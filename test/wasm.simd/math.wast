;;-------------------------------------------------------------------------------------------------------
;; Copyright (C) Microsoft Corporation and contributors. All rights reserved.
;; Licensed under the MIT license. See LICENSE.txt file in the project root for full license information.
;;-------------------------------------------------------------------------------------------------------

(module
  (import "dummy" "memory" (memory 1))

    (func (export "func_i8x16_shuffle_test0")
        (local $v1 m128) (local $v2 m128)

        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))

        (m128.store offset=0 (i32.const 0)
            (v8x16.shuffle
                (get_local $v1) (get_local $v2)
                (i32.const 31) (i32.const 30) (i32.const 29) (i32.const 28)
                (i32.const 1) (i32.const 17) (i32.const 2) (i32.const 19)
                (i32.const 3) (i32.const 4) (i32.const 5) (i32.const 6)
                (i32.const 21) (i32.const 20) (i32.const 11) (i32.const 10)
            )
        )
    )

    (func (export "func_i8x16_shuffle_test1")
        (local $v1 m128) (local $v2 m128)

        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))

        (m128.store offset=0 (i32.const 0)
            (v8x16.shuffle
                (get_local $v1) (get_local $v2)
                (i32.const 16) (i32.const 17) (i32.const 18) (i32.const 19)
                (i32.const 20) (i32.const 21) (i32.const 22) (i32.const 23)
                (i32.const 0) (i32.const 1) (i32.const 2) (i32.const 3)
                (i32.const 4) (i32.const 5) (i32.const 6) (i32.const 7)
            )
        )
    )

    (func (export "func_i8x16_shuffle_test2")
        (local $v1 m128) (local $v2 m128)

        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))

        (m128.store offset=0 (i32.const 0)
            (v8x16.shuffle
                (get_local $v1) (get_local $v2)
                (i32.const 0) (i32.const 17) (i32.const 1) (i32.const 18)
                (i32.const 2) (i32.const 19) (i32.const 3) (i32.const 20)
                (i32.const 4) (i32.const 21) (i32.const 5) (i32.const 22)
                (i32.const 6) (i32.const 23) (i32.const 7) (i32.const 24)
            )
        )
    )

    (func (export "func_i32x4_bitselect") (local $v1 m128) (local $v2 m128) (local $mask m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (set_local $mask (m128.load offset=0 align=4 (i32.const 32)))
        (m128.store offset=0 (i32.const 0) (m128.bitselect (get_local $v1) (get_local $v2) (get_local $mask)))
    )

    (func (export "func_i32x4_add") (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i32x4.add (get_local $v1) (get_local $v2)))
    )

    (func (export "func_i32x4_sub") (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i32x4.sub (get_local $v1) (get_local $v2)))
    )

    (func (export "func_i32x4_mul") (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i32x4.mul (get_local $v1) (get_local $v2)))
    )

    (func (export "func_i32x4_shl") (param $shamt i32) (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i32x4.shl (get_local $v1) (get_local $shamt)))
    )

    (func (export "func_i32x4_shr_s") (param $shamt i32) (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i32x4.shr_s (get_local $v1) (get_local $shamt)))
    )

    (func (export "func_i32x4_shr_u") (param $shamt i32) (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i32x4.shr_u (get_local $v1) (get_local $shamt)))
    )

    (func (export "func_i16x8_add") (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i16x8.add (get_local $v1) (get_local $v2)))
    )

    (func (export "func_i16x8_addsaturate_s") (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i16x8.addsaturate_s (get_local $v1) (get_local $v2)))
    )

    (func (export "func_i16x8_addsaturate_u") (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i16x8.addsaturate_u (get_local $v1) (get_local $v2)))
    )

    (func (export "func_i16x8_sub") (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i16x8.sub (get_local $v1) (get_local $v2)))
    )

    (func (export "func_i16x8_subsaturate_s") (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i16x8.subsaturate_s (get_local $v1) (get_local $v2)))
    )

    (func (export "func_i16x8_subsaturate_u") (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i16x8.subsaturate_u (get_local $v1) (get_local $v2)))
    )

    (func (export "func_i16x8_mul") (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i16x8.mul (get_local $v1) (get_local $v2)))
    )

    (func (export "func_i16x8_shl") (param $shamt i32) (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i16x8.shl (get_local $v1) (get_local $shamt)))
    )

    (func (export "func_i16x8_shr_s") (param $shamt i32) (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i16x8.shr_s (get_local $v1) (get_local $shamt)))
    )

    (func (export "func_i16x8_shr_u") (param $shamt i32) (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i16x8.shr_u (get_local $v1) (get_local $shamt)))
    )

    (func (export "func_i8x16_add") (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i8x16.add (get_local $v1) (get_local $v2)))
    )

    (func (export "func_i8x16_addsaturate_s") (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i8x16.addsaturate_s (get_local $v1) (get_local $v2)))
    )

    (func (export "func_i8x16_addsaturate_u") (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i8x16.addsaturate_u (get_local $v1) (get_local $v2)))
    )

    (func (export "func_i8x16_sub") (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i8x16.sub (get_local $v1) (get_local $v2)))
    )

    (func (export "func_i8x16_subsaturate_s") (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i8x16.subsaturate_s (get_local $v1) (get_local $v2)))
    )

    (func (export "func_i8x16_subsaturate_u") (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i8x16.subsaturate_u (get_local $v1) (get_local $v2)))
    )

    (func (export "func_i8x16_mul") (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i8x16.mul (get_local $v1) (get_local $v2)))
    )

    (func (export "func_i8x16_shl") (param $shamt i32) (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i8x16.shl (get_local $v1) (get_local $shamt)))
    )

    (func (export "func_i8x16_shr_s") (param $shamt i32) (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i8x16.shr_s (get_local $v1) (get_local $shamt)))
    )

    (func (export "func_i8x16_shr_u") (param $shamt i32) (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (i8x16.shr_u (get_local $v1) (get_local $shamt)))
    )

    (func (export "func_f32x4_add") (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (f32x4.add (get_local $v1) (get_local $v2)))
    )

    (func (export "func_f32x4_sub") (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (f32x4.sub (get_local $v1) (get_local $v2)))
    )

    (func (export "func_f32x4_mul") (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (f32x4.mul (get_local $v1) (get_local $v2)))
    )

    (func (export "func_f32x4_div") (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (f32x4.div (get_local $v1) (get_local $v2)))
    )

    (func (export "func_f32x4_min") (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (f32x4.min (get_local $v1) (get_local $v2)))
    )

    (func (export "func_f32x4_max") (local $v1 m128) (local $v2 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (set_local $v2 (m128.load offset=0 align=4 (i32.const 16)))
        (m128.store offset=0 (i32.const 0) (f32x4.max (get_local $v1) (get_local $v2)))
    )

    (func (export "func_f32x4_abs")  (local $v1 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (m128.store offset=0 (i32.const 0) (f32x4.abs (get_local $v1)))
    )

    (func (export "func_f32x4_sqrt")  (local $v1 m128)
        (set_local $v1 (m128.load offset=0 align=4 (i32.const 0)))
        (m128.store offset=0 (i32.const 0) (f32x4.sqrt (get_local $v1)))
    )
)
