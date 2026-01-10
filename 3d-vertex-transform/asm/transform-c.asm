
/bench/bench:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000010a00 <_start>:
   10a00:	d503201f 	nop
   10a04:	d280001d 	mov	x29, #0x0                   	// #0
   10a08:	d280001e 	mov	x30, #0x0                   	// #0
   10a0c:	aa0003e5 	mov	x5, x0
   10a10:	f94003e1 	ldr	x1, [sp]
   10a14:	910023e2 	add	x2, sp, #0x8
   10a18:	910003e6 	mov	x6, sp
   10a1c:	d503201f 	nop
   10a20:	100007a0 	adr	x0, 10b14 <main>
   10a24:	d2800003 	mov	x3, #0x0                   	// #0
   10a28:	d2800004 	mov	x4, #0x0                   	// #0
   10a2c:	94000111 	bl	10e70 <__libc_start_main@plt>
   10a30:	9400010c 	bl	10e60 <abort@plt>

0000000000010a34 <call_weak_fn>:
   10a34:	b0000080 	adrp	x0, 21000 <_DYNAMIC+0xd0>
   10a38:	f9407400 	ldr	x0, [x0, #232]
   10a3c:	b4000040 	cbz	x0, 10a44 <call_weak_fn+0x10>
   10a40:	14000110 	b	10e80 <__gmon_start__@plt>
   10a44:	d65f03c0 	ret
	...

0000000000010a50 <deregister_tm_clones>:
   10a50:	d503201f 	nop
   10a54:	10103620 	adr	x0, 31118 <__TMC_END__>
   10a58:	d503201f 	nop
   10a5c:	101035e1 	adr	x1, 31118 <__TMC_END__>
   10a60:	eb00003f 	cmp	x1, x0
   10a64:	540000c0 	b.eq	10a7c <deregister_tm_clones+0x2c>  // b.none
   10a68:	b0000081 	adrp	x1, 21000 <_DYNAMIC+0xd0>
   10a6c:	f9407821 	ldr	x1, [x1, #240]
   10a70:	b4000061 	cbz	x1, 10a7c <deregister_tm_clones+0x2c>
   10a74:	aa0103f0 	mov	x16, x1
   10a78:	d61f0200 	br	x16
   10a7c:	d65f03c0 	ret

0000000000010a80 <register_tm_clones>:
   10a80:	d503201f 	nop
   10a84:	101034a0 	adr	x0, 31118 <__TMC_END__>
   10a88:	d503201f 	nop
   10a8c:	10103461 	adr	x1, 31118 <__TMC_END__>
   10a90:	cb000021 	sub	x1, x1, x0
   10a94:	d37ffc22 	lsr	x2, x1, #63
   10a98:	8b810c41 	add	x1, x2, x1, asr #3
   10a9c:	9341fc21 	asr	x1, x1, #1
   10aa0:	b40000c1 	cbz	x1, 10ab8 <register_tm_clones+0x38>
   10aa4:	b0000082 	adrp	x2, 21000 <_DYNAMIC+0xd0>
   10aa8:	f9407c42 	ldr	x2, [x2, #248]
   10aac:	b4000062 	cbz	x2, 10ab8 <register_tm_clones+0x38>
   10ab0:	aa0203f0 	mov	x16, x2
   10ab4:	d61f0200 	br	x16
   10ab8:	d65f03c0 	ret
   10abc:	d503201f 	nop

0000000000010ac0 <__do_global_dtors_aux>:
   10ac0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   10ac4:	910003fd 	mov	x29, sp
   10ac8:	f9000bf3 	str	x19, [sp, #16]
   10acc:	b0000113 	adrp	x19, 31000 <_DYNAMIC+0x100d0>
   10ad0:	39464260 	ldrb	w0, [x19, #400]
   10ad4:	35000140 	cbnz	w0, 10afc <__do_global_dtors_aux+0x3c>
   10ad8:	b0000080 	adrp	x0, 21000 <_DYNAMIC+0xd0>
   10adc:	f9408000 	ldr	x0, [x0, #256]
   10ae0:	b4000080 	cbz	x0, 10af0 <__do_global_dtors_aux+0x30>
   10ae4:	b0000100 	adrp	x0, 31000 <_DYNAMIC+0x100d0>
   10ae8:	f9408800 	ldr	x0, [x0, #272]
   10aec:	940000e9 	bl	10e90 <__cxa_finalize@plt>
   10af0:	97ffffd8 	bl	10a50 <deregister_tm_clones>
   10af4:	52800020 	mov	w0, #0x1                   	// #1
   10af8:	39064260 	strb	w0, [x19, #400]
   10afc:	f9400bf3 	ldr	x19, [sp, #16]
   10b00:	a8c27bfd 	ldp	x29, x30, [sp], #32
   10b04:	d65f03c0 	ret
   10b08:	d503201f 	nop
   10b0c:	d503201f 	nop

0000000000010b10 <frame_dummy>:
   10b10:	17ffffdc 	b	10a80 <register_tm_clones>

0000000000010b14 <main>:
   10b14:	d10303ff 	sub	sp, sp, #0xc0
   10b18:	6d023bef 	stp	d15, d14, [sp, #32]
   10b1c:	6d0333ed 	stp	d13, d12, [sp, #48]
   10b20:	6d042beb 	stp	d11, d10, [sp, #64]
   10b24:	6d0523e9 	stp	d9, d8, [sp, #80]
   10b28:	a9067bfd 	stp	x29, x30, [sp, #96]
   10b2c:	910183fd 	add	x29, sp, #0x60
   10b30:	a9076ffc 	stp	x28, x27, [sp, #112]
   10b34:	a90867fa 	stp	x26, x25, [sp, #128]
   10b38:	a9095ff8 	stp	x24, x23, [sp, #144]
   10b3c:	a90a57f6 	stp	x22, x21, [sp, #160]
   10b40:	a90b4ff4 	stp	x20, x19, [sp, #176]
   10b44:	5291b000 	mov	w0, #0x8d80                	// #36224
   10b48:	5291b016 	mov	w22, #0x8d80                	// #36224
   10b4c:	72a00b60 	movk	w0, #0x5b, lsl #16
   10b50:	72a00b76 	movk	w22, #0x5b, lsl #16
   10b54:	940000db 	bl	10ec0 <malloc@plt>
   10b58:	90ffff88 	adrp	x8, 0 <__abi_tag-0x2c4>
   10b5c:	90ffff89 	adrp	x9, 0 <__abi_tag-0x2c4>
   10b60:	d2d08f15 	mov	x21, #0x847800000000        	// #145650930941952
   10b64:	529a1218 	mov	w24, #0xd090                	// #53392
   10b68:	aa0003f3 	mov	x19, x0
   10b6c:	aa1f03f4 	mov	x20, xzr
   10b70:	f2f821d5 	movk	x21, #0xc10e, lsl #48
   10b74:	91004017 	add	x23, x0, #0x10
   10b78:	fd43d50a 	ldr	d10, [x8, #1960]
   10b7c:	1e6e100c 	fmov	d12, #1.000000000000000000e+00
   10b80:	fd43dd2b 	ldr	d11, [x9, #1976]
   10b84:	1e60100d 	fmov	d13, #2.000000000000000000e+00
   10b88:	72a00078 	movk	w24, #0x3, lsl #16
   10b8c:	1e620289 	scvtf	d9, w20
   10b90:	9e6702a0 	fmov	d0, x21
   10b94:	1e601920 	fdiv	d0, d9, d0
   10b98:	1f4d300e 	fmadd	d14, d0, d13, d12
   10b9c:	1f4eb1c0 	fmsub	d0, d14, d14, d12
   10ba0:	1e61c008 	fsqrt	d8, d0
   10ba4:	1e682100 	fcmp	d8, d8
   10ba8:	540001e6 	b.vs	10be4 <main+0xd0>
   10bac:	1e6a0920 	fmul	d0, d9, d10
   10bb0:	1e6b0809 	fmul	d9, d0, d11
   10bb4:	1e604120 	fmov	d0, d9
   10bb8:	940000ba 	bl	10ea0 <cos@plt>
   10bbc:	1e60090f 	fmul	d15, d8, d0
   10bc0:	1e604120 	fmov	d0, d9
   10bc4:	940000bb 	bl	10eb0 <sin@plt>
   10bc8:	1e600900 	fmul	d0, d8, d0
   10bcc:	91000694 	add	x20, x20, #0x1
   10bd0:	eb18029f 	cmp	x20, x24
   10bd4:	6d3f3aef 	stp	d15, d14, [x23, #-16]
   10bd8:	fc0186e0 	str	d0, [x23], #24
   10bdc:	54fffd81 	b.ne	10b8c <main+0x78>  // b.any
   10be0:	14000004 	b	10bf0 <main+0xdc>
   10be4:	940000bb 	bl	10ed0 <sqrt@plt>
   10be8:	1e604008 	fmov	d8, d0
   10bec:	17fffff0 	b	10bac <main+0x98>
   10bf0:	90ffff80 	adrp	x0, 0 <__abi_tag-0x2c4>
   10bf4:	91209400 	add	x0, x0, #0x825
   10bf8:	940000c6 	bl	10f10 <puts@plt>
   10bfc:	910043e1 	add	x1, sp, #0x10
   10c00:	52800020 	mov	w0, #0x1                   	// #1
   10c04:	940000bf 	bl	10f00 <clock_gettime@plt>
   10c08:	90ffff88 	adrp	x8, 0 <__abi_tag-0x2c4>
   10c0c:	2f00e408 	movi	d8, #0x0
   10c10:	a94163f7 	ldp	x23, x24, [sp, #16]
   10c14:	d2c80019 	mov	x25, #0x400000000000        	// #70368744177664
   10c18:	529999ba 	mov	w26, #0xcccd                	// #52429
   10c1c:	2f00e40d 	movi	d13, #0x0
   10c20:	529999bb 	mov	w27, #0xcccd                	// #52429
   10c24:	90ffff95 	adrp	x21, 0 <__abi_tag-0x2c4>
   10c28:	2a1f03f4 	mov	w20, wzr
   10c2c:	1e62900b 	fmov	d11, #5.000000000000000000e+00
   10c30:	f2e811f9 	movk	x25, #0x408f, lsl #48
   10c34:	fd43d900 	ldr	d0, [x8, #1968]
   10c38:	72b9999a 	movk	w26, #0xcccc, lsl #16
   10c3c:	72a1999b 	movk	w27, #0xccc, lsl #16
   10c40:	911fc6b5 	add	x21, x21, #0x7f1
   10c44:	fd0007e0 	str	d0, [sp, #8]
   10c48:	14000006 	b	10c60 <main+0x14c>
   10c4c:	1e6e1000 	fmov	d0, #1.000000000000000000e+00
   10c50:	11000694 	add	w20, w20, #0x1
   10c54:	7101929f 	cmp	w20, #0x64
   10c58:	1e6029ad 	fadd	d13, d13, d0
   10c5c:	540007c0 	b.eq	10d54 <main+0x240>  // b.none
   10c60:	fd4007e0 	ldr	d0, [sp, #8]
   10c64:	aa1f03fc 	mov	x28, xzr
   10c68:	1e6009a9 	fmul	d9, d13, d0
   10c6c:	8b1c0268 	add	x8, x19, x28
   10c70:	1e604120 	fmov	d0, d9
   10c74:	6d40390f 	ldp	d15, d14, [x8]
   10c78:	fd40090c 	ldr	d12, [x8, #16]
   10c7c:	94000089 	bl	10ea0 <cos@plt>
   10c80:	1e60400a 	fmov	d10, d0
   10c84:	1e604120 	fmov	d0, d9
   10c88:	9400008a 	bl	10eb0 <sin@plt>
   10c8c:	1e6a0981 	fmul	d1, d12, d10
   10c90:	9e670323 	fmov	d3, x25
   10c94:	9100639c 	add	x28, x28, #0x18
   10c98:	eb1c02df 	cmp	x22, x28
   10c9c:	1f4085e2 	fmsub	d2, d15, d0, d1
   10ca0:	1e620942 	fmul	d2, d10, d2
   10ca4:	1f4009c2 	fmadd	d2, d14, d0, d2
   10ca8:	1e6b2842 	fadd	d2, d2, d11
   10cac:	1e621862 	fdiv	d2, d3, d2
   10cb0:	1e6141e3 	fneg	d3, d15
   10cb4:	1f600461 	fnmadd	d1, d3, d0, d1
   10cb8:	1e600983 	fmul	d3, d12, d0
   10cbc:	1e610800 	fmul	d0, d0, d1
   10cc0:	1f4a0de1 	fmadd	d1, d15, d10, d3
   10cc4:	1f4a01c0 	fmadd	d0, d14, d10, d0
   10cc8:	1e620821 	fmul	d1, d1, d2
   10ccc:	1e620800 	fmul	d0, d0, d2
   10cd0:	1e602820 	fadd	d0, d1, d0
   10cd4:	1e602908 	fadd	d8, d8, d0
   10cd8:	54fffca1 	b.ne	10c6c <main+0x158>  // b.any
   10cdc:	1b1a7e88 	mul	w8, w20, w26
   10ce0:	13880908 	ror	w8, w8, #2
   10ce4:	6b1b011f 	cmp	w8, w27
   10ce8:	54fffb22 	b.cs	10c4c <main+0x138>  // b.hs, b.nlast
   10cec:	6d403a6c 	ldp	d12, d14, [x19]
   10cf0:	1e604120 	fmov	d0, d9
   10cf4:	fd400a6f 	ldr	d15, [x19, #16]
   10cf8:	9400006a 	bl	10ea0 <cos@plt>
   10cfc:	1e60400a 	fmov	d10, d0
   10d00:	1e604120 	fmov	d0, d9
   10d04:	9400006b 	bl	10eb0 <sin@plt>
   10d08:	1e6a09e1 	fmul	d1, d15, d10
   10d0c:	9e670323 	fmov	d3, x25
   10d10:	aa1503e0 	mov	x0, x21
   10d14:	2a1403e1 	mov	w1, w20
   10d18:	1f408582 	fmsub	d2, d12, d0, d1
   10d1c:	1e620942 	fmul	d2, d10, d2
   10d20:	1f4009c2 	fmadd	d2, d14, d0, d2
   10d24:	1e6b2842 	fadd	d2, d2, d11
   10d28:	1e621862 	fdiv	d2, d3, d2
   10d2c:	1e614183 	fneg	d3, d12
   10d30:	1f600461 	fnmadd	d1, d3, d0, d1
   10d34:	1e6009e3 	fmul	d3, d15, d0
   10d38:	1e610800 	fmul	d0, d0, d1
   10d3c:	1f4a0d81 	fmadd	d1, d12, d10, d3
   10d40:	1f4a01c3 	fmadd	d3, d14, d10, d0
   10d44:	1e620820 	fmul	d0, d1, d2
   10d48:	1e620861 	fmul	d1, d3, d2
   10d4c:	94000065 	bl	10ee0 <printf@plt>
   10d50:	17ffffbf 	b	10c4c <main+0x138>
   10d54:	d2d09008 	mov	x8, #0x848000000000        	// #145685290680320
   10d58:	9e620300 	scvtf	d0, x24
   10d5c:	f2e825c8 	movk	x8, #0x412e, lsl #48
   10d60:	9e6202e1 	scvtf	d1, x23
   10d64:	910043e1 	add	x1, sp, #0x10
   10d68:	52800020 	mov	w0, #0x1                   	// #1
   10d6c:	9e670109 	fmov	d9, x8
   10d70:	d2c80008 	mov	x8, #0x400000000000        	// #70368744177664
   10d74:	f2e811e8 	movk	x8, #0x408f, lsl #48
   10d78:	1e691800 	fdiv	d0, d0, d9
   10d7c:	9e67010a 	fmov	d10, x8
   10d80:	1f4a002b 	fmadd	d11, d1, d10, d0
   10d84:	9400005f 	bl	10f00 <clock_gettime@plt>
   10d88:	6d4103e1 	ldp	d1, d0, [sp, #16]
   10d8c:	90ffff80 	adrp	x0, 0 <__abi_tag-0x2c4>
   10d90:	911f0000 	add	x0, x0, #0x7c0
   10d94:	5e61d821 	scvtf	d1, d1
   10d98:	5e61d800 	scvtf	d0, d0
   10d9c:	1e691800 	fdiv	d0, d0, d9
   10da0:	1f4a0020 	fmadd	d0, d1, d10, d0
   10da4:	1e6b3809 	fsub	d9, d0, d11
   10da8:	9400005a 	bl	10f10 <puts@plt>
   10dac:	1e6a1920 	fdiv	d0, d9, d10
   10db0:	d2daf088 	mov	x8, #0xd78400000000        	// #236961935654912
   10db4:	f2e82ee8 	movk	x8, #0x4177, lsl #48
   10db8:	90ffff80 	adrp	x0, 0 <__abi_tag-0x2c4>
   10dbc:	1e604102 	fmov	d2, d8
   10dc0:	91213400 	add	x0, x0, #0x84d
   10dc4:	9e670101 	fmov	d1, x8
   10dc8:	1e601821 	fdiv	d1, d1, d0
   10dcc:	1e604120 	fmov	d0, d9
   10dd0:	94000044 	bl	10ee0 <printf@plt>
   10dd4:	aa1303e0 	mov	x0, x19
   10dd8:	94000046 	bl	10ef0 <free@plt>
   10ddc:	a94b4ff4 	ldp	x20, x19, [sp, #176]
   10de0:	2a1f03e0 	mov	w0, wzr
   10de4:	a94a57f6 	ldp	x22, x21, [sp, #160]
   10de8:	a9495ff8 	ldp	x24, x23, [sp, #144]
   10dec:	a94867fa 	ldp	x26, x25, [sp, #128]
   10df0:	a9476ffc 	ldp	x28, x27, [sp, #112]
   10df4:	a9467bfd 	ldp	x29, x30, [sp, #96]
   10df8:	6d4523e9 	ldp	d9, d8, [sp, #80]
   10dfc:	6d442beb 	ldp	d11, d10, [sp, #64]
   10e00:	6d4333ed 	ldp	d13, d12, [sp, #48]
   10e04:	6d423bef 	ldp	d15, d14, [sp, #32]
   10e08:	910303ff 	add	sp, sp, #0xc0
   10e0c:	d65f03c0 	ret

Disassembly of section .init:

0000000000010e10 <_init>:
   10e10:	d503201f 	nop
   10e14:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   10e18:	910003fd 	mov	x29, sp
   10e1c:	97ffff06 	bl	10a34 <call_weak_fn>
   10e20:	a8c17bfd 	ldp	x29, x30, [sp], #16
   10e24:	d65f03c0 	ret

Disassembly of section .fini:

0000000000010e28 <_fini>:
   10e28:	d503201f 	nop
   10e2c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   10e30:	910003fd 	mov	x29, sp
   10e34:	a8c17bfd 	ldp	x29, x30, [sp], #16
   10e38:	d65f03c0 	ret

Disassembly of section .plt:

0000000000010e40 <abort@plt-0x20>:
   10e40:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
   10e44:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10e48:	f9409611 	ldr	x17, [x16, #296]
   10e4c:	9104a210 	add	x16, x16, #0x128
   10e50:	d61f0220 	br	x17
   10e54:	d503201f 	nop
   10e58:	d503201f 	nop
   10e5c:	d503201f 	nop

0000000000010e60 <abort@plt>:
   10e60:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10e64:	f9409a11 	ldr	x17, [x16, #304]
   10e68:	9104c210 	add	x16, x16, #0x130
   10e6c:	d61f0220 	br	x17

0000000000010e70 <__libc_start_main@plt>:
   10e70:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10e74:	f9409e11 	ldr	x17, [x16, #312]
   10e78:	9104e210 	add	x16, x16, #0x138
   10e7c:	d61f0220 	br	x17

0000000000010e80 <__gmon_start__@plt>:
   10e80:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10e84:	f940a211 	ldr	x17, [x16, #320]
   10e88:	91050210 	add	x16, x16, #0x140
   10e8c:	d61f0220 	br	x17

0000000000010e90 <__cxa_finalize@plt>:
   10e90:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10e94:	f940a611 	ldr	x17, [x16, #328]
   10e98:	91052210 	add	x16, x16, #0x148
   10e9c:	d61f0220 	br	x17

0000000000010ea0 <cos@plt>:
   10ea0:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10ea4:	f940aa11 	ldr	x17, [x16, #336]
   10ea8:	91054210 	add	x16, x16, #0x150
   10eac:	d61f0220 	br	x17

0000000000010eb0 <sin@plt>:
   10eb0:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10eb4:	f940ae11 	ldr	x17, [x16, #344]
   10eb8:	91056210 	add	x16, x16, #0x158
   10ebc:	d61f0220 	br	x17

0000000000010ec0 <malloc@plt>:
   10ec0:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10ec4:	f940b211 	ldr	x17, [x16, #352]
   10ec8:	91058210 	add	x16, x16, #0x160
   10ecc:	d61f0220 	br	x17

0000000000010ed0 <sqrt@plt>:
   10ed0:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10ed4:	f940b611 	ldr	x17, [x16, #360]
   10ed8:	9105a210 	add	x16, x16, #0x168
   10edc:	d61f0220 	br	x17

0000000000010ee0 <printf@plt>:
   10ee0:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10ee4:	f940ba11 	ldr	x17, [x16, #368]
   10ee8:	9105c210 	add	x16, x16, #0x170
   10eec:	d61f0220 	br	x17

0000000000010ef0 <free@plt>:
   10ef0:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10ef4:	f940be11 	ldr	x17, [x16, #376]
   10ef8:	9105e210 	add	x16, x16, #0x178
   10efc:	d61f0220 	br	x17

0000000000010f00 <clock_gettime@plt>:
   10f00:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10f04:	f940c211 	ldr	x17, [x16, #384]
   10f08:	91060210 	add	x16, x16, #0x180
   10f0c:	d61f0220 	br	x17

0000000000010f10 <puts@plt>:
   10f10:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0x100d0>
   10f14:	f940c611 	ldr	x17, [x16, #392]
   10f18:	91062210 	add	x16, x16, #0x188
   10f1c:	d61f0220 	br	x17
