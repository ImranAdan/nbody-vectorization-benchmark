
/bench/bench:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000010b40 <_start>:
   10b40:	d503201f 	nop
   10b44:	d280001d 	mov	x29, #0x0                   	// #0
   10b48:	d280001e 	mov	x30, #0x0                   	// #0
   10b4c:	aa0003e5 	mov	x5, x0
   10b50:	f94003e1 	ldr	x1, [sp]
   10b54:	910023e2 	add	x2, sp, #0x8
   10b58:	910003e6 	mov	x6, sp
   10b5c:	d503201f 	nop
   10b60:	10000980 	adr	x0, 10c90 <main>
   10b64:	d2800003 	mov	x3, #0x0                   	// #0
   10b68:	d2800004 	mov	x4, #0x0                   	// #0
   10b6c:	9400014d 	bl	110a0 <__libc_start_main@plt>
   10b70:	94000148 	bl	11090 <abort@plt>

0000000000010b74 <call_weak_fn>:
   10b74:	b0000080 	adrp	x0, 21000 <sincos@plt+0xfec0>
   10b78:	f941a000 	ldr	x0, [x0, #832]
   10b7c:	b4000040 	cbz	x0, 10b84 <call_weak_fn+0x10>
   10b80:	1400014c 	b	110b0 <__gmon_start__@plt>
   10b84:	d65f03c0 	ret
	...

0000000000010b90 <deregister_tm_clones>:
   10b90:	d503201f 	nop
   10b94:	10103f20 	adr	x0, 31378 <__TMC_END__>
   10b98:	d503201f 	nop
   10b9c:	10103ee1 	adr	x1, 31378 <__TMC_END__>
   10ba0:	eb00003f 	cmp	x1, x0
   10ba4:	540000c0 	b.eq	10bbc <deregister_tm_clones+0x2c>  // b.none
   10ba8:	b0000081 	adrp	x1, 21000 <sincos@plt+0xfec0>
   10bac:	f941a421 	ldr	x1, [x1, #840]
   10bb0:	b4000061 	cbz	x1, 10bbc <deregister_tm_clones+0x2c>
   10bb4:	aa0103f0 	mov	x16, x1
   10bb8:	d61f0200 	br	x16
   10bbc:	d65f03c0 	ret

0000000000010bc0 <register_tm_clones>:
   10bc0:	d503201f 	nop
   10bc4:	10103da0 	adr	x0, 31378 <__TMC_END__>
   10bc8:	d503201f 	nop
   10bcc:	10103d61 	adr	x1, 31378 <__TMC_END__>
   10bd0:	cb000021 	sub	x1, x1, x0
   10bd4:	d37ffc22 	lsr	x2, x1, #63
   10bd8:	8b810c41 	add	x1, x2, x1, asr #3
   10bdc:	9341fc21 	asr	x1, x1, #1
   10be0:	b40000c1 	cbz	x1, 10bf8 <register_tm_clones+0x38>
   10be4:	b0000082 	adrp	x2, 21000 <sincos@plt+0xfec0>
   10be8:	f941a842 	ldr	x2, [x2, #848]
   10bec:	b4000062 	cbz	x2, 10bf8 <register_tm_clones+0x38>
   10bf0:	aa0203f0 	mov	x16, x2
   10bf4:	d61f0200 	br	x16
   10bf8:	d65f03c0 	ret
   10bfc:	d503201f 	nop

0000000000010c00 <__do_global_dtors_aux>:
   10c00:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   10c04:	910003fd 	mov	x29, sp
   10c08:	f9000bf3 	str	x19, [sp, #16]
   10c0c:	b0000113 	adrp	x19, 31000 <_DYNAMIC+0xfe98>
   10c10:	394fc260 	ldrb	w0, [x19, #1008]
   10c14:	35000140 	cbnz	w0, 10c3c <__do_global_dtors_aux+0x3c>
   10c18:	b0000080 	adrp	x0, 21000 <sincos@plt+0xfec0>
   10c1c:	f941ac00 	ldr	x0, [x0, #856]
   10c20:	b4000080 	cbz	x0, 10c30 <__do_global_dtors_aux+0x30>
   10c24:	b0000100 	adrp	x0, 31000 <_DYNAMIC+0xfe98>
   10c28:	f941b800 	ldr	x0, [x0, #880]
   10c2c:	94000125 	bl	110c0 <__cxa_finalize@plt>
   10c30:	97ffffd8 	bl	10b90 <deregister_tm_clones>
   10c34:	52800020 	mov	w0, #0x1                   	// #1
   10c38:	390fc260 	strb	w0, [x19, #1008]
   10c3c:	f9400bf3 	ldr	x19, [sp, #16]
   10c40:	a8c27bfd 	ldp	x29, x30, [sp], #32
   10c44:	d65f03c0 	ret
   10c48:	d503201f 	nop
   10c4c:	d503201f 	nop

0000000000010c50 <frame_dummy>:
   10c50:	17ffffdc 	b	10bc0 <register_tm_clones>

0000000000010c54 <_GLOBAL__sub_I_bench.cpp>:
   10c54:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   10c58:	f9000bf3 	str	x19, [sp, #16]
   10c5c:	910003fd 	mov	x29, sp
   10c60:	d503201f 	nop
   10c64:	30103c73 	adr	x19, 313f1 <_ZStL8__ioinit>
   10c68:	aa1303e0 	mov	x0, x19
   10c6c:	94000119 	bl	110d0 <_ZNSt8ios_base4InitC1Ev@plt>
   10c70:	b0000080 	adrp	x0, 21000 <sincos@plt+0xfec0>
   10c74:	aa1303e1 	mov	x1, x19
   10c78:	d503201f 	nop
   10c7c:	101037a2 	adr	x2, 31370 <__dso_handle>
   10c80:	f941b000 	ldr	x0, [x0, #864]
   10c84:	f9400bf3 	ldr	x19, [sp, #16]
   10c88:	a8c27bfd 	ldp	x29, x30, [sp], #32
   10c8c:	14000115 	b	110e0 <__cxa_atexit@plt>

0000000000010c90 <main>:
   10c90:	d10543ff 	sub	sp, sp, #0x150
   10c94:	fd006bec 	str	d12, [sp, #208]
   10c98:	6d0dabeb 	stp	d11, d10, [sp, #216]
   10c9c:	6d0ea3e9 	stp	d9, d8, [sp, #232]
   10ca0:	a90ffbfd 	stp	x29, x30, [sp, #248]
   10ca4:	9103e3fd 	add	x29, sp, #0xf8
   10ca8:	f90087fc 	str	x28, [sp, #264]
   10cac:	a91167fa 	stp	x26, x25, [sp, #272]
   10cb0:	a9125ff8 	stp	x24, x23, [sp, #288]
   10cb4:	a91357f6 	stp	x22, x21, [sp, #304]
   10cb8:	a9144ff4 	stp	x20, x19, [sp, #320]
   10cbc:	5291b000 	mov	w0, #0x8d80                	// #36224
   10cc0:	5291b017 	mov	w23, #0x8d80                	// #36224
   10cc4:	72a00b60 	movk	w0, #0x5b, lsl #16
   10cc8:	72a00b77 	movk	w23, #0x5b, lsl #16
   10ccc:	94000111 	bl	11110 <_Znwm@plt>
   10cd0:	aa0003f3 	mov	x19, x0
   10cd4:	aa1f03e8 	mov	x8, xzr
   10cd8:	d10062e9 	sub	x9, x23, #0x18
   10cdc:	a900fc1f 	stp	xzr, xzr, [x0, #8]
   10ce0:	f900001f 	str	xzr, [x0]
   10ce4:	8b08026a 	add	x10, x19, x8
   10ce8:	3dc00260 	ldr	q0, [x19]
   10cec:	f9400a6b 	ldr	x11, [x19, #16]
   10cf0:	91006108 	add	x8, x8, #0x18
   10cf4:	eb08013f 	cmp	x9, x8
   10cf8:	3c818140 	stur	q0, [x10, #24]
   10cfc:	f900154b 	str	x11, [x10, #40]
   10d00:	54ffff21 	b.ne	10ce4 <main+0x54>  // b.any
   10d04:	d285a309 	mov	x9, #0x2d18                	// #11544
   10d08:	d285ac0a 	mov	x10, #0x2d60                	// #11616
   10d0c:	6f00f400 	fmov	v0.2d, #2.000000000000000000e+00
   10d10:	f2aa8889 	movk	x9, #0x5444, lsl #16
   10d14:	f2c43f69 	movk	x9, #0x21fb, lsl #32
   10d18:	f2b2340a 	movk	x10, #0x91a0, lsl #16
   10d1c:	f2e80129 	movk	x9, #0x4009, lsl #48
   10d20:	90ffff88 	adrp	x8, 0 <__abi_tag-0x2c4>
   10d24:	f2ce442a 	movk	x10, #0x7221, lsl #32
   10d28:	d2d08f0b 	mov	x11, #0x847800000000        	// #145650930941952
   10d2c:	3d8013e0 	str	q0, [sp, #64]
   10d30:	f2e7fd0a 	movk	x10, #0x3fe8, lsl #48
   10d34:	6f03f600 	fmov	v0.2d, #1.000000000000000000e+00
   10d38:	f2f821cb 	movk	x11, #0xc10e, lsl #48
   10d3c:	4e080d21 	dup	v1.2d, x9
   10d40:	aa1f03f4 	mov	x20, xzr
   10d44:	0f000449 	movi	v9.2s, #0x2
   10d48:	fd447d08 	ldr	d8, [x8, #2296]
   10d4c:	d100c3b5 	sub	x21, x29, #0x30
   10d50:	d100e3b6 	sub	x22, x29, #0x38
   10d54:	ad0107e0 	stp	q0, q1, [sp, #32]
   10d58:	4e080d41 	dup	v1.2d, x10
   10d5c:	4e080d60 	dup	v0.2d, x11
   10d60:	ad0007e0 	stp	q0, q1, [sp]
   10d64:	0f20a500 	sxtl	v0.2d, v8.2s
   10d68:	3dc003e1 	ldr	q1, [sp]
   10d6c:	3dc00be3 	ldr	q3, [sp, #32]
   10d70:	9101c3e8 	add	x8, sp, #0x70
   10d74:	3dc013e2 	ldr	q2, [sp, #64]
   10d78:	d10103a0 	sub	x0, x29, #0x40
   10d7c:	d10123a1 	sub	x1, x29, #0x48
   10d80:	4e61d800 	scvtf	v0.2d, v0.2d
   10d84:	4ea31c65 	mov	v5.16b, v3.16b
   10d88:	6e61fc01 	fdiv	v1.2d, v0.2d, v1.2d
   10d8c:	4e61cc45 	fmla	v5.2d, v2.2d, v1.2d
   10d90:	4ea31c61 	mov	v1.16b, v3.16b
   10d94:	4c006d04 	st1	{v4.2d-v6.2d}, [x8]
   10d98:	4ee5cca1 	fmls	v1.2d, v5.2d, v5.2d
   10d9c:	6ee1f822 	fsqrt	v2.2d, v1.2d
   10da0:	3dc00fe1 	ldr	q1, [sp, #48]
   10da4:	6e61dc00 	fmul	v0.2d, v0.2d, v1.2d
   10da8:	3dc007e1 	ldr	q1, [sp, #16]
   10dac:	6e61dc00 	fmul	v0.2d, v0.2d, v1.2d
   10db0:	ad028be0 	stp	q0, q2, [sp, #80]
   10db4:	940000e3 	bl	11140 <sincos@plt>
   10db8:	3dc017e0 	ldr	q0, [sp, #80]
   10dbc:	d100c3a0 	sub	x0, x29, #0x30
   10dc0:	fc5b83a1 	ldur	d1, [x29, #-72]
   10dc4:	d100e3a1 	sub	x1, x29, #0x38
   10dc8:	5e180400 	mov	d0, v0.d[1]
   10dcc:	3d8017e1 	str	q1, [sp, #80]
   10dd0:	940000dc 	bl	11140 <sincos@plt>
   10dd4:	ad4293e5 	ldp	q5, q4, [sp, #80]
   10dd8:	9101c3e8 	add	x8, sp, #0x70
   10ddc:	0ea98508 	add	v8.2s, v8.2s, v9.2s
   10de0:	fc5c03a0 	ldur	d0, [x29, #-64]
   10de4:	4d4086c5 	ld1	{v5.d}[1], [x22]
   10de8:	4c406d01 	ld1	{v1.2d-v3.2d}, [x8]
   10dec:	8b140268 	add	x8, x19, x20
   10df0:	9100c294 	add	x20, x20, #0x30
   10df4:	eb1402ff 	cmp	x23, x20
   10df8:	6e64dca1 	fmul	v1.2d, v5.2d, v4.2d
   10dfc:	4d4086a0 	ld1	{v0.d}[1], [x21]
   10e00:	6e64dc03 	fmul	v3.2d, v0.2d, v4.2d
   10e04:	4c004d01 	st3	{v1.2d-v3.2d}, [x8]
   10e08:	54fffae1 	b.ne	10d64 <main+0xd4>  // b.any
   10e0c:	90ffff80 	adrp	x0, 0 <__abi_tag-0x2c4>
   10e10:	9125b400 	add	x0, x0, #0x96d
   10e14:	940000c7 	bl	11130 <puts@plt>
   10e18:	2f00e408 	movi	d8, #0x0
   10e1c:	940000b9 	bl	11100 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
   10e20:	90ffff88 	adrp	x8, 0 <__abi_tag-0x2c4>
   10e24:	d2c80018 	mov	x24, #0x400000000000        	// #70368744177664
   10e28:	f2e811f8 	movk	x24, #0x408f, lsl #48
   10e2c:	529999b9 	mov	w25, #0xcccd                	// #52429
   10e30:	6f00f697 	fmov	v23.2d, #5.000000000000000000e+00
   10e34:	5299999a 	mov	w26, #0xcccc                	// #52428
   10e38:	2f00e40a 	movi	d10, #0x0
   10e3c:	90ffff96 	adrp	x22, 0 <__abi_tag-0x2c4>
   10e40:	aa0003f4 	mov	x20, x0
   10e44:	2a1f03f5 	mov	w21, wzr
   10e48:	72b99999 	movk	w25, #0xcccc, lsl #16
   10e4c:	72a1999a 	movk	w26, #0xccc, lsl #16
   10e50:	fd448109 	ldr	d9, [x8, #2304]
   10e54:	1e62900b 	fmov	d11, #5.000000000000000000e+00
   10e58:	1e6e100c 	fmov	d12, #1.000000000000000000e+00
   10e5c:	9124e6d6 	add	x22, x22, #0x939
   10e60:	4e080f18 	dup	v24.2d, x24
   10e64:	ad035ff8 	stp	q24, q23, [sp, #96]
   10e68:	14000005 	b	10e7c <main+0x1ec>
   10e6c:	1e6c294a 	fadd	d10, d10, d12
   10e70:	110006b5 	add	w21, w21, #0x1
   10e74:	710192bf 	cmp	w21, #0x64
   10e78:	54000960 	b.eq	10fa4 <main+0x314>  // b.none
   10e7c:	1e690940 	fmul	d0, d10, d9
   10e80:	d10143a0 	sub	x0, x29, #0x50
   10e84:	d10163a1 	sub	x1, x29, #0x58
   10e88:	940000ae 	bl	11140 <sincos@plt>
   10e8c:	6d7a87a0 	ldp	d0, d1, [x29, #-88]
   10e90:	aa1f03e8 	mov	x8, xzr
   10e94:	ad435ff8 	ldp	q24, q23, [sp, #96]
   10e98:	4e080403 	dup	v3.2d, v0.d[0]
   10e9c:	4e080422 	dup	v2.2d, v1.d[0]
   10ea0:	8b080269 	add	x9, x19, x8
   10ea4:	91018108 	add	x8, x8, #0x60
   10ea8:	eb0802ff 	cmp	x23, x8
   10eac:	4cdf4d24 	ld3	{v4.2d-v6.2d}, [x9], #48
   10eb0:	4fc090c7 	fmul	v7.2d, v6.2d, v0.d[0]
   10eb4:	4fc190d6 	fmul	v22.2d, v6.2d, v1.d[0]
   10eb8:	4ee4cc47 	fmls	v7.2d, v2.2d, v4.2d
   10ebc:	4e64cc76 	fmla	v22.2d, v3.2d, v4.2d
   10ec0:	4c404d31 	ld3	{v17.2d-v19.2d}, [x9]
   10ec4:	4fc090f0 	fmul	v16.2d, v7.2d, v0.d[0]
   10ec8:	6ee0f8e7 	fneg	v7.2d, v7.2d
   10ecc:	4e65cc50 	fmla	v16.2d, v2.2d, v5.2d
   10ed0:	4fc190e7 	fmul	v7.2d, v7.2d, v1.d[0]
   10ed4:	4e77d610 	fadd	v16.2d, v16.2d, v23.2d
   10ed8:	4fc09274 	fmul	v20.2d, v19.2d, v0.d[0]
   10edc:	4e65cc67 	fmla	v7.2d, v3.2d, v5.2d
   10ee0:	4fc19264 	fmul	v4.2d, v19.2d, v1.d[0]
   10ee4:	6e70ff10 	fdiv	v16.2d, v24.2d, v16.2d
   10ee8:	4ef1cc54 	fmls	v20.2d, v2.2d, v17.2d
   10eec:	4e71cc64 	fmla	v4.2d, v3.2d, v17.2d
   10ef0:	4fc09295 	fmul	v21.2d, v20.2d, v0.d[0]
   10ef4:	6ee0fa94 	fneg	v20.2d, v20.2d
   10ef8:	4e72cc55 	fmla	v21.2d, v2.2d, v18.2d
   10efc:	4fc19285 	fmul	v5.2d, v20.2d, v1.d[0]
   10f00:	4e77d6b5 	fadd	v21.2d, v21.2d, v23.2d
   10f04:	4e72cc65 	fmla	v5.2d, v3.2d, v18.2d
   10f08:	6e75ff15 	fdiv	v21.2d, v24.2d, v21.2d
   10f0c:	6e70dec6 	fmul	v6.2d, v22.2d, v16.2d
   10f10:	6e70dce7 	fmul	v7.2d, v7.2d, v16.2d
   10f14:	4e67d4c6 	fadd	v6.2d, v6.2d, v7.2d
   10f18:	5e1804c7 	mov	d7, v6.d[1]
   10f1c:	1e662906 	fadd	d6, d8, d6
   10f20:	6e75dc84 	fmul	v4.2d, v4.2d, v21.2d
   10f24:	6e75dca5 	fmul	v5.2d, v5.2d, v21.2d
   10f28:	4e65d484 	fadd	v4.2d, v4.2d, v5.2d
   10f2c:	1e6728c5 	fadd	d5, d6, d7
   10f30:	5e180486 	mov	d6, v4.d[1]
   10f34:	1e6428a4 	fadd	d4, d5, d4
   10f38:	1e662888 	fadd	d8, d4, d6
   10f3c:	54fffb21 	b.ne	10ea0 <main+0x210>  // b.any
   10f40:	1b197ea8 	mul	w8, w21, w25
   10f44:	13880908 	ror	w8, w8, #2
   10f48:	6b1a011f 	cmp	w8, w26
   10f4c:	54fff908 	b.hi	10e6c <main+0x1dc>  // b.pmore
   10f50:	6d408a65 	ldp	d5, d2, [x19, #8]
   10f54:	9e670307 	fmov	d7, x24
   10f58:	aa1603e0 	mov	x0, x22
   10f5c:	fd400264 	ldr	d4, [x19]
   10f60:	2a1503e1 	mov	w1, w21
   10f64:	1e620803 	fmul	d3, d0, d2
   10f68:	1e620822 	fmul	d2, d1, d2
   10f6c:	1f418c86 	fmsub	d6, d4, d1, d3
   10f70:	1f400882 	fmadd	d2, d4, d0, d2
   10f74:	1e660806 	fmul	d6, d0, d6
   10f78:	1f4118a6 	fmadd	d6, d5, d1, d6
   10f7c:	1e6b28c6 	fadd	d6, d6, d11
   10f80:	1e6618e6 	fdiv	d6, d7, d6
   10f84:	1e614087 	fneg	d7, d4
   10f88:	1f610ce3 	fnmadd	d3, d7, d1, d3
   10f8c:	1e630821 	fmul	d1, d1, d3
   10f90:	1f4004a1 	fmadd	d1, d5, d0, d1
   10f94:	1e660840 	fmul	d0, d2, d6
   10f98:	1e660821 	fmul	d1, d1, d6
   10f9c:	94000055 	bl	110f0 <printf@plt>
   10fa0:	17ffffb3 	b	10e6c <main+0x1dc>
   10fa4:	94000057 	bl	11100 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
   10fa8:	cb140008 	sub	x8, x0, x20
   10fac:	d2d09009 	mov	x9, #0x848000000000        	// #145685290680320
   10fb0:	f2e825c9 	movk	x9, #0x412e, lsl #48
   10fb4:	90ffff80 	adrp	x0, 0 <__abi_tag-0x2c4>
   10fb8:	91242000 	add	x0, x0, #0x908
   10fbc:	9e620100 	scvtf	d0, x8
   10fc0:	9e670121 	fmov	d1, x9
   10fc4:	1e611809 	fdiv	d9, d0, d1
   10fc8:	9400005a 	bl	11130 <puts@plt>
   10fcc:	d2c80008 	mov	x8, #0x400000000000        	// #70368744177664
   10fd0:	90ffff80 	adrp	x0, 0 <__abi_tag-0x2c4>
   10fd4:	f2e811e8 	movk	x8, #0x408f, lsl #48
   10fd8:	1e604102 	fmov	d2, d8
   10fdc:	91265400 	add	x0, x0, #0x995
   10fe0:	9e670100 	fmov	d0, x8
   10fe4:	d2daf088 	mov	x8, #0xd78400000000        	// #236961935654912
   10fe8:	f2e82ee8 	movk	x8, #0x4177, lsl #48
   10fec:	1e601920 	fdiv	d0, d9, d0
   10ff0:	9e670101 	fmov	d1, x8
   10ff4:	1e601821 	fdiv	d1, d1, d0
   10ff8:	1e604120 	fmov	d0, d9
   10ffc:	9400003d 	bl	110f0 <printf@plt>
   11000:	aa1303e0 	mov	x0, x19
   11004:	94000047 	bl	11120 <_ZdlPv@plt>
   11008:	a9544ff4 	ldp	x20, x19, [sp, #320]
   1100c:	2a1f03e0 	mov	w0, wzr
   11010:	a95357f6 	ldp	x22, x21, [sp, #304]
   11014:	a9525ff8 	ldp	x24, x23, [sp, #288]
   11018:	a95167fa 	ldp	x26, x25, [sp, #272]
   1101c:	a94ffbfd 	ldp	x29, x30, [sp, #248]
   11020:	6d4ea3e9 	ldp	d9, d8, [sp, #232]
   11024:	6d4dabeb 	ldp	d11, d10, [sp, #216]
   11028:	f94087fc 	ldr	x28, [sp, #264]
   1102c:	fd406bec 	ldr	d12, [sp, #208]
   11030:	910543ff 	add	sp, sp, #0x150
   11034:	d65f03c0 	ret

Disassembly of section .init:

0000000000011038 <_init>:
   11038:	d503201f 	nop
   1103c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   11040:	910003fd 	mov	x29, sp
   11044:	97fffecc 	bl	10b74 <call_weak_fn>
   11048:	a8c17bfd 	ldp	x29, x30, [sp], #16
   1104c:	d65f03c0 	ret

Disassembly of section .fini:

0000000000011050 <_fini>:
   11050:	d503201f 	nop
   11054:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   11058:	910003fd 	mov	x29, sp
   1105c:	a8c17bfd 	ldp	x29, x30, [sp], #16
   11060:	d65f03c0 	ret

Disassembly of section .plt:

0000000000011070 <abort@plt-0x20>:
   11070:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
   11074:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfe98>
   11078:	f941c611 	ldr	x17, [x16, #904]
   1107c:	910e2210 	add	x16, x16, #0x388
   11080:	d61f0220 	br	x17
   11084:	d503201f 	nop
   11088:	d503201f 	nop
   1108c:	d503201f 	nop

0000000000011090 <abort@plt>:
   11090:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfe98>
   11094:	f941ca11 	ldr	x17, [x16, #912]
   11098:	910e4210 	add	x16, x16, #0x390
   1109c:	d61f0220 	br	x17

00000000000110a0 <__libc_start_main@plt>:
   110a0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfe98>
   110a4:	f941ce11 	ldr	x17, [x16, #920]
   110a8:	910e6210 	add	x16, x16, #0x398
   110ac:	d61f0220 	br	x17

00000000000110b0 <__gmon_start__@plt>:
   110b0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfe98>
   110b4:	f941d211 	ldr	x17, [x16, #928]
   110b8:	910e8210 	add	x16, x16, #0x3a0
   110bc:	d61f0220 	br	x17

00000000000110c0 <__cxa_finalize@plt>:
   110c0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfe98>
   110c4:	f941d611 	ldr	x17, [x16, #936]
   110c8:	910ea210 	add	x16, x16, #0x3a8
   110cc:	d61f0220 	br	x17

00000000000110d0 <_ZNSt8ios_base4InitC1Ev@plt>:
   110d0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfe98>
   110d4:	f941da11 	ldr	x17, [x16, #944]
   110d8:	910ec210 	add	x16, x16, #0x3b0
   110dc:	d61f0220 	br	x17

00000000000110e0 <__cxa_atexit@plt>:
   110e0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfe98>
   110e4:	f941de11 	ldr	x17, [x16, #952]
   110e8:	910ee210 	add	x16, x16, #0x3b8
   110ec:	d61f0220 	br	x17

00000000000110f0 <printf@plt>:
   110f0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfe98>
   110f4:	f941e211 	ldr	x17, [x16, #960]
   110f8:	910f0210 	add	x16, x16, #0x3c0
   110fc:	d61f0220 	br	x17

0000000000011100 <_ZNSt6chrono3_V212system_clock3nowEv@plt>:
   11100:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfe98>
   11104:	f941e611 	ldr	x17, [x16, #968]
   11108:	910f2210 	add	x16, x16, #0x3c8
   1110c:	d61f0220 	br	x17

0000000000011110 <_Znwm@plt>:
   11110:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfe98>
   11114:	f941ea11 	ldr	x17, [x16, #976]
   11118:	910f4210 	add	x16, x16, #0x3d0
   1111c:	d61f0220 	br	x17

0000000000011120 <_ZdlPv@plt>:
   11120:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfe98>
   11124:	f941ee11 	ldr	x17, [x16, #984]
   11128:	910f6210 	add	x16, x16, #0x3d8
   1112c:	d61f0220 	br	x17

0000000000011130 <puts@plt>:
   11130:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfe98>
   11134:	f941f211 	ldr	x17, [x16, #992]
   11138:	910f8210 	add	x16, x16, #0x3e0
   1113c:	d61f0220 	br	x17

0000000000011140 <sincos@plt>:
   11140:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfe98>
   11144:	f941f611 	ldr	x17, [x16, #1000]
   11148:	910fa210 	add	x16, x16, #0x3e8
   1114c:	d61f0220 	br	x17
