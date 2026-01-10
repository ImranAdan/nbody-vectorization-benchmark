
/bench/bench:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000010bc0 <_start>:
   10bc0:	d503201f 	nop
   10bc4:	d280001d 	mov	x29, #0x0                   	// #0
   10bc8:	d280001e 	mov	x30, #0x0                   	// #0
   10bcc:	aa0003e5 	mov	x5, x0
   10bd0:	f94003e1 	ldr	x1, [sp]
   10bd4:	910023e2 	add	x2, sp, #0x8
   10bd8:	910003e6 	mov	x6, sp
   10bdc:	d503201f 	nop
   10be0:	10000980 	adr	x0, 10d10 <main>
   10be4:	d2800003 	mov	x3, #0x0                   	// #0
   10be8:	d2800004 	mov	x4, #0x0                   	// #0
   10bec:	9400011d 	bl	11060 <__libc_start_main@plt>
   10bf0:	94000118 	bl	11050 <abort@plt>

0000000000010bf4 <call_weak_fn>:
   10bf4:	b0000080 	adrp	x0, 21000 <puts@plt+0xfee0>
   10bf8:	f9419000 	ldr	x0, [x0, #800]
   10bfc:	b4000040 	cbz	x0, 10c04 <call_weak_fn+0x10>
   10c00:	1400011c 	b	11070 <__gmon_start__@plt>
   10c04:	d65f03c0 	ret
	...

0000000000010c10 <deregister_tm_clones>:
   10c10:	d503201f 	nop
   10c14:	10103a20 	adr	x0, 31358 <__TMC_END__>
   10c18:	d503201f 	nop
   10c1c:	101039e1 	adr	x1, 31358 <__TMC_END__>
   10c20:	eb00003f 	cmp	x1, x0
   10c24:	540000c0 	b.eq	10c3c <deregister_tm_clones+0x2c>  // b.none
   10c28:	b0000081 	adrp	x1, 21000 <puts@plt+0xfee0>
   10c2c:	f9419421 	ldr	x1, [x1, #808]
   10c30:	b4000061 	cbz	x1, 10c3c <deregister_tm_clones+0x2c>
   10c34:	aa0103f0 	mov	x16, x1
   10c38:	d61f0200 	br	x16
   10c3c:	d65f03c0 	ret

0000000000010c40 <register_tm_clones>:
   10c40:	d503201f 	nop
   10c44:	101038a0 	adr	x0, 31358 <__TMC_END__>
   10c48:	d503201f 	nop
   10c4c:	10103861 	adr	x1, 31358 <__TMC_END__>
   10c50:	cb000021 	sub	x1, x1, x0
   10c54:	d37ffc22 	lsr	x2, x1, #63
   10c58:	8b810c41 	add	x1, x2, x1, asr #3
   10c5c:	9341fc21 	asr	x1, x1, #1
   10c60:	b40000c1 	cbz	x1, 10c78 <register_tm_clones+0x38>
   10c64:	b0000082 	adrp	x2, 21000 <puts@plt+0xfee0>
   10c68:	f9419842 	ldr	x2, [x2, #816]
   10c6c:	b4000062 	cbz	x2, 10c78 <register_tm_clones+0x38>
   10c70:	aa0203f0 	mov	x16, x2
   10c74:	d61f0200 	br	x16
   10c78:	d65f03c0 	ret
   10c7c:	d503201f 	nop

0000000000010c80 <__do_global_dtors_aux>:
   10c80:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   10c84:	910003fd 	mov	x29, sp
   10c88:	f9000bf3 	str	x19, [sp, #16]
   10c8c:	b0000113 	adrp	x19, 31000 <_DYNAMIC+0xfeb8>
   10c90:	394f8260 	ldrb	w0, [x19, #992]
   10c94:	35000140 	cbnz	w0, 10cbc <__do_global_dtors_aux+0x3c>
   10c98:	b0000080 	adrp	x0, 21000 <puts@plt+0xfee0>
   10c9c:	f9419c00 	ldr	x0, [x0, #824]
   10ca0:	b4000080 	cbz	x0, 10cb0 <__do_global_dtors_aux+0x30>
   10ca4:	b0000100 	adrp	x0, 31000 <_DYNAMIC+0xfeb8>
   10ca8:	f941a800 	ldr	x0, [x0, #848]
   10cac:	940000f5 	bl	11080 <__cxa_finalize@plt>
   10cb0:	97ffffd8 	bl	10c10 <deregister_tm_clones>
   10cb4:	52800020 	mov	w0, #0x1                   	// #1
   10cb8:	390f8260 	strb	w0, [x19, #992]
   10cbc:	f9400bf3 	ldr	x19, [sp, #16]
   10cc0:	a8c27bfd 	ldp	x29, x30, [sp], #32
   10cc4:	d65f03c0 	ret
   10cc8:	d503201f 	nop
   10ccc:	d503201f 	nop

0000000000010cd0 <frame_dummy>:
   10cd0:	17ffffdc 	b	10c40 <register_tm_clones>

0000000000010cd4 <_GLOBAL__sub_I_bench.cpp>:
   10cd4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   10cd8:	f9000bf3 	str	x19, [sp, #16]
   10cdc:	910003fd 	mov	x29, sp
   10ce0:	d503201f 	nop
   10ce4:	301037f3 	adr	x19, 313e1 <_ZStL8__ioinit>
   10ce8:	aa1303e0 	mov	x0, x19
   10cec:	940000e9 	bl	11090 <_ZNSt8ios_base4InitC1Ev@plt>
   10cf0:	b0000080 	adrp	x0, 21000 <puts@plt+0xfee0>
   10cf4:	aa1303e1 	mov	x1, x19
   10cf8:	d503201f 	nop
   10cfc:	101032a2 	adr	x2, 31350 <__dso_handle>
   10d00:	f941a000 	ldr	x0, [x0, #832]
   10d04:	f9400bf3 	ldr	x19, [sp, #16]
   10d08:	a8c27bfd 	ldp	x29, x30, [sp], #32
   10d0c:	140000e5 	b	110a0 <__cxa_atexit@plt>

0000000000010d10 <main>:
   10d10:	6db63bef 	stp	d15, d14, [sp, #-160]!
   10d14:	6d0133ed 	stp	d13, d12, [sp, #16]
   10d18:	6d022beb 	stp	d11, d10, [sp, #32]
   10d1c:	6d0323e9 	stp	d9, d8, [sp, #48]
   10d20:	a9047bfd 	stp	x29, x30, [sp, #64]
   10d24:	910103fd 	add	x29, sp, #0x40
   10d28:	f9002bfb 	str	x27, [sp, #80]
   10d2c:	a90667fa 	stp	x26, x25, [sp, #96]
   10d30:	a9075ff8 	stp	x24, x23, [sp, #112]
   10d34:	a90857f6 	stp	x22, x21, [sp, #128]
   10d38:	a9094ff4 	stp	x20, x19, [sp, #144]
   10d3c:	5291ad14 	mov	w20, #0x8d68                	// #36200
   10d40:	72a00b74 	movk	w20, #0x5b, lsl #16
   10d44:	91006280 	add	x0, x20, #0x18
   10d48:	940000ee 	bl	11100 <_Znwm@plt>
   10d4c:	9156e009 	add	x9, x0, #0x5b8, lsl #12
   10d50:	aa0003f3 	mov	x19, x0
   10d54:	aa1f03e8 	mov	x8, xzr
   10d58:	91360137 	add	x23, x9, #0xd80
   10d5c:	a900fc1f 	stp	xzr, xzr, [x0, #8]
   10d60:	f900001f 	str	xzr, [x0]
   10d64:	8b080269 	add	x9, x19, x8
   10d68:	3dc00260 	ldr	q0, [x19]
   10d6c:	f9400a6a 	ldr	x10, [x19, #16]
   10d70:	91006108 	add	x8, x8, #0x18
   10d74:	eb08029f 	cmp	x20, x8
   10d78:	3c818120 	stur	q0, [x9, #24]
   10d7c:	f900152a 	str	x10, [x9, #40]
   10d80:	54ffff21 	b.ne	10d64 <main+0x54>  // b.any
   10d84:	90ffff88 	adrp	x8, 0 <__abi_tag-0x2c4>
   10d88:	90ffff89 	adrp	x9, 0 <__abi_tag-0x2c4>
   10d8c:	d2d08f16 	mov	x22, #0x847800000000        	// #145650930941952
   10d90:	529a1218 	mov	w24, #0xd090                	// #53392
   10d94:	aa1f03f4 	mov	x20, xzr
   10d98:	91004275 	add	x21, x19, #0x10
   10d9c:	f2f821d6 	movk	x22, #0xc10e, lsl #48
   10da0:	fd44b10a 	ldr	d10, [x8, #2400]
   10da4:	1e6e100b 	fmov	d11, #1.000000000000000000e+00
   10da8:	fd44b92c 	ldr	d12, [x9, #2416]
   10dac:	1e60100d 	fmov	d13, #2.000000000000000000e+00
   10db0:	72a00078 	movk	w24, #0x3, lsl #16
   10db4:	1e620289 	scvtf	d9, w20
   10db8:	9e6702c0 	fmov	d0, x22
   10dbc:	1e601920 	fdiv	d0, d9, d0
   10dc0:	1f4d2c0e 	fmadd	d14, d0, d13, d11
   10dc4:	1f4eadc0 	fmsub	d0, d14, d14, d11
   10dc8:	1e61c008 	fsqrt	d8, d0
   10dcc:	1e682100 	fcmp	d8, d8
   10dd0:	540001e6 	b.vs	10e0c <main+0xfc>
   10dd4:	1e6a0920 	fmul	d0, d9, d10
   10dd8:	1e6c0809 	fmul	d9, d0, d12
   10ddc:	1e604120 	fmov	d0, d9
   10de0:	940000b4 	bl	110b0 <cos@plt>
   10de4:	1e60090f 	fmul	d15, d8, d0
   10de8:	1e604120 	fmov	d0, d9
   10dec:	940000b5 	bl	110c0 <sin@plt>
   10df0:	1e600900 	fmul	d0, d8, d0
   10df4:	91000694 	add	x20, x20, #0x1
   10df8:	eb18029f 	cmp	x20, x24
   10dfc:	6d3f3aaf 	stp	d15, d14, [x21, #-16]
   10e00:	fc0186a0 	str	d0, [x21], #24
   10e04:	54fffd81 	b.ne	10db4 <main+0xa4>  // b.any
   10e08:	14000004 	b	10e18 <main+0x108>
   10e0c:	940000b1 	bl	110d0 <sqrt@plt>
   10e10:	1e604008 	fmov	d8, d0
   10e14:	17fffff0 	b	10dd4 <main+0xc4>
   10e18:	90ffff80 	adrp	x0, 0 <__abi_tag-0x2c4>
   10e1c:	91277400 	add	x0, x0, #0x9dd
   10e20:	940000c0 	bl	11120 <puts@plt>
   10e24:	2f00e408 	movi	d8, #0x0
   10e28:	940000b2 	bl	110f0 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
   10e2c:	90ffff88 	adrp	x8, 0 <__abi_tag-0x2c4>
   10e30:	d2c80018 	mov	x24, #0x400000000000        	// #70368744177664
   10e34:	529999b9 	mov	w25, #0xcccd                	// #52429
   10e38:	2f00e40c 	movi	d12, #0x0
   10e3c:	529999ba 	mov	w26, #0xcccd                	// #52429
   10e40:	90ffff96 	adrp	x22, 0 <__abi_tag-0x2c4>
   10e44:	aa0003f4 	mov	x20, x0
   10e48:	2a1f03f5 	mov	w21, wzr
   10e4c:	1e62900b 	fmov	d11, #5.000000000000000000e+00
   10e50:	f2e811f8 	movk	x24, #0x408f, lsl #48
   10e54:	72b99999 	movk	w25, #0xcccc, lsl #16
   10e58:	fd44b50d 	ldr	d13, [x8, #2408]
   10e5c:	72a1999a 	movk	w26, #0xccc, lsl #16
   10e60:	1e6e100e 	fmov	d14, #1.000000000000000000e+00
   10e64:	9126a6d6 	add	x22, x22, #0x9a9
   10e68:	14000005 	b	10e7c <main+0x16c>
   10e6c:	1e6e298c 	fadd	d12, d12, d14
   10e70:	110006b5 	add	w21, w21, #0x1
   10e74:	710192bf 	cmp	w21, #0x64
   10e78:	54000760 	b.eq	10f64 <main+0x254>  // b.none
   10e7c:	1e6d0989 	fmul	d9, d12, d13
   10e80:	aa1303fb 	mov	x27, x19
   10e84:	1e604120 	fmov	d0, d9
   10e88:	9400008a 	bl	110b0 <cos@plt>
   10e8c:	1e60400a 	fmov	d10, d0
   10e90:	1e604120 	fmov	d0, d9
   10e94:	9400008b 	bl	110c0 <sin@plt>
   10e98:	6d408764 	ldp	d4, d1, [x27, #8]
   10e9c:	9e670306 	fmov	d6, x24
   10ea0:	fc418763 	ldr	d3, [x27], #24
   10ea4:	eb17037f 	cmp	x27, x23
   10ea8:	1e610942 	fmul	d2, d10, d1
   10eac:	1e610801 	fmul	d1, d0, d1
   10eb0:	1f408865 	fmsub	d5, d3, d0, d2
   10eb4:	1f4a0461 	fmadd	d1, d3, d10, d1
   10eb8:	1e650945 	fmul	d5, d10, d5
   10ebc:	1f401485 	fmadd	d5, d4, d0, d5
   10ec0:	1e6b28a5 	fadd	d5, d5, d11
   10ec4:	1e6518c5 	fdiv	d5, d6, d5
   10ec8:	1e614066 	fneg	d6, d3
   10ecc:	1f6008c2 	fnmadd	d2, d6, d0, d2
   10ed0:	1e620800 	fmul	d0, d0, d2
   10ed4:	1f4a0080 	fmadd	d0, d4, d10, d0
   10ed8:	1e650821 	fmul	d1, d1, d5
   10edc:	1e650800 	fmul	d0, d0, d5
   10ee0:	1e602820 	fadd	d0, d1, d0
   10ee4:	1e602908 	fadd	d8, d8, d0
   10ee8:	54fffce1 	b.ne	10e84 <main+0x174>  // b.any
   10eec:	1b197ea8 	mul	w8, w21, w25
   10ef0:	13880908 	ror	w8, w8, #2
   10ef4:	6b1a011f 	cmp	w8, w26
   10ef8:	54fffba2 	b.cs	10e6c <main+0x15c>  // b.hs, b.nlast
   10efc:	1e604120 	fmov	d0, d9
   10f00:	9400006c 	bl	110b0 <cos@plt>
   10f04:	1e60400a 	fmov	d10, d0
   10f08:	1e604120 	fmov	d0, d9
   10f0c:	9400006d 	bl	110c0 <sin@plt>
   10f10:	6d408664 	ldp	d4, d1, [x19, #8]
   10f14:	9e670306 	fmov	d6, x24
   10f18:	aa1603e0 	mov	x0, x22
   10f1c:	fd400263 	ldr	d3, [x19]
   10f20:	2a1503e1 	mov	w1, w21
   10f24:	1e610942 	fmul	d2, d10, d1
   10f28:	1e610801 	fmul	d1, d0, d1
   10f2c:	1f408865 	fmsub	d5, d3, d0, d2
   10f30:	1f4a0461 	fmadd	d1, d3, d10, d1
   10f34:	1e650945 	fmul	d5, d10, d5
   10f38:	1f401485 	fmadd	d5, d4, d0, d5
   10f3c:	1e6b28a5 	fadd	d5, d5, d11
   10f40:	1e6518c5 	fdiv	d5, d6, d5
   10f44:	1e614066 	fneg	d6, d3
   10f48:	1f6008c2 	fnmadd	d2, d6, d0, d2
   10f4c:	1e620800 	fmul	d0, d0, d2
   10f50:	1f4a0082 	fmadd	d2, d4, d10, d0
   10f54:	1e650820 	fmul	d0, d1, d5
   10f58:	1e650841 	fmul	d1, d2, d5
   10f5c:	94000061 	bl	110e0 <printf@plt>
   10f60:	17ffffc3 	b	10e6c <main+0x15c>
   10f64:	94000063 	bl	110f0 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
   10f68:	cb140008 	sub	x8, x0, x20
   10f6c:	d2d09009 	mov	x9, #0x848000000000        	// #145685290680320
   10f70:	f2e825c9 	movk	x9, #0x412e, lsl #48
   10f74:	90ffff80 	adrp	x0, 0 <__abi_tag-0x2c4>
   10f78:	9125e000 	add	x0, x0, #0x978
   10f7c:	9e620100 	scvtf	d0, x8
   10f80:	9e670121 	fmov	d1, x9
   10f84:	1e611809 	fdiv	d9, d0, d1
   10f88:	94000066 	bl	11120 <puts@plt>
   10f8c:	d2c80008 	mov	x8, #0x400000000000        	// #70368744177664
   10f90:	90ffff80 	adrp	x0, 0 <__abi_tag-0x2c4>
   10f94:	f2e811e8 	movk	x8, #0x408f, lsl #48
   10f98:	1e604102 	fmov	d2, d8
   10f9c:	91281400 	add	x0, x0, #0xa05
   10fa0:	9e670100 	fmov	d0, x8
   10fa4:	d2daf088 	mov	x8, #0xd78400000000        	// #236961935654912
   10fa8:	f2e82ee8 	movk	x8, #0x4177, lsl #48
   10fac:	1e601920 	fdiv	d0, d9, d0
   10fb0:	9e670101 	fmov	d1, x8
   10fb4:	1e601821 	fdiv	d1, d1, d0
   10fb8:	1e604120 	fmov	d0, d9
   10fbc:	94000049 	bl	110e0 <printf@plt>
   10fc0:	aa1303e0 	mov	x0, x19
   10fc4:	94000053 	bl	11110 <_ZdlPv@plt>
   10fc8:	a9494ff4 	ldp	x20, x19, [sp, #144]
   10fcc:	2a1f03e0 	mov	w0, wzr
   10fd0:	a94857f6 	ldp	x22, x21, [sp, #128]
   10fd4:	a9475ff8 	ldp	x24, x23, [sp, #112]
   10fd8:	a94667fa 	ldp	x26, x25, [sp, #96]
   10fdc:	a9447bfd 	ldp	x29, x30, [sp, #64]
   10fe0:	6d4323e9 	ldp	d9, d8, [sp, #48]
   10fe4:	6d422beb 	ldp	d11, d10, [sp, #32]
   10fe8:	6d4133ed 	ldp	d13, d12, [sp, #16]
   10fec:	f9402bfb 	ldr	x27, [sp, #80]
   10ff0:	6cca3bef 	ldp	d15, d14, [sp], #160
   10ff4:	d65f03c0 	ret

Disassembly of section .init:

0000000000010ff8 <_init>:
   10ff8:	d503201f 	nop
   10ffc:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   11000:	910003fd 	mov	x29, sp
   11004:	97fffefc 	bl	10bf4 <call_weak_fn>
   11008:	a8c17bfd 	ldp	x29, x30, [sp], #16
   1100c:	d65f03c0 	ret

Disassembly of section .fini:

0000000000011010 <_fini>:
   11010:	d503201f 	nop
   11014:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   11018:	910003fd 	mov	x29, sp
   1101c:	a8c17bfd 	ldp	x29, x30, [sp], #16
   11020:	d65f03c0 	ret

Disassembly of section .plt:

0000000000011030 <abort@plt-0x20>:
   11030:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
   11034:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfeb8>
   11038:	f941b611 	ldr	x17, [x16, #872]
   1103c:	910da210 	add	x16, x16, #0x368
   11040:	d61f0220 	br	x17
   11044:	d503201f 	nop
   11048:	d503201f 	nop
   1104c:	d503201f 	nop

0000000000011050 <abort@plt>:
   11050:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfeb8>
   11054:	f941ba11 	ldr	x17, [x16, #880]
   11058:	910dc210 	add	x16, x16, #0x370
   1105c:	d61f0220 	br	x17

0000000000011060 <__libc_start_main@plt>:
   11060:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfeb8>
   11064:	f941be11 	ldr	x17, [x16, #888]
   11068:	910de210 	add	x16, x16, #0x378
   1106c:	d61f0220 	br	x17

0000000000011070 <__gmon_start__@plt>:
   11070:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfeb8>
   11074:	f941c211 	ldr	x17, [x16, #896]
   11078:	910e0210 	add	x16, x16, #0x380
   1107c:	d61f0220 	br	x17

0000000000011080 <__cxa_finalize@plt>:
   11080:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfeb8>
   11084:	f941c611 	ldr	x17, [x16, #904]
   11088:	910e2210 	add	x16, x16, #0x388
   1108c:	d61f0220 	br	x17

0000000000011090 <_ZNSt8ios_base4InitC1Ev@plt>:
   11090:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfeb8>
   11094:	f941ca11 	ldr	x17, [x16, #912]
   11098:	910e4210 	add	x16, x16, #0x390
   1109c:	d61f0220 	br	x17

00000000000110a0 <__cxa_atexit@plt>:
   110a0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfeb8>
   110a4:	f941ce11 	ldr	x17, [x16, #920]
   110a8:	910e6210 	add	x16, x16, #0x398
   110ac:	d61f0220 	br	x17

00000000000110b0 <cos@plt>:
   110b0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfeb8>
   110b4:	f941d211 	ldr	x17, [x16, #928]
   110b8:	910e8210 	add	x16, x16, #0x3a0
   110bc:	d61f0220 	br	x17

00000000000110c0 <sin@plt>:
   110c0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfeb8>
   110c4:	f941d611 	ldr	x17, [x16, #936]
   110c8:	910ea210 	add	x16, x16, #0x3a8
   110cc:	d61f0220 	br	x17

00000000000110d0 <sqrt@plt>:
   110d0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfeb8>
   110d4:	f941da11 	ldr	x17, [x16, #944]
   110d8:	910ec210 	add	x16, x16, #0x3b0
   110dc:	d61f0220 	br	x17

00000000000110e0 <printf@plt>:
   110e0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfeb8>
   110e4:	f941de11 	ldr	x17, [x16, #952]
   110e8:	910ee210 	add	x16, x16, #0x3b8
   110ec:	d61f0220 	br	x17

00000000000110f0 <_ZNSt6chrono3_V212system_clock3nowEv@plt>:
   110f0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfeb8>
   110f4:	f941e211 	ldr	x17, [x16, #960]
   110f8:	910f0210 	add	x16, x16, #0x3c0
   110fc:	d61f0220 	br	x17

0000000000011100 <_Znwm@plt>:
   11100:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfeb8>
   11104:	f941e611 	ldr	x17, [x16, #968]
   11108:	910f2210 	add	x16, x16, #0x3c8
   1110c:	d61f0220 	br	x17

0000000000011110 <_ZdlPv@plt>:
   11110:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfeb8>
   11114:	f941ea11 	ldr	x17, [x16, #976]
   11118:	910f4210 	add	x16, x16, #0x3d0
   1111c:	d61f0220 	br	x17

0000000000011120 <puts@plt>:
   11120:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfeb8>
   11124:	f941ee11 	ldr	x17, [x16, #984]
   11128:	910f6210 	add	x16, x16, #0x3d8
   1112c:	d61f0220 	br	x17
