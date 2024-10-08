; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -passes=instcombine -S | FileCheck %s

target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i1 @test1(i1 %a, i1 %b) {
; CHECK-LABEL: @test1(
; CHECK-NEXT:    [[WC:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    [[LHS:%.*]] = and i1 [[B:%.*]], [[WC]]
; CHECK-NEXT:    [[AND:%.*]] = and i1 [[LHS]], [[A:%.*]]
; CHECK-NEXT:    ret i1 [[AND]]
;
  %wc = call i1 @llvm.experimental.widenable.condition()
  %lhs = and i1 %b, %wc
  %and = and i1 %lhs, %a
  ret i1 %and
}

define i1 @test1_logical(i1 %a, i1 %b) {
; CHECK-LABEL: @test1_logical(
; CHECK-NEXT:    [[WC:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    [[LHS:%.*]] = and i1 [[B:%.*]], [[WC]]
; CHECK-NEXT:    [[AND:%.*]] = select i1 [[LHS]], i1 [[A:%.*]], i1 false
; CHECK-NEXT:    ret i1 [[AND]]
;
  %wc = call i1 @llvm.experimental.widenable.condition()
  %lhs = select i1 %b, i1 %wc, i1 false
  %and = select i1 %lhs, i1 %a, i1 false
  ret i1 %and
}

; Negative test - profitability of dropping WC from first use unclear
define i1 @test1b(i1 %a, i1 %b) {
; CHECK-LABEL: @test1b(
; CHECK-NEXT:    [[WC:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    [[LHS:%.*]] = and i1 [[B:%.*]], [[WC]]
; CHECK-NEXT:    call void @use(i1 [[LHS]])
; CHECK-NEXT:    [[AND:%.*]] = and i1 [[LHS]], [[A:%.*]]
; CHECK-NEXT:    ret i1 [[AND]]
;
  %wc = call i1 @llvm.experimental.widenable.condition()
  %lhs = and i1 %b, %wc
  call void @use(i1 %lhs)
  %and = and i1 %lhs, %a
  ret i1 %and
}

define i1 @test1b_logical(i1 %a, i1 %b) {
; CHECK-LABEL: @test1b_logical(
; CHECK-NEXT:    [[WC:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    [[LHS:%.*]] = and i1 [[B:%.*]], [[WC]]
; CHECK-NEXT:    call void @use(i1 [[LHS]])
; CHECK-NEXT:    [[AND:%.*]] = select i1 [[LHS]], i1 [[A:%.*]], i1 false
; CHECK-NEXT:    ret i1 [[AND]]
;
  %wc = call i1 @llvm.experimental.widenable.condition()
  %lhs = select i1 %b, i1 %wc, i1 false
  call void @use(i1 %lhs)
  %and = select i1 %lhs, i1 %a, i1 false
  ret i1 %and
}

; multiple uses of A, B, WC doesn't change result
define i1 @test1c(i1 %a, i1 %b) {
; CHECK-LABEL: @test1c(
; CHECK-NEXT:    call void @use(i1 [[A:%.*]])
; CHECK-NEXT:    call void @use(i1 [[B:%.*]])
; CHECK-NEXT:    [[WC:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    call void @use(i1 [[WC]])
; CHECK-NEXT:    [[LHS:%.*]] = and i1 [[B]], [[WC]]
; CHECK-NEXT:    [[AND:%.*]] = and i1 [[LHS]], [[A]]
; CHECK-NEXT:    ret i1 [[AND]]
;
  call void @use(i1 %a)
  call void @use(i1 %b)
  %wc = call i1 @llvm.experimental.widenable.condition()
  call void @use(i1 %wc)
  %lhs = and i1 %b, %wc
  %and = and i1 %lhs, %a
  ret i1 %and
}

define i1 @test1c_logical(i1 %a, i1 %b) {
; CHECK-LABEL: @test1c_logical(
; CHECK-NEXT:    call void @use(i1 [[A:%.*]])
; CHECK-NEXT:    call void @use(i1 [[B:%.*]])
; CHECK-NEXT:    [[WC:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    call void @use(i1 [[WC]])
; CHECK-NEXT:    [[LHS:%.*]] = and i1 [[B]], [[WC]]
; CHECK-NEXT:    [[AND:%.*]] = select i1 [[LHS]], i1 [[A]], i1 false
; CHECK-NEXT:    ret i1 [[AND]]
;
  call void @use(i1 %a)
  call void @use(i1 %b)
  %wc = call i1 @llvm.experimental.widenable.condition()
  call void @use(i1 %wc)
  %lhs = select i1 %b, i1 %wc, i1 false
  %and = select i1 %lhs, i1 %a, i1 false
  ret i1 %and
}

define i1 @test2(i1 %a, i1 %b) {
; CHECK-LABEL: @test2(
; CHECK-NEXT:    [[WC:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    [[LHS:%.*]] = and i1 [[WC]], [[B:%.*]]
; CHECK-NEXT:    [[AND:%.*]] = and i1 [[LHS]], [[A:%.*]]
; CHECK-NEXT:    ret i1 [[AND]]
;
  %wc = call i1 @llvm.experimental.widenable.condition()
  %lhs = and i1 %wc, %b
  %and = and i1 %lhs, %a
  ret i1 %and
}

define i1 @test2_logical(i1 %a, i1 %b) {
; CHECK-LABEL: @test2_logical(
; CHECK-NEXT:    [[WC:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    [[LHS:%.*]] = select i1 [[WC]], i1 [[B:%.*]], i1 false
; CHECK-NEXT:    [[AND:%.*]] = select i1 [[LHS]], i1 [[A:%.*]], i1 false
; CHECK-NEXT:    ret i1 [[AND]]
;
  %wc = call i1 @llvm.experimental.widenable.condition()
  %lhs = select i1 %wc, i1 %b, i1 false
  %and = select i1 %lhs, i1 %a, i1 false
  ret i1 %and
}

; To test the rhs side, an instruction on lhs to prevent complexity
; canonicalization reducing to above.
define i1 @test3(i1 %a, i1 %b, i1 %c) {
; CHECK-LABEL: @test3(
; CHECK-NEXT:    [[WC:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    [[LHS:%.*]] = and i1 [[A:%.*]], [[B:%.*]]
; CHECK-NEXT:    [[RHS:%.*]] = and i1 [[C:%.*]], [[WC]]
; CHECK-NEXT:    [[AND:%.*]] = and i1 [[LHS]], [[RHS]]
; CHECK-NEXT:    ret i1 [[AND]]
;
  %wc = call i1 @llvm.experimental.widenable.condition()
  %lhs = and i1 %a, %b
  %rhs = and i1 %c, %wc
  %and = and i1 %lhs, %rhs
  ret i1 %and
}

define i1 @test3_logical(i1 %a, i1 %b, i1 %c) {
; CHECK-LABEL: @test3_logical(
; CHECK-NEXT:    [[WC:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    [[LHS:%.*]] = select i1 [[A:%.*]], i1 [[B:%.*]], i1 false
; CHECK-NEXT:    [[RHS:%.*]] = and i1 [[C:%.*]], [[WC]]
; CHECK-NEXT:    [[AND:%.*]] = select i1 [[LHS]], i1 [[RHS]], i1 false
; CHECK-NEXT:    ret i1 [[AND]]
;
  %wc = call i1 @llvm.experimental.widenable.condition()
  %lhs = select i1 %a, i1 %b, i1 false
  %rhs = select i1 %c, i1 %wc, i1 false
  %and = select i1 %lhs, i1 %rhs, i1 false
  ret i1 %and
}

define i1 @test4(i1 %a, i1 %b, i1 %c) {
; CHECK-LABEL: @test4(
; CHECK-NEXT:    [[WC:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    [[LHS:%.*]] = and i1 [[A:%.*]], [[B:%.*]]
; CHECK-NEXT:    [[RHS:%.*]] = and i1 [[WC]], [[C:%.*]]
; CHECK-NEXT:    [[AND:%.*]] = and i1 [[LHS]], [[RHS]]
; CHECK-NEXT:    ret i1 [[AND]]
;
  %wc = call i1 @llvm.experimental.widenable.condition()
  %lhs = and i1 %a, %b
  %rhs = and i1 %wc, %c
  %and = and i1 %lhs, %rhs
  ret i1 %and
}

define i1 @test4_logical(i1 %a, i1 %b, i1 %c) {
; CHECK-LABEL: @test4_logical(
; CHECK-NEXT:    [[WC:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    [[LHS:%.*]] = select i1 [[A:%.*]], i1 [[B:%.*]], i1 false
; CHECK-NEXT:    [[TMP1:%.*]] = and i1 [[LHS]], [[WC]]
; CHECK-NEXT:    [[AND:%.*]] = select i1 [[TMP1]], i1 [[C:%.*]], i1 false
; CHECK-NEXT:    ret i1 [[AND]]
;
  %wc = call i1 @llvm.experimental.widenable.condition()
  %lhs = select i1 %a, i1 %b, i1 false
  %rhs = select i1 %wc, i1 %c, i1 false
  %and = select i1 %lhs, i1 %rhs, i1 false
  ret i1 %and
}

define i1 @test5(i1 %a, i1 %b) {
; CHECK-LABEL: @test5(
; CHECK-NEXT:    [[WC:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    ret i1 [[WC]]
;
  %wc = call i1 @llvm.experimental.widenable.condition()
  %and = and i1 %wc, %wc
  ret i1 %and
}

define i1 @test5_logical(i1 %a, i1 %b) {
; CHECK-LABEL: @test5_logical(
; CHECK-NEXT:    [[WC:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    ret i1 [[WC]]
;
  %wc = call i1 @llvm.experimental.widenable.condition()
  %and = select i1 %wc, i1 %wc, i1 false
  ret i1 %and
}

define i1 @test6(i1 %a, i1 %b) {
; CHECK-LABEL: @test6(
; CHECK-NEXT:    [[WC:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    [[WC2:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    [[AND:%.*]] = and i1 [[WC]], [[WC2]]
; CHECK-NEXT:    ret i1 [[AND]]
;
  %wc = call i1 @llvm.experimental.widenable.condition()
  %wc2 = call i1 @llvm.experimental.widenable.condition()
  %and = and i1 %wc, %wc2
  ret i1 %and
}

define i1 @test6_logical(i1 %a, i1 %b) {
; CHECK-LABEL: @test6_logical(
; CHECK-NEXT:    [[WC:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    [[WC2:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    [[AND:%.*]] = and i1 [[WC]], [[WC2]]
; CHECK-NEXT:    ret i1 [[AND]]
;
  %wc = call i1 @llvm.experimental.widenable.condition()
  %wc2 = call i1 @llvm.experimental.widenable.condition()
  %and = select i1 %wc, i1 %wc2, i1 false
  ret i1 %and
}

define i1 @test7(i1 %a, i1 %b) {
; CHECK-LABEL: @test7(
; CHECK-NEXT:    [[WC:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    call void @use(i1 [[WC]])
; CHECK-NEXT:    [[WC2:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    [[AND:%.*]] = and i1 [[WC]], [[WC2]]
; CHECK-NEXT:    ret i1 [[AND]]
;
  %wc = call i1 @llvm.experimental.widenable.condition()
  call void @use(i1 %wc)
  %wc2 = call i1 @llvm.experimental.widenable.condition()
  %and = and i1 %wc, %wc2
  ret i1 %and
}

define i1 @test7_logical(i1 %a, i1 %b) {
; CHECK-LABEL: @test7_logical(
; CHECK-NEXT:    [[WC:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    call void @use(i1 [[WC]])
; CHECK-NEXT:    [[WC2:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    [[AND:%.*]] = and i1 [[WC]], [[WC2]]
; CHECK-NEXT:    ret i1 [[AND]]
;
  %wc = call i1 @llvm.experimental.widenable.condition()
  call void @use(i1 %wc)
  %wc2 = call i1 @llvm.experimental.widenable.condition()
  %and = select i1 %wc, i1 %wc2, i1 false
  ret i1 %and
}

define i1 @test8(i1 %a, i1 %b) {
; CHECK-LABEL: @test8(
; CHECK-NEXT:    [[WC:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    [[WC2:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    call void @use(i1 [[WC2]])
; CHECK-NEXT:    [[AND:%.*]] = and i1 [[WC]], [[WC2]]
; CHECK-NEXT:    ret i1 [[AND]]
;
  %wc = call i1 @llvm.experimental.widenable.condition()
  %wc2 = call i1 @llvm.experimental.widenable.condition()
  call void @use(i1 %wc2)
  %and = and i1 %wc, %wc2
  ret i1 %and
}

define i1 @test8_logical(i1 %a, i1 %b) {
; CHECK-LABEL: @test8_logical(
; CHECK-NEXT:    [[WC:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    [[WC2:%.*]] = call i1 @llvm.experimental.widenable.condition()
; CHECK-NEXT:    call void @use(i1 [[WC2]])
; CHECK-NEXT:    [[AND:%.*]] = and i1 [[WC]], [[WC2]]
; CHECK-NEXT:    ret i1 [[AND]]
;
  %wc = call i1 @llvm.experimental.widenable.condition()
  %wc2 = call i1 @llvm.experimental.widenable.condition()
  call void @use(i1 %wc2)
  %and = select i1 %wc, i1 %wc2, i1 false
  ret i1 %and
}


declare void @use(i1)
declare i1 @llvm.experimental.widenable.condition()
