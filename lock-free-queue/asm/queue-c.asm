
/bench/bench:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000010ac0 <_start>:
   10ac0:	d503201f 	nop
   10ac4:	d280001d 	mov	x29, #0x0                   	// #0
   10ac8:	d280001e 	mov	x30, #0x0                   	// #0
   10acc:	aa0003e5 	mov	x5, x0
   10ad0:	f94003e1 	ldr	x1, [sp]
   10ad4:	910023e2 	add	x2, sp, #0x8
   10ad8:	910003e6 	mov	x6, sp
   10adc:	d503201f 	nop
   10ae0:	10001c00 	adr	x0, 10e60 <main>
   10ae4:	d2800003 	mov	x3, #0x0                   	// #0
   10ae8:	d2800004 	mov	x4, #0x0                   	// #0
   10aec:	940001d5 	bl	11240 <__libc_start_main@plt>
   10af0:	940001d0 	bl	11230 <abort@plt>

0000000000010af4 <call_weak_fn>:
   10af4:	b0000080 	adrp	x0, 21000 <__getauxval@plt+0xfd10>
   10af8:	f9426000 	ldr	x0, [x0, #1216]
   10afc:	b4000040 	cbz	x0, 10b04 <call_weak_fn+0x10>
   10b00:	140001d4 	b	11250 <__gmon_start__@plt>
   10b04:	d65f03c0 	ret
	...

0000000000010b10 <deregister_tm_clones>:
   10b10:	d503201f 	nop
   10b14:	10104f20 	adr	x0, 314f8 <__TMC_END__>
   10b18:	d503201f 	nop
   10b1c:	10104ee1 	adr	x1, 314f8 <__TMC_END__>
   10b20:	eb00003f 	cmp	x1, x0
   10b24:	540000c0 	b.eq	10b3c <deregister_tm_clones+0x2c>  // b.none
   10b28:	b0000081 	adrp	x1, 21000 <__getauxval@plt+0xfd10>
   10b2c:	f9426421 	ldr	x1, [x1, #1224]
   10b30:	b4000061 	cbz	x1, 10b3c <deregister_tm_clones+0x2c>
   10b34:	aa0103f0 	mov	x16, x1
   10b38:	d61f0200 	br	x16
   10b3c:	d65f03c0 	ret

0000000000010b40 <register_tm_clones>:
   10b40:	d503201f 	nop
   10b44:	10104da0 	adr	x0, 314f8 <__TMC_END__>
   10b48:	d503201f 	nop
   10b4c:	10104d61 	adr	x1, 314f8 <__TMC_END__>
   10b50:	cb000021 	sub	x1, x1, x0
   10b54:	d37ffc22 	lsr	x2, x1, #63
   10b58:	8b810c41 	add	x1, x2, x1, asr #3
   10b5c:	9341fc21 	asr	x1, x1, #1
   10b60:	b40000c1 	cbz	x1, 10b78 <register_tm_clones+0x38>
   10b64:	b0000082 	adrp	x2, 21000 <__getauxval@plt+0xfd10>
   10b68:	f9426842 	ldr	x2, [x2, #1232]
   10b6c:	b4000062 	cbz	x2, 10b78 <register_tm_clones+0x38>
   10b70:	aa0203f0 	mov	x16, x2
   10b74:	d61f0200 	br	x16
   10b78:	d65f03c0 	ret
   10b7c:	d503201f 	nop

0000000000010b80 <__do_global_dtors_aux>:
   10b80:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   10b84:	910003fd 	mov	x29, sp
   10b88:	f9000bf3 	str	x19, [sp, #16]
   10b8c:	b0000113 	adrp	x19, 31000 <_DYNAMIC+0xfce8>
   10b90:	3955e260 	ldrb	w0, [x19, #1400]
   10b94:	35000140 	cbnz	w0, 10bbc <__do_global_dtors_aux+0x3c>
   10b98:	b0000080 	adrp	x0, 21000 <__getauxval@plt+0xfd10>
   10b9c:	f9426c00 	ldr	x0, [x0, #1240]
   10ba0:	b4000080 	cbz	x0, 10bb0 <__do_global_dtors_aux+0x30>
   10ba4:	b0000100 	adrp	x0, 31000 <_DYNAMIC+0xfce8>
   10ba8:	f9427800 	ldr	x0, [x0, #1264]
   10bac:	940001ad 	bl	11260 <__cxa_finalize@plt>
   10bb0:	97ffffd8 	bl	10b10 <deregister_tm_clones>
   10bb4:	52800020 	mov	w0, #0x1                   	// #1
   10bb8:	3915e260 	strb	w0, [x19, #1400]
   10bbc:	f9400bf3 	ldr	x19, [sp, #16]
   10bc0:	a8c27bfd 	ldp	x29, x30, [sp], #32
   10bc4:	d65f03c0 	ret
   10bc8:	d503201f 	nop
   10bcc:	d503201f 	nop

0000000000010bd0 <frame_dummy>:
   10bd0:	17ffffdc 	b	10b40 <register_tm_clones>
	...

0000000000010be0 <__aarch64_cas8_relax>:
   10be0:	d503245f 	bti	c
   10be4:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0xfce8>
   10be8:	3955e610 	ldrb	w16, [x16, #1401]
   10bec:	34000070 	cbz	w16, 10bf8 <__aarch64_cas8_relax+0x18>
   10bf0:	c8a07c41 	cas	x0, x1, [x2]
   10bf4:	d65f03c0 	ret
   10bf8:	aa0003f0 	mov	x16, x0
   10bfc:	c85f7c40 	ldxr	x0, [x2]
   10c00:	eb10001f 	cmp	x0, x16
   10c04:	54000061 	b.ne	10c10 <__aarch64_cas8_relax+0x30>  // b.any
   10c08:	c8117c41 	stxr	w17, x1, [x2]
   10c0c:	35ffff91 	cbnz	w17, 10bfc <__aarch64_cas8_relax+0x1c>
   10c10:	d65f03c0 	ret
	...

0000000000010c20 <init_have_lse_atomics>:
   10c20:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   10c24:	d2800200 	mov	x0, #0x10                  	// #16
   10c28:	910003fd 	mov	x29, sp
   10c2c:	940001b1 	bl	112f0 <__getauxval@plt>
   10c30:	53082000 	ubfx	w0, w0, #8, #1
   10c34:	b0000101 	adrp	x1, 31000 <_DYNAMIC+0xfce8>
   10c38:	a8c17bfd 	ldp	x29, x30, [sp], #16
   10c3c:	3915e420 	strb	w0, [x1, #1401]
   10c40:	d65f03c0 	ret
	...

0000000000010c50 <__aarch64_ldadd8_relax>:
   10c50:	d503245f 	bti	c
   10c54:	b0000110 	adrp	x16, 31000 <_DYNAMIC+0xfce8>
   10c58:	3955e610 	ldrb	w16, [x16, #1401]
   10c5c:	34000070 	cbz	w16, 10c68 <__aarch64_ldadd8_relax+0x18>
   10c60:	f8200020 	ldadd	x0, x0, [x1]
   10c64:	d65f03c0 	ret
   10c68:	aa0003f0 	mov	x16, x0
   10c6c:	c85f7c20 	ldxr	x0, [x1]
   10c70:	8b100011 	add	x17, x0, x16
   10c74:	c80f7c31 	stxr	w15, x17, [x1]
   10c78:	35ffffaf 	cbnz	w15, 10c6c <__aarch64_ldadd8_relax+0x1c>
   10c7c:	d65f03c0 	ret

0000000000010c80 <producer_thread>:
   10c80:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
   10c84:	f9000bfb 	str	x27, [sp, #16]
   10c88:	910003fd 	mov	x29, sp
   10c8c:	a90267fa 	stp	x26, x25, [sp, #32]
   10c90:	a9035ff8 	stp	x24, x23, [sp, #48]
   10c94:	a90457f6 	stp	x22, x21, [sp, #64]
   10c98:	a9054ff4 	stp	x20, x19, [sp, #80]
   10c9c:	52884817 	mov	w23, #0x4240                	// #16960
   10ca0:	b9801808 	ldrsw	x8, [x0, #24]
   10ca4:	72a001f7 	movk	w23, #0xf, lsl #16
   10ca8:	f9400019 	ldr	x25, [x0]
   10cac:	aa0003f3 	mov	x19, x0
   10cb0:	aa1f03f8 	mov	x24, xzr
   10cb4:	9b177d1a 	mul	x26, x8, x23
   10cb8:	91440334 	add	x20, x25, #0x100, lsl #12
   10cbc:	14000002 	b	10cc4 <producer_thread+0x44>
   10cc0:	9400016c 	bl	11270 <sched_yield@plt>
   10cc4:	f9400295 	ldr	x21, [x20]
   10cc8:	1400000a 	b	10cf0 <producer_thread+0x70>
   10ccc:	910006b6 	add	x22, x21, #0x1
   10cd0:	aa1503e0 	mov	x0, x21
   10cd4:	aa1603e1 	mov	x1, x22
   10cd8:	aa1403e2 	mov	x2, x20
   10cdc:	97ffffc1 	bl	10be0 <__aarch64_cas8_relax>
   10ce0:	eb15001f 	cmp	x0, x21
   10ce4:	54000140 	b.eq	10d0c <producer_thread+0x8c>  // b.none
   10ce8:	aa0003f5 	mov	x21, x0
   10cec:	d5033fdf 	isb
   10cf0:	8b35333b 	add	x27, x25, w21, uxth #4
   10cf4:	c8dfff68 	ldar	x8, [x27]
   10cf8:	eb150108 	subs	x8, x8, x21
   10cfc:	54fffe80 	b.eq	10ccc <producer_thread+0x4c>  // b.none
   10d00:	b7fffe08 	tbnz	x8, #63, 10cc0 <producer_thread+0x40>
   10d04:	f9400280 	ldr	x0, [x20]
   10d08:	17fffff8 	b	10ce8 <producer_thread+0x68>
   10d0c:	92403ea8 	and	x8, x21, #0xffff
   10d10:	91000718 	add	x24, x24, #0x1
   10d14:	8b1a0309 	add	x9, x24, x26
   10d18:	eb17031f 	cmp	x24, x23
   10d1c:	8b081328 	add	x8, x25, x8, lsl #4
   10d20:	f9000509 	str	x9, [x8, #8]
   10d24:	c89fff76 	stlr	x22, [x27]
   10d28:	54fffce1 	b.ne	10cc4 <producer_thread+0x44>  // b.any
   10d2c:	f9001677 	str	x23, [x19, #40]
   10d30:	f9400bfb 	ldr	x27, [sp, #16]
   10d34:	a9454ff4 	ldp	x20, x19, [sp, #80]
   10d38:	aa1f03e0 	mov	x0, xzr
   10d3c:	a94457f6 	ldp	x22, x21, [sp, #64]
   10d40:	a9435ff8 	ldp	x24, x23, [sp, #48]
   10d44:	a94267fa 	ldp	x26, x25, [sp, #32]
   10d48:	a8c67bfd 	ldp	x29, x30, [sp], #96
   10d4c:	d65f03c0 	ret

0000000000010d50 <consumer_thread>:
   10d50:	d10183ff 	sub	sp, sp, #0x60
   10d54:	a9027bfd 	stp	x29, x30, [sp, #32]
   10d58:	910083fd 	add	x29, sp, #0x20
   10d5c:	f9001bf7 	str	x23, [sp, #48]
   10d60:	a90457f6 	stp	x22, x21, [sp, #64]
   10d64:	a9054ff4 	stp	x20, x19, [sp, #80]
   10d68:	a9402016 	ldp	x22, x8, [x0]
   10d6c:	6f00e400 	movi	v0.2d, #0x0
   10d70:	aa0003f3 	mov	x19, x0
   10d74:	f9400108 	ldr	x8, [x8]
   10d78:	3d8007e0 	str	q0, [sp, #16]
   10d7c:	f9400809 	ldr	x9, [x0, #16]
   10d80:	eb09011f 	cmp	x8, x9
   10d84:	540005c2 	b.cs	10e3c <consumer_thread+0xec>  // b.hs, b.nlast
   10d88:	52800029 	mov	w9, #0x1                   	// #1
   10d8c:	914402c8 	add	x8, x22, #0x100, lsl #12
   10d90:	6f00e401 	movi	v1.2d, #0x0
   10d94:	91010114 	add	x20, x8, #0x40
   10d98:	4e080d20 	dup	v0.2d, x9
   10d9c:	ad0007e0 	stp	q0, q1, [sp]
   10da0:	14000006 	b	10db8 <consumer_thread+0x68>
   10da4:	94000133 	bl	11270 <sched_yield@plt>
   10da8:	a940a668 	ldp	x8, x9, [x19, #8]
   10dac:	f9400108 	ldr	x8, [x8]
   10db0:	eb09011f 	cmp	x8, x9
   10db4:	54000442 	b.cs	10e3c <consumer_thread+0xec>  // b.hs, b.nlast
   10db8:	f9400295 	ldr	x21, [x20]
   10dbc:	14000008 	b	10ddc <consumer_thread+0x8c>
   10dc0:	aa1503e0 	mov	x0, x21
   10dc4:	aa1403e2 	mov	x2, x20
   10dc8:	97ffff86 	bl	10be0 <__aarch64_cas8_relax>
   10dcc:	eb15001f 	cmp	x0, x21
   10dd0:	54000160 	b.eq	10dfc <consumer_thread+0xac>  // b.none
   10dd4:	aa0003f5 	mov	x21, x0
   10dd8:	d5033fdf 	isb
   10ddc:	8b3532d7 	add	x23, x22, w21, uxth #4
   10de0:	910006a1 	add	x1, x21, #0x1
   10de4:	c8dffee8 	ldar	x8, [x23]
   10de8:	eb010108 	subs	x8, x8, x1
   10dec:	54fffea0 	b.eq	10dc0 <consumer_thread+0x70>  // b.none
   10df0:	b7fffda8 	tbnz	x8, #63, 10da4 <consumer_thread+0x54>
   10df4:	f9400280 	ldr	x0, [x20]
   10df8:	17fffff7 	b	10dd4 <consumer_thread+0x84>
   10dfc:	92403ea8 	and	x8, x21, #0xffff
   10e00:	914042a9 	add	x9, x21, #0x10, lsl #12
   10e04:	ad4007e0 	ldp	q0, q1, [sp]
   10e08:	8b0812c8 	add	x8, x22, x8, lsl #4
   10e0c:	52800020 	mov	w0, #0x1                   	// #1
   10e10:	91002108 	add	x8, x8, #0x8
   10e14:	0d408500 	ld1	{v0.d}[0], [x8]
   10e18:	c89ffee9 	stlr	x9, [x23]
   10e1c:	f9400661 	ldr	x1, [x19, #8]
   10e20:	4ee18401 	add	v1.2d, v0.2d, v1.2d
   10e24:	3d8007e1 	str	q1, [sp, #16]
   10e28:	97ffff8a 	bl	10c50 <__aarch64_ldadd8_relax>
   10e2c:	a940a668 	ldp	x8, x9, [x19, #8]
   10e30:	f9400108 	ldr	x8, [x8]
   10e34:	eb09011f 	cmp	x8, x9
   10e38:	54fffc03 	b.cc	10db8 <consumer_thread+0x68>  // b.lo, b.ul, b.last
   10e3c:	3dc007e0 	ldr	q0, [sp, #16]
   10e40:	aa1f03e0 	mov	x0, xzr
   10e44:	a94457f6 	ldp	x22, x21, [sp, #64]
   10e48:	3d800a60 	str	q0, [x19, #32]
   10e4c:	f9401bf7 	ldr	x23, [sp, #48]
   10e50:	a9454ff4 	ldp	x20, x19, [sp, #80]
   10e54:	a9427bfd 	ldp	x29, x30, [sp, #32]
   10e58:	910183ff 	add	sp, sp, #0x60
   10e5c:	d65f03c0 	ret

0000000000010e60 <main>:
   10e60:	fc180fea 	str	d10, [sp, #-128]!
   10e64:	6d0123e9 	stp	d9, d8, [sp, #16]
   10e68:	a9027bfd 	stp	x29, x30, [sp, #32]
   10e6c:	910083fd 	add	x29, sp, #0x20
   10e70:	a9036ffc 	stp	x28, x27, [sp, #48]
   10e74:	a90467fa 	stp	x26, x25, [sp, #64]
   10e78:	a9055ff8 	stp	x24, x23, [sp, #80]
   10e7c:	a90657f6 	stp	x22, x21, [sp, #96]
   10e80:	a9074ff4 	stp	x20, x19, [sp, #112]
   10e84:	d10743ff 	sub	sp, sp, #0x1d0
   10e88:	52801001 	mov	w1, #0x80                  	// #128
   10e8c:	52800800 	mov	w0, #0x40                  	// #64
   10e90:	72a00201 	movk	w1, #0x10, lsl #16
   10e94:	940000fb 	bl	11280 <aligned_alloc@plt>
   10e98:	b40018e0 	cbz	x0, 111b4 <main+0x354>
   10e9c:	aa0003f3 	mov	x19, x0
   10ea0:	aa1f03e8 	mov	x8, xzr
   10ea4:	91002009 	add	x9, x0, #0x8
   10ea8:	f81f8128 	stur	x8, [x9, #-8]
   10eac:	91000508 	add	x8, x8, #0x1
   10eb0:	f140411f 	cmp	x8, #0x10, lsl #12
   10eb4:	f801053f 	str	xzr, [x9], #16
   10eb8:	54ffff81 	b.ne	10ea8 <main+0x48>  // b.any
   10ebc:	52800809 	mov	w9, #0x40                  	// #64
   10ec0:	52a00208 	mov	w8, #0x100000              	// #1048576
   10ec4:	72a00209 	movk	w9, #0x10, lsl #16
   10ec8:	5280002a 	mov	w10, #0x1                   	// #1
   10ecc:	5280004b 	mov	w11, #0x2                   	// #2
   10ed0:	5280006c 	mov	w12, #0x3                   	// #3
   10ed4:	f8286a7f 	str	xzr, [x19, x8]
   10ed8:	d10063a8 	sub	x8, x29, #0x18
   10edc:	f8296a7f 	str	xzr, [x19, x9]
   10ee0:	52812009 	mov	w9, #0x900                 	// #2304
   10ee4:	72a007a9 	movk	w9, #0x3d, lsl #16
   10ee8:	d10143a1 	sub	x1, x29, #0x50
   10eec:	52800020 	mov	w0, #0x1                   	// #1
   10ef0:	b9010bea 	str	w10, [sp, #264]
   10ef4:	b9004bea 	str	w10, [sp, #72]
   10ef8:	910303ea 	add	x10, sp, #0xc0
   10efc:	9100c157 	add	x23, x10, #0x30
   10f00:	91018158 	add	x24, x10, #0x60
   10f04:	91024159 	add	x25, x10, #0x90
   10f08:	910003ea 	mov	x10, sp
   10f0c:	f81e83bf 	stur	xzr, [x29, #-24]
   10f10:	9100c156 	add	x22, x10, #0x30
   10f14:	a90c23f3 	stp	x19, x8, [sp, #192]
   10f18:	91018155 	add	x21, x10, #0x60
   10f1c:	f9006be9 	str	x9, [sp, #208]
   10f20:	91024154 	add	x20, x10, #0x90
   10f24:	b900dbff 	str	wzr, [sp, #216]
   10f28:	d10143bb 	sub	x27, x29, #0x50
   10f2c:	a90e7fff 	stp	xzr, xzr, [sp, #224]
   10f30:	a90f23f3 	stp	x19, x8, [sp, #240]
   10f34:	f90083e9 	str	x9, [sp, #256]
   10f38:	a9117fff 	stp	xzr, xzr, [sp, #272]
   10f3c:	a91223f3 	stp	x19, x8, [sp, #288]
   10f40:	f9009be9 	str	x9, [sp, #304]
   10f44:	b9013beb 	str	w11, [sp, #312]
   10f48:	a9147fff 	stp	xzr, xzr, [sp, #320]
   10f4c:	a91523f3 	stp	x19, x8, [sp, #336]
   10f50:	f900b3e9 	str	x9, [sp, #352]
   10f54:	b9016bec 	str	w12, [sp, #360]
   10f58:	a9177fff 	stp	xzr, xzr, [sp, #368]
   10f5c:	a90023f3 	stp	x19, x8, [sp]
   10f60:	f9000be9 	str	x9, [sp, #16]
   10f64:	b9001bff 	str	wzr, [sp, #24]
   10f68:	a9027fff 	stp	xzr, xzr, [sp, #32]
   10f6c:	a90323f3 	stp	x19, x8, [sp, #48]
   10f70:	f90023e9 	str	x9, [sp, #64]
   10f74:	a9057fff 	stp	xzr, xzr, [sp, #80]
   10f78:	a90623f3 	stp	x19, x8, [sp, #96]
   10f7c:	f9003be9 	str	x9, [sp, #112]
   10f80:	b9007beb 	str	w11, [sp, #120]
   10f84:	a9087fff 	stp	xzr, xzr, [sp, #128]
   10f88:	a90923f3 	stp	x19, x8, [sp, #144]
   10f8c:	f90053e9 	str	x9, [sp, #160]
   10f90:	b900abec 	str	w12, [sp, #168]
   10f94:	a90b7fff 	stp	xzr, xzr, [sp, #176]
   10f98:	940000ce 	bl	112d0 <clock_gettime@plt>
   10f9c:	6d7b03aa 	ldp	d10, d0, [x29, #-80]
   10fa0:	d2d09008 	mov	x8, #0x848000000000        	// #145685290680320
   10fa4:	9000001a 	adrp	x26, 10000 <__FRAME_END__+0xf6f8>
   10fa8:	f2e825c8 	movk	x8, #0x412e, lsl #48
   10fac:	9132035a 	add	x26, x26, #0xc80
   10fb0:	d10143a0 	sub	x0, x29, #0x50
   10fb4:	910303e3 	add	x3, sp, #0xc0
   10fb8:	aa1f03e1 	mov	x1, xzr
   10fbc:	aa1a03e2 	mov	x2, x26
   10fc0:	5e61d800 	scvtf	d0, d0
   10fc4:	9e670109 	fmov	d9, x8
   10fc8:	1e691808 	fdiv	d8, d0, d9
   10fcc:	940000b1 	bl	11290 <pthread_create@plt>
   10fd0:	91002360 	add	x0, x27, #0x8
   10fd4:	aa1f03e1 	mov	x1, xzr
   10fd8:	aa1a03e2 	mov	x2, x26
   10fdc:	aa1703e3 	mov	x3, x23
   10fe0:	940000ac 	bl	11290 <pthread_create@plt>
   10fe4:	91004360 	add	x0, x27, #0x10
   10fe8:	aa1f03e1 	mov	x1, xzr
   10fec:	aa1a03e2 	mov	x2, x26
   10ff0:	aa1803e3 	mov	x3, x24
   10ff4:	940000a7 	bl	11290 <pthread_create@plt>
   10ff8:	91006360 	add	x0, x27, #0x18
   10ffc:	aa1f03e1 	mov	x1, xzr
   11000:	aa1a03e2 	mov	x2, x26
   11004:	aa1903e3 	mov	x3, x25
   11008:	940000a2 	bl	11290 <pthread_create@plt>
   1100c:	f0fffff7 	adrp	x23, 10000 <__FRAME_END__+0xf6f8>
   11010:	d101c3a0 	sub	x0, x29, #0x70
   11014:	913542f7 	add	x23, x23, #0xd50
   11018:	910003e3 	mov	x3, sp
   1101c:	aa1f03e1 	mov	x1, xzr
   11020:	aa1703e2 	mov	x2, x23
   11024:	5e61d94a 	scvtf	d10, d10
   11028:	d101c3b8 	sub	x24, x29, #0x70
   1102c:	94000099 	bl	11290 <pthread_create@plt>
   11030:	91002300 	add	x0, x24, #0x8
   11034:	aa1f03e1 	mov	x1, xzr
   11038:	aa1703e2 	mov	x2, x23
   1103c:	aa1603e3 	mov	x3, x22
   11040:	94000094 	bl	11290 <pthread_create@plt>
   11044:	91004300 	add	x0, x24, #0x10
   11048:	aa1f03e1 	mov	x1, xzr
   1104c:	aa1703e2 	mov	x2, x23
   11050:	aa1503e3 	mov	x3, x21
   11054:	9400008f 	bl	11290 <pthread_create@plt>
   11058:	91006300 	add	x0, x24, #0x18
   1105c:	aa1f03e1 	mov	x1, xzr
   11060:	aa1703e2 	mov	x2, x23
   11064:	aa1403e3 	mov	x3, x20
   11068:	9400008a 	bl	11290 <pthread_create@plt>
   1106c:	f85b03a0 	ldur	x0, [x29, #-80]
   11070:	aa1f03e1 	mov	x1, xzr
   11074:	9400008b 	bl	112a0 <pthread_join@plt>
   11078:	f85b83a0 	ldur	x0, [x29, #-72]
   1107c:	aa1f03e1 	mov	x1, xzr
   11080:	94000088 	bl	112a0 <pthread_join@plt>
   11084:	f85c03a0 	ldur	x0, [x29, #-64]
   11088:	aa1f03e1 	mov	x1, xzr
   1108c:	94000085 	bl	112a0 <pthread_join@plt>
   11090:	f85c83a0 	ldur	x0, [x29, #-56]
   11094:	aa1f03e1 	mov	x1, xzr
   11098:	94000082 	bl	112a0 <pthread_join@plt>
   1109c:	f85903a0 	ldur	x0, [x29, #-112]
   110a0:	aa1f03e1 	mov	x1, xzr
   110a4:	9400007f 	bl	112a0 <pthread_join@plt>
   110a8:	f85983a0 	ldur	x0, [x29, #-104]
   110ac:	aa1f03e1 	mov	x1, xzr
   110b0:	9400007c 	bl	112a0 <pthread_join@plt>
   110b4:	f85a03a0 	ldur	x0, [x29, #-96]
   110b8:	aa1f03e1 	mov	x1, xzr
   110bc:	94000079 	bl	112a0 <pthread_join@plt>
   110c0:	f85a83a0 	ldur	x0, [x29, #-88]
   110c4:	aa1f03e1 	mov	x1, xzr
   110c8:	94000076 	bl	112a0 <pthread_join@plt>
   110cc:	d100c3a1 	sub	x1, x29, #0x30
   110d0:	52800020 	mov	w0, #0x1                   	// #1
   110d4:	9400007f 	bl	112d0 <clock_gettime@plt>
   110d8:	6d7d03a1 	ldp	d1, d0, [x29, #-48]
   110dc:	d2c80008 	mov	x8, #0x400000000000        	// #70368744177664
   110e0:	d2809004 	mov	x4, #0x480                 	// #1152
   110e4:	f2e811e8 	movk	x8, #0x408f, lsl #48
   110e8:	f940a7ee 	ldr	x14, [sp, #328]
   110ec:	a9452bed 	ldp	x13, x10, [sp, #80]
   110f0:	5e61d821 	scvtf	d1, d1
   110f4:	f0ffff60 	adrp	x0, 0 <__abi_tag-0x2c4>
   110f8:	5e61d800 	scvtf	d0, d0
   110fc:	9e670102 	fmov	d2, x8
   11100:	a94223e9 	ldp	x9, x8, [sp, #32]
   11104:	f2b4a8e4 	movk	x4, #0xa547, lsl #16
   11108:	9120d000 	add	x0, x0, #0x834
   1110c:	f940bfef 	ldr	x15, [sp, #376]
   11110:	f2c0e8c4 	movk	x4, #0x746, lsl #32
   11114:	1e691800 	fdiv	d0, d0, d9
   11118:	d2809015 	mov	x21, #0x480                 	// #1152
   1111c:	8b0901a9 	add	x9, x13, x9
   11120:	f2b4a8f5 	movk	x21, #0xa547, lsl #16
   11124:	8b080148 	add	x8, x10, x8
   11128:	f2c0e8d5 	movk	x21, #0x746, lsl #32
   1112c:	a9482fea 	ldp	x10, x11, [sp, #128]
   11130:	8b090149 	add	x9, x10, x9
   11134:	8b080168 	add	x8, x11, x8
   11138:	a94b33eb 	ldp	x11, x12, [sp, #176]
   1113c:	8b090174 	add	x20, x11, x9
   11140:	8b080182 	add	x2, x12, x8
   11144:	f94077e8 	ldr	x8, [sp, #232]
   11148:	f9408fec 	ldr	x12, [sp, #280]
   1114c:	aa1403e3 	mov	x3, x20
   11150:	8b080188 	add	x8, x12, x8
   11154:	8b0801c8 	add	x8, x14, x8
   11158:	8b0801e1 	add	x1, x15, x8
   1115c:	1f420020 	fmadd	d0, d1, d2, d0
   11160:	1f422141 	fmadd	d1, d10, d2, d8
   11164:	1e613800 	fsub	d0, d0, d1
   11168:	1e621801 	fdiv	d1, d0, d2
   1116c:	9e630042 	ucvtf	d2, x2
   11170:	1e611841 	fdiv	d1, d2, d1
   11174:	9400004f 	bl	112b0 <printf@plt>
   11178:	aa1303e0 	mov	x0, x19
   1117c:	94000051 	bl	112c0 <free@plt>
   11180:	eb15029f 	cmp	x20, x21
   11184:	1a9f07f3 	cset	w19, ne  // ne = any
   11188:	2a1303e0 	mov	w0, w19
   1118c:	910743ff 	add	sp, sp, #0x1d0
   11190:	a9474ff4 	ldp	x20, x19, [sp, #112]
   11194:	a94657f6 	ldp	x22, x21, [sp, #96]
   11198:	a9455ff8 	ldp	x24, x23, [sp, #80]
   1119c:	a94467fa 	ldp	x26, x25, [sp, #64]
   111a0:	a9436ffc 	ldp	x28, x27, [sp, #48]
   111a4:	a9427bfd 	ldp	x29, x30, [sp, #32]
   111a8:	6d4123e9 	ldp	d9, d8, [sp, #16]
   111ac:	fc4807ea 	ldr	d10, [sp], #128
   111b0:	d65f03c0 	ret
   111b4:	90000088 	adrp	x8, 21000 <__getauxval@plt+0xfd10>
   111b8:	d503201f 	nop
   111bc:	50f7b660 	adr	x0, 88a <_IO_stdin_used+0x5a>
   111c0:	52800321 	mov	w1, #0x19                  	// #25
   111c4:	52800022 	mov	w2, #0x1                   	// #1
   111c8:	52800033 	mov	w19, #0x1                   	// #1
   111cc:	f9427108 	ldr	x8, [x8, #1248]
   111d0:	f9400103 	ldr	x3, [x8]
   111d4:	94000043 	bl	112e0 <fwrite@plt>
   111d8:	17ffffec 	b	11188 <main+0x328>

Disassembly of section .init:

00000000000111dc <_init>:
   111dc:	d503201f 	nop
   111e0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   111e4:	910003fd 	mov	x29, sp
   111e8:	97fffe43 	bl	10af4 <call_weak_fn>
   111ec:	a8c17bfd 	ldp	x29, x30, [sp], #16
   111f0:	d65f03c0 	ret

Disassembly of section .fini:

00000000000111f4 <_fini>:
   111f4:	d503201f 	nop
   111f8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   111fc:	910003fd 	mov	x29, sp
   11200:	a8c17bfd 	ldp	x29, x30, [sp], #16
   11204:	d65f03c0 	ret

Disassembly of section .plt:

0000000000011210 <abort@plt-0x20>:
   11210:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
   11214:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfce8>
   11218:	f9428611 	ldr	x17, [x16, #1288]
   1121c:	91142210 	add	x16, x16, #0x508
   11220:	d61f0220 	br	x17
   11224:	d503201f 	nop
   11228:	d503201f 	nop
   1122c:	d503201f 	nop

0000000000011230 <abort@plt>:
   11230:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfce8>
   11234:	f9428a11 	ldr	x17, [x16, #1296]
   11238:	91144210 	add	x16, x16, #0x510
   1123c:	d61f0220 	br	x17

0000000000011240 <__libc_start_main@plt>:
   11240:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfce8>
   11244:	f9428e11 	ldr	x17, [x16, #1304]
   11248:	91146210 	add	x16, x16, #0x518
   1124c:	d61f0220 	br	x17

0000000000011250 <__gmon_start__@plt>:
   11250:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfce8>
   11254:	f9429211 	ldr	x17, [x16, #1312]
   11258:	91148210 	add	x16, x16, #0x520
   1125c:	d61f0220 	br	x17

0000000000011260 <__cxa_finalize@plt>:
   11260:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfce8>
   11264:	f9429611 	ldr	x17, [x16, #1320]
   11268:	9114a210 	add	x16, x16, #0x528
   1126c:	d61f0220 	br	x17

0000000000011270 <sched_yield@plt>:
   11270:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfce8>
   11274:	f9429a11 	ldr	x17, [x16, #1328]
   11278:	9114c210 	add	x16, x16, #0x530
   1127c:	d61f0220 	br	x17

0000000000011280 <aligned_alloc@plt>:
   11280:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfce8>
   11284:	f9429e11 	ldr	x17, [x16, #1336]
   11288:	9114e210 	add	x16, x16, #0x538
   1128c:	d61f0220 	br	x17

0000000000011290 <pthread_create@plt>:
   11290:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfce8>
   11294:	f942a211 	ldr	x17, [x16, #1344]
   11298:	91150210 	add	x16, x16, #0x540
   1129c:	d61f0220 	br	x17

00000000000112a0 <pthread_join@plt>:
   112a0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfce8>
   112a4:	f942a611 	ldr	x17, [x16, #1352]
   112a8:	91152210 	add	x16, x16, #0x548
   112ac:	d61f0220 	br	x17

00000000000112b0 <printf@plt>:
   112b0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfce8>
   112b4:	f942aa11 	ldr	x17, [x16, #1360]
   112b8:	91154210 	add	x16, x16, #0x550
   112bc:	d61f0220 	br	x17

00000000000112c0 <free@plt>:
   112c0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfce8>
   112c4:	f942ae11 	ldr	x17, [x16, #1368]
   112c8:	91156210 	add	x16, x16, #0x558
   112cc:	d61f0220 	br	x17

00000000000112d0 <clock_gettime@plt>:
   112d0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfce8>
   112d4:	f942b211 	ldr	x17, [x16, #1376]
   112d8:	91158210 	add	x16, x16, #0x560
   112dc:	d61f0220 	br	x17

00000000000112e0 <fwrite@plt>:
   112e0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfce8>
   112e4:	f942b611 	ldr	x17, [x16, #1384]
   112e8:	9115a210 	add	x16, x16, #0x568
   112ec:	d61f0220 	br	x17

00000000000112f0 <__getauxval@plt>:
   112f0:	90000110 	adrp	x16, 31000 <_DYNAMIC+0xfce8>
   112f4:	f942ba11 	ldr	x17, [x16, #1392]
   112f8:	9115c210 	add	x16, x16, #0x570
   112fc:	d61f0220 	br	x17
