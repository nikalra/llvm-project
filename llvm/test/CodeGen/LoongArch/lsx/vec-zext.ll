; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 5
; RUN: llc --mtriple=loongarch64 --mattr=+lsx %s -o - | FileCheck %s


define void @load_zext_2i8_to_2i64(ptr %ptr, ptr %dst) {
; CHECK-LABEL: load_zext_2i8_to_2i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    ld.bu $a2, $a0, 0
; CHECK-NEXT:    ld.bu $a0, $a0, 1
; CHECK-NEXT:    vinsgr2vr.d $vr0, $a2, 0
; CHECK-NEXT:    vinsgr2vr.d $vr0, $a0, 1
; CHECK-NEXT:    vst $vr0, $a1, 0
; CHECK-NEXT:    ret
entry:
  %A = load <2 x i8>, ptr %ptr
  %B = zext <2 x i8> %A to <2 x i64>
  store <2 x i64> %B, ptr %dst
  ret void
}

define void @load_zext_4i8_to_4i32(ptr %ptr, ptr %dst) {
; CHECK-LABEL: load_zext_4i8_to_4i32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    ld.bu $a2, $a0, 0
; CHECK-NEXT:    ld.bu $a3, $a0, 1
; CHECK-NEXT:    ld.bu $a4, $a0, 2
; CHECK-NEXT:    ld.bu $a0, $a0, 3
; CHECK-NEXT:    vinsgr2vr.w $vr0, $a2, 0
; CHECK-NEXT:    vinsgr2vr.w $vr0, $a3, 1
; CHECK-NEXT:    vinsgr2vr.w $vr0, $a4, 2
; CHECK-NEXT:    vinsgr2vr.w $vr0, $a0, 3
; CHECK-NEXT:    vst $vr0, $a1, 0
; CHECK-NEXT:    ret
entry:
  %A = load <4 x i8>, ptr %ptr
  %B = zext <4 x i8> %A to <4 x i32>
  store <4 x i32> %B, ptr %dst
  ret void
}

define void @load_zext_8i8_to_8i16(ptr %ptr, ptr %dst) {
; CHECK-LABEL: load_zext_8i8_to_8i16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    ld.bu $a2, $a0, 0
; CHECK-NEXT:    ld.bu $a3, $a0, 1
; CHECK-NEXT:    ld.bu $a4, $a0, 2
; CHECK-NEXT:    ld.bu $a5, $a0, 3
; CHECK-NEXT:    vinsgr2vr.h $vr0, $a2, 0
; CHECK-NEXT:    vinsgr2vr.h $vr0, $a3, 1
; CHECK-NEXT:    vinsgr2vr.h $vr0, $a4, 2
; CHECK-NEXT:    vinsgr2vr.h $vr0, $a5, 3
; CHECK-NEXT:    ld.bu $a2, $a0, 4
; CHECK-NEXT:    ld.bu $a3, $a0, 5
; CHECK-NEXT:    ld.bu $a4, $a0, 6
; CHECK-NEXT:    ld.bu $a0, $a0, 7
; CHECK-NEXT:    vinsgr2vr.h $vr0, $a2, 4
; CHECK-NEXT:    vinsgr2vr.h $vr0, $a3, 5
; CHECK-NEXT:    vinsgr2vr.h $vr0, $a4, 6
; CHECK-NEXT:    vinsgr2vr.h $vr0, $a0, 7
; CHECK-NEXT:    vst $vr0, $a1, 0
; CHECK-NEXT:    ret
entry:
  %A = load <8 x i8>, ptr %ptr
  %B = zext <8 x i8> %A to <8 x i16>
  store <8 x i16> %B, ptr %dst
  ret void
}

define void @load_zext_2i16_to_2i64(ptr %ptr, ptr %dst) {
; CHECK-LABEL: load_zext_2i16_to_2i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    ld.hu $a2, $a0, 0
; CHECK-NEXT:    ld.hu $a0, $a0, 2
; CHECK-NEXT:    vinsgr2vr.d $vr0, $a2, 0
; CHECK-NEXT:    vinsgr2vr.d $vr0, $a0, 1
; CHECK-NEXT:    vst $vr0, $a1, 0
; CHECK-NEXT:    ret
entry:
  %A = load <2 x i16>, ptr %ptr
  %B = zext <2 x i16> %A to <2 x i64>
  store <2 x i64> %B, ptr %dst
  ret void
}

define void @load_zext_4i16_to_4i32(ptr %ptr, ptr %dst) {
; CHECK-LABEL: load_zext_4i16_to_4i32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    ld.hu $a2, $a0, 0
; CHECK-NEXT:    ld.hu $a3, $a0, 2
; CHECK-NEXT:    ld.hu $a4, $a0, 4
; CHECK-NEXT:    ld.hu $a0, $a0, 6
; CHECK-NEXT:    vinsgr2vr.w $vr0, $a2, 0
; CHECK-NEXT:    vinsgr2vr.w $vr0, $a3, 1
; CHECK-NEXT:    vinsgr2vr.w $vr0, $a4, 2
; CHECK-NEXT:    vinsgr2vr.w $vr0, $a0, 3
; CHECK-NEXT:    vst $vr0, $a1, 0
; CHECK-NEXT:    ret
entry:
  %A = load <4 x i16>, ptr %ptr
  %B = zext <4 x i16> %A to <4 x i32>
  store <4 x i32> %B, ptr %dst
  ret void
}

define void @load_zext_2i32_to_2i64(ptr %ptr, ptr %dst) {
; CHECK-LABEL: load_zext_2i32_to_2i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    ld.wu $a2, $a0, 0
; CHECK-NEXT:    ld.wu $a0, $a0, 4
; CHECK-NEXT:    vinsgr2vr.d $vr0, $a2, 0
; CHECK-NEXT:    vinsgr2vr.d $vr0, $a0, 1
; CHECK-NEXT:    vst $vr0, $a1, 0
; CHECK-NEXT:    ret
entry:
  %A = load <2 x i32>, ptr %ptr
  %B = zext <2 x i32> %A to <2 x i64>
  store <2 x i64> %B, ptr %dst
  ret void
}

define void @load_zext_16i8_to_16i16(ptr %ptr, ptr %dst) {
; CHECK-LABEL: load_zext_16i8_to_16i16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vld $vr0, $a0, 0
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 0
; CHECK-NEXT:    vinsgr2vr.h $vr1, $a0, 0
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 1
; CHECK-NEXT:    vinsgr2vr.h $vr1, $a0, 1
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 2
; CHECK-NEXT:    vinsgr2vr.h $vr1, $a0, 2
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 3
; CHECK-NEXT:    vinsgr2vr.h $vr1, $a0, 3
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 4
; CHECK-NEXT:    vinsgr2vr.h $vr1, $a0, 4
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 5
; CHECK-NEXT:    vinsgr2vr.h $vr1, $a0, 5
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 6
; CHECK-NEXT:    vinsgr2vr.h $vr1, $a0, 6
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 7
; CHECK-NEXT:    vinsgr2vr.h $vr1, $a0, 7
; CHECK-NEXT:    vrepli.h $vr2, 255
; CHECK-NEXT:    vand.v $vr1, $vr1, $vr2
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 8
; CHECK-NEXT:    vinsgr2vr.h $vr3, $a0, 0
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 9
; CHECK-NEXT:    vinsgr2vr.h $vr3, $a0, 1
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 10
; CHECK-NEXT:    vinsgr2vr.h $vr3, $a0, 2
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 11
; CHECK-NEXT:    vinsgr2vr.h $vr3, $a0, 3
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 12
; CHECK-NEXT:    vinsgr2vr.h $vr3, $a0, 4
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 13
; CHECK-NEXT:    vinsgr2vr.h $vr3, $a0, 5
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 14
; CHECK-NEXT:    vinsgr2vr.h $vr3, $a0, 6
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 15
; CHECK-NEXT:    vinsgr2vr.h $vr3, $a0, 7
; CHECK-NEXT:    vand.v $vr0, $vr3, $vr2
; CHECK-NEXT:    vst $vr0, $a1, 16
; CHECK-NEXT:    vst $vr1, $a1, 0
; CHECK-NEXT:    ret
entry:
  %A = load <16 x i8>, ptr %ptr
  %B = zext <16 x i8> %A to <16 x i16>
  store <16 x i16> %B, ptr %dst
  ret void
}

define void @load_zext_16i8_to_16i32(ptr %ptr, ptr %dst) {
; CHECK-LABEL: load_zext_16i8_to_16i32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vld $vr0, $a0, 0
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 0
; CHECK-NEXT:    vinsgr2vr.w $vr1, $a0, 0
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 1
; CHECK-NEXT:    vinsgr2vr.w $vr1, $a0, 1
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 2
; CHECK-NEXT:    vinsgr2vr.w $vr1, $a0, 2
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 3
; CHECK-NEXT:    vinsgr2vr.w $vr1, $a0, 3
; CHECK-NEXT:    vrepli.w $vr2, 255
; CHECK-NEXT:    vand.v $vr1, $vr1, $vr2
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 4
; CHECK-NEXT:    vinsgr2vr.w $vr3, $a0, 0
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 5
; CHECK-NEXT:    vinsgr2vr.w $vr3, $a0, 1
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 6
; CHECK-NEXT:    vinsgr2vr.w $vr3, $a0, 2
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 7
; CHECK-NEXT:    vinsgr2vr.w $vr3, $a0, 3
; CHECK-NEXT:    vand.v $vr3, $vr3, $vr2
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 8
; CHECK-NEXT:    vinsgr2vr.w $vr4, $a0, 0
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 9
; CHECK-NEXT:    vinsgr2vr.w $vr4, $a0, 1
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 10
; CHECK-NEXT:    vinsgr2vr.w $vr4, $a0, 2
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 11
; CHECK-NEXT:    vinsgr2vr.w $vr4, $a0, 3
; CHECK-NEXT:    vand.v $vr4, $vr4, $vr2
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 12
; CHECK-NEXT:    vinsgr2vr.w $vr5, $a0, 0
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 13
; CHECK-NEXT:    vinsgr2vr.w $vr5, $a0, 1
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 14
; CHECK-NEXT:    vinsgr2vr.w $vr5, $a0, 2
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 15
; CHECK-NEXT:    vinsgr2vr.w $vr5, $a0, 3
; CHECK-NEXT:    vand.v $vr0, $vr5, $vr2
; CHECK-NEXT:    vst $vr0, $a1, 48
; CHECK-NEXT:    vst $vr4, $a1, 32
; CHECK-NEXT:    vst $vr3, $a1, 16
; CHECK-NEXT:    vst $vr1, $a1, 0
; CHECK-NEXT:    ret
entry:
  %A = load <16 x i8>, ptr %ptr
  %B = zext <16 x i8> %A to <16 x i32>
  store <16 x i32> %B, ptr %dst
  ret void
}

define void @load_zext_16i8_to_16i64(ptr %ptr, ptr %dst) {
; CHECK-LABEL: load_zext_16i8_to_16i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vld $vr0, $a0, 0
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 0
; CHECK-NEXT:    vinsgr2vr.d $vr1, $a0, 0
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 1
; CHECK-NEXT:    vinsgr2vr.d $vr1, $a0, 1
; CHECK-NEXT:    vrepli.d $vr2, 255
; CHECK-NEXT:    vand.v $vr1, $vr1, $vr2
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 2
; CHECK-NEXT:    vinsgr2vr.d $vr3, $a0, 0
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 3
; CHECK-NEXT:    vinsgr2vr.d $vr3, $a0, 1
; CHECK-NEXT:    vand.v $vr3, $vr3, $vr2
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 4
; CHECK-NEXT:    vinsgr2vr.d $vr4, $a0, 0
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 5
; CHECK-NEXT:    vinsgr2vr.d $vr4, $a0, 1
; CHECK-NEXT:    vand.v $vr4, $vr4, $vr2
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 6
; CHECK-NEXT:    vinsgr2vr.d $vr5, $a0, 0
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 7
; CHECK-NEXT:    vinsgr2vr.d $vr5, $a0, 1
; CHECK-NEXT:    vand.v $vr5, $vr5, $vr2
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 8
; CHECK-NEXT:    vinsgr2vr.d $vr6, $a0, 0
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 9
; CHECK-NEXT:    vinsgr2vr.d $vr6, $a0, 1
; CHECK-NEXT:    vand.v $vr6, $vr6, $vr2
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 10
; CHECK-NEXT:    vinsgr2vr.d $vr7, $a0, 0
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 11
; CHECK-NEXT:    vinsgr2vr.d $vr7, $a0, 1
; CHECK-NEXT:    vand.v $vr7, $vr7, $vr2
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 12
; CHECK-NEXT:    vinsgr2vr.d $vr8, $a0, 0
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 13
; CHECK-NEXT:    vinsgr2vr.d $vr8, $a0, 1
; CHECK-NEXT:    vand.v $vr8, $vr8, $vr2
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 14
; CHECK-NEXT:    vinsgr2vr.d $vr9, $a0, 0
; CHECK-NEXT:    vpickve2gr.b $a0, $vr0, 15
; CHECK-NEXT:    vinsgr2vr.d $vr9, $a0, 1
; CHECK-NEXT:    vand.v $vr0, $vr9, $vr2
; CHECK-NEXT:    vst $vr0, $a1, 112
; CHECK-NEXT:    vst $vr8, $a1, 96
; CHECK-NEXT:    vst $vr7, $a1, 80
; CHECK-NEXT:    vst $vr6, $a1, 64
; CHECK-NEXT:    vst $vr5, $a1, 48
; CHECK-NEXT:    vst $vr4, $a1, 32
; CHECK-NEXT:    vst $vr3, $a1, 16
; CHECK-NEXT:    vst $vr1, $a1, 0
; CHECK-NEXT:    ret
entry:
  %A = load <16 x i8>, ptr %ptr
  %B = zext <16 x i8> %A to <16 x i64>
  store <16 x i64> %B, ptr %dst
  ret void
}

define void @load_zext_8i16_to_8i32(ptr %ptr, ptr %dst) {
; CHECK-LABEL: load_zext_8i16_to_8i32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vld $vr0, $a0, 0
; CHECK-NEXT:    vpickve2gr.h $a0, $vr0, 0
; CHECK-NEXT:    vinsgr2vr.w $vr1, $a0, 0
; CHECK-NEXT:    vpickve2gr.h $a0, $vr0, 1
; CHECK-NEXT:    vinsgr2vr.w $vr1, $a0, 1
; CHECK-NEXT:    vpickve2gr.h $a0, $vr0, 2
; CHECK-NEXT:    vinsgr2vr.w $vr1, $a0, 2
; CHECK-NEXT:    vpickve2gr.h $a0, $vr0, 3
; CHECK-NEXT:    vinsgr2vr.w $vr1, $a0, 3
; CHECK-NEXT:    lu12i.w $a0, 15
; CHECK-NEXT:    ori $a0, $a0, 4095
; CHECK-NEXT:    vreplgr2vr.w $vr2, $a0
; CHECK-NEXT:    vand.v $vr1, $vr1, $vr2
; CHECK-NEXT:    vpickve2gr.h $a0, $vr0, 4
; CHECK-NEXT:    vinsgr2vr.w $vr3, $a0, 0
; CHECK-NEXT:    vpickve2gr.h $a0, $vr0, 5
; CHECK-NEXT:    vinsgr2vr.w $vr3, $a0, 1
; CHECK-NEXT:    vpickve2gr.h $a0, $vr0, 6
; CHECK-NEXT:    vinsgr2vr.w $vr3, $a0, 2
; CHECK-NEXT:    vpickve2gr.h $a0, $vr0, 7
; CHECK-NEXT:    vinsgr2vr.w $vr3, $a0, 3
; CHECK-NEXT:    vand.v $vr0, $vr3, $vr2
; CHECK-NEXT:    vst $vr0, $a1, 16
; CHECK-NEXT:    vst $vr1, $a1, 0
; CHECK-NEXT:    ret
entry:
  %A = load <8 x i16>, ptr %ptr
  %B = zext <8 x i16> %A to <8 x i32>
  store <8 x i32> %B, ptr %dst
  ret void
}

define void @load_zext_8i16_to_8i64(ptr %ptr, ptr %dst) {
; CHECK-LABEL: load_zext_8i16_to_8i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vld $vr0, $a0, 0
; CHECK-NEXT:    vpickve2gr.h $a0, $vr0, 0
; CHECK-NEXT:    vinsgr2vr.d $vr1, $a0, 0
; CHECK-NEXT:    vpickve2gr.h $a0, $vr0, 1
; CHECK-NEXT:    vinsgr2vr.d $vr1, $a0, 1
; CHECK-NEXT:    lu12i.w $a0, 15
; CHECK-NEXT:    ori $a0, $a0, 4095
; CHECK-NEXT:    vreplgr2vr.d $vr2, $a0
; CHECK-NEXT:    vand.v $vr1, $vr1, $vr2
; CHECK-NEXT:    vpickve2gr.h $a0, $vr0, 2
; CHECK-NEXT:    vinsgr2vr.d $vr3, $a0, 0
; CHECK-NEXT:    vpickve2gr.h $a0, $vr0, 3
; CHECK-NEXT:    vinsgr2vr.d $vr3, $a0, 1
; CHECK-NEXT:    vand.v $vr3, $vr3, $vr2
; CHECK-NEXT:    vpickve2gr.h $a0, $vr0, 4
; CHECK-NEXT:    vinsgr2vr.d $vr4, $a0, 0
; CHECK-NEXT:    vpickve2gr.h $a0, $vr0, 5
; CHECK-NEXT:    vinsgr2vr.d $vr4, $a0, 1
; CHECK-NEXT:    vand.v $vr4, $vr4, $vr2
; CHECK-NEXT:    vpickve2gr.h $a0, $vr0, 6
; CHECK-NEXT:    vinsgr2vr.d $vr5, $a0, 0
; CHECK-NEXT:    vpickve2gr.h $a0, $vr0, 7
; CHECK-NEXT:    vinsgr2vr.d $vr5, $a0, 1
; CHECK-NEXT:    vand.v $vr0, $vr5, $vr2
; CHECK-NEXT:    vst $vr0, $a1, 48
; CHECK-NEXT:    vst $vr4, $a1, 32
; CHECK-NEXT:    vst $vr3, $a1, 16
; CHECK-NEXT:    vst $vr1, $a1, 0
; CHECK-NEXT:    ret
entry:
  %A = load <8 x i16>, ptr %ptr
  %B = zext <8 x i16> %A to <8 x i64>
  store <8 x i64> %B, ptr %dst
  ret void
}

define void @load_zext_4i32_to_4i64(ptr %ptr, ptr %dst) {
; CHECK-LABEL: load_zext_4i32_to_4i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vld $vr0, $a0, 0
; CHECK-NEXT:    vpickve2gr.w $a0, $vr0, 0
; CHECK-NEXT:    vinsgr2vr.d $vr1, $a0, 0
; CHECK-NEXT:    vpickve2gr.w $a0, $vr0, 1
; CHECK-NEXT:    vinsgr2vr.d $vr1, $a0, 1
; CHECK-NEXT:    addi.w $a0, $zero, -1
; CHECK-NEXT:    lu32i.d $a0, 0
; CHECK-NEXT:    vreplgr2vr.d $vr2, $a0
; CHECK-NEXT:    vand.v $vr1, $vr1, $vr2
; CHECK-NEXT:    vpickve2gr.w $a0, $vr0, 2
; CHECK-NEXT:    vinsgr2vr.d $vr3, $a0, 0
; CHECK-NEXT:    vpickve2gr.w $a0, $vr0, 3
; CHECK-NEXT:    vinsgr2vr.d $vr3, $a0, 1
; CHECK-NEXT:    vand.v $vr0, $vr3, $vr2
; CHECK-NEXT:    vst $vr0, $a1, 16
; CHECK-NEXT:    vst $vr1, $a1, 0
; CHECK-NEXT:    ret
entry:
  %A = load <4 x i32>, ptr %ptr
  %B = zext <4 x i32> %A to <4 x i64>
  store <4 x i64> %B, ptr %dst
  ret void
}

