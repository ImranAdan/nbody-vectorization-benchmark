
/bench/bench:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000010980 <_start>:
   10980:	d503201f 	nop
   10984:	d280001d 	mov	x29, #0x0                   	// #0
   10988:	d280001e 	mov	x30, #0x0                   	// #0
   1098c:	aa0003e5 	mov	x5, x0
   10990:	f94003e1 	ldr	x1, [sp]
   10994:	910023e2 	add	x2, sp, #0x8
   10998:	910003e6 	mov	x6, sp
   1099c:	d503201f 	nop
   109a0:	100007a0 	adr	x0, 10a94 <main>
   109a4:	d2800003 	mov	x3, #0x0                   	// #0
   109a8:	d2800004 	mov	x4, #0x0                   	// #0
   109ac:	94000139 	bl	10e90 <__libc_start_main@plt>
   109b0:	94000134 	bl	10e80 <abort@plt>

00000000000109b4 <call_weak_fn>:
   109b4:	b0000080 	adrp	x0, 21000 <_DYNAMIC+0xd0>
   109b8:	f9407400 	ldr	x0, [x0, #232]
   109bc:	b4000040 	cbz	x0, 109c4 <call_weak_fn+0x10>
   109c0:	14000138 	b	10ea0 <__gmon_start__@plt>
   109c4:	d65f03c0 	ret
	...

00000000000109d0 <deregister_tm_clones>:
   109d0:	d503201f 	nop
   109d4:	10103a20 	adr	x0, 31118 <__TMC_END__>
   109d8:	d503201f 	nop
   109dc:	101039e1 	adr	x1, 31118 <__TMC_END__>
   109e0:	eb00003f 	cmp	x1, x0
   109e4:	540000c0 	b.eq	109fc <deregister_tm_clones+0x2c>  // b.none
   109e8:	b0000081 	adrp	x1, 21000 <_DYNAMIC+0xd0>
   109ec:	f9407821 	ldr	x1, [x1, #240]
   109f0:	b4000061 	cbz	x1, 109fc <deregister_tm_clones+0x2c>
   109f4:	aa0103f0 	mov	x16, x1
   109f8:	d61f0200 	br	x16
   109fc:	d65f03c0 	ret

0000000000010a00 <register_tm_clones>:
   10a00:	d503201f 	nop
   10a04:	101038a0 	adr	x0, 31118 <__TMC_END__>
   10a08:	d503201f 	nop
   10a0c:	10103861 	adr	x1, 31118 <__TMC_END__>
   10a10:	cb000021 	sub	x1, x1, x0
   10a14:	d37ffc22 	lsr	x2, x1, #63
   10a18:	8b810c41 	add	x1, x2, x1, asr #3
   10a1c:	9341fc21 	asr	x1, x1, #1
   10a20:	b40000c1 	cbz	x1, 10a38 <register_tm_clones+0x38>
   10a24:	b0000082 	adrp	x2, 21000 <_DYNAMIC+0xd0>
   10a28:	f9407c42 	ldr	x2, [x2, #248]
   10a2c:	b4000062 	cbz	x2, 10a38 <register_tm_clones+0x38>
   10a30:	aa0203f0 	mov	x16, x2
   10a34:	d61f0200 	br	x16
   10a38:	d65f03c0 	ret
   10a3c:	d503201f 	nop

0000000000010a40 <__do_global_dtors_aux>:
   10a40:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   10a44:	910003fd 	mov	x29, sp
   10a48:	f9000bf3 	str	x19, [sp, #16]
   10a4c:	b0000113 	adrp	x19, 31000 <_DYNAMIC+0x100d0>
   10a50:	39460260 	ldrb	w0, [x19, #384]
   10a54:	35000140 	cbnz	w0, 10a7c <__do_global_dtors_aux+0x3c>
   10a58:	b0000080 	adrp	x0, 21000 <_DYNAMIC+0xd0>
   10a5c:	f9408000 	ldr	x0, [x0, #256]
   10a60:	b4000080 	cbz	x0, 10a70 <__do_global_dtors_aux+0x30>
   10a64:	b0000100 	adrp	x0, 31000 <_DYNAMIC+0x100d0>
   10a68:	f9408800 	ldr	x0, [x0, #272]
   10a6c:	94000111 	bl	10eb0 <__cxa_finalize@plt>
   10a70:	97ffffd8 	bl	109d0 <deregister_tm_clones>
   10a74:	52800020 	mov	w0, #0x1                   	// #1
   10a78:	39060260 	strb	w0, [x19, #384]
   10a7c:	f9400bf3 	ldr	x19, [sp, #16]
   10a80:	a8c27bfd 	ldp	x29, x30, [sp], #32
   10a84:	d65f03c0 	ret
   10a88:	d503201f 	nop
   10a8c:	d503201f 	nop

0000000000010a90 <frame_dummy>:
   10a90:	17ffffdc 	b	10a00 <register_tm_clones>

0000000000010a94 <main>:
   10a94:	d105c3ff 	sub	sp, sp, #0x170
   10a98:	fd0073ec 	str	d12, [sp, #224]
   10a9c:	6d0f2beb 	stp	d11, d10, [sp, #240]
   10aa0:	6d1023e9 	stp	d9, d8, [sp, #256]
   10aa4:	a9117bfd 	stp	x29, x30, [sp, #272]
   10aa8:	910443fd 	add	x29, sp, #0x110
   10aac:	a9126ffc 	stp	x28, x27, [sp, #288]
   10ab0:	a91367fa 	stp	x26, x25, [sp, #304]
   10ab4:	a9145ff8 	stp	x24, x23, [sp, #320]
   10ab8:	a91557f6 	stp	x22, x21, [sp, #336]
   10abc:	a9164ff4 	stp	x20, x19, [sp, #352]
   10ac0:	90ffff88 	adrp	x8, 0 <__abi_tag-0x2c4>
   10ac4:	5291b000 	mov	w0, #0x8d80                	// #36224
   10ac8:	72a00b60 	movk	w0, #0x5b, lsl #16
   10acc:	5291b016 	mov	w22, #0x8d80                	// #36224
   10ad0:	72a00b76 	movk	w22, #0x5b, lsl #16
   10ad4:	fd43a108 	ldr	d8, [x8, #1856]
   10ad8:	940000fa 	bl	10ec0 <malloc@plt>
   10adc:	d285a308 	mov	x8, #0x2d18                	// #11544
   10ae0:	d285ac09 	mov	x9, #0x2d60                	// #11616
   10ae4:	f2aa8888 	movk	x8, #0x5444, lsl #16
   10ae8:	f2b23409 	movk	x9, #0x91a0, lsl #16
   10aec:	f2c43f68 	movk	x8, #0x21fb, lsl #32
   10af0:	f2ce4429 	movk	x9, #0x7221, lsl #32
   10af4:	6f00f401 	fmov	v1.2d, #2.000000000000000000e+00
   10af8:	f2e80128 	movk	x8, #0x4009, lsl #48
   10afc:	6f03f600 	fmov	v0.2d, #1.000000000000000000e+00
   10b00:	f2e7fd09 	movk	x9, #0x3fe8, lsl #48
   10b04:	d2d08f0a 	mov	x10, #0x847800000000        	// #145650930941952
   10b08:	0f000449 	movi	v9.2s, #0x2
   10b0c:	f2f821ca 	movk	x10, #0xc10e, lsl #48
   10b10:	aa0003f3 	mov	x19, x0
   10b14:	aa1f03f4 	mov	x20, xzr
   10b18:	d100a3b5 	sub	x21, x29, #0x28
   10b1c:	ad0187e0 	stp	q0, q1, [sp, #48]
   10b20:	4e080d01 	dup	v1.2d, x8
   10b24:	4e080d20 	dup	v0.2d, x9
   10b28:	d10123b7 	sub	x23, x29, #0x48
   10b2c:	ad0087e0 	stp	q0, q1, [sp, #16]
   10b30:	4e080d40 	dup	v0.2d, x10
   10b34:	3d8003e0 	str	q0, [sp]
   10b38:	0f20a500 	sxtl	v0.2d, v8.2s
   10b3c:	3dc003e1 	ldr	q1, [sp]
   10b40:	ad418be3 	ldp	q3, q2, [sp, #48]
   10b44:	9101c3e8 	add	x8, sp, #0x70
   10b48:	d10143a0 	sub	x0, x29, #0x50
   10b4c:	d10163a1 	sub	x1, x29, #0x58
   10b50:	4e61d800 	scvtf	v0.2d, v0.2d
   10b54:	4ea31c65 	mov	v5.16b, v3.16b
   10b58:	6e61fc01 	fdiv	v1.2d, v0.2d, v1.2d
   10b5c:	4e61cc45 	fmla	v5.2d, v2.2d, v1.2d
   10b60:	4ea31c61 	mov	v1.16b, v3.16b
   10b64:	4c006d04 	st1	{v4.2d-v6.2d}, [x8]
   10b68:	4ee5cca1 	fmls	v1.2d, v5.2d, v5.2d
   10b6c:	6ee1f822 	fsqrt	v2.2d, v1.2d
   10b70:	3dc00be1 	ldr	q1, [sp, #32]
   10b74:	6e61dc00 	fmul	v0.2d, v0.2d, v1.2d
   10b78:	3dc007e1 	ldr	q1, [sp, #16]
   10b7c:	6e61dc00 	fmul	v0.2d, v0.2d, v1.2d
   10b80:	ad028be0 	stp	q0, q2, [sp, #80]
   10b84:	940000e3 	bl	10f10 <sincos@plt>
   10b88:	3dc017e0 	ldr	q0, [sp, #80]
   10b8c:	d100a3a0 	sub	x0, x29, #0x28
   10b90:	fc5a83a1 	ldur	d1, [x29, #-88]
   10b94:	d10123a1 	sub	x1, x29, #0x48
   10b98:	5e180400 	mov	d0, v0.d[1]
   10b9c:	3d8017e1 	str	q1, [sp, #80]
   10ba0:	940000dc 	bl	10f10 <sincos@plt>
   10ba4:	ad4293e5 	ldp	q5, q4, [sp, #80]
   10ba8:	9101c3e8 	add	x8, sp, #0x70
   10bac:	0ea98508 	add	v8.2s, v8.2s, v9.2s
   10bb0:	fc5b03a0 	ldur	d0, [x29, #-80]
   10bb4:	4d4086e5 	ld1	{v5.d}[1], [x23]
   10bb8:	4c406d01 	ld1	{v1.2d-v3.2d}, [x8]
   10bbc:	8b140268 	add	x8, x19, x20
   10bc0:	9100c294 	add	x20, x20, #0x30
   10bc4:	eb1402df 	cmp	x22, x20
   10bc8:	6e64dca1 	fmul	v1.2d, v5.2d, v4.2d
   10bcc:	4d4086a0 	ld1	{v0.d}[1], [x21]
   10bd0:	6e64dc03 	fmul	v3.2d, v0.2d, v4.2d
   10bd4:	4c004d01 	st3	{v1.2d-v3.2d}, [x8]
   10bd8:	54fffb01 	b.ne	10b38 <main+0xa4>  // b.any
   10bdc:	90ffff80 	adrp	x0, 0 <__abi_tag-0x2c4>
   10be0:	911ed400 	add	x0, x0, #0x7b5
   10be4:	940000c7 	bl	10f00 <puts@plt>
   10be8:	d10103a1 	sub	x1, x29, #0x40
   10bec:	52800020 	mov	w0, #0x1                   	// #1
   10bf0:	940000c0 	bl	10ef0 <clock_gettime@plt>
   10bf4:	90ffff88 	adrp	x8, 0 <__abi_tag-0x2c4>
   10bf8:	d2c80019 	mov	x25, #0x400000000000        	// #70368744177664
   10bfc:	a97c63b7 	ldp	x23, x24, [x29, #-64]
   10c00:	f2e811f9 	movk	x25, #0x408f, lsl #48
   10c04:	2f00e408 	movi	d8, #0x0
   10c08:	6f00f697 	fmov	v23.2d, #5.000000000000000000e+00
   10c0c:	529999ba 	mov	w26, #0xcccd                	// #52429
   10c10:	5299999b 	mov	w27, #0xcccc                	// #52428
   10c14:	2f00e40a 	movi	d10, #0x0
   10c18:	90ffff95 	adrp	x21, 0 <__abi_tag-0x2c4>
   10c1c:	2a1f03f4 	mov	w20, wzr
   10c20:	fd43a509 	ldr	d9, [x8, #1864]
   10c24:	72b9999a 	movk	w26, #0xcccc, lsl #16
   10c28:	72a1999b 	movk	w27, #0xccc, lsl #16
   10c2c:	1e62900b 	fmov	d11, #5.000000000000000000e+00
   10c30:	1e6e100c 	fmov	d12, #1.000000000000000000e+00
   10c34:	911e06b5 	add	x21, x21, #0x781
   10c38:	4e080f38 	dup	v24.2d, x25
   10c3c:	ad035ff8 	stp	q24, q23, [sp, #96]
   10c40:	14000005 	b	10c54 <main+0x1c0>
   10c44:	1e6c294a 	fadd	d10, d10, d12
   10c48:	11000694 	add	w20, w20, #0x1
   10c4c:	7101929f 	cmp	w20, #0x64
   10c50:	54000960 	b.eq	10d7c <main+0x2e8>  // b.none
   10c54:	1e690940 	fmul	d0, d10, d9
   10c58:	d10183a0 	sub	x0, x29, #0x60
   10c5c:	d101a3a1 	sub	x1, x29, #0x68
   10c60:	940000ac 	bl	10f10 <sincos@plt>
   10c64:	6d7987a0 	ldp	d0, d1, [x29, #-104]
   10c68:	aa1f03e8 	mov	x8, xzr
   10c6c:	ad435ff8 	ldp	q24, q23, [sp, #96]
   10c70:	4e080403 	dup	v3.2d, v0.d[0]
   10c74:	4e080422 	dup	v2.2d, v1.d[0]
   10c78:	8b080269 	add	x9, x19, x8
   10c7c:	91018108 	add	x8, x8, #0x60
   10c80:	eb0802df 	cmp	x22, x8
   10c84:	4cdf4d24 	ld3	{v4.2d-v6.2d}, [x9], #48
   10c88:	4fc090c7 	fmul	v7.2d, v6.2d, v0.d[0]
   10c8c:	4fc190d6 	fmul	v22.2d, v6.2d, v1.d[0]
   10c90:	4ee4cc47 	fmls	v7.2d, v2.2d, v4.2d
   10c94:	4e64cc76 	fmla	v22.2d, v3.2d, v4.2d
   10c98:	4c404d31 	ld3	{v17.2d-v19.2d}, [x9]
   10c9c:	4fc090f0 	fmul	v16.2d, v7.2d, v0.d[0]
   10ca0:	6ee0f8e7 	fneg	v7.2d, v7.2d
   10ca4:	4e65cc50 	fmla	v16.2d, v2.2d, v5.2d
   10ca8:	4fc190e7 	fmul	v7.2d, v7.2d, v1.d[0]
   10cac:	4e77d610 	fadd	v16.2d, v16.2d, v23.2d
   10cb0:	4fc09274 	fmul	v20.2d, v19.2d, v0.d[0]
   10cb4:	4e65cc67 	fmla	v7.2d, v3.2d, v5.2d
   10cb8:	4fc19264 	fmul	v4.2d, v19.2d, v1.d[0]
   10cbc:	6e70ff10 	fdiv	v16.2d, v24.2d, v16.2d
   10cc0:	4ef1cc54 	fmls	v20.2d, v2.2d, v17.2d
   10cc4:	4e71cc64 	fmla	v4.2d, v3.2d, v17.2d
   10cc8:	4fc09295 	fmul	v21.2d, v20.2d, v0.d[0]
   10ccc:	6ee0fa94 	fneg	v20.2d, v20.2d
   10cd0:	4e72cc55 	fmla	v21.2d, v2.2d, v18.2d
   10cd4:	4fc19285 	fmul	v5.2d, v20.2d, v1.d[0]
   10cd8:	4e77d6b5 	fadd	v21.2d, v21.2d, v23.2d
   10cdc:	4e72cc65 	fmla	v5.2d, v3.2d, v18.2d
   10ce0:	6e75ff15 	fdiv	v21.2d, v24.2d, v21.2d
   10ce4:	6e70dec6 	fmul	v6.2d, v22.2d, v16.2d
   10ce8:	6e70dce7 	fmul	v7.2d, v7.2d, v16.2d
   10cec:	4e67d4c6 	fadd	v6.2d, v6.2d, v7.2d
   10cf0:	5e1804c7 	mov	d7, v6.d[1]
   10cf4:	1e662906 	fadd	d6, d8, d6
   10cf8:	6e75dc84 	fmul	v4.2d, v4.2d, v21.2d
   10cfc:	6e75dca5 	fmul	v5.2d, v5.2d, v21.2d
   10d00:	4e65d484 	fadd	v4.2d, v4.2d, v5.2d
   10d04:	1e6728c5 	fadd	d5, d6, d7
   10d08:	5e180486 	mov	d6, v4.d[1]
   10d0c:	1e6428a4 	fadd	d4, d5, d4
   10d10:	1e662888 	fadd	d8, d4, d6
   10d14:	54fffb21 	b.ne	10c78 <main+0x1e4>  // b.any
   10d18:	1b1a7e88 	mul	w8, w20, w26
   10d1c:	13880908 	ror	w8, w8, #2
   10d20:	6b1b011f 	cmp	w8, w27
   10d24:	54fff908 	b.hi	10c44 <main+0x1b0>  // b.pmore
   10d28:	6d408a65 	ldp	d5, d2, [x19, #8]
   10d2c:	9e670327 	fmov	d7, x25
   10d30:	aa1503e0 	mov	x0, x21
   10d34:	fd400264 	ldr	d4, [x19]
   10d38:	2a1403e1 	mov	w1, w20
   10d3c:	1e620803 	fmul	d3, d0, d2
   10d40:	1e620822 	fmul	d2, d1, d2
   10d44:	1f418c86 	fmsub	d6, d4, d1, d3
   10d48:	1f400882 	fmadd	d2, d4, d0, d2
   10d4c:	1e660806 	fmul	d6, d0, d6
   10d50:	1f4118a6 	fmadd	d6, d5, d1, d6
   10d54:	1e6b28c6 	fadd	d6, d6, d11
   10d58:	1e6618e6 	fdiv	d6, d7, d6
   10d5c:	1e614087 	fneg	d7, d4
   10d60:	1f610ce3 	fnmadd	d3, d7, d1, d3
   10d64:	1e630821 	fmul	d1, d1, d3
   10d68:	1f4004a1 	fmadd	d1, d5, d0, d1
   10d6c:	1e660840 	fmul	d0, d2, d6
   10d70:	1e660821 	fmul	d1, d1, d6
   10d74:	94000057 	bl	10ed0 <printf@plt>
   10d78:	17ffffb3 	b	10c44 <main+0x1b0>
   10d7c:	d2d09008 	mov	x8, #0x848000000000        	// #145685290680320
   10d80:	9e620300 	scvtf	d0, x24
   10d84:	f2e825c8 	movk	x8, #0x412e, lsl #48
   10d88:	9e6202e1 	scvtf	d1, x23
   10d8c:	d10103a1 	sub	x1, x29, #0x40
   10d90:	52800020 	mov	w0, #0x1                   	// #1
   10d94:	9e670109 	fmov	d9, x8
   10d98:	d2c80008 	mov	x8, #0x400000000000        	// #70368744177664
   10d9c:	f2e811e8 	movk	x8, #0x408f, lsl #48
   10da0:	1e691800 	fdiv	d0, d0, d9
   10da4:	9e67010a 	fmov	d10, x8
   10da8:	1f4a002b 	fmadd	d11, d1, d10, d0
   10dac:	94000051 	bl	10ef0 <clock_gettime@plt>
   10db0:	6d7c03a1 	ldp	d1, d0, [x29, #-64]
   10db4:	90ffff80 	adrp	x0, 0 <__abi_tag-0x2c4>
   10db8:	911d4000 	add	x0, x0, #0x750
   10dbc:	5e61d821 	scvtf	d1, d1
   10dc0:	5e61d800 	scvtf	d0, d0
   10dc4:	1e691800 	fdiv	d0, d0, d9
   10dc8:	1f4a0020 	fmadd	d0, d1, d10, d0
   10dcc:	1e6b3809 	fsub	d9, d0, d11
   10dd0:	9400004c 	bl	10f00 <puts@plt>
   10dd4:	1e6a1920 	fdiv	d0, d9, d10
   10dd8:	d2daf088 	mov	x8, #0xd78400000000        	// #236961935654912
   10ddc:	f2e82ee8 	movk	x8, #0x4177, lsl #48
   10de0:	90ffff80 	adrp	x0, 0 <__abi_tag-0x2c4>
   10de4:	1e604102 	fmov	d2, d8
   10de8:	911f7400 	add	x0, x0, #0x7dd
   10dec:	9e670101 	fmov	d1, x8
   10df0:	1e601821 	fdiv	d1, d1, d0
   10df4:	1e604120 	fmov	d0, d9
   10df8:	94000036 	bl	10ed0 <printf@plt>
   10dfc:	aa1303e0 	mov	x0, x19
   10e00:	94000038 	bl	10ee0 <free@plt>
   10e04:	a9564ff4 	ldp	x20, x19, [sp, #352]
   10e08:	2a1f03e0 	mov	w0, wzr
   10e0c:	a95557f6 	ldp	x22, x21, [sp, #336]
   10e10:	a9545ff8 	ldp	x24, x23, [sp, #320]
   10e14:	a95367fa 	ldp	x26, x25, [sp, #304]
   10e18:	a9526ffc 	ldp	x28, x27, [sp, #288]
   10e1c:	a9517bfd 	ldp	x29, x30, [sp, #272]
   10e20:	6d5023e9 	ldp	d9, d8, [sp, #256]
   10e24:	6d4f2beb 	ldp	d11, d10, [sp, #240]
   10e28:	fd4073ec 	ldr	d12, [sp, #224]
   10e2c:	9105c3ff 	add	sp, sp, #0x170
   10e30:	d65f03c0 	ret

Disassembly of section .init:

0000000000010e34 <_init>:
   10e34:	d503201f 	nop
   10e38:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   10e3c:	910003fd 	mov	x29, sp
   10e40:	97fffedd 	bl	109b4 <call_weak_fn>
   10e44:	a8c17bfd 	ldp	x29, x30, [sp], #16
   10e48:	d65f03c0 	ret

Disassembly of section .fini:

0000000000010e4c <_fini>:
   10e4c:	d503201f 	nop
   10e50:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   10e54:	910003fd 	mov	x29, sp
   10e58:	a8c17bfd 	ldp	x29, x30, [sp], #16
   10e5c:	d65f03c0 	ret

Disassembly of section .plt:

0000000000010e60 <abort@plt-0x20>:
   10e60:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
   10e64:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10e68:	f9409611 	ldr	x17, [x16, #296]
   10e6c:	9104a210 	add	x16, x16, #0x128
   10e70:	d61f0220 	br	x17
   10e74:	d503201f 	nop
   10e78:	d503201f 	nop
   10e7c:	d503201f 	nop

0000000000010e80 <abort@plt>:
   10e80:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10e84:	f9409a11 	ldr	x17, [x16, #304]
   10e88:	9104c210 	add	x16, x16, #0x130
   10e8c:	d61f0220 	br	x17

0000000000010e90 <__libc_start_main@plt>:
   10e90:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10e94:	f9409e11 	ldr	x17, [x16, #312]
   10e98:	9104e210 	add	x16, x16, #0x138
   10e9c:	d61f0220 	br	x17

0000000000010ea0 <__gmon_start__@plt>:
   10ea0:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10ea4:	f940a211 	ldr	x17, [x16, #320]
   10ea8:	91050210 	add	x16, x16, #0x140
   10eac:	d61f0220 	br	x17

0000000000010eb0 <__cxa_finalize@plt>:
   10eb0:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10eb4:	f940a611 	ldr	x17, [x16, #328]
   10eb8:	91052210 	add	x16, x16, #0x148
   10ebc:	d61f0220 	br	x17

0000000000010ec0 <malloc@plt>:
   10ec0:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10ec4:	f940aa11 	ldr	x17, [x16, #336]
   10ec8:	91054210 	add	x16, x16, #0x150
   10ecc:	d61f0220 	br	x17

0000000000010ed0 <printf@plt>:
   10ed0:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10ed4:	f940ae11 	ldr	x17, [x16, #344]
   10ed8:	91056210 	add	x16, x16, #0x158
   10edc:	d61f0220 	br	x17

0000000000010ee0 <free@plt>:
   10ee0:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10ee4:	f940b211 	ldr	x17, [x16, #352]
   10ee8:	91058210 	add	x16, x16, #0x160
   10eec:	d61f0220 	br	x17

0000000000010ef0 <clock_gettime@plt>:
   10ef0:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10ef4:	f940b611 	ldr	x17, [x16, #360]
   10ef8:	9105a210 	add	x16, x16, #0x168
   10efc:	d61f0220 	br	x17

0000000000010f00 <puts@plt>:
   10f00:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10f04:	f940ba11 	ldr	x17, [x16, #368]
   10f08:	9105c210 	add	x16, x16, #0x170
   10f0c:	d61f0220 	br	x17

0000000000010f10 <sincos@plt>:
   10f10:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10f14:	f940be11 	ldr	x17, [x16, #376]
   10f18:	9105e210 	add	x16, x16, #0x178
   10f1c:	d61f0220 	br	x17
