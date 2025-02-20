; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=aarch64-linux-gnu -mattr=+sve < %s 2>%t | FileCheck %s
; RUN: FileCheck --check-prefix=WARN --allow-empty %s <%t

; If this check fails please read test/CodeGen/AArch64/README for instructions on how to resolve it.
; WARN-NOT: warning

;
; ABS
;

define <vscale x 16 x i8> @abs_i8(<vscale x 16 x i8> %a, <vscale x 16 x i1> %pg, <vscale x 16 x i8> %b) {
; CHECK-LABEL: abs_i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    abs z0.b, p0/m, z1.b
; CHECK-NEXT:    ret
  %out = call <vscale x 16 x i8> @llvm.aarch64.sve.abs.nxv16i8(<vscale x 16 x i8> %a,
                                                               <vscale x 16 x i1> %pg,
                                                               <vscale x 16 x i8> %b)
  ret <vscale x 16 x i8> %out
}

define <vscale x 8 x i16> @abs_i16(<vscale x 8 x i16> %a, <vscale x 8 x i1> %pg, <vscale x 8 x i16> %b) {
; CHECK-LABEL: abs_i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    abs z0.h, p0/m, z1.h
; CHECK-NEXT:    ret
  %out = call <vscale x 8 x i16> @llvm.aarch64.sve.abs.nxv8i16(<vscale x 8 x i16> %a,
                                                               <vscale x 8 x i1> %pg,
                                                               <vscale x 8 x i16> %b)
  ret <vscale x 8 x i16> %out
}

define <vscale x 4 x i32> @abs_i32(<vscale x 4 x i32> %a, <vscale x 4 x i1> %pg, <vscale x 4 x i32> %b) {
; CHECK-LABEL: abs_i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    abs z0.s, p0/m, z1.s
; CHECK-NEXT:    ret
  %out = call <vscale x 4 x i32> @llvm.aarch64.sve.abs.nxv4i32(<vscale x 4 x i32> %a,
                                                               <vscale x 4 x i1> %pg,
                                                               <vscale x 4 x i32> %b)
  ret <vscale x 4 x i32> %out
}

define <vscale x 2 x i64> @abs_i64(<vscale x 2 x i64> %a, <vscale x 2 x i1> %pg, <vscale x 2 x i64> %b) {
; CHECK-LABEL: abs_i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    abs z0.d, p0/m, z1.d
; CHECK-NEXT:    ret
  %out = call <vscale x 2 x i64> @llvm.aarch64.sve.abs.nxv2i64(<vscale x 2 x i64> %a,
                                                               <vscale x 2 x i1> %pg,
                                                               <vscale x 2 x i64> %b)
  ret <vscale x 2 x i64> %out
}

;
; NEG
;

define <vscale x 16 x i8> @neg_i8(<vscale x 16 x i8> %a, <vscale x 16 x i1> %pg, <vscale x 16 x i8> %b) {
; CHECK-LABEL: neg_i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    neg z0.b, p0/m, z1.b
; CHECK-NEXT:    ret
  %out = call <vscale x 16 x i8> @llvm.aarch64.sve.neg.nxv16i8(<vscale x 16 x i8> %a,
                                                               <vscale x 16 x i1> %pg,
                                                               <vscale x 16 x i8> %b)
  ret <vscale x 16 x i8> %out
}

define <vscale x 8 x i16> @neg_i16(<vscale x 8 x i16> %a, <vscale x 8 x i1> %pg, <vscale x 8 x i16> %b) {
; CHECK-LABEL: neg_i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    neg z0.h, p0/m, z1.h
; CHECK-NEXT:    ret
  %out = call <vscale x 8 x i16> @llvm.aarch64.sve.neg.nxv8i16(<vscale x 8 x i16> %a,
                                                               <vscale x 8 x i1> %pg,
                                                               <vscale x 8 x i16> %b)
  ret <vscale x 8 x i16> %out
}

define <vscale x 4 x i32> @neg_i32(<vscale x 4 x i32> %a, <vscale x 4 x i1> %pg, <vscale x 4 x i32> %b) {
; CHECK-LABEL: neg_i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    neg z0.s, p0/m, z1.s
; CHECK-NEXT:    ret
  %out = call <vscale x 4 x i32> @llvm.aarch64.sve.neg.nxv4i32(<vscale x 4 x i32> %a,
                                                               <vscale x 4 x i1> %pg,
                                                               <vscale x 4 x i32> %b)
  ret <vscale x 4 x i32> %out
}

define <vscale x 2 x i64> @neg_i64(<vscale x 2 x i64> %a, <vscale x 2 x i1> %pg, <vscale x 2 x i64> %b) {
; CHECK-LABEL: neg_i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    neg z0.d, p0/m, z1.d
; CHECK-NEXT:    ret
  %out = call <vscale x 2 x i64> @llvm.aarch64.sve.neg.nxv2i64(<vscale x 2 x i64> %a,
                                                               <vscale x 2 x i1> %pg,
                                                               <vscale x 2 x i64> %b)
  ret <vscale x 2 x i64> %out
}

; SDOT

define <vscale x 4 x i32> @sdot_i32(<vscale x 4 x i32> %a, <vscale x 16 x i8> %b, <vscale x 16 x i8> %c) {
; CHECK-LABEL: sdot_i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sdot z0.s, z1.b, z2.b
; CHECK-NEXT:    ret
  %out = call <vscale x 4 x i32> @llvm.aarch64.sve.sdot.nxv4i32(<vscale x 4 x i32> %a,
                                                                <vscale x 16 x i8> %b,
                                                                <vscale x 16 x i8> %c)
  ret <vscale x 4 x i32> %out
}

define <vscale x 2 x i64> @sdot_i64(<vscale x 2 x i64> %a, <vscale x 8 x i16> %b, <vscale x 8 x i16> %c) {
; CHECK-LABEL: sdot_i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sdot z0.d, z1.h, z2.h
; CHECK-NEXT:    ret
  %out = call <vscale x 2 x i64> @llvm.aarch64.sve.sdot.nxv2i64(<vscale x 2 x i64> %a,
                                                                <vscale x 8 x i16> %b,
                                                                <vscale x 8 x i16> %c)
  ret <vscale x 2 x i64> %out
}

define <vscale x 2 x i64> @test_sdot_i64_zero(<vscale x 2 x i64> %a, <vscale x 8 x i16> %b, <vscale x 8 x i16> %c) {
; CHECK-LABEL: test_sdot_i64_zero:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    sdot z0.d, z1.h, z2.h
; CHECK-NEXT:    ret
entry:
  %vdot1.i = call <vscale x 2 x i64> @llvm.aarch64.sve.sdot.nxv2i64(<vscale x 2 x i64> zeroinitializer, <vscale x 8 x i16> %b, <vscale x 8 x i16> %c)
  %ret = add <vscale x 2 x i64> %vdot1.i, %a
  ret <vscale x 2 x i64> %ret
}

define <vscale x 4 x i32> @test_sdot_i32_zero(<vscale x 4 x i32> %a, <vscale x 16 x i8> %b, <vscale x 16 x i8> %c) {
; CHECK-LABEL: test_sdot_i32_zero:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    sdot z0.s, z1.b, z2.b
; CHECK-NEXT:    ret
entry:
  %vdot1.i = call <vscale x 4 x i32> @llvm.aarch64.sve.sdot.nxv4i32(<vscale x 4 x i32> zeroinitializer, <vscale x 16 x i8> %b, <vscale x 16 x i8> %c)
  %ret = add <vscale x 4 x i32> %vdot1.i, %a
  ret <vscale x 4 x i32> %ret
}

; SDOT (Indexed)

define <vscale x 4 x i32> @sdot_lane_i32(<vscale x 4 x i32> %a, <vscale x 16 x i8> %b, <vscale x 16 x i8> %c) {
; CHECK-LABEL: sdot_lane_i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sdot z0.s, z1.b, z2.b[2]
; CHECK-NEXT:    ret
  %out = call <vscale x 4 x i32> @llvm.aarch64.sve.sdot.lane.nxv4i32(<vscale x 4 x i32> %a,
                                                                     <vscale x 16 x i8> %b,
                                                                     <vscale x 16 x i8> %c,
                                                                     i32 2)
  ret <vscale x 4 x i32> %out
}

define <vscale x 2 x i64> @sdot_lane_i64(<vscale x 2 x i64> %a, <vscale x 8 x i16> %b, <vscale x 8 x i16> %c) {
; CHECK-LABEL: sdot_lane_i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sdot z0.d, z1.h, z2.h[1]
; CHECK-NEXT:    ret
  %out = call <vscale x 2 x i64> @llvm.aarch64.sve.sdot.lane.nxv2i64(<vscale x 2 x i64> %a,
                                                                     <vscale x 8 x i16> %b,
                                                                     <vscale x 8 x i16> %c,
                                                                     i32 1)
  ret <vscale x 2 x i64> %out
}

; SQADD

define <vscale x 16 x i8> @sqadd_i8(<vscale x 16 x i8> %a, <vscale x 16 x i8> %b) {
; CHECK-LABEL: sqadd_i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sqadd z0.b, z0.b, z1.b
; CHECK-NEXT:    ret
  %out = call <vscale x 16 x i8> @llvm.aarch64.sve.sqadd.x.nxv16i8(<vscale x 16 x i8> %a,
                                                                   <vscale x 16 x i8> %b)
  ret <vscale x 16 x i8> %out
}

define <vscale x 8 x i16> @sqadd_i16(<vscale x 8 x i16> %a, <vscale x 8 x i16> %b) {
; CHECK-LABEL: sqadd_i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sqadd z0.h, z0.h, z1.h
; CHECK-NEXT:    ret
  %out = call <vscale x 8 x i16> @llvm.aarch64.sve.sqadd.x.nxv8i16(<vscale x 8 x i16> %a,
                                                                   <vscale x 8 x i16> %b)
  ret <vscale x 8 x i16> %out
}

define <vscale x 4 x i32> @sqadd_i32(<vscale x 4 x i32> %a, <vscale x 4 x i32> %b) {
; CHECK-LABEL: sqadd_i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sqadd z0.s, z0.s, z1.s
; CHECK-NEXT:    ret
  %out = call <vscale x 4 x i32> @llvm.aarch64.sve.sqadd.x.nxv4i32(<vscale x 4 x i32> %a,
                                                                   <vscale x 4 x i32> %b)
  ret <vscale x 4 x i32> %out
}

define <vscale x 2 x i64> @sqadd_i64(<vscale x 2 x i64> %a, <vscale x 2 x i64> %b) {
; CHECK-LABEL: sqadd_i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sqadd z0.d, z0.d, z1.d
; CHECK-NEXT:    ret
  %out = call <vscale x 2 x i64> @llvm.aarch64.sve.sqadd.x.nxv2i64(<vscale x 2 x i64> %a,
                                                                   <vscale x 2 x i64> %b)
  ret <vscale x 2 x i64> %out
}

; SQSUB

define <vscale x 16 x i8> @sqsub_i8(<vscale x 16 x i8> %a, <vscale x 16 x i8> %b) {
; CHECK-LABEL: sqsub_i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sqsub z0.b, z0.b, z1.b
; CHECK-NEXT:    ret
  %out = call <vscale x 16 x i8> @llvm.aarch64.sve.sqsub.x.nxv16i8(<vscale x 16 x i8> %a,
                                                                   <vscale x 16 x i8> %b)
  ret <vscale x 16 x i8> %out
}

define <vscale x 8 x i16> @sqsub_i16(<vscale x 8 x i16> %a, <vscale x 8 x i16> %b) {
; CHECK-LABEL: sqsub_i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sqsub z0.h, z0.h, z1.h
; CHECK-NEXT:    ret
  %out = call <vscale x 8 x i16> @llvm.aarch64.sve.sqsub.x.nxv8i16(<vscale x 8 x i16> %a,
                                                                   <vscale x 8 x i16> %b)
  ret <vscale x 8 x i16> %out
}

define <vscale x 4 x i32> @sqsub_i32(<vscale x 4 x i32> %a, <vscale x 4 x i32> %b) {
; CHECK-LABEL: sqsub_i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sqsub z0.s, z0.s, z1.s
; CHECK-NEXT:    ret
  %out = call <vscale x 4 x i32> @llvm.aarch64.sve.sqsub.x.nxv4i32(<vscale x 4 x i32> %a,
                                                                   <vscale x 4 x i32> %b)
  ret <vscale x 4 x i32> %out
}

define <vscale x 2 x i64> @sqsub_i64(<vscale x 2 x i64> %a, <vscale x 2 x i64> %b) {
; CHECK-LABEL: sqsub_i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sqsub z0.d, z0.d, z1.d
; CHECK-NEXT:    ret
  %out = call <vscale x 2 x i64> @llvm.aarch64.sve.sqsub.x.nxv2i64(<vscale x 2 x i64> %a,
                                                                   <vscale x 2 x i64> %b)
  ret <vscale x 2 x i64> %out
}

; UDOT

define <vscale x 4 x i32> @udot_i32(<vscale x 4 x i32> %a, <vscale x 16 x i8> %b, <vscale x 16 x i8> %c) {
; CHECK-LABEL: udot_i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    udot z0.s, z1.b, z2.b
; CHECK-NEXT:    ret
  %out = call <vscale x 4 x i32> @llvm.aarch64.sve.udot.nxv4i32(<vscale x 4 x i32> %a,
                                                                <vscale x 16 x i8> %b,
                                                                <vscale x 16 x i8> %c)
  ret <vscale x 4 x i32> %out
}

define <vscale x 2 x i64> @udot_i64(<vscale x 2 x i64> %a, <vscale x 8 x i16> %b, <vscale x 8 x i16> %c) {
; CHECK-LABEL: udot_i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    udot z0.d, z1.h, z2.h
; CHECK-NEXT:    ret
  %out = call <vscale x 2 x i64> @llvm.aarch64.sve.udot.nxv2i64(<vscale x 2 x i64> %a,
                                                                <vscale x 8 x i16> %b,
                                                                <vscale x 8 x i16> %c)
  ret <vscale x 2 x i64> %out
}

define <vscale x 2 x i64> @test_udot_i64_zero(<vscale x 2 x i64> %a, <vscale x 8 x i16> %b, <vscale x 8 x i16> %c) {
; CHECK-LABEL: test_udot_i64_zero:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    udot z0.d, z1.h, z2.h
; CHECK-NEXT:    ret
entry:
  %vdot1.i = call <vscale x 2 x i64> @llvm.aarch64.sve.udot.nxv2i64(<vscale x 2 x i64> zeroinitializer, <vscale x 8 x i16> %b, <vscale x 8 x i16> %c)
  %ret = add <vscale x 2 x i64> %vdot1.i, %a
  ret <vscale x 2 x i64> %ret
}

define <vscale x 4 x i32> @test_udot_i32_zero(<vscale x 4 x i32> %a, <vscale x 16 x i8> %b, <vscale x 16 x i8> %c) {
; CHECK-LABEL: test_udot_i32_zero:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    udot z0.s, z1.b, z2.b
; CHECK-NEXT:    ret
entry:
  %vdot1.i = call <vscale x 4 x i32> @llvm.aarch64.sve.udot.nxv4i32(<vscale x 4 x i32> zeroinitializer, <vscale x 16 x i8> %b, <vscale x 16 x i8> %c)
  %ret = add <vscale x 4 x i32> %vdot1.i, %a
  ret <vscale x 4 x i32> %ret
}

; UDOT (Indexed)

define <vscale x 4 x i32> @udot_lane_i32(<vscale x 4 x i32> %a, <vscale x 16 x i8> %b, <vscale x 16 x i8> %c) {
; CHECK-LABEL: udot_lane_i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    udot z0.s, z1.b, z2.b[2]
; CHECK-NEXT:    ret
  %out = call <vscale x 4 x i32> @llvm.aarch64.sve.udot.lane.nxv4i32(<vscale x 4 x i32> %a,
                                                                     <vscale x 16 x i8> %b,
                                                                     <vscale x 16 x i8> %c,
                                                                     i32 2)
  ret <vscale x 4 x i32> %out
}

; UQADD

define <vscale x 16 x i8> @uqadd_i8(<vscale x 16 x i8> %a, <vscale x 16 x i8> %b) {
; CHECK-LABEL: uqadd_i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    uqadd z0.b, z0.b, z1.b
; CHECK-NEXT:    ret
  %out = call <vscale x 16 x i8> @llvm.aarch64.sve.uqadd.x.nxv16i8(<vscale x 16 x i8> %a,
                                                                   <vscale x 16 x i8> %b)
  ret <vscale x 16 x i8> %out
}

define <vscale x 8 x i16> @uqadd_i16(<vscale x 8 x i16> %a, <vscale x 8 x i16> %b) {
; CHECK-LABEL: uqadd_i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    uqadd z0.h, z0.h, z1.h
; CHECK-NEXT:    ret
  %out = call <vscale x 8 x i16> @llvm.aarch64.sve.uqadd.x.nxv8i16(<vscale x 8 x i16> %a,
                                                                   <vscale x 8 x i16> %b)
  ret <vscale x 8 x i16> %out
}

define <vscale x 4 x i32> @uqadd_i32(<vscale x 4 x i32> %a, <vscale x 4 x i32> %b) {
; CHECK-LABEL: uqadd_i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    uqadd z0.s, z0.s, z1.s
; CHECK-NEXT:    ret
  %out = call <vscale x 4 x i32> @llvm.aarch64.sve.uqadd.x.nxv4i32(<vscale x 4 x i32> %a,
                                                                   <vscale x 4 x i32> %b)
  ret <vscale x 4 x i32> %out
}

define <vscale x 2 x i64> @uqadd_i64(<vscale x 2 x i64> %a, <vscale x 2 x i64> %b) {
; CHECK-LABEL: uqadd_i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    uqadd z0.d, z0.d, z1.d
; CHECK-NEXT:    ret
  %out = call <vscale x 2 x i64> @llvm.aarch64.sve.uqadd.x.nxv2i64(<vscale x 2 x i64> %a,
                                                                   <vscale x 2 x i64> %b)
  ret <vscale x 2 x i64> %out
}

; UQSUB

define <vscale x 16 x i8> @uqsub_i8(<vscale x 16 x i8> %a, <vscale x 16 x i8> %b) {
; CHECK-LABEL: uqsub_i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    uqsub z0.b, z0.b, z1.b
; CHECK-NEXT:    ret
  %out = call <vscale x 16 x i8> @llvm.aarch64.sve.uqsub.x.nxv16i8(<vscale x 16 x i8> %a,
                                                                   <vscale x 16 x i8> %b)
  ret <vscale x 16 x i8> %out
}

define <vscale x 8 x i16> @uqsub_i16(<vscale x 8 x i16> %a, <vscale x 8 x i16> %b) {
; CHECK-LABEL: uqsub_i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    uqsub z0.h, z0.h, z1.h
; CHECK-NEXT:    ret
  %out = call <vscale x 8 x i16> @llvm.aarch64.sve.uqsub.x.nxv8i16(<vscale x 8 x i16> %a,
                                                                   <vscale x 8 x i16> %b)
  ret <vscale x 8 x i16> %out
}

define <vscale x 4 x i32> @uqsub_i32(<vscale x 4 x i32> %a, <vscale x 4 x i32> %b) {
; CHECK-LABEL: uqsub_i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    uqsub z0.s, z0.s, z1.s
; CHECK-NEXT:    ret
  %out = call <vscale x 4 x i32> @llvm.aarch64.sve.uqsub.x.nxv4i32(<vscale x 4 x i32> %a,
                                                                   <vscale x 4 x i32> %b)
  ret <vscale x 4 x i32> %out
}

define <vscale x 2 x i64> @uqsub_i64(<vscale x 2 x i64> %a, <vscale x 2 x i64> %b) {
; CHECK-LABEL: uqsub_i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    uqsub z0.d, z0.d, z1.d
; CHECK-NEXT:    ret
  %out = call <vscale x 2 x i64> @llvm.aarch64.sve.uqsub.x.nxv2i64(<vscale x 2 x i64> %a,
                                                                   <vscale x 2 x i64> %b)
  ret <vscale x 2 x i64> %out
}

; ADD (tuples)

define <vscale x 4 x i64> @add_i64_tuple2(<vscale x 4 x i64>* %out, <vscale x 2 x i64> %in1, <vscale x 2 x i64> %in2) {
; CHECK-LABEL: add_i64_tuple2:
; CHECK:       // %bb.0:
; CHECK-NEXT:    add z0.d, z0.d, z0.d
; CHECK-NEXT:    add z1.d, z1.d, z1.d
; CHECK-NEXT:    ret
  %tuple = tail call <vscale x 4 x i64> @llvm.aarch64.sve.tuple.create2.nxv4i64.nxv2i64(<vscale x 2 x i64> %in1, <vscale x 2 x i64> %in2)
  %res = add <vscale x 4 x i64> %tuple, %tuple
  ret <vscale x 4 x i64> %res
}

define <vscale x 6 x i64> @add_i64_tuple3(<vscale x 6 x i64>* %out, <vscale x 2 x i64> %in1, <vscale x 2 x i64> %in2, <vscale x 2 x i64> %in3) {
; CHECK-LABEL: add_i64_tuple3:
; CHECK:       // %bb.0:
; CHECK-NEXT:    add z0.d, z0.d, z0.d
; CHECK-NEXT:    add z1.d, z1.d, z1.d
; CHECK-NEXT:    add z2.d, z2.d, z2.d
; CHECK-NEXT:    ret
  %tuple = tail call <vscale x 6 x i64> @llvm.aarch64.sve.tuple.create3.nxv6i64.nxv2i64(<vscale x 2 x i64> %in1, <vscale x 2 x i64> %in2, <vscale x 2 x i64> %in3)
  %res = add <vscale x 6 x i64> %tuple, %tuple
  ret <vscale x 6 x i64> %res
}

define <vscale x 8 x i64> @add_i64_tuple4(<vscale x 8 x i64>* %out, <vscale x 2 x i64> %in1, <vscale x 2 x i64> %in2, <vscale x 2 x i64> %in3, <vscale x 2 x i64> %in4) {
; CHECK-LABEL: add_i64_tuple4:
; CHECK:       // %bb.0:
; CHECK-NEXT:    add z0.d, z0.d, z0.d
; CHECK-NEXT:    add z1.d, z1.d, z1.d
; CHECK-NEXT:    add z2.d, z2.d, z2.d
; CHECK-NEXT:    add z3.d, z3.d, z3.d
; CHECK-NEXT:    ret
  %tuple = tail call <vscale x 8 x i64> @llvm.aarch64.sve.tuple.create4.nxv8i64.nxv2i64(<vscale x 2 x i64> %in1, <vscale x 2 x i64> %in2, <vscale x 2 x i64> %in3, <vscale x 2 x i64> %in4)
  %res = add <vscale x 8 x i64> %tuple, %tuple
  ret <vscale x 8 x i64> %res
}


declare <vscale x 16 x i8> @llvm.aarch64.sve.abs.nxv16i8(<vscale x 16 x i8>, <vscale x 16 x i1>, <vscale x 16 x i8>)
declare <vscale x 8 x i16> @llvm.aarch64.sve.abs.nxv8i16(<vscale x 8 x i16>, <vscale x 8 x i1>, <vscale x 8 x i16>)
declare <vscale x 4 x i32> @llvm.aarch64.sve.abs.nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i1>, <vscale x 4 x i32>)
declare <vscale x 2 x i64> @llvm.aarch64.sve.abs.nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i1>, <vscale x 2 x i64>)

declare <vscale x 16 x i8> @llvm.aarch64.sve.neg.nxv16i8(<vscale x 16 x i8>, <vscale x 16 x i1>, <vscale x 16 x i8>)
declare <vscale x 8 x i16> @llvm.aarch64.sve.neg.nxv8i16(<vscale x 8 x i16>, <vscale x 8 x i1>, <vscale x 8 x i16>)
declare <vscale x 4 x i32> @llvm.aarch64.sve.neg.nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i1>, <vscale x 4 x i32>)
declare <vscale x 2 x i64> @llvm.aarch64.sve.neg.nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i1>, <vscale x 2 x i64>)

declare <vscale x 4 x i32> @llvm.aarch64.sve.sdot.nxv4i32(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>)
declare <vscale x 2 x i64> @llvm.aarch64.sve.sdot.nxv2i64(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>)

declare <vscale x 4 x i32> @llvm.aarch64.sve.sdot.lane.nxv4i32(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, i32)
declare <vscale x 2 x i64> @llvm.aarch64.sve.sdot.lane.nxv2i64(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>, i32)

declare <vscale x 16 x i8> @llvm.aarch64.sve.sqadd.x.nxv16i8(<vscale x 16 x i8>, <vscale x 16 x i8>)
declare <vscale x 8 x i16> @llvm.aarch64.sve.sqadd.x.nxv8i16(<vscale x 8 x i16>, <vscale x 8 x i16>)
declare <vscale x 4 x i32> @llvm.aarch64.sve.sqadd.x.nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>)
declare <vscale x 2 x i64> @llvm.aarch64.sve.sqadd.x.nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i64>)

declare <vscale x 16 x i8> @llvm.aarch64.sve.sqsub.x.nxv16i8(<vscale x 16 x i8>, <vscale x 16 x i8>)
declare <vscale x 8 x i16> @llvm.aarch64.sve.sqsub.x.nxv8i16(<vscale x 8 x i16>, <vscale x 8 x i16>)
declare <vscale x 4 x i32> @llvm.aarch64.sve.sqsub.x.nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>)
declare <vscale x 2 x i64> @llvm.aarch64.sve.sqsub.x.nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i64>)

declare <vscale x 4 x i32> @llvm.aarch64.sve.udot.nxv4i32(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>)
declare <vscale x 2 x i64> @llvm.aarch64.sve.udot.nxv2i64(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>)

declare <vscale x 4 x i32> @llvm.aarch64.sve.udot.lane.nxv4i32(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, i32)
declare <vscale x 2 x i64> @llvm.aarch64.sve.udot.lane.nxv2i64(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>, i32)

declare <vscale x 16 x i8> @llvm.aarch64.sve.uqadd.x.nxv16i8(<vscale x 16 x i8>, <vscale x 16 x i8>)
declare <vscale x 8 x i16> @llvm.aarch64.sve.uqadd.x.nxv8i16(<vscale x 8 x i16>, <vscale x 8 x i16>)
declare <vscale x 4 x i32> @llvm.aarch64.sve.uqadd.x.nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>)
declare <vscale x 2 x i64> @llvm.aarch64.sve.uqadd.x.nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i64>)

declare <vscale x 16 x i8> @llvm.aarch64.sve.uqsub.x.nxv16i8(<vscale x 16 x i8>, <vscale x 16 x i8>)
declare <vscale x 8 x i16> @llvm.aarch64.sve.uqsub.x.nxv8i16(<vscale x 8 x i16>, <vscale x 8 x i16>)
declare <vscale x 4 x i32> @llvm.aarch64.sve.uqsub.x.nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>)
declare <vscale x 2 x i64> @llvm.aarch64.sve.uqsub.x.nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i64>)

declare <vscale x 4 x i64> @llvm.aarch64.sve.tuple.create2.nxv4i64.nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i64>)
declare <vscale x 6 x i64> @llvm.aarch64.sve.tuple.create3.nxv6i64.nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>)
declare <vscale x 8 x i64> @llvm.aarch64.sve.tuple.create4.nxv8i64.nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>)
