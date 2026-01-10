
/bench/bench:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000010940 <_start>:
   10940:	d503201f 	nop
   10944:	d280001d 	mov	x29, #0x0                   	// #0
   10948:	d280001e 	mov	x30, #0x0                   	// #0
   1094c:	aa0003e5 	mov	x5, x0
   10950:	f94003e1 	ldr	x1, [sp]
   10954:	910023e2 	add	x2, sp, #0x8
   10958:	910003e6 	mov	x6, sp
   1095c:	d503201f 	nop
   10960:	100029c0 	adr	x0, 10e98 <main>
   10964:	d2800003 	mov	x3, #0x0                   	// #0
   10968:	d2800004 	mov	x4, #0x0                   	// #0
   1096c:	94000259 	bl	112d0 <__libc_start_main@plt>
   10970:	94000254 	bl	112c0 <abort@plt>

0000000000010974 <call_weak_fn>:
   10974:	b0000080 	adrp	x0, 21000 <memset@plt+0xfcb0>
   10978:	f9429400 	ldr	x0, [x0, #1320]
   1097c:	b4000040 	cbz	x0, 10984 <call_weak_fn+0x10>
   10980:	14000258 	b	112e0 <__gmon_start__@plt>
   10984:	d65f03c0 	ret
	...

0000000000010990 <deregister_tm_clones>:
   10990:	d503201f 	nop
   10994:	10105e60 	adr	x0, 31560 <__TMC_END__>
   10998:	d503201f 	nop
   1099c:	10105e21 	adr	x1, 31560 <__TMC_END__>
   109a0:	eb00003f 	cmp	x1, x0
   109a4:	540000c0 	b.eq	109bc <deregister_tm_clones+0x2c>  // b.none
   109a8:	b0000081 	adrp	x1, 21000 <memset@plt+0xfcb0>
   109ac:	f9429821 	ldr	x1, [x1, #1328]
   109b0:	b4000061 	cbz	x1, 109bc <deregister_tm_clones+0x2c>
   109b4:	aa0103f0 	mov	x16, x1
   109b8:	d61f0200 	br	x16
   109bc:	d65f03c0 	ret

00000000000109c0 <register_tm_clones>:
   109c0:	d503201f 	nop
   109c4:	10105ce0 	adr	x0, 31560 <__TMC_END__>
   109c8:	d503201f 	nop
   109cc:	10105ca1 	adr	x1, 31560 <__TMC_END__>
   109d0:	cb000021 	sub	x1, x1, x0
   109d4:	d37ffc22 	lsr	x2, x1, #63
   109d8:	8b810c41 	add	x1, x2, x1, asr #3
   109dc:	9341fc21 	asr	x1, x1, #1
   109e0:	b40000c1 	cbz	x1, 109f8 <register_tm_clones+0x38>
   109e4:	b0000082 	adrp	x2, 21000 <memset@plt+0xfcb0>
   109e8:	f9429c42 	ldr	x2, [x2, #1336]
   109ec:	b4000062 	cbz	x2, 109f8 <register_tm_clones+0x38>
   109f0:	aa0203f0 	mov	x16, x2
   109f4:	d61f0200 	br	x16
   109f8:	d65f03c0 	ret
   109fc:	d503201f 	nop

0000000000010a00 <__do_global_dtors_aux>:
   10a00:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   10a04:	910003fd 	mov	x29, sp
   10a08:	f9000bf3 	str	x19, [sp, #16]
   10a0c:	b0000113 	adrp	x19, 31000 <_DYNAMIC+0xfc90>
   10a10:	39572260 	ldrb	w0, [x19, #1480]
   10a14:	35000140 	cbnz	w0, 10a3c <__do_global_dtors_aux+0x3c>
   10a18:	b0000080 	adrp	x0, 21000 <memset@plt+0xfcb0>
   10a1c:	f942a000 	ldr	x0, [x0, #1344]
   10a20:	b4000080 	cbz	x0, 10a30 <__do_global_dtors_aux+0x30>
   10a24:	b0000100 	adrp	x0, 31000 <_DYNAMIC+0xfc90>
   10a28:	f942ac00 	ldr	x0, [x0, #1368]
   10a2c:	94000231 	bl	112f0 <__cxa_finalize@plt>
   10a30:	97ffffd8 	bl	10990 <deregister_tm_clones>
   10a34:	52800020 	mov	w0, #0x1                   	// #1
   10a38:	39172260 	strb	w0, [x19, #1480]
   10a3c:	f9400bf3 	ldr	x19, [sp, #16]
   10a40:	a8c27bfd 	ldp	x29, x30, [sp], #32
   10a44:	d65f03c0 	ret
   10a48:	d503201f 	nop
   10a4c:	d503201f 	nop

0000000000010a50 <frame_dummy>:
   10a50:	17ffffdc 	b	109c0 <register_tm_clones>

0000000000010a54 <run_steps>:
   10a54:	d102c3ff 	sub	sp, sp, #0xb0
   10a58:	6d032beb 	stp	d11, d10, [sp, #48]
   10a5c:	6d0423e9 	stp	d9, d8, [sp, #64]
   10a60:	a9057bfd 	stp	x29, x30, [sp, #80]
   10a64:	910143fd 	add	x29, sp, #0x50
   10a68:	a9066ffc 	stp	x28, x27, [sp, #96]
   10a6c:	a90767fa 	stp	x26, x25, [sp, #112]
   10a70:	a9085ff8 	stp	x24, x23, [sp, #128]
   10a74:	a90957f6 	stp	x22, x21, [sp, #144]
   10a78:	a90a4ff4 	stp	x20, x19, [sp, #160]
   10a7c:	90ffff88 	adrp	x8, 0 <__abi_tag-0x2c4>
   10a80:	aa0703f3 	mov	x19, x7
   10a84:	a946efbc 	ldp	x28, x27, [x29, #104]
   10a88:	6f03f607 	fmov	v7.2d, #1.000000000000000000e+00
   10a8c:	aa0603f4 	mov	x20, x6
   10a90:	fd43b108 	ldr	d8, [x8, #1888]
   10a94:	d29ad2a8 	mov	x8, #0xd695                	// #54933
   10a98:	f2bd04c8 	movk	x8, #0xe826, lsl #16
   10a9c:	aa0503f5 	mov	x21, x5
   10aa0:	f2c5c168 	movk	x8, #0x2e0b, lsl #32
   10aa4:	aa0403f6 	mov	x22, x4
   10aa8:	f2e7c228 	movk	x8, #0x3e11, lsl #48
   10aac:	aa0303f7 	mov	x23, x3
   10ab0:	aa0203f8 	mov	x24, x2
   10ab4:	aa0103f9 	mov	x25, x1
   10ab8:	2a1f03e9 	mov	w9, wzr
   10abc:	f94033ba 	ldr	x26, [x29, #96]
   10ac0:	1e6e1009 	fmov	d9, #1.000000000000000000e+00
   10ac4:	4e080d10 	dup	v16.2d, x8
   10ac8:	b9000be0 	str	w0, [sp, #8]
   10acc:	ad009ff0 	stp	q16, q7, [sp, #16]
   10ad0:	aa1a03e0 	mov	x0, x26
   10ad4:	2a1f03e1 	mov	w1, wzr
   10ad8:	5285dc02 	mov	w2, #0x2ee0                	// #12000
   10adc:	b9000fe9 	str	w9, [sp, #12]
   10ae0:	9400021c 	bl	11350 <memset@plt>
   10ae4:	aa1c03e0 	mov	x0, x28
   10ae8:	2a1f03e1 	mov	w1, wzr
   10aec:	5285dc02 	mov	w2, #0x2ee0                	// #12000
   10af0:	94000218 	bl	11350 <memset@plt>
   10af4:	aa1b03e0 	mov	x0, x27
   10af8:	2a1f03e1 	mov	w1, wzr
   10afc:	5285dc02 	mov	w2, #0x2ee0                	// #12000
   10b00:	94000214 	bl	11350 <memset@plt>
   10b04:	2f00e400 	movi	d0, #0x0
   10b08:	2f00e401 	movi	d1, #0x0
   10b0c:	2f00e402 	movi	d2, #0x0
   10b10:	aa1f03e8 	mov	x8, xzr
   10b14:	52800309 	mov	w9, #0x18                  	// #24
   10b18:	5280bb6a 	mov	w10, #0x5db                 	// #1499
   10b1c:	5280002b 	mov	w11, #0x1                   	// #1
   10b20:	d37df10c 	lsl	x12, x8, #3
   10b24:	f117691f 	cmp	x8, #0x5da
   10b28:	540011c8 	b.hi	10d60 <run_steps+0x30c>  // b.pmore
   10b2c:	fc6c6b23 	ldr	d3, [x25, x12]
   10b30:	f117611f 	cmp	x8, #0x5d8
   10b34:	fc6c6b04 	ldr	d4, [x24, x12]
   10b38:	fc6c6ae5 	ldr	d5, [x23, x12]
   10b3c:	fc6c6a66 	ldr	d6, [x19, x12]
   10b40:	54000063 	b.cc	10b4c <run_steps+0xf8>  // b.lo, b.ul, b.last
   10b44:	aa0b03ee 	mov	x14, x11
   10b48:	1400005a 	b	10cb0 <run_steps+0x25c>
   10b4c:	ad40abeb 	ldp	q11, q10, [sp, #16]
   10b50:	5280bb6d 	mov	w13, #0x5db                 	// #1499
   10b54:	927ef54f 	and	x15, x10, #0xfffffffffffffffc
   10b58:	cb0801ae 	sub	x14, x13, x8
   10b5c:	aa0903f0 	mov	x16, x9
   10b60:	927ef5cd 	and	x13, x14, #0xfffffffffffffffc
   10b64:	4e080467 	dup	v7.2d, v3.d[0]
   10b68:	4e080490 	dup	v16.2d, v4.d[0]
   10b6c:	4e0804b1 	dup	v17.2d, v5.d[0]
   10b70:	8b100311 	add	x17, x24, x16
   10b74:	8b100332 	add	x18, x25, x16
   10b78:	8b1002e0 	add	x0, x23, x16
   10b7c:	f10011ef 	subs	x15, x15, #0x4
   10b80:	ad7fd632 	ldp	q18, q21, [x17, #-16]
   10b84:	8b100271 	add	x17, x19, x16
   10b88:	4ef0d652 	fsub	v18.2d, v18.2d, v16.2d
   10b8c:	ad7fde53 	ldp	q19, q23, [x18, #-16]
   10b90:	4ef0d6b5 	fsub	v21.2d, v21.2d, v16.2d
   10b94:	8b100352 	add	x18, x26, x16
   10b98:	6e72de54 	fmul	v20.2d, v18.2d, v18.2d
   10b9c:	4ee7d676 	fsub	v22.2d, v19.2d, v7.2d
   10ba0:	6e75deb9 	fmul	v25.2d, v21.2d, v21.2d
   10ba4:	3cdf0013 	ldur	q19, [x0, #-16]
   10ba8:	4ee7d6f7 	fsub	v23.2d, v23.2d, v7.2d
   10bac:	4e76ced4 	fmla	v20.2d, v22.2d, v22.2d
   10bb0:	4ef1d673 	fsub	v19.2d, v19.2d, v17.2d
   10bb4:	ad7ff65c 	ldp	q28, q29, [x18, #-16]
   10bb8:	4e77cef9 	fmla	v25.2d, v23.2d, v23.2d
   10bbc:	4e73ce74 	fmla	v20.2d, v19.2d, v19.2d
   10bc0:	4e6bd694 	fadd	v20.2d, v20.2d, v11.2d
   10bc4:	6ee1fa98 	fsqrt	v24.2d, v20.2d
   10bc8:	3dc00014 	ldr	q20, [x0]
   10bcc:	4ef1d694 	fsub	v20.2d, v20.2d, v17.2d
   10bd0:	4e74ce99 	fmla	v25.2d, v20.2d, v20.2d
   10bd4:	4e6bd739 	fadd	v25.2d, v25.2d, v11.2d
   10bd8:	6ee1fb39 	fsqrt	v25.2d, v25.2d
   10bdc:	6e78fd58 	fdiv	v24.2d, v10.2d, v24.2d
   10be0:	6e79fd59 	fdiv	v25.2d, v10.2d, v25.2d
   10be4:	6e78df1a 	fmul	v26.2d, v24.2d, v24.2d
   10be8:	6e7adf18 	fmul	v24.2d, v24.2d, v26.2d
   10bec:	6e79df3b 	fmul	v27.2d, v25.2d, v25.2d
   10bf0:	6e7bdf39 	fmul	v25.2d, v25.2d, v27.2d
   10bf4:	ad7fee3a 	ldp	q26, q27, [x17, #-16]
   10bf8:	8b100391 	add	x17, x28, x16
   10bfc:	4fc6933e 	fmul	v30.2d, v25.2d, v6.d[0]
   10c00:	6e78df5a 	fmul	v26.2d, v26.2d, v24.2d
   10c04:	4fc69318 	fmul	v24.2d, v24.2d, v6.d[0]
   10c08:	6e79df79 	fmul	v25.2d, v27.2d, v25.2d
   10c0c:	4ef7cfdd 	fmls	v29.2d, v30.2d, v23.2d
   10c10:	4ef6cf1c 	fmls	v28.2d, v24.2d, v22.2d
   10c14:	6e7aded6 	fmul	v22.2d, v22.2d, v26.2d
   10c18:	6e7ade5b 	fmul	v27.2d, v18.2d, v26.2d
   10c1c:	6e7ade7a 	fmul	v26.2d, v19.2d, v26.2d
   10c20:	ad3ff65c 	stp	q28, q29, [x18, #-16]
   10c24:	8b100372 	add	x18, x27, x16
   10c28:	5e1806dd 	mov	d29, v22.d[1]
   10c2c:	1e762842 	fadd	d2, d2, d22
   10c30:	5e180776 	mov	d22, v27.d[1]
   10c34:	1e7b2821 	fadd	d1, d1, d27
   10c38:	5e18075b 	mov	d27, v26.d[1]
   10c3c:	1e7a2800 	fadd	d0, d0, d26
   10c40:	ad7fea3c 	ldp	q28, q26, [x17, #-16]
   10c44:	6e79def7 	fmul	v23.2d, v23.2d, v25.2d
   10c48:	1e7d2842 	fadd	d2, d2, d29
   10c4c:	6e79debf 	fmul	v31.2d, v21.2d, v25.2d
   10c50:	91008210 	add	x16, x16, #0x20
   10c54:	6e79de99 	fmul	v25.2d, v20.2d, v25.2d
   10c58:	1e762821 	fadd	d1, d1, d22
   10c5c:	4ef2cf1c 	fmls	v28.2d, v24.2d, v18.2d
   10c60:	1e7b2800 	fadd	d0, d0, d27
   10c64:	5e1806f2 	mov	d18, v23.d[1]
   10c68:	ad7fda5d 	ldp	q29, q22, [x18, #-16]
   10c6c:	4ef5cfda 	fmls	v26.2d, v30.2d, v21.2d
   10c70:	5e1807f5 	mov	d21, v31.d[1]
   10c74:	5e18073b 	mov	d27, v25.d[1]
   10c78:	1e772842 	fadd	d2, d2, d23
   10c7c:	1e7f2821 	fadd	d1, d1, d31
   10c80:	1e792800 	fadd	d0, d0, d25
   10c84:	4ef3cf1d 	fmls	v29.2d, v24.2d, v19.2d
   10c88:	ad3fea3c 	stp	q28, q26, [x17, #-16]
   10c8c:	4ef4cfd6 	fmls	v22.2d, v30.2d, v20.2d
   10c90:	1e722842 	fadd	d2, d2, d18
   10c94:	1e752821 	fadd	d1, d1, d21
   10c98:	1e7b2800 	fadd	d0, d0, d27
   10c9c:	ad3fda5d 	stp	q29, q22, [x18, #-16]
   10ca0:	54fff681 	b.ne	10b70 <run_steps+0x11c>  // b.any
   10ca4:	eb0d01df 	cmp	x14, x13
   10ca8:	540005c0 	b.eq	10d60 <run_steps+0x30c>  // b.none
   10cac:	8b0d016e 	add	x14, x11, x13
   10cb0:	d37df1c2 	lsl	x2, x14, #3
   10cb4:	5280bb8f 	mov	w15, #0x5dc                 	// #1500
   10cb8:	aa1f03ed 	mov	x13, xzr
   10cbc:	cb0e01ee 	sub	x14, x15, x14
   10cc0:	8b02036f 	add	x15, x27, x2
   10cc4:	8b020390 	add	x16, x28, x2
   10cc8:	8b020351 	add	x17, x26, x2
   10ccc:	8b020272 	add	x18, x19, x2
   10cd0:	8b0202e0 	add	x0, x23, x2
   10cd4:	8b020301 	add	x1, x24, x2
   10cd8:	8b020322 	add	x2, x25, x2
   10cdc:	d37df1a3 	lsl	x3, x13, #3
   10ce0:	910005ad 	add	x13, x13, #0x1
   10ce4:	eb0d01df 	cmp	x14, x13
   10ce8:	fc636827 	ldr	d7, [x1, x3]
   10cec:	fc636850 	ldr	d16, [x2, x3]
   10cf0:	fc636811 	ldr	d17, [x0, x3]
   10cf4:	fc636a54 	ldr	d20, [x18, x3]
   10cf8:	1e6438e7 	fsub	d7, d7, d4
   10cfc:	fc636a15 	ldr	d21, [x16, x3]
   10d00:	1e633a10 	fsub	d16, d16, d3
   10d04:	fc6369f6 	ldr	d22, [x15, x3]
   10d08:	1e653a31 	fsub	d17, d17, d5
   10d0c:	1e6708f2 	fmul	d18, d7, d7
   10d10:	1f504a12 	fmadd	d18, d16, d16, d18
   10d14:	1f514a32 	fmadd	d18, d17, d17, d18
   10d18:	1e682a52 	fadd	d18, d18, d8
   10d1c:	1e61c252 	fsqrt	d18, d18
   10d20:	1e721932 	fdiv	d18, d9, d18
   10d24:	1e720a53 	fmul	d19, d18, d18
   10d28:	1e730a52 	fmul	d18, d18, d19
   10d2c:	fc636a33 	ldr	d19, [x17, x3]
   10d30:	1e720a94 	fmul	d20, d20, d18
   10d34:	1e7208d2 	fmul	d18, d6, d18
   10d38:	1f540a02 	fmadd	d2, d16, d20, d2
   10d3c:	1f5404e1 	fmadd	d1, d7, d20, d1
   10d40:	1f540220 	fmadd	d0, d17, d20, d0
   10d44:	1f52ce10 	fmsub	d16, d16, d18, d19
   10d48:	1f52d4e7 	fmsub	d7, d7, d18, d21
   10d4c:	1f52da31 	fmsub	d17, d17, d18, d22
   10d50:	fc236a30 	str	d16, [x17, x3]
   10d54:	fc236a07 	str	d7, [x16, x3]
   10d58:	fc2369f1 	str	d17, [x15, x3]
   10d5c:	54fffc01 	b.ne	10cdc <run_steps+0x288>  // b.any
   10d60:	91000508 	add	x8, x8, #0x1
   10d64:	fc2c6b42 	str	d2, [x26, x12]
   10d68:	f117711f 	cmp	x8, #0x5dc
   10d6c:	fc2c6b81 	str	d1, [x28, x12]
   10d70:	fc2c6b60 	str	d0, [x27, x12]
   10d74:	54000180 	b.eq	10da4 <run_steps+0x350>  // b.none
   10d78:	d37df10c 	lsl	x12, x8, #3
   10d7c:	9100056b 	add	x11, x11, #0x1
   10d80:	d100054a 	sub	x10, x10, #0x1
   10d84:	91002129 	add	x9, x9, #0x8
   10d88:	fc6c6b42 	ldr	d2, [x26, x12]
   10d8c:	fc6c6b81 	ldr	d1, [x28, x12]
   10d90:	fc6c6b60 	ldr	d0, [x27, x12]
   10d94:	d37df10c 	lsl	x12, x8, #3
   10d98:	f117691f 	cmp	x8, #0x5da
   10d9c:	54ffec89 	b.ls	10b2c <run_steps+0xd8>  // b.plast
   10da0:	17fffff0 	b	10d60 <run_steps+0x30c>
   10da4:	d2828f6c 	mov	x12, #0x147b                	// #5243
   10da8:	9285dbe8 	mov	x8, #0xffffffffffffd120    	// #-12000
   10dac:	f2a8f5cc 	movk	x12, #0x47ae, lsl #16
   10db0:	f2cf5c2c 	movk	x12, #0x7ae1, lsl #32
   10db4:	f2e7f08c 	movk	x12, #0x3f84, lsl #48
   10db8:	8b080349 	add	x9, x26, x8
   10dbc:	8b08038a 	add	x10, x28, x8
   10dc0:	8b08036b 	add	x11, x27, x8
   10dc4:	4e080d80 	dup	v0.2d, x12
   10dc8:	3dcbb921 	ldr	q1, [x9, #12000]
   10dcc:	8b0802c9 	add	x9, x22, x8
   10dd0:	3dcbb942 	ldr	q2, [x10, #12000]
   10dd4:	8b0802aa 	add	x10, x21, x8
   10dd8:	3dcbb963 	ldr	q3, [x11, #12000]
   10ddc:	8b08028b 	add	x11, x20, x8
   10de0:	3dcbb924 	ldr	q4, [x9, #12000]
   10de4:	b1004108 	adds	x8, x8, #0x10
   10de8:	3dcbb945 	ldr	q5, [x10, #12000]
   10dec:	3dcbb966 	ldr	q6, [x11, #12000]
   10df0:	4e61cc04 	fmla	v4.2d, v0.2d, v1.2d
   10df4:	4e62cc05 	fmla	v5.2d, v0.2d, v2.2d
   10df8:	4e63cc06 	fmla	v6.2d, v0.2d, v3.2d
   10dfc:	3d8bb924 	str	q4, [x9, #12000]
   10e00:	3d8bb945 	str	q5, [x10, #12000]
   10e04:	3d8bb966 	str	q6, [x11, #12000]
   10e08:	54fffd81 	b.ne	10db8 <run_steps+0x364>  // b.any
   10e0c:	9285dbe8 	mov	x8, #0xffffffffffffd120    	// #-12000
   10e10:	8b0802c9 	add	x9, x22, x8
   10e14:	8b0802aa 	add	x10, x21, x8
   10e18:	8b08028b 	add	x11, x20, x8
   10e1c:	3dcbb921 	ldr	q1, [x9, #12000]
   10e20:	8b080329 	add	x9, x25, x8
   10e24:	3dcbb942 	ldr	q2, [x10, #12000]
   10e28:	8b08030a 	add	x10, x24, x8
   10e2c:	3dcbb963 	ldr	q3, [x11, #12000]
   10e30:	8b0802eb 	add	x11, x23, x8
   10e34:	3dcbb924 	ldr	q4, [x9, #12000]
   10e38:	b1004108 	adds	x8, x8, #0x10
   10e3c:	3dcbb945 	ldr	q5, [x10, #12000]
   10e40:	3dcbb966 	ldr	q6, [x11, #12000]
   10e44:	4e61cc04 	fmla	v4.2d, v0.2d, v1.2d
   10e48:	4e62cc05 	fmla	v5.2d, v0.2d, v2.2d
   10e4c:	4e63cc06 	fmla	v6.2d, v0.2d, v3.2d
   10e50:	3d8bb924 	str	q4, [x9, #12000]
   10e54:	3d8bb945 	str	q5, [x10, #12000]
   10e58:	3d8bb966 	str	q6, [x11, #12000]
   10e5c:	54fffda1 	b.ne	10e10 <run_steps+0x3bc>  // b.any
   10e60:	294127e8 	ldp	w8, w9, [sp, #8]
   10e64:	11000529 	add	w9, w9, #0x1
   10e68:	6b08013f 	cmp	w9, w8
   10e6c:	54ffe321 	b.ne	10ad0 <run_steps+0x7c>  // b.any
   10e70:	a94a4ff4 	ldp	x20, x19, [sp, #160]
   10e74:	a94957f6 	ldp	x22, x21, [sp, #144]
   10e78:	a9485ff8 	ldp	x24, x23, [sp, #128]
   10e7c:	a94767fa 	ldp	x26, x25, [sp, #112]
   10e80:	a9466ffc 	ldp	x28, x27, [sp, #96]
   10e84:	a9457bfd 	ldp	x29, x30, [sp, #80]
   10e88:	6d4423e9 	ldp	d9, d8, [sp, #64]
   10e8c:	6d432beb 	ldp	d11, d10, [sp, #48]
   10e90:	9102c3ff 	add	sp, sp, #0xb0
   10e94:	d65f03c0 	ret

0000000000010e98 <main>:
   10e98:	d10283ff 	sub	sp, sp, #0xa0
   10e9c:	fd001be8 	str	d8, [sp, #48]
   10ea0:	a9047bfd 	stp	x29, x30, [sp, #64]
   10ea4:	910103fd 	add	x29, sp, #0x40
   10ea8:	a9056ffc 	stp	x28, x27, [sp, #80]
   10eac:	a90667fa 	stp	x26, x25, [sp, #96]
   10eb0:	a9075ff8 	stp	x24, x23, [sp, #112]
   10eb4:	a90857f6 	stp	x22, x21, [sp, #128]
   10eb8:	a9094ff4 	stp	x20, x19, [sp, #144]
   10ebc:	5285dc00 	mov	w0, #0x2ee0                	// #12000
   10ec0:	94000110 	bl	11300 <malloc@plt>
   10ec4:	aa0003f3 	mov	x19, x0
   10ec8:	5285dc00 	mov	w0, #0x2ee0                	// #12000
   10ecc:	9400010d 	bl	11300 <malloc@plt>
   10ed0:	aa0003f4 	mov	x20, x0
   10ed4:	5285dc00 	mov	w0, #0x2ee0                	// #12000
   10ed8:	9400010a 	bl	11300 <malloc@plt>
   10edc:	aa0003f5 	mov	x21, x0
   10ee0:	5285dc00 	mov	w0, #0x2ee0                	// #12000
   10ee4:	94000107 	bl	11300 <malloc@plt>
   10ee8:	aa0003f6 	mov	x22, x0
   10eec:	5285dc00 	mov	w0, #0x2ee0                	// #12000
   10ef0:	94000104 	bl	11300 <malloc@plt>
   10ef4:	aa0003f7 	mov	x23, x0
   10ef8:	5285dc00 	mov	w0, #0x2ee0                	// #12000
   10efc:	94000101 	bl	11300 <malloc@plt>
   10f00:	aa0003f8 	mov	x24, x0
   10f04:	5285dc00 	mov	w0, #0x2ee0                	// #12000
   10f08:	940000fe 	bl	11300 <malloc@plt>
   10f0c:	aa0003f9 	mov	x25, x0
   10f10:	5285dc00 	mov	w0, #0x2ee0                	// #12000
   10f14:	940000fb 	bl	11300 <malloc@plt>
   10f18:	aa0003fa 	mov	x26, x0
   10f1c:	5285dc00 	mov	w0, #0x2ee0                	// #12000
   10f20:	940000f8 	bl	11300 <malloc@plt>
   10f24:	aa0003fb 	mov	x27, x0
   10f28:	5285dc00 	mov	w0, #0x2ee0                	// #12000
   10f2c:	940000f5 	bl	11300 <malloc@plt>
   10f30:	b40018b3 	cbz	x19, 11244 <main+0x3ac>
   10f34:	b4001894 	cbz	x20, 11244 <main+0x3ac>
   10f38:	b4001875 	cbz	x21, 11244 <main+0x3ac>
   10f3c:	b4001856 	cbz	x22, 11244 <main+0x3ac>
   10f40:	b4001837 	cbz	x23, 11244 <main+0x3ac>
   10f44:	b4001818 	cbz	x24, 11244 <main+0x3ac>
   10f48:	b40017f9 	cbz	x25, 11244 <main+0x3ac>
   10f4c:	b40017da 	cbz	x26, 11244 <main+0x3ac>
   10f50:	b40017bb 	cbz	x27, 11244 <main+0x3ac>
   10f54:	aa0003fc 	mov	x28, x0
   10f58:	b4001760 	cbz	x0, 11244 <main+0x3ac>
   10f5c:	d28fe5a9 	mov	x9, #0x7f2d                	// #32557
   10f60:	90ffff8d 	adrp	x13, 0 <__abi_tag-0x2c4>
   10f64:	f2a992a9 	movk	x9, #0x4c95, lsl #16
   10f68:	aa1f03e8 	mov	x8, xzr
   10f6c:	f2de85a9 	movk	x9, #0xf42d, lsl #32
   10f70:	5280002c 	mov	w12, #0x1                   	// #1
   10f74:	f2eb0a29 	movk	x9, #0x5851, lsl #48
   10f78:	b24003ea 	orr	x10, xzr, #0x1
   10f7c:	d2e7940b 	mov	x11, #0x3ca0000000000000    	// #4368491638549381120
   10f80:	1e7e1000 	fmov	d0, #-1.000000000000000000e+00
   10f84:	1e601001 	fmov	d1, #2.000000000000000000e+00
   10f88:	fd43b5a2 	ldr	d2, [x13, #1896]
   10f8c:	1e6c1003 	fmov	d3, #5.000000000000000000e-01
   10f90:	9b09298c 	madd	x12, x12, x9, x10
   10f94:	9e670167 	fmov	d7, x11
   10f98:	d34bfd8d 	lsr	x13, x12, #11
   10f9c:	9b09298e 	madd	x14, x12, x9, x10
   10fa0:	9e6301a4 	ucvtf	d4, x13
   10fa4:	9b0929cd 	madd	x13, x14, x9, x10
   10fa8:	d34bfdce 	lsr	x14, x14, #11
   10fac:	9b0929ac 	madd	x12, x13, x9, x10
   10fb0:	d34bfdad 	lsr	x13, x13, #11
   10fb4:	9e6301d1 	ucvtf	d17, x14
   10fb8:	1e670884 	fmul	d4, d4, d7
   10fbc:	d34bfd8f 	lsr	x15, x12, #11
   10fc0:	9b092990 	madd	x16, x12, x9, x10
   10fc4:	9e6301b3 	ucvtf	d19, x13
   10fc8:	d37df10d 	lsl	x13, x8, #3
   10fcc:	91000508 	add	x8, x8, #0x1
   10fd0:	9e6301e5 	ucvtf	d5, x15
   10fd4:	1e670a31 	fmul	d17, d17, d7
   10fd8:	9b092a0f 	madd	x15, x16, x9, x10
   10fdc:	d34bfe10 	lsr	x16, x16, #11
   10fe0:	1f410084 	fmadd	d4, d4, d1, d0
   10fe4:	f117711f 	cmp	x8, #0x5dc
   10fe8:	9b0929ec 	madd	x12, x15, x9, x10
   10fec:	d34bfdef 	lsr	x15, x15, #11
   10ff0:	9e630210 	ucvtf	d16, x16
   10ff4:	1e6708a5 	fmul	d5, d5, d7
   10ff8:	d34bfd91 	lsr	x17, x12, #11
   10ffc:	fc2d6a64 	str	d4, [x19, x13]
   11000:	9e6301f2 	ucvtf	d18, x15
   11004:	1f410231 	fmadd	d17, d17, d1, d0
   11008:	9e630226 	ucvtf	d6, x17
   1100c:	1e670a10 	fmul	d16, d16, d7
   11010:	1f4100a5 	fmadd	d5, d5, d1, d0
   11014:	fc2d6a91 	str	d17, [x20, x13]
   11018:	1e670a52 	fmul	d18, d18, d7
   1101c:	1e6708c6 	fmul	d6, d6, d7
   11020:	1e670a67 	fmul	d7, d19, d7
   11024:	1f410210 	fmadd	d16, d16, d1, d0
   11028:	1e6208a4 	fmul	d4, d5, d2
   1102c:	1f410252 	fmadd	d18, d18, d1, d0
   11030:	1f4100c6 	fmadd	d6, d6, d1, d0
   11034:	1f4100e7 	fmadd	d7, d7, d1, d0
   11038:	1e620a05 	fmul	d5, d16, d2
   1103c:	fc2d6ac4 	str	d4, [x22, x13]
   11040:	fc2d6aa7 	str	d7, [x21, x13]
   11044:	1e620a47 	fmul	d7, d18, d2
   11048:	1e60c0c6 	fabs	d6, d6
   1104c:	fc2d6ae5 	str	d5, [x23, x13]
   11050:	fc2d6b07 	str	d7, [x24, x13]
   11054:	1e6328c4 	fadd	d4, d6, d3
   11058:	fc2d6b24 	str	d4, [x25, x13]
   1105c:	54fff9a1 	b.ne	10f90 <main+0xf8>  // b.any
   11060:	528000a0 	mov	w0, #0x5                   	// #5
   11064:	aa1303e1 	mov	x1, x19
   11068:	aa1403e2 	mov	x2, x20
   1106c:	aa1503e3 	mov	x3, x21
   11070:	aa1603e4 	mov	x4, x22
   11074:	aa1703e5 	mov	x5, x23
   11078:	aa1803e6 	mov	x6, x24
   1107c:	aa1903e7 	mov	x7, x25
   11080:	a900f3fb 	stp	x27, x28, [sp, #8]
   11084:	f90003fa 	str	x26, [sp]
   11088:	97fffe73 	bl	10a54 <run_steps>
   1108c:	910083e1 	add	x1, sp, #0x20
   11090:	52800020 	mov	w0, #0x1                   	// #1
   11094:	940000a7 	bl	11330 <clock_gettime@plt>
   11098:	fd4017e0 	ldr	d0, [sp, #40]
   1109c:	aa1a03e8 	mov	x8, x26
   110a0:	52803200 	mov	w0, #0x190                 	// #400
   110a4:	aa1303e1 	mov	x1, x19
   110a8:	aa1403e2 	mov	x2, x20
   110ac:	aa1503e3 	mov	x3, x21
   110b0:	aa1603e4 	mov	x4, x22
   110b4:	aa1703e5 	mov	x5, x23
   110b8:	aa1803e6 	mov	x6, x24
   110bc:	aa1903e7 	mov	x7, x25
   110c0:	f94013fa 	ldr	x26, [sp, #32]
   110c4:	5e61d808 	scvtf	d8, d0
   110c8:	a900f3fb 	stp	x27, x28, [sp, #8]
   110cc:	f81f83a8 	stur	x8, [x29, #-8]
   110d0:	f90003e8 	str	x8, [sp]
   110d4:	97fffe60 	bl	10a54 <run_steps>
   110d8:	910083e1 	add	x1, sp, #0x20
   110dc:	52800020 	mov	w0, #0x1                   	// #1
   110e0:	94000094 	bl	11330 <clock_gettime@plt>
   110e4:	fd4017e0 	ldr	d0, [sp, #40]
   110e8:	2f00e401 	movi	d1, #0x0
   110ec:	f94013e8 	ldr	x8, [sp, #32]
   110f0:	9285dbe9 	mov	x9, #0xffffffffffffd120    	// #-12000
   110f4:	5e61d800 	scvtf	d0, d0
   110f8:	8b09026a 	add	x10, x19, x9
   110fc:	8b09028b 	add	x11, x20, x9
   11100:	8b0902ac 	add	x12, x21, x9
   11104:	3dcbb942 	ldr	q2, [x10, #12000]
   11108:	3dcbb963 	ldr	q3, [x11, #12000]
   1110c:	3dcbbd44 	ldr	q4, [x10, #12016]
   11110:	8b0902ca 	add	x10, x22, x9
   11114:	3dcbbd65 	ldr	q5, [x11, #12016]
   11118:	8b0902eb 	add	x11, x23, x9
   1111c:	4e63d442 	fadd	v2.2d, v2.2d, v3.2d
   11120:	3dcbb983 	ldr	q3, [x12, #12000]
   11124:	4e65d484 	fadd	v4.2d, v4.2d, v5.2d
   11128:	3dcbbd85 	ldr	q5, [x12, #12016]
   1112c:	8b09030c 	add	x12, x24, x9
   11130:	b1008129 	adds	x9, x9, #0x20
   11134:	4e63d442 	fadd	v2.2d, v2.2d, v3.2d
   11138:	3dcbb943 	ldr	q3, [x10, #12000]
   1113c:	4e65d484 	fadd	v4.2d, v4.2d, v5.2d
   11140:	3dcbbd45 	ldr	q5, [x10, #12016]
   11144:	4e63d442 	fadd	v2.2d, v2.2d, v3.2d
   11148:	3dcbb963 	ldr	q3, [x11, #12000]
   1114c:	4e65d484 	fadd	v4.2d, v4.2d, v5.2d
   11150:	3dcbbd65 	ldr	q5, [x11, #12016]
   11154:	4e63d442 	fadd	v2.2d, v2.2d, v3.2d
   11158:	3dcbb983 	ldr	q3, [x12, #12000]
   1115c:	4e63d442 	fadd	v2.2d, v2.2d, v3.2d
   11160:	4e65d483 	fadd	v3.2d, v4.2d, v5.2d
   11164:	5e180444 	mov	d4, v2.d[1]
   11168:	1e622821 	fadd	d1, d1, d2
   1116c:	3dcbbd82 	ldr	q2, [x12, #12016]
   11170:	4e62d462 	fadd	v2.2d, v3.2d, v2.2d
   11174:	1e642821 	fadd	d1, d1, d4
   11178:	5e180443 	mov	d3, v2.d[1]
   1117c:	1e622821 	fadd	d1, d1, d2
   11180:	1e632821 	fadd	d1, d1, d3
   11184:	54fffba1 	b.ne	110f8 <main+0x260>  // b.any
   11188:	d2d09009 	mov	x9, #0x848000000000        	// #145685290680320
   1118c:	9e620104 	scvtf	d4, x8
   11190:	f2e825c9 	movk	x9, #0x412e, lsl #48
   11194:	f0ffff60 	adrp	x0, 0 <__abi_tag-0x2c4>
   11198:	911dc000 	add	x0, x0, #0x770
   1119c:	9e670122 	fmov	d2, x9
   111a0:	d2c80009 	mov	x9, #0x400000000000        	// #70368744177664
   111a4:	f2e811e9 	movk	x9, #0x408f, lsl #48
   111a8:	1e621903 	fdiv	d3, d8, d2
   111ac:	9e670125 	fmov	d5, x9
   111b0:	1e621800 	fdiv	d0, d0, d2
   111b4:	9e620342 	scvtf	d2, x26
   111b8:	1f450c42 	fmadd	d2, d2, d5, d3
   111bc:	1f450080 	fmadd	d0, d4, d5, d0
   111c0:	1e623800 	fsub	d0, d0, d2
   111c4:	94000053 	bl	11310 <printf@plt>
   111c8:	aa1303e0 	mov	x0, x19
   111cc:	94000055 	bl	11320 <free@plt>
   111d0:	aa1403e0 	mov	x0, x20
   111d4:	94000053 	bl	11320 <free@plt>
   111d8:	aa1503e0 	mov	x0, x21
   111dc:	94000051 	bl	11320 <free@plt>
   111e0:	aa1603e0 	mov	x0, x22
   111e4:	9400004f 	bl	11320 <free@plt>
   111e8:	aa1703e0 	mov	x0, x23
   111ec:	9400004d 	bl	11320 <free@plt>
   111f0:	aa1803e0 	mov	x0, x24
   111f4:	9400004b 	bl	11320 <free@plt>
   111f8:	aa1903e0 	mov	x0, x25
   111fc:	94000049 	bl	11320 <free@plt>
   11200:	f85f83a0 	ldur	x0, [x29, #-8]
   11204:	94000047 	bl	11320 <free@plt>
   11208:	aa1b03e0 	mov	x0, x27
   1120c:	94000045 	bl	11320 <free@plt>
   11210:	aa1c03e0 	mov	x0, x28
   11214:	94000043 	bl	11320 <free@plt>
   11218:	2a1f03f3 	mov	w19, wzr
   1121c:	2a1303e0 	mov	w0, w19
   11220:	fd401be8 	ldr	d8, [sp, #48]
   11224:	a9494ff4 	ldp	x20, x19, [sp, #144]
   11228:	a94857f6 	ldp	x22, x21, [sp, #128]
   1122c:	a9475ff8 	ldp	x24, x23, [sp, #112]
   11230:	a94667fa 	ldp	x26, x25, [sp, #96]
   11234:	a9456ffc 	ldp	x28, x27, [sp, #80]
   11238:	a9447bfd 	ldp	x29, x30, [sp, #64]
   1123c:	910283ff 	add	sp, sp, #0xa0
   11240:	d65f03c0 	ret
   11244:	90000088 	adrp	x8, 21000 <memset@plt+0xfcb0>
   11248:	d503201f 	nop
   1124c:	70f7aa00 	adr	x0, 78f <_IO_stdin_used+0x37>
   11250:	52800241 	mov	w1, #0x12                  	// #18
   11254:	52800022 	mov	w2, #0x1                   	// #1
   11258:	52800033 	mov	w19, #0x1                   	// #1
   1125c:	f942a508 	ldr	x8, [x8, #1352]
   11260:	f9400103 	ldr	x3, [x8]
   11264:	94000037 	bl	11340 <fwrite@plt>
   11268:	17ffffed 	b	1121c <main+0x384>

Disassembly of section .init:

000000000001126c <_init>:
   1126c:	d503201f 	nop
   11270:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   11274:	910003fd 	mov	x29, sp
   11278:	97fffdbf 	bl	10974 <call_weak_fn>
   1127c:	a8c17bfd 	ldp	x29, x30, [sp], #16
   11280:	d65f03c0 	ret

Disassembly of section .fini:

0000000000011284 <_fini>:
   11284:	d503201f 	nop
   11288:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   1128c:	910003fd 	mov	x29, sp
   11290:	a8c17bfd 	ldp	x29, x30, [sp], #16
   11294:	d65f03c0 	ret

Disassembly of section .plt:

00000000000112a0 <abort@plt-0x20>:
   112a0:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
   112a4:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfc90>
   112a8:	f942ba11 	ldr	x17, [x16, #1392]
   112ac:	9115c210 	add	x16, x16, #0x570
   112b0:	d61f0220 	br	x17
   112b4:	d503201f 	nop
   112b8:	d503201f 	nop
   112bc:	d503201f 	nop

00000000000112c0 <abort@plt>:
   112c0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfc90>
   112c4:	f942be11 	ldr	x17, [x16, #1400]
   112c8:	9115e210 	add	x16, x16, #0x578
   112cc:	d61f0220 	br	x17

00000000000112d0 <__libc_start_main@plt>:
   112d0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfc90>
   112d4:	f942c211 	ldr	x17, [x16, #1408]
   112d8:	91160210 	add	x16, x16, #0x580
   112dc:	d61f0220 	br	x17

00000000000112e0 <__gmon_start__@plt>:
   112e0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfc90>
   112e4:	f942c611 	ldr	x17, [x16, #1416]
   112e8:	91162210 	add	x16, x16, #0x588
   112ec:	d61f0220 	br	x17

00000000000112f0 <__cxa_finalize@plt>:
   112f0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfc90>
   112f4:	f942ca11 	ldr	x17, [x16, #1424]
   112f8:	91164210 	add	x16, x16, #0x590
   112fc:	d61f0220 	br	x17

0000000000011300 <malloc@plt>:
   11300:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfc90>
   11304:	f942ce11 	ldr	x17, [x16, #1432]
   11308:	91166210 	add	x16, x16, #0x598
   1130c:	d61f0220 	br	x17

0000000000011310 <printf@plt>:
   11310:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfc90>
   11314:	f942d211 	ldr	x17, [x16, #1440]
   11318:	91168210 	add	x16, x16, #0x5a0
   1131c:	d61f0220 	br	x17

0000000000011320 <free@plt>:
   11320:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfc90>
   11324:	f942d611 	ldr	x17, [x16, #1448]
   11328:	9116a210 	add	x16, x16, #0x5a8
   1132c:	d61f0220 	br	x17

0000000000011330 <clock_gettime@plt>:
   11330:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfc90>
   11334:	f942da11 	ldr	x17, [x16, #1456]
   11338:	9116c210 	add	x16, x16, #0x5b0
   1133c:	d61f0220 	br	x17

0000000000011340 <fwrite@plt>:
   11340:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfc90>
   11344:	f942de11 	ldr	x17, [x16, #1464]
   11348:	9116e210 	add	x16, x16, #0x5b8
   1134c:	d61f0220 	br	x17

0000000000011350 <memset@plt>:
   11350:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfc90>
   11354:	f942e211 	ldr	x17, [x16, #1472]
   11358:	91170210 	add	x16, x16, #0x5c0
   1135c:	d61f0220 	br	x17
