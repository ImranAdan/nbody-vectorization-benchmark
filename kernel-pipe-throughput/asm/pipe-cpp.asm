
/bench/bench:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000010cc0 <_start>:
   10cc0:	d503201f 	nop
   10cc4:	d280001d 	mov	x29, #0x0                   	// #0
   10cc8:	d280001e 	mov	x30, #0x0                   	// #0
   10ccc:	aa0003e5 	mov	x5, x0
   10cd0:	f94003e1 	ldr	x1, [sp]
   10cd4:	910023e2 	add	x2, sp, #0x8
   10cd8:	910003e6 	mov	x6, sp
   10cdc:	d503201f 	nop
   10ce0:	10000980 	adr	x0, 10e10 <main>
   10ce4:	d2800003 	mov	x3, #0x0                   	// #0
   10ce8:	d2800004 	mov	x4, #0x0                   	// #0
   10cec:	94000121 	bl	11170 <__libc_start_main@plt>
   10cf0:	9400011c 	bl	11160 <abort@plt>

0000000000010cf4 <call_weak_fn>:
   10cf4:	b0000080 	adrp	x0, 21000 <memset@plt+0xfd80>
   10cf8:	f9424000 	ldr	x0, [x0, #1152]
   10cfc:	b4000040 	cbz	x0, 10d04 <call_weak_fn+0x10>
   10d00:	14000120 	b	11180 <__gmon_start__@plt>
   10d04:	d65f03c0 	ret
	...

0000000000010d10 <deregister_tm_clones>:
   10d10:	d503201f 	nop
   10d14:	10103d60 	adr	x0, 314c0 <__TMC_END__>
   10d18:	d503201f 	nop
   10d1c:	10103d21 	adr	x1, 314c0 <__TMC_END__>
   10d20:	eb00003f 	cmp	x1, x0
   10d24:	540000c0 	b.eq	10d3c <deregister_tm_clones+0x2c>  // b.none
   10d28:	b0000081 	adrp	x1, 21000 <memset@plt+0xfd80>
   10d2c:	f9424421 	ldr	x1, [x1, #1160]
   10d30:	b4000061 	cbz	x1, 10d3c <deregister_tm_clones+0x2c>
   10d34:	aa0103f0 	mov	x16, x1
   10d38:	d61f0200 	br	x16
   10d3c:	d65f03c0 	ret

0000000000010d40 <register_tm_clones>:
   10d40:	d503201f 	nop
   10d44:	10103be0 	adr	x0, 314c0 <__TMC_END__>
   10d48:	d503201f 	nop
   10d4c:	10103ba1 	adr	x1, 314c0 <__TMC_END__>
   10d50:	cb000021 	sub	x1, x1, x0
   10d54:	d37ffc22 	lsr	x2, x1, #63
   10d58:	8b810c41 	add	x1, x2, x1, asr #3
   10d5c:	9341fc21 	asr	x1, x1, #1
   10d60:	b40000c1 	cbz	x1, 10d78 <register_tm_clones+0x38>
   10d64:	b0000082 	adrp	x2, 21000 <memset@plt+0xfd80>
   10d68:	f9424842 	ldr	x2, [x2, #1168]
   10d6c:	b4000062 	cbz	x2, 10d78 <register_tm_clones+0x38>
   10d70:	aa0203f0 	mov	x16, x2
   10d74:	d61f0200 	br	x16
   10d78:	d65f03c0 	ret
   10d7c:	d503201f 	nop

0000000000010d80 <__do_global_dtors_aux>:
   10d80:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   10d84:	910003fd 	mov	x29, sp
   10d88:	f9000bf3 	str	x19, [sp, #16]
   10d8c:	b0000113 	adrp	x19, 31000 <_DYNAMIC+0xfd58>
   10d90:	3955c260 	ldrb	w0, [x19, #1392]
   10d94:	35000140 	cbnz	w0, 10dbc <__do_global_dtors_aux+0x3c>
   10d98:	b0000080 	adrp	x0, 21000 <memset@plt+0xfd80>
   10d9c:	f9424c00 	ldr	x0, [x0, #1176]
   10da0:	b4000080 	cbz	x0, 10db0 <__do_global_dtors_aux+0x30>
   10da4:	b0000100 	adrp	x0, 31000 <_DYNAMIC+0xfd58>
   10da8:	f9425800 	ldr	x0, [x0, #1200]
   10dac:	940000f9 	bl	11190 <__cxa_finalize@plt>
   10db0:	97ffffd8 	bl	10d10 <deregister_tm_clones>
   10db4:	52800020 	mov	w0, #0x1                   	// #1
   10db8:	3915c260 	strb	w0, [x19, #1392]
   10dbc:	f9400bf3 	ldr	x19, [sp, #16]
   10dc0:	a8c27bfd 	ldp	x29, x30, [sp], #32
   10dc4:	d65f03c0 	ret
   10dc8:	d503201f 	nop
   10dcc:	d503201f 	nop

0000000000010dd0 <frame_dummy>:
   10dd0:	17ffffdc 	b	10d40 <register_tm_clones>

0000000000010dd4 <_GLOBAL__sub_I_bench.cpp>:
   10dd4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   10dd8:	f9000bf3 	str	x19, [sp, #16]
   10ddc:	910003fd 	mov	x29, sp
   10de0:	d503201f 	nop
   10de4:	30103c73 	adr	x19, 31571 <_ZStL8__ioinit>
   10de8:	aa1303e0 	mov	x0, x19
   10dec:	940000ed 	bl	111a0 <_ZNSt8ios_base4InitC1Ev@plt>
   10df0:	b0000080 	adrp	x0, 21000 <memset@plt+0xfd80>
   10df4:	aa1303e1 	mov	x1, x19
   10df8:	d503201f 	nop
   10dfc:	101035a2 	adr	x2, 314b0 <__dso_handle>
   10e00:	f9425000 	ldr	x0, [x0, #1184]
   10e04:	f9400bf3 	ldr	x19, [sp, #16]
   10e08:	a8c27bfd 	ldp	x29, x30, [sp], #32
   10e0c:	140000e9 	b	111b0 <__cxa_atexit@plt>

0000000000010e10 <main>:
   10e10:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
   10e14:	f9000bf7 	str	x23, [sp, #16]
   10e18:	910003fd 	mov	x29, sp
   10e1c:	a90257f6 	stp	x22, x21, [sp, #32]
   10e20:	a9034ff4 	stp	x20, x19, [sp, #48]
   10e24:	910063a0 	add	x0, x29, #0x18
   10e28:	940000e6 	bl	111c0 <pipe@plt>
   10e2c:	3100041f 	cmn	w0, #0x1
   10e30:	54000820 	b.eq	10f34 <main+0x124>  // b.none
   10e34:	d2b00015 	mov	x21, #0x80000000            	// #2147483648
   10e38:	f2c00055 	movk	x21, #0x2, lsl #32
   10e3c:	940000e5 	bl	111d0 <fork@plt>
   10e40:	34000860 	cbz	w0, 10f4c <main+0x13c>
   10e44:	b9401ba0 	ldr	w0, [x29, #24]
   10e48:	940000e6 	bl	111e0 <close@plt>
   10e4c:	52a00020 	mov	w0, #0x10000               	// #65536
   10e50:	94000100 	bl	11250 <_Znwm@plt>
   10e54:	2a1f03e1 	mov	w1, wzr
   10e58:	52a00022 	mov	w2, #0x10000               	// #65536
   10e5c:	aa0003f3 	mov	x19, x0
   10e60:	94000108 	bl	11280 <memset@plt>
   10e64:	90ffff89 	adrp	x9, 0 <__abi_tag-0x2c4>
   10e68:	aa1f03e8 	mov	x8, xzr
   10e6c:	4f00e600 	movi	v0.16b, #0x10
   10e70:	4f01e401 	movi	v1.16b, #0x20
   10e74:	3dc2ad22 	ldr	q2, [x9, #2736]
   10e78:	4e208443 	add	v3.16b, v2.16b, v0.16b
   10e7c:	8b080269 	add	x9, x19, x8
   10e80:	91008108 	add	x8, x8, #0x20
   10e84:	f140411f 	cmp	x8, #0x10, lsl #12
   10e88:	ad000d22 	stp	q2, q3, [x9]
   10e8c:	4e218442 	add	v2.16b, v2.16b, v1.16b
   10e90:	54ffff41 	b.ne	10e78 <main+0x68>  // b.any
   10e94:	940000e3 	bl	11220 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
   10e98:	aa0003f4 	mov	x20, x0
   10e9c:	aa1f03f6 	mov	x22, xzr
   10ea0:	eb1502df 	cmp	x22, x21
   10ea4:	54000102 	b.cs	10ec4 <main+0xb4>  // b.hs, b.nlast
   10ea8:	b9401fa0 	ldr	w0, [x29, #28]
   10eac:	aa1303e1 	mov	x1, x19
   10eb0:	52a00022 	mov	w2, #0x10000               	// #65536
   10eb4:	940000df 	bl	11230 <write@plt>
   10eb8:	8b160016 	add	x22, x0, x22
   10ebc:	f100041f 	cmp	x0, #0x1
   10ec0:	54ffff0a 	b.ge	10ea0 <main+0x90>  // b.tcont
   10ec4:	940000d7 	bl	11220 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
   10ec8:	cb140008 	sub	x8, x0, x20
   10ecc:	d2d09009 	mov	x9, #0x848000000000        	// #145685290680320
   10ed0:	f2e825c9 	movk	x9, #0x412e, lsl #48
   10ed4:	1e649002 	fmov	d2, #1.000000000000000000e+01
   10ed8:	90ffff80 	adrp	x0, 0 <__abi_tag-0x2c4>
   10edc:	9e620100 	scvtf	d0, x8
   10ee0:	d2c80008 	mov	x8, #0x400000000000        	// #70368744177664
   10ee4:	9e670121 	fmov	d1, x9
   10ee8:	f2e811e8 	movk	x8, #0x408f, lsl #48
   10eec:	912b0000 	add	x0, x0, #0xac0
   10ef0:	1e611800 	fdiv	d0, d0, d1
   10ef4:	9e670101 	fmov	d1, x8
   10ef8:	1e611801 	fdiv	d1, d0, d1
   10efc:	1e611841 	fdiv	d1, d2, d1
   10f00:	940000c0 	bl	11200 <printf@plt>
   10f04:	b9401fa0 	ldr	w0, [x29, #28]
   10f08:	940000b6 	bl	111e0 <close@plt>
   10f0c:	aa1f03e0 	mov	x0, xzr
   10f10:	940000cc 	bl	11240 <wait@plt>
   10f14:	aa1303e0 	mov	x0, x19
   10f18:	940000d2 	bl	11260 <_ZdlPv@plt>
   10f1c:	2a1f03e0 	mov	w0, wzr
   10f20:	a9434ff4 	ldp	x20, x19, [sp, #48]
   10f24:	a94257f6 	ldp	x22, x21, [sp, #32]
   10f28:	f9400bf7 	ldr	x23, [sp, #16]
   10f2c:	a8c47bfd 	ldp	x29, x30, [sp], #64
   10f30:	d65f03c0 	ret
   10f34:	52800020 	mov	w0, #0x1                   	// #1
   10f38:	a9434ff4 	ldp	x20, x19, [sp, #48]
   10f3c:	a94257f6 	ldp	x22, x21, [sp, #32]
   10f40:	f9400bf7 	ldr	x23, [sp, #16]
   10f44:	a8c47bfd 	ldp	x29, x30, [sp], #64
   10f48:	d65f03c0 	ret
   10f4c:	b9401fa0 	ldr	w0, [x29, #28]
   10f50:	940000a4 	bl	111e0 <close@plt>
   10f54:	52a00020 	mov	w0, #0x10000               	// #65536
   10f58:	940000be 	bl	11250 <_Znwm@plt>
   10f5c:	2a1f03e1 	mov	w1, wzr
   10f60:	52a00022 	mov	w2, #0x10000               	// #65536
   10f64:	aa0003f3 	mov	x19, x0
   10f68:	940000c6 	bl	11280 <memset@plt>
   10f6c:	2a1f03f7 	mov	w23, wzr
   10f70:	aa1f03f4 	mov	x20, xzr
   10f74:	91004276 	add	x22, x19, #0x10
   10f78:	14000004 	b	10f88 <main+0x178>
   10f7c:	8b140114 	add	x20, x8, x20
   10f80:	eb15029f 	cmp	x20, x21
   10f84:	54000a82 	b.cs	110d4 <main+0x2c4>  // b.hs, b.nlast
   10f88:	b9401ba0 	ldr	w0, [x29, #24]
   10f8c:	aa1303e1 	mov	x1, x19
   10f90:	52a00022 	mov	w2, #0x10000               	// #65536
   10f94:	94000097 	bl	111f0 <read@plt>
   10f98:	aa0003e8 	mov	x8, x0
   10f9c:	f100041f 	cmp	x0, #0x1
   10fa0:	540009ab 	b.lt	110d4 <main+0x2c4>  // b.tstop
   10fa4:	f1001d1f 	cmp	x8, #0x7
   10fa8:	54000068 	b.hi	10fb4 <main+0x1a4>  // b.pmore
   10fac:	aa1f03e9 	mov	x9, xzr
   10fb0:	14000042 	b	110b8 <main+0x2a8>
   10fb4:	f100811f 	cmp	x8, #0x20
   10fb8:	54000062 	b.cs	10fc4 <main+0x1b4>  // b.hs, b.nlast
   10fbc:	aa1f03e9 	mov	x9, xzr
   10fc0:	14000023 	b	1104c <main+0x23c>
   10fc4:	6f00e400 	movi	v0.2d, #0x0
   10fc8:	927be909 	and	x9, x8, #0xffffffffffffffe0
   10fcc:	6f00e401 	movi	v1.2d, #0x0
   10fd0:	aa1603ea 	mov	x10, x22
   10fd4:	aa0903eb 	mov	x11, x9
   10fd8:	4e011ee0 	mov	v0.b[0], w23
   10fdc:	ad7f8d42 	ldp	q2, q3, [x10, #-16]
   10fe0:	f100816b 	subs	x11, x11, #0x20
   10fe4:	9100814a 	add	x10, x10, #0x20
   10fe8:	6e201c40 	eor	v0.16b, v2.16b, v0.16b
   10fec:	6e211c61 	eor	v1.16b, v3.16b, v1.16b
   10ff0:	54ffff61 	b.ne	10fdc <main+0x1cc>  // b.any
   10ff4:	6e201c20 	eor	v0.16b, v1.16b, v0.16b
   10ff8:	eb09011f 	cmp	x8, x9
   10ffc:	6e004001 	ext	v1.16b, v0.16b, v0.16b, #8
   11000:	2e211c00 	eor	v0.8b, v0.8b, v1.8b
   11004:	0e033c0a 	umov	w10, v0.b[1]
   11008:	0e013c0b 	umov	w11, v0.b[0]
   1100c:	0e053c0c 	umov	w12, v0.b[2]
   11010:	0e073c0d 	umov	w13, v0.b[3]
   11014:	0e093c0e 	umov	w14, v0.b[4]
   11018:	4a0a016a 	eor	w10, w11, w10
   1101c:	0e0b3c0b 	umov	w11, v0.b[5]
   11020:	4a0c014a 	eor	w10, w10, w12
   11024:	0e0d3c0c 	umov	w12, v0.b[6]
   11028:	4a0d014a 	eor	w10, w10, w13
   1102c:	0e0f3c0d 	umov	w13, v0.b[7]
   11030:	4a0e014a 	eor	w10, w10, w14
   11034:	4a0b014a 	eor	w10, w10, w11
   11038:	4a0c014a 	eor	w10, w10, w12
   1103c:	4a0d0157 	eor	w23, w10, w13
   11040:	54fff9e0 	b.eq	10f7c <main+0x16c>  // b.none
   11044:	f27d051f 	tst	x8, #0x18
   11048:	54000380 	b.eq	110b8 <main+0x2a8>  // b.none
   1104c:	2f00e400 	movi	d0, #0x0
   11050:	aa0903eb 	mov	x11, x9
   11054:	927df109 	and	x9, x8, #0xfffffffffffffff8
   11058:	cb09016a 	sub	x10, x11, x9
   1105c:	8b0b026b 	add	x11, x19, x11
   11060:	4e011ee0 	mov	v0.b[0], w23
   11064:	fc408561 	ldr	d1, [x11], #8
   11068:	b100214a 	adds	x10, x10, #0x8
   1106c:	2e201c20 	eor	v0.8b, v1.8b, v0.8b
   11070:	54ffffa1 	b.ne	11064 <main+0x254>  // b.any
   11074:	0e033c0a 	umov	w10, v0.b[1]
   11078:	0e013c0b 	umov	w11, v0.b[0]
   1107c:	0e053c0c 	umov	w12, v0.b[2]
   11080:	0e073c0d 	umov	w13, v0.b[3]
   11084:	0e093c0e 	umov	w14, v0.b[4]
   11088:	eb09011f 	cmp	x8, x9
   1108c:	4a0a016a 	eor	w10, w11, w10
   11090:	0e0b3c0b 	umov	w11, v0.b[5]
   11094:	4a0c014a 	eor	w10, w10, w12
   11098:	0e0d3c0c 	umov	w12, v0.b[6]
   1109c:	4a0d014a 	eor	w10, w10, w13
   110a0:	0e0f3c0d 	umov	w13, v0.b[7]
   110a4:	4a0e014a 	eor	w10, w10, w14
   110a8:	4a0b014a 	eor	w10, w10, w11
   110ac:	4a0c014a 	eor	w10, w10, w12
   110b0:	4a0d0157 	eor	w23, w10, w13
   110b4:	54fff640 	b.eq	10f7c <main+0x16c>  // b.none
   110b8:	cb09010a 	sub	x10, x8, x9
   110bc:	8b090269 	add	x9, x19, x9
   110c0:	3840152b 	ldrb	w11, [x9], #1
   110c4:	f100054a 	subs	x10, x10, #0x1
   110c8:	4a170177 	eor	w23, w11, w23
   110cc:	54ffffa1 	b.ne	110c0 <main+0x2b0>  // b.any
   110d0:	17ffffab 	b	10f7c <main+0x16c>
   110d4:	f0ffff60 	adrp	x0, 0 <__abi_tag-0x2c4>
   110d8:	12001ee1 	and	w1, w23, #0xff
   110dc:	912ba000 	add	x0, x0, #0xae8
   110e0:	94000048 	bl	11200 <printf@plt>
   110e4:	b9401ba0 	ldr	w0, [x29, #24]
   110e8:	9400003e 	bl	111e0 <close@plt>
   110ec:	2a1f03e0 	mov	w0, wzr
   110f0:	94000048 	bl	11210 <exit@plt>
   110f4:	14000003 	b	11100 <main+0x2f0>
   110f8:	14000002 	b	11100 <main+0x2f0>
   110fc:	14000001 	b	11100 <main+0x2f0>
   11100:	aa0003f4 	mov	x20, x0
   11104:	aa1303e0 	mov	x0, x19
   11108:	94000056 	bl	11260 <_ZdlPv@plt>
   1110c:	aa1403e0 	mov	x0, x20
   11110:	94000058 	bl	11270 <_Unwind_Resume@plt>

Disassembly of section .init:

0000000000011114 <_init>:
   11114:	d503201f 	nop
   11118:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   1111c:	910003fd 	mov	x29, sp
   11120:	97fffef5 	bl	10cf4 <call_weak_fn>
   11124:	a8c17bfd 	ldp	x29, x30, [sp], #16
   11128:	d65f03c0 	ret

Disassembly of section .fini:

000000000001112c <_fini>:
   1112c:	d503201f 	nop
   11130:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   11134:	910003fd 	mov	x29, sp
   11138:	a8c17bfd 	ldp	x29, x30, [sp], #16
   1113c:	d65f03c0 	ret

Disassembly of section .plt:

0000000000011140 <abort@plt-0x20>:
   11140:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
   11144:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfd58>
   11148:	f9426a11 	ldr	x17, [x16, #1232]
   1114c:	91134210 	add	x16, x16, #0x4d0
   11150:	d61f0220 	br	x17
   11154:	d503201f 	nop
   11158:	d503201f 	nop
   1115c:	d503201f 	nop

0000000000011160 <abort@plt>:
   11160:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfd58>
   11164:	f9426e11 	ldr	x17, [x16, #1240]
   11168:	91136210 	add	x16, x16, #0x4d8
   1116c:	d61f0220 	br	x17

0000000000011170 <__libc_start_main@plt>:
   11170:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfd58>
   11174:	f9427211 	ldr	x17, [x16, #1248]
   11178:	91138210 	add	x16, x16, #0x4e0
   1117c:	d61f0220 	br	x17

0000000000011180 <__gmon_start__@plt>:
   11180:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfd58>
   11184:	f9427611 	ldr	x17, [x16, #1256]
   11188:	9113a210 	add	x16, x16, #0x4e8
   1118c:	d61f0220 	br	x17

0000000000011190 <__cxa_finalize@plt>:
   11190:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfd58>
   11194:	f9427a11 	ldr	x17, [x16, #1264]
   11198:	9113c210 	add	x16, x16, #0x4f0
   1119c:	d61f0220 	br	x17

00000000000111a0 <_ZNSt8ios_base4InitC1Ev@plt>:
   111a0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfd58>
   111a4:	f9427e11 	ldr	x17, [x16, #1272]
   111a8:	9113e210 	add	x16, x16, #0x4f8
   111ac:	d61f0220 	br	x17

00000000000111b0 <__cxa_atexit@plt>:
   111b0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfd58>
   111b4:	f9428211 	ldr	x17, [x16, #1280]
   111b8:	91140210 	add	x16, x16, #0x500
   111bc:	d61f0220 	br	x17

00000000000111c0 <pipe@plt>:
   111c0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfd58>
   111c4:	f9428611 	ldr	x17, [x16, #1288]
   111c8:	91142210 	add	x16, x16, #0x508
   111cc:	d61f0220 	br	x17

00000000000111d0 <fork@plt>:
   111d0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfd58>
   111d4:	f9428a11 	ldr	x17, [x16, #1296]
   111d8:	91144210 	add	x16, x16, #0x510
   111dc:	d61f0220 	br	x17

00000000000111e0 <close@plt>:
   111e0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfd58>
   111e4:	f9428e11 	ldr	x17, [x16, #1304]
   111e8:	91146210 	add	x16, x16, #0x518
   111ec:	d61f0220 	br	x17

00000000000111f0 <read@plt>:
   111f0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfd58>
   111f4:	f9429211 	ldr	x17, [x16, #1312]
   111f8:	91148210 	add	x16, x16, #0x520
   111fc:	d61f0220 	br	x17

0000000000011200 <printf@plt>:
   11200:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfd58>
   11204:	f9429611 	ldr	x17, [x16, #1320]
   11208:	9114a210 	add	x16, x16, #0x528
   1120c:	d61f0220 	br	x17

0000000000011210 <exit@plt>:
   11210:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfd58>
   11214:	f9429a11 	ldr	x17, [x16, #1328]
   11218:	9114c210 	add	x16, x16, #0x530
   1121c:	d61f0220 	br	x17

0000000000011220 <_ZNSt6chrono3_V212system_clock3nowEv@plt>:
   11220:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfd58>
   11224:	f9429e11 	ldr	x17, [x16, #1336]
   11228:	9114e210 	add	x16, x16, #0x538
   1122c:	d61f0220 	br	x17

0000000000011230 <write@plt>:
   11230:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfd58>
   11234:	f942a211 	ldr	x17, [x16, #1344]
   11238:	91150210 	add	x16, x16, #0x540
   1123c:	d61f0220 	br	x17

0000000000011240 <wait@plt>:
   11240:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfd58>
   11244:	f942a611 	ldr	x17, [x16, #1352]
   11248:	91152210 	add	x16, x16, #0x548
   1124c:	d61f0220 	br	x17

0000000000011250 <_Znwm@plt>:
   11250:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfd58>
   11254:	f942aa11 	ldr	x17, [x16, #1360]
   11258:	91154210 	add	x16, x16, #0x550
   1125c:	d61f0220 	br	x17

0000000000011260 <_ZdlPv@plt>:
   11260:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfd58>
   11264:	f942ae11 	ldr	x17, [x16, #1368]
   11268:	91156210 	add	x16, x16, #0x558
   1126c:	d61f0220 	br	x17

0000000000011270 <_Unwind_Resume@plt>:
   11270:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfd58>
   11274:	f942b211 	ldr	x17, [x16, #1376]
   11278:	91158210 	add	x16, x16, #0x560
   1127c:	d61f0220 	br	x17

0000000000011280 <memset@plt>:
   11280:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfd58>
   11284:	f942b611 	ldr	x17, [x16, #1384]
   11288:	9115a210 	add	x16, x16, #0x568
   1128c:	d61f0220 	br	x17
