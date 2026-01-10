
/bench/bench:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000011580 <_start>:
   11580:	d503201f 	nop
   11584:	d280001d 	mov	x29, #0x0                   	// #0
   11588:	d280001e 	mov	x30, #0x0                   	// #0
   1158c:	aa0003e5 	mov	x5, x0
   11590:	f94003e1 	ldr	x1, [sp]
   11594:	910023e2 	add	x2, sp, #0x8
   11598:	910003e6 	mov	x6, sp
   1159c:	d503201f 	nop
   115a0:	100018a0 	adr	x0, 118b4 <main>
   115a4:	d2800003 	mov	x3, #0x0                   	// #0
   115a8:	d2800004 	mov	x4, #0x0                   	// #0
   115ac:	94000265 	bl	11f40 <__libc_start_main@plt>
   115b0:	94000260 	bl	11f30 <abort@plt>

00000000000115b4 <call_weak_fn>:
   115b4:	b0000080 	adrp	x0, 22000 <memset@plt+0xff00>
   115b8:	f941a400 	ldr	x0, [x0, #840]
   115bc:	b4000040 	cbz	x0, 115c4 <call_weak_fn+0x10>
   115c0:	14000264 	b	11f50 <__gmon_start__@plt>
   115c4:	d65f03c0 	ret
	...

00000000000115d0 <deregister_tm_clones>:
   115d0:	d503201f 	nop
   115d4:	10106de0 	adr	x0, 32390 <__TMC_END__>
   115d8:	d503201f 	nop
   115dc:	10106da1 	adr	x1, 32390 <__TMC_END__>
   115e0:	eb00003f 	cmp	x1, x0
   115e4:	540000c0 	b.eq	115fc <deregister_tm_clones+0x2c>  // b.none
   115e8:	b0000081 	adrp	x1, 22000 <memset@plt+0xff00>
   115ec:	f941a821 	ldr	x1, [x1, #848]
   115f0:	b4000061 	cbz	x1, 115fc <deregister_tm_clones+0x2c>
   115f4:	aa0103f0 	mov	x16, x1
   115f8:	d61f0200 	br	x16
   115fc:	d65f03c0 	ret

0000000000011600 <register_tm_clones>:
   11600:	d503201f 	nop
   11604:	10106c60 	adr	x0, 32390 <__TMC_END__>
   11608:	d503201f 	nop
   1160c:	10106c21 	adr	x1, 32390 <__TMC_END__>
   11610:	cb000021 	sub	x1, x1, x0
   11614:	d37ffc22 	lsr	x2, x1, #63
   11618:	8b810c41 	add	x1, x2, x1, asr #3
   1161c:	9341fc21 	asr	x1, x1, #1
   11620:	b40000c1 	cbz	x1, 11638 <register_tm_clones+0x38>
   11624:	b0000082 	adrp	x2, 22000 <memset@plt+0xff00>
   11628:	f941ac42 	ldr	x2, [x2, #856]
   1162c:	b4000062 	cbz	x2, 11638 <register_tm_clones+0x38>
   11630:	aa0203f0 	mov	x16, x2
   11634:	d61f0200 	br	x16
   11638:	d65f03c0 	ret
   1163c:	d503201f 	nop

0000000000011640 <__do_global_dtors_aux>:
   11640:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   11644:	910003fd 	mov	x29, sp
   11648:	f9000bf3 	str	x19, [sp, #16]
   1164c:	b0000113 	adrp	x19, 32000 <_DYNAMIC+0xfe90>
   11650:	39526260 	ldrb	w0, [x19, #1176]
   11654:	35000140 	cbnz	w0, 1167c <__do_global_dtors_aux+0x3c>
   11658:	b0000080 	adrp	x0, 22000 <memset@plt+0xff00>
   1165c:	f941b000 	ldr	x0, [x0, #864]
   11660:	b4000080 	cbz	x0, 11670 <__do_global_dtors_aux+0x30>
   11664:	b0000100 	adrp	x0, 32000 <_DYNAMIC+0xfe90>
   11668:	f941c000 	ldr	x0, [x0, #896]
   1166c:	9400023d 	bl	11f60 <__cxa_finalize@plt>
   11670:	97ffffd8 	bl	115d0 <deregister_tm_clones>
   11674:	52800020 	mov	w0, #0x1                   	// #1
   11678:	39126260 	strb	w0, [x19, #1176]
   1167c:	f9400bf3 	ldr	x19, [sp, #16]
   11680:	a8c27bfd 	ldp	x29, x30, [sp], #32
   11684:	d65f03c0 	ret
   11688:	d503201f 	nop
   1168c:	d503201f 	nop

0000000000011690 <frame_dummy>:
   11690:	17ffffdc 	b	11600 <register_tm_clones>
	...

00000000000116a0 <__aarch64_ldadd4_acq_rel>:
   116a0:	d503245f 	bti	c
   116a4:	b0000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   116a8:	39526610 	ldrb	w16, [x16, #1177]
   116ac:	34000070 	cbz	w16, 116b8 <__aarch64_ldadd4_acq_rel+0x18>
   116b0:	b8e00020 	ldaddal	w0, w0, [x1]
   116b4:	d65f03c0 	ret
   116b8:	2a0003f0 	mov	w16, w0
   116bc:	885ffc20 	ldaxr	w0, [x1]
   116c0:	0b100011 	add	w17, w0, w16
   116c4:	880ffc31 	stlxr	w15, w17, [x1]
   116c8:	35ffffaf 	cbnz	w15, 116bc <__aarch64_ldadd4_acq_rel+0x1c>
   116cc:	d65f03c0 	ret

00000000000116d0 <init_have_lse_atomics>:
   116d0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   116d4:	d2800200 	mov	x0, #0x10                  	// #16
   116d8:	910003fd 	mov	x29, sp
   116dc:	94000285 	bl	120f0 <__getauxval@plt>
   116e0:	53082000 	ubfx	w0, w0, #8, #1
   116e4:	b0000101 	adrp	x1, 32000 <_DYNAMIC+0xfe90>
   116e8:	a8c17bfd 	ldp	x29, x30, [sp], #16
   116ec:	39126420 	strb	w0, [x1, #1177]
   116f0:	d65f03c0 	ret

00000000000116f4 <_GLOBAL__sub_I_bench.cpp>:
   116f4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   116f8:	f9000bf3 	str	x19, [sp, #16]
   116fc:	910003fd 	mov	x29, sp
   11700:	d503201f 	nop
   11704:	50106cb3 	adr	x19, 3249a <_ZStL8__ioinit>
   11708:	aa1303e0 	mov	x0, x19
   1170c:	94000219 	bl	11f70 <_ZNSt8ios_base4InitC1Ev@plt>
   11710:	b0000080 	adrp	x0, 22000 <memset@plt+0xff00>
   11714:	aa1303e1 	mov	x1, x19
   11718:	d503201f 	nop
   1171c:	10106322 	adr	x2, 32380 <__dso_handle>
   11720:	f941b400 	ldr	x0, [x0, #872]
   11724:	f9400bf3 	ldr	x19, [sp, #16]
   11728:	a8c27bfd 	ldp	x29, x30, [sp], #32
   1172c:	14000215 	b	11f80 <__cxa_atexit@plt>

0000000000011730 <_Z14render_dynamicRSt6atomicIiEiijddddPj>:
   11730:	fc180fee 	str	d14, [sp, #-128]!
   11734:	6d0133ed 	stp	d13, d12, [sp, #16]
   11738:	6d022beb 	stp	d11, d10, [sp, #32]
   1173c:	6d0323e9 	stp	d9, d8, [sp, #48]
   11740:	a9047bfd 	stp	x29, x30, [sp, #64]
   11744:	910103fd 	add	x29, sp, #0x40
   11748:	a9055ff8 	stp	x24, x23, [sp, #80]
   1174c:	a90657f6 	stp	x22, x21, [sp, #96]
   11750:	a9074ff4 	stp	x20, x19, [sp, #112]
   11754:	aa0003f4 	mov	x20, x0
   11758:	2a0103f6 	mov	w22, w1
   1175c:	52800020 	mov	w0, #0x1                   	// #1
   11760:	aa1403e1 	mov	x1, x20
   11764:	aa0403f5 	mov	x21, x4
   11768:	1e60406b 	fmov	d11, d3
   1176c:	1e604048 	fmov	d8, d2
   11770:	1e60402a 	fmov	d10, d1
   11774:	1e604009 	fmov	d9, d0
   11778:	2a0303f7 	mov	w23, w3
   1177c:	2a0203f3 	mov	w19, w2
   11780:	97ffffc8 	bl	116a0 <__aarch64_ldadd4_acq_rel>
   11784:	6b13001f 	cmp	w0, w19
   11788:	5400084a 	b.ge	11890 <_Z14render_dynamicRSt6atomicIiEiijddddPj+0x160>  // b.tcont
   1178c:	710002df 	cmp	w22, #0x0
   11790:	540005ed 	b.le	1184c <_Z14render_dynamicRSt6atomicIiEiijddddPj+0x11c>
   11794:	2a1603f8 	mov	w24, w22
   11798:	34000677 	cbz	w23, 11864 <_Z14render_dynamicRSt6atomicIiEiijddddPj+0x134>
   1179c:	1e62026c 	scvtf	d12, w19
   117a0:	1e68396b 	fsub	d11, d11, d8
   117a4:	1e6202cd 	scvtf	d13, w22
   117a8:	1e69394a 	fsub	d10, d10, d9
   117ac:	1e62100e 	fmov	d14, #4.000000000000000000e+00
   117b0:	14000006 	b	117c8 <_Z14render_dynamicRSt6atomicIiEiijddddPj+0x98>
   117b4:	52800020 	mov	w0, #0x1                   	// #1
   117b8:	aa1403e1 	mov	x1, x20
   117bc:	97ffffb9 	bl	116a0 <__aarch64_ldadd4_acq_rel>
   117c0:	6b13001f 	cmp	w0, w19
   117c4:	5400066a 	b.ge	11890 <_Z14render_dynamicRSt6atomicIiEiijddddPj+0x160>  // b.tcont
   117c8:	1e620000 	scvtf	d0, w0
   117cc:	1b167c09 	mul	w9, w0, w22
   117d0:	aa1f03e8 	mov	x8, xzr
   117d4:	93407d29 	sxtw	x9, w9
   117d8:	1e6c1800 	fdiv	d0, d0, d12
   117dc:	1f4b2000 	fmadd	d0, d0, d11, d8
   117e0:	14000006 	b	117f8 <_Z14render_dynamicRSt6atomicIiEiijddddPj+0xc8>
   117e4:	8b09010b 	add	x11, x8, x9
   117e8:	91000508 	add	x8, x8, #0x1
   117ec:	eb18011f 	cmp	x8, x24
   117f0:	b82b7aaa 	str	w10, [x21, x11, lsl #2]
   117f4:	54fffe00 	b.eq	117b4 <_Z14render_dynamicRSt6atomicIiEiijddddPj+0x84>  // b.none
   117f8:	1e620101 	scvtf	d1, w8
   117fc:	2f00e403 	movi	d3, #0x0
   11800:	2f00e402 	movi	d2, #0x0
   11804:	2a1f03ea 	mov	w10, wzr
   11808:	1e6d1821 	fdiv	d1, d1, d13
   1180c:	1f4a2421 	fmadd	d1, d1, d10, d9
   11810:	1e630864 	fmul	d4, d3, d3
   11814:	1e620845 	fmul	d5, d2, d2
   11818:	1e652886 	fadd	d6, d4, d5
   1181c:	1e6e20c0 	fcmp	d6, d14
   11820:	54fffe2c 	b.gt	117e4 <_Z14render_dynamicRSt6atomicIiEiijddddPj+0xb4>
   11824:	1e653884 	fsub	d4, d4, d5
   11828:	1e632863 	fadd	d3, d3, d3
   1182c:	1100054a 	add	w10, w10, #0x1
   11830:	6b0a02ff 	cmp	w23, w10
   11834:	1e642824 	fadd	d4, d1, d4
   11838:	1f420062 	fmadd	d2, d3, d2, d0
   1183c:	1e604083 	fmov	d3, d4
   11840:	54fffe81 	b.ne	11810 <_Z14render_dynamicRSt6atomicIiEiijddddPj+0xe0>  // b.any
   11844:	2a1703ea 	mov	w10, w23
   11848:	17ffffe7 	b	117e4 <_Z14render_dynamicRSt6atomicIiEiijddddPj+0xb4>
   1184c:	52800020 	mov	w0, #0x1                   	// #1
   11850:	aa1403e1 	mov	x1, x20
   11854:	97ffff93 	bl	116a0 <__aarch64_ldadd4_acq_rel>
   11858:	6b13001f 	cmp	w0, w19
   1185c:	54ffff8b 	b.lt	1184c <_Z14render_dynamicRSt6atomicIiEiijddddPj+0x11c>  // b.tstop
   11860:	1400000c 	b	11890 <_Z14render_dynamicRSt6atomicIiEiijddddPj+0x160>
   11864:	d37ef717 	lsl	x23, x24, #2
   11868:	1b167c08 	mul	w8, w0, w22
   1186c:	2a1f03e1 	mov	w1, wzr
   11870:	aa1703e2 	mov	x2, x23
   11874:	8b28caa0 	add	x0, x21, w8, sxtw #2
   11878:	94000222 	bl	12100 <memset@plt>
   1187c:	52800020 	mov	w0, #0x1                   	// #1
   11880:	aa1403e1 	mov	x1, x20
   11884:	97ffff87 	bl	116a0 <__aarch64_ldadd4_acq_rel>
   11888:	6b13001f 	cmp	w0, w19
   1188c:	54fffeeb 	b.lt	11868 <_Z14render_dynamicRSt6atomicIiEiijddddPj+0x138>  // b.tstop
   11890:	a9474ff4 	ldp	x20, x19, [sp, #112]
   11894:	a94657f6 	ldp	x22, x21, [sp, #96]
   11898:	a9455ff8 	ldp	x24, x23, [sp, #80]
   1189c:	a9447bfd 	ldp	x29, x30, [sp, #64]
   118a0:	6d4323e9 	ldp	d9, d8, [sp, #48]
   118a4:	6d422beb 	ldp	d11, d10, [sp, #32]
   118a8:	6d4133ed 	ldp	d13, d12, [sp, #16]
   118ac:	fc4807ee 	ldr	d14, [sp], #128
   118b0:	d65f03c0 	ret

00000000000118b4 <main>:
   118b4:	fc190fe8 	str	d8, [sp, #-112]!
   118b8:	a9017bfd 	stp	x29, x30, [sp, #16]
   118bc:	910043fd 	add	x29, sp, #0x10
   118c0:	a9026ffc 	stp	x28, x27, [sp, #32]
   118c4:	a90367fa 	stp	x26, x25, [sp, #48]
   118c8:	a9045ff8 	stp	x24, x23, [sp, #64]
   118cc:	a90557f6 	stp	x22, x21, [sp, #80]
   118d0:	a9064ff4 	stp	x20, x19, [sp, #96]
   118d4:	d10903ff 	sub	sp, sp, #0x240
   118d8:	52920000 	mov	w0, #0x9000                	// #36864
   118dc:	72a07a00 	movk	w0, #0x3d0, lsl #16
   118e0:	940001d4 	bl	12030 <_Znwm@plt>
   118e4:	52920002 	mov	w2, #0x9000                	// #36864
   118e8:	2a1f03e1 	mov	w1, wzr
   118ec:	72a07a02 	movk	w2, #0x3d0, lsl #16
   118f0:	aa0003f3 	mov	x19, x0
   118f4:	94000203 	bl	12100 <memset@plt>
   118f8:	940001a6 	bl	11f90 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
   118fc:	f90007e0 	str	x0, [sp, #8]
   11900:	940001a8 	bl	11fa0 <_ZNSt6thread20hardware_concurrencyEv@plt>
   11904:	90ffff89 	adrp	x9, 1000 <__abi_tag+0xd3c>
   11908:	90ffff8a 	adrp	x10, 1000 <__abi_tag+0xd3c>
   1190c:	90ffff8c 	adrp	x12, 1000 <__abi_tag+0xd3c>
   11910:	7100041f 	cmp	w0, #0x1
   11914:	1a9f8408 	csinc	w8, w0, wzr, hi  // hi = pmore
   11918:	7100001f 	cmp	w0, #0x0
   1191c:	3dc05120 	ldr	q0, [x9, #320]
   11920:	5280004b 	mov	w11, #0x2                   	// #2
   11924:	aa1f03f8 	mov	x24, xzr
   11928:	aa1f03f5 	mov	x21, xzr
   1192c:	aa1f03f4 	mov	x20, xzr
   11930:	2a1f03f9 	mov	w25, wzr
   11934:	1a88017a 	csel	w26, w11, w8, eq  // eq = none
   11938:	3d800be0 	str	q0, [sp, #32]
   1193c:	3dc05540 	ldr	q0, [x10, #336]
   11940:	b81f83bf 	stur	wzr, [x29, #-8]
   11944:	fd40b188 	ldr	d8, [x12, #352]
   11948:	3d8007e0 	str	q0, [sp, #16]
   1194c:	14000006 	b	11964 <main+0xb0>
   11950:	aa1503fc 	mov	x28, x21
   11954:	91002395 	add	x21, x28, #0x8
   11958:	11000739 	add	w25, w25, #0x1
   1195c:	6b1a033f 	cmp	w25, w26
   11960:	54000ee0 	b.eq	11b3c <main+0x288>  // b.none
   11964:	eb1802bf 	cmp	x21, x24
   11968:	54000380 	b.eq	119d8 <main+0x124>  // b.none
   1196c:	f90002bf 	str	xzr, [x21]
   11970:	52800a00 	mov	w0, #0x50                  	// #80
   11974:	940001af 	bl	12030 <_Znwm@plt>
   11978:	b0000088 	adrp	x8, 22000 <memset@plt+0xff00>
   1197c:	ad4087e0 	ldp	q0, q1, [sp, #16]
   11980:	91050108 	add	x8, x8, #0x140
   11984:	fd001808 	str	d8, [x0, #48]
   11988:	f9001be0 	str	x0, [sp, #48]
   1198c:	a9004c08 	stp	x8, x19, [x0]
   11990:	5281f408 	mov	w8, #0xfa0                 	// #4000
   11994:	ad008001 	stp	q1, q0, [x0, #16]
   11998:	b9003808 	str	w8, [x0, #56]
   1199c:	d10023a8 	sub	x8, x29, #0x8
   119a0:	f9002008 	str	x8, [x0, #64]
   119a4:	d503201f 	nop
   119a8:	10ffec48 	adr	x8, 11730 <_Z14render_dynamicRSt6atomicIiEiijddddPj>
   119ac:	f9002408 	str	x8, [x0, #72]
   119b0:	9100c3e1 	add	x1, sp, #0x30
   119b4:	aa1503e0 	mov	x0, x21
   119b8:	aa1f03e2 	mov	x2, xzr
   119bc:	940001a5 	bl	12050 <_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@plt>
   119c0:	f9401be0 	ldr	x0, [sp, #48]
   119c4:	b4fffc60 	cbz	x0, 11950 <main+0x9c>
   119c8:	f9400008 	ldr	x8, [x0]
   119cc:	f9400508 	ldr	x8, [x8, #8]
   119d0:	d63f0100 	blr	x8
   119d4:	17ffffdf 	b	11950 <main+0x9c>
   119d8:	cb140316 	sub	x22, x24, x20
   119dc:	b27defe8 	mov	x8, #0x7ffffffffffffff8    	// #9223372036854775800
   119e0:	eb0802df 	cmp	x22, x8
   119e4:	54001ce0 	b.eq	11d80 <main+0x4cc>  // b.none
   119e8:	9343fedc 	asr	x28, x22, #3
   119ec:	f10002df 	cmp	x22, #0x0
   119f0:	9a9f1788 	csinc	x8, x28, xzr, ne  // ne = any
   119f4:	ab1c0108 	adds	x8, x8, x28
   119f8:	d37cfd09 	lsr	x9, x8, #60
   119fc:	1a9f37ea 	cset	w10, cs  // cs = hs, nlast
   11a00:	f100013f 	cmp	x9, #0x0
   11a04:	1a9f07e9 	cset	w9, ne  // ne = any
   11a08:	2a090149 	orr	w9, w10, w9
   11a0c:	7100013f 	cmp	w9, #0x0
   11a10:	92fe0009 	mov	x9, #0xfffffffffffffff     	// #1152921504606846975
   11a14:	9a88113b 	csel	x27, x9, x8, ne  // ne = any
   11a18:	b40000db 	cbz	x27, 11a30 <main+0x17c>
   11a1c:	d37df360 	lsl	x0, x27, #3
   11a20:	aa1803f5 	mov	x21, x24
   11a24:	94000183 	bl	12030 <_Znwm@plt>
   11a28:	aa0003f7 	mov	x23, x0
   11a2c:	14000002 	b	11a34 <main+0x180>
   11a30:	aa1f03f7 	mov	x23, xzr
   11a34:	8b1c0ef5 	add	x21, x23, x28, lsl #3
   11a38:	f90002bf 	str	xzr, [x21]
   11a3c:	52800a00 	mov	w0, #0x50                  	// #80
   11a40:	9400017c 	bl	12030 <_Znwm@plt>
   11a44:	b0000088 	adrp	x8, 22000 <memset@plt+0xff00>
   11a48:	ad4087e0 	ldp	q0, q1, [sp, #16]
   11a4c:	91050108 	add	x8, x8, #0x140
   11a50:	fd001808 	str	d8, [x0, #48]
   11a54:	f9001be0 	str	x0, [sp, #48]
   11a58:	a9004c08 	stp	x8, x19, [x0]
   11a5c:	5281f408 	mov	w8, #0xfa0                 	// #4000
   11a60:	ad008001 	stp	q1, q0, [x0, #16]
   11a64:	b9003808 	str	w8, [x0, #56]
   11a68:	d10023a8 	sub	x8, x29, #0x8
   11a6c:	f9002008 	str	x8, [x0, #64]
   11a70:	d503201f 	nop
   11a74:	10ffe5e8 	adr	x8, 11730 <_Z14render_dynamicRSt6atomicIiEiijddddPj>
   11a78:	f9002408 	str	x8, [x0, #72]
   11a7c:	9100c3e1 	add	x1, sp, #0x30
   11a80:	aa1503e0 	mov	x0, x21
   11a84:	aa1f03e2 	mov	x2, xzr
   11a88:	94000172 	bl	12050 <_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@plt>
   11a8c:	f9401be0 	ldr	x0, [sp, #48]
   11a90:	b4000080 	cbz	x0, 11aa0 <main+0x1ec>
   11a94:	f9400008 	ldr	x8, [x0]
   11a98:	f9400508 	ldr	x8, [x8, #8]
   11a9c:	d63f0100 	blr	x8
   11aa0:	6f00e402 	movi	v2.2d, #0x0
   11aa4:	aa1703fc 	mov	x28, x23
   11aa8:	eb18029f 	cmp	x20, x24
   11aac:	54000360 	b.eq	11b18 <main+0x264>  // b.none
   11ab0:	d10022c9 	sub	x9, x22, #0x8
   11ab4:	aa1703fc 	mov	x28, x23
   11ab8:	aa1403e8 	mov	x8, x20
   11abc:	f100613f 	cmp	x9, #0x18
   11ac0:	54000223 	b.cc	11b04 <main+0x250>  // b.lo, b.ul, b.last
   11ac4:	d343fd28 	lsr	x8, x9, #3
   11ac8:	910042ea 	add	x10, x23, #0x10
   11acc:	91000509 	add	x9, x8, #0x1
   11ad0:	aa1403eb 	mov	x11, x20
   11ad4:	927eed28 	and	x8, x9, #0x3ffffffffffffffc
   11ad8:	aa0803ec 	mov	x12, x8
   11adc:	8b080efc 	add	x28, x23, x8, lsl #3
   11ae0:	ad400560 	ldp	q0, q1, [x11]
   11ae4:	f100118c 	subs	x12, x12, #0x4
   11ae8:	ad3f8540 	stp	q0, q1, [x10, #-16]
   11aec:	9100814a 	add	x10, x10, #0x20
   11af0:	ac810962 	stp	q2, q2, [x11], #32
   11af4:	54ffff61 	b.ne	11ae0 <main+0x22c>  // b.any
   11af8:	eb08013f 	cmp	x9, x8
   11afc:	54000100 	b.eq	11b1c <main+0x268>  // b.none
   11b00:	8b080e88 	add	x8, x20, x8, lsl #3
   11b04:	f9400109 	ldr	x9, [x8]
   11b08:	f8008789 	str	x9, [x28], #8
   11b0c:	f800851f 	str	xzr, [x8], #8
   11b10:	eb18011f 	cmp	x8, x24
   11b14:	54ffff81 	b.ne	11b04 <main+0x250>  // b.any
   11b18:	b4000074 	cbz	x20, 11b24 <main+0x270>
   11b1c:	aa1403e0 	mov	x0, x20
   11b20:	94000148 	bl	12040 <_ZdlPv@plt>
   11b24:	8b1b0ef8 	add	x24, x23, x27, lsl #3
   11b28:	aa1703f4 	mov	x20, x23
   11b2c:	91002395 	add	x21, x28, #0x8
   11b30:	11000739 	add	w25, w25, #0x1
   11b34:	6b1a033f 	cmp	w25, w26
   11b38:	54fff161 	b.ne	11964 <main+0xb0>  // b.any
   11b3c:	eb15029f 	cmp	x20, x21
   11b40:	54000100 	b.eq	11b60 <main+0x2ac>  // b.none
   11b44:	aa1403f7 	mov	x23, x20
   11b48:	aa1703e0 	mov	x0, x23
   11b4c:	94000119 	bl	11fb0 <_ZNSt6thread4joinEv@plt>
   11b50:	910022e8 	add	x8, x23, #0x8
   11b54:	eb1c02ff 	cmp	x23, x28
   11b58:	aa0803f7 	mov	x23, x8
   11b5c:	54ffff61 	b.ne	11b48 <main+0x294>  // b.any
   11b60:	9400010c 	bl	11f90 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
   11b64:	aa0003f6 	mov	x22, x0
   11b68:	90ffff81 	adrp	x1, 1000 <__abi_tag+0xd3c>
   11b6c:	9100c3e0 	add	x0, sp, #0x30
   11b70:	91065c21 	add	x1, x1, #0x197
   11b74:	52800202 	mov	w2, #0x10                  	// #16
   11b78:	94000112 	bl	11fc0 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode@plt>
   11b7c:	90ffff81 	adrp	x1, 1000 <__abi_tag+0xd3c>
   11b80:	9100c3e0 	add	x0, sp, #0x30
   11b84:	9105a821 	add	x1, x1, #0x16a
   11b88:	52800062 	mov	w2, #0x3                   	// #3
   11b8c:	94000151 	bl	120d0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
   11b90:	9100c3e0 	add	x0, sp, #0x30
   11b94:	5281f401 	mov	w1, #0xfa0                 	// #4000
   11b98:	9400010e 	bl	11fd0 <_ZNSolsEi@plt>
   11b9c:	aa0003f8 	mov	x24, x0
   11ba0:	90ffff81 	adrp	x1, 1000 <__abi_tag+0xd3c>
   11ba4:	52800022 	mov	w2, #0x1                   	// #1
   11ba8:	9105a021 	add	x1, x1, #0x168
   11bac:	94000149 	bl	120d0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
   11bb0:	aa1803e0 	mov	x0, x24
   11bb4:	5281f401 	mov	w1, #0xfa0                 	// #4000
   11bb8:	94000106 	bl	11fd0 <_ZNSolsEi@plt>
   11bbc:	90ffff81 	adrp	x1, 1000 <__abi_tag+0xd3c>
   11bc0:	528000a2 	mov	w2, #0x5                   	// #5
   11bc4:	91069821 	add	x1, x1, #0x1a6
   11bc8:	94000142 	bl	120d0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
   11bcc:	f94007e8 	ldr	x8, [sp, #8]
   11bd0:	d2d09009 	mov	x9, #0x848000000000        	// #145685290680320
   11bd4:	f2e825c9 	movk	x9, #0x412e, lsl #48
   11bd8:	90ffff98 	adrp	x24, 1000 <__abi_tag+0xd3c>
   11bdc:	90ffff99 	adrp	x25, 1000 <__abi_tag+0xd3c>
   11be0:	aa1f03f7 	mov	x23, xzr
   11be4:	cb0802c8 	sub	x8, x22, x8
   11be8:	52848016 	mov	w22, #0x2400                	// #9216
   11bec:	9e670121 	fmov	d1, x9
   11bf0:	72a01e96 	movk	w22, #0xf4, lsl #16
   11bf4:	9105a318 	add	x24, x24, #0x168
   11bf8:	9105bb39 	add	x25, x25, #0x16e
   11bfc:	9e620100 	scvtf	d0, x8
   11c00:	1e611808 	fdiv	d8, d0, d1
   11c04:	14000004 	b	11c14 <main+0x360>
   11c08:	910006f7 	add	x23, x23, #0x1
   11c0c:	eb1602ff 	cmp	x23, x22
   11c10:	54000400 	b.eq	11c90 <main+0x3dc>  // b.none
   11c14:	b8777a68 	ldr	w8, [x19, x23, lsl #2]
   11c18:	710fa11f 	cmp	w8, #0x3e8
   11c1c:	540000e1 	b.ne	11c38 <main+0x384>  // b.any
   11c20:	90ffff81 	adrp	x1, 1000 <__abi_tag+0xd3c>
   11c24:	9100c3e0 	add	x0, sp, #0x30
   11c28:	91063821 	add	x1, x1, #0x18e
   11c2c:	528000c2 	mov	w2, #0x6                   	// #6
   11c30:	94000128 	bl	120d0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
   11c34:	1400000f 	b	11c70 <main+0x3bc>
   11c38:	12001d1a 	and	w26, w8, #0xff
   11c3c:	9100c3e0 	add	x0, sp, #0x30
   11c40:	2a1a03e1 	mov	w1, w26
   11c44:	940000e3 	bl	11fd0 <_ZNSolsEi@plt>
   11c48:	aa0003fb 	mov	x27, x0
   11c4c:	aa1803e1 	mov	x1, x24
   11c50:	52800022 	mov	w2, #0x1                   	// #1
   11c54:	9400011f 	bl	120d0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
   11c58:	aa1b03e0 	mov	x0, x27
   11c5c:	2a1a03e1 	mov	w1, w26
   11c60:	940000dc 	bl	11fd0 <_ZNSolsEi@plt>
   11c64:	aa1903e1 	mov	x1, x25
   11c68:	528000a2 	mov	w2, #0x5                   	// #5
   11c6c:	94000119 	bl	120d0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
   11c70:	f2400eff 	tst	x23, #0xf
   11c74:	54fffca1 	b.ne	11c08 <main+0x354>  // b.any
   11c78:	90ffff81 	adrp	x1, 1000 <__abi_tag+0xd3c>
   11c7c:	9100c3e0 	add	x0, sp, #0x30
   11c80:	91065421 	add	x1, x1, #0x195
   11c84:	52800022 	mov	w2, #0x1                   	// #1
   11c88:	94000112 	bl	120d0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
   11c8c:	17ffffdf 	b	11c08 <main+0x354>
   11c90:	9100c3e8 	add	x8, sp, #0x30
   11c94:	91002116 	add	x22, x8, #0x8
   11c98:	aa1603e0 	mov	x0, x22
   11c9c:	94000105 	bl	120b0 <_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv@plt>
   11ca0:	b5000100 	cbnz	x0, 11cc0 <main+0x40c>
   11ca4:	f9401be8 	ldr	x8, [sp, #48]
   11ca8:	9100c3e9 	add	x9, sp, #0x30
   11cac:	f85e8108 	ldur	x8, [x8, #-24]
   11cb0:	8b080120 	add	x0, x9, x8
   11cb4:	b9402008 	ldr	w8, [x0, #32]
   11cb8:	321e0101 	orr	w1, w8, #0x4
   11cbc:	940000f9 	bl	120a0 <_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@plt>
   11cc0:	d2c80008 	mov	x8, #0x400000000000        	// #70368744177664
   11cc4:	90ffff80 	adrp	x0, 1000 <__abi_tag+0xd3c>
   11cc8:	f2e811e8 	movk	x8, #0x408f, lsl #48
   11ccc:	9106b000 	add	x0, x0, #0x1ac
   11cd0:	9e670100 	fmov	d0, x8
   11cd4:	d2d09008 	mov	x8, #0x848000000000        	// #145685290680320
   11cd8:	f2e82dc8 	movk	x8, #0x416e, lsl #48
   11cdc:	1e600900 	fmul	d0, d8, d0
   11ce0:	9e670101 	fmov	d1, x8
   11ce4:	1e601821 	fdiv	d1, d1, d0
   11ce8:	1e604100 	fmov	d0, d8
   11cec:	940000bd 	bl	11fe0 <printf@plt>
   11cf0:	b0000088 	adrp	x8, 22000 <memset@plt+0xff00>
   11cf4:	aa1603e0 	mov	x0, x22
   11cf8:	9100c3f7 	add	x23, sp, #0x30
   11cfc:	f941b908 	ldr	x8, [x8, #880]
   11d00:	f9400109 	ldr	x9, [x8]
   11d04:	f9400d08 	ldr	x8, [x8, #24]
   11d08:	f9001be9 	str	x9, [sp, #48]
   11d0c:	f85e8129 	ldur	x9, [x9, #-24]
   11d10:	f8296ae8 	str	x8, [x23, x9]
   11d14:	940000df 	bl	12090 <_ZNSt13basic_filebufIcSt11char_traitsIcEED2Ev@plt>
   11d18:	910402e0 	add	x0, x23, #0x100
   11d1c:	940000e9 	bl	120c0 <_ZNSt8ios_baseD2Ev@plt>
   11d20:	eb15029f 	cmp	x20, x21
   11d24:	540000e0 	b.eq	11d40 <main+0x48c>  // b.none
   11d28:	d1002288 	sub	x8, x20, #0x8
   11d2c:	f9400509 	ldr	x9, [x8, #8]
   11d30:	b5000269 	cbnz	x9, 11d7c <main+0x4c8>
   11d34:	91002108 	add	x8, x8, #0x8
   11d38:	eb1c011f 	cmp	x8, x28
   11d3c:	54ffff81 	b.ne	11d2c <main+0x478>  // b.any
   11d40:	b4000074 	cbz	x20, 11d4c <main+0x498>
   11d44:	aa1403e0 	mov	x0, x20
   11d48:	940000be 	bl	12040 <_ZdlPv@plt>
   11d4c:	aa1303e0 	mov	x0, x19
   11d50:	940000bc 	bl	12040 <_ZdlPv@plt>
   11d54:	2a1f03e0 	mov	w0, wzr
   11d58:	910903ff 	add	sp, sp, #0x240
   11d5c:	a9464ff4 	ldp	x20, x19, [sp, #96]
   11d60:	a94557f6 	ldp	x22, x21, [sp, #80]
   11d64:	a9445ff8 	ldp	x24, x23, [sp, #64]
   11d68:	a94367fa 	ldp	x26, x25, [sp, #48]
   11d6c:	a9426ffc 	ldp	x28, x27, [sp, #32]
   11d70:	a9417bfd 	ldp	x29, x30, [sp, #16]
   11d74:	fc4707e8 	ldr	d8, [sp], #112
   11d78:	d65f03c0 	ret
   11d7c:	940000a9 	bl	12020 <_ZSt9terminatev@plt>
   11d80:	90ffff80 	adrp	x0, 1000 <__abi_tag+0xd3c>
   11d84:	9105d000 	add	x0, x0, #0x174
   11d88:	9400009e 	bl	12000 <_ZSt20__throw_length_errorPKc@plt>
   11d8c:	aa0003f6 	mov	x22, x0
   11d90:	14000028 	b	11e30 <main+0x57c>
   11d94:	14000024 	b	11e24 <main+0x570>
   11d98:	f9401be8 	ldr	x8, [sp, #48]
   11d9c:	aa0003f5 	mov	x21, x0
   11da0:	b40000e8 	cbz	x8, 11dbc <main+0x508>
   11da4:	f9400109 	ldr	x9, [x8]
   11da8:	aa0803e0 	mov	x0, x8
   11dac:	f9400529 	ldr	x9, [x9, #8]
   11db0:	d63f0120 	blr	x9
   11db4:	14000002 	b	11dbc <main+0x508>
   11db8:	aa0003f5 	mov	x21, x0
   11dbc:	aa1503e0 	mov	x0, x21
   11dc0:	94000094 	bl	12010 <__cxa_begin_catch@plt>
   11dc4:	aa1703e0 	mov	x0, x23
   11dc8:	9400009e 	bl	12040 <_ZdlPv@plt>
   11dcc:	940000a9 	bl	12070 <__cxa_rethrow@plt>
   11dd0:	aa0003f6 	mov	x22, x0
   11dd4:	aa1803f5 	mov	x21, x24
   11dd8:	14000016 	b	11e30 <main+0x57c>
   11ddc:	aa0003f6 	mov	x22, x0
   11de0:	14000014 	b	11e30 <main+0x57c>
   11de4:	f9401be8 	ldr	x8, [sp, #48]
   11de8:	aa0003f6 	mov	x22, x0
   11dec:	b4000228 	cbz	x8, 11e30 <main+0x57c>
   11df0:	f9400109 	ldr	x9, [x8]
   11df4:	aa0803e0 	mov	x0, x8
   11df8:	f9400529 	ldr	x9, [x9, #8]
   11dfc:	d63f0120 	blr	x9
   11e00:	1400000c 	b	11e30 <main+0x57c>
   11e04:	aa0003f6 	mov	x22, x0
   11e08:	9400009e 	bl	12080 <__cxa_end_catch@plt>
   11e0c:	aa1803f5 	mov	x21, x24
   11e10:	14000008 	b	11e30 <main+0x57c>
   11e14:	9400001d 	bl	11e88 <__clang_call_terminate>
   11e18:	aa0003f6 	mov	x22, x0
   11e1c:	14000005 	b	11e30 <main+0x57c>
   11e20:	14000001 	b	11e24 <main+0x570>
   11e24:	aa0003f6 	mov	x22, x0
   11e28:	9100c3e0 	add	x0, sp, #0x30
   11e2c:	94000071 	bl	11ff0 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@plt>
   11e30:	aa1403e0 	mov	x0, x20
   11e34:	aa1503e1 	mov	x1, x21
   11e38:	94000005 	bl	11e4c <_ZNSt6vectorISt6threadSaIS0_EED2Ev>
   11e3c:	aa1303e0 	mov	x0, x19
   11e40:	94000080 	bl	12040 <_ZdlPv@plt>
   11e44:	aa1603e0 	mov	x0, x22
   11e48:	940000a6 	bl	120e0 <_Unwind_Resume@plt>

0000000000011e4c <_ZNSt6vectorISt6threadSaIS0_EED2Ev>:
   11e4c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   11e50:	910003fd 	mov	x29, sp
   11e54:	eb01001f 	cmp	x0, x1
   11e58:	540000c0 	b.eq	11e70 <_ZNSt6vectorISt6threadSaIS0_EED2Ev+0x24>  // b.none
   11e5c:	aa0003e8 	mov	x8, x0
   11e60:	f8408509 	ldr	x9, [x8], #8
   11e64:	b5000109 	cbnz	x9, 11e84 <_ZNSt6vectorISt6threadSaIS0_EED2Ev+0x38>
   11e68:	eb01011f 	cmp	x8, x1
   11e6c:	54ffffa1 	b.ne	11e60 <_ZNSt6vectorISt6threadSaIS0_EED2Ev+0x14>  // b.any
   11e70:	b4000060 	cbz	x0, 11e7c <_ZNSt6vectorISt6threadSaIS0_EED2Ev+0x30>
   11e74:	a8c17bfd 	ldp	x29, x30, [sp], #16
   11e78:	14000072 	b	12040 <_ZdlPv@plt>
   11e7c:	a8c17bfd 	ldp	x29, x30, [sp], #16
   11e80:	d65f03c0 	ret
   11e84:	94000067 	bl	12020 <_ZSt9terminatev@plt>

0000000000011e88 <__clang_call_terminate>:
   11e88:	f81f0ffe 	str	x30, [sp, #-16]!
   11e8c:	94000061 	bl	12010 <__cxa_begin_catch@plt>
   11e90:	94000064 	bl	12020 <_ZSt9terminatev@plt>

0000000000011e94 <_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvRSt6atomicIiEiijddddPjESt17reference_wrapperIS4_EiijddddS6_EEEEED0Ev>:
   11e94:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   11e98:	f9000bf3 	str	x19, [sp, #16]
   11e9c:	910003fd 	mov	x29, sp
   11ea0:	aa0003f3 	mov	x19, x0
   11ea4:	9400006f 	bl	12060 <_ZNSt6thread6_StateD2Ev@plt>
   11ea8:	aa1303e0 	mov	x0, x19
   11eac:	f9400bf3 	ldr	x19, [sp, #16]
   11eb0:	a8c27bfd 	ldp	x29, x30, [sp], #32
   11eb4:	14000063 	b	12040 <_ZdlPv@plt>

0000000000011eb8 <_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvRSt6atomicIiEiijddddPjESt17reference_wrapperIS4_EiijddddS6_EEEEE6_M_runEv>:
   11eb8:	a9441408 	ldp	x8, x5, [x0, #64]
   11ebc:	6d420001 	ldp	d1, d0, [x0, #32]
   11ec0:	6d410803 	ldp	d3, d2, [x0, #16]
   11ec4:	29468402 	ldp	w2, w1, [x0, #52]
   11ec8:	b9403003 	ldr	w3, [x0, #48]
   11ecc:	f9400404 	ldr	x4, [x0, #8]
   11ed0:	aa0803e0 	mov	x0, x8
   11ed4:	d61f00a0 	br	x5

Disassembly of section .init:

0000000000011ed8 <_init>:
   11ed8:	d503201f 	nop
   11edc:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   11ee0:	910003fd 	mov	x29, sp
   11ee4:	97fffdb4 	bl	115b4 <call_weak_fn>
   11ee8:	a8c17bfd 	ldp	x29, x30, [sp], #16
   11eec:	d65f03c0 	ret

Disassembly of section .fini:

0000000000011ef0 <_fini>:
   11ef0:	d503201f 	nop
   11ef4:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   11ef8:	910003fd 	mov	x29, sp
   11efc:	a8c17bfd 	ldp	x29, x30, [sp], #16
   11f00:	d65f03c0 	ret

Disassembly of section .plt:

0000000000011f10 <abort@plt-0x20>:
   11f10:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
   11f14:	b0000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   11f18:	f941d211 	ldr	x17, [x16, #928]
   11f1c:	910e8210 	add	x16, x16, #0x3a0
   11f20:	d61f0220 	br	x17
   11f24:	d503201f 	nop
   11f28:	d503201f 	nop
   11f2c:	d503201f 	nop

0000000000011f30 <abort@plt>:
   11f30:	b0000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   11f34:	f941d611 	ldr	x17, [x16, #936]
   11f38:	910ea210 	add	x16, x16, #0x3a8
   11f3c:	d61f0220 	br	x17

0000000000011f40 <__libc_start_main@plt>:
   11f40:	b0000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   11f44:	f941da11 	ldr	x17, [x16, #944]
   11f48:	910ec210 	add	x16, x16, #0x3b0
   11f4c:	d61f0220 	br	x17

0000000000011f50 <__gmon_start__@plt>:
   11f50:	b0000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   11f54:	f941de11 	ldr	x17, [x16, #952]
   11f58:	910ee210 	add	x16, x16, #0x3b8
   11f5c:	d61f0220 	br	x17

0000000000011f60 <__cxa_finalize@plt>:
   11f60:	b0000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   11f64:	f941e211 	ldr	x17, [x16, #960]
   11f68:	910f0210 	add	x16, x16, #0x3c0
   11f6c:	d61f0220 	br	x17

0000000000011f70 <_ZNSt8ios_base4InitC1Ev@plt>:
   11f70:	b0000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   11f74:	f941e611 	ldr	x17, [x16, #968]
   11f78:	910f2210 	add	x16, x16, #0x3c8
   11f7c:	d61f0220 	br	x17

0000000000011f80 <__cxa_atexit@plt>:
   11f80:	b0000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   11f84:	f941ea11 	ldr	x17, [x16, #976]
   11f88:	910f4210 	add	x16, x16, #0x3d0
   11f8c:	d61f0220 	br	x17

0000000000011f90 <_ZNSt6chrono3_V212system_clock3nowEv@plt>:
   11f90:	b0000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   11f94:	f941ee11 	ldr	x17, [x16, #984]
   11f98:	910f6210 	add	x16, x16, #0x3d8
   11f9c:	d61f0220 	br	x17

0000000000011fa0 <_ZNSt6thread20hardware_concurrencyEv@plt>:
   11fa0:	b0000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   11fa4:	f941f211 	ldr	x17, [x16, #992]
   11fa8:	910f8210 	add	x16, x16, #0x3e0
   11fac:	d61f0220 	br	x17

0000000000011fb0 <_ZNSt6thread4joinEv@plt>:
   11fb0:	b0000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   11fb4:	f941f611 	ldr	x17, [x16, #1000]
   11fb8:	910fa210 	add	x16, x16, #0x3e8
   11fbc:	d61f0220 	br	x17

0000000000011fc0 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode@plt>:
   11fc0:	b0000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   11fc4:	f941fa11 	ldr	x17, [x16, #1008]
   11fc8:	910fc210 	add	x16, x16, #0x3f0
   11fcc:	d61f0220 	br	x17

0000000000011fd0 <_ZNSolsEi@plt>:
   11fd0:	b0000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   11fd4:	f941fe11 	ldr	x17, [x16, #1016]
   11fd8:	910fe210 	add	x16, x16, #0x3f8
   11fdc:	d61f0220 	br	x17

0000000000011fe0 <printf@plt>:
   11fe0:	b0000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   11fe4:	f9420211 	ldr	x17, [x16, #1024]
   11fe8:	91100210 	add	x16, x16, #0x400
   11fec:	d61f0220 	br	x17

0000000000011ff0 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@plt>:
   11ff0:	b0000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   11ff4:	f9420611 	ldr	x17, [x16, #1032]
   11ff8:	91102210 	add	x16, x16, #0x408
   11ffc:	d61f0220 	br	x17

0000000000012000 <_ZSt20__throw_length_errorPKc@plt>:
   12000:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   12004:	f9420a11 	ldr	x17, [x16, #1040]
   12008:	91104210 	add	x16, x16, #0x410
   1200c:	d61f0220 	br	x17

0000000000012010 <__cxa_begin_catch@plt>:
   12010:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   12014:	f9420e11 	ldr	x17, [x16, #1048]
   12018:	91106210 	add	x16, x16, #0x418
   1201c:	d61f0220 	br	x17

0000000000012020 <_ZSt9terminatev@plt>:
   12020:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   12024:	f9421211 	ldr	x17, [x16, #1056]
   12028:	91108210 	add	x16, x16, #0x420
   1202c:	d61f0220 	br	x17

0000000000012030 <_Znwm@plt>:
   12030:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   12034:	f9421611 	ldr	x17, [x16, #1064]
   12038:	9110a210 	add	x16, x16, #0x428
   1203c:	d61f0220 	br	x17

0000000000012040 <_ZdlPv@plt>:
   12040:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   12044:	f9421a11 	ldr	x17, [x16, #1072]
   12048:	9110c210 	add	x16, x16, #0x430
   1204c:	d61f0220 	br	x17

0000000000012050 <_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@plt>:
   12050:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   12054:	f9421e11 	ldr	x17, [x16, #1080]
   12058:	9110e210 	add	x16, x16, #0x438
   1205c:	d61f0220 	br	x17

0000000000012060 <_ZNSt6thread6_StateD2Ev@plt>:
   12060:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   12064:	f9422211 	ldr	x17, [x16, #1088]
   12068:	91110210 	add	x16, x16, #0x440
   1206c:	d61f0220 	br	x17

0000000000012070 <__cxa_rethrow@plt>:
   12070:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   12074:	f9422611 	ldr	x17, [x16, #1096]
   12078:	91112210 	add	x16, x16, #0x448
   1207c:	d61f0220 	br	x17

0000000000012080 <__cxa_end_catch@plt>:
   12080:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   12084:	f9422a11 	ldr	x17, [x16, #1104]
   12088:	91114210 	add	x16, x16, #0x450
   1208c:	d61f0220 	br	x17

0000000000012090 <_ZNSt13basic_filebufIcSt11char_traitsIcEED2Ev@plt>:
   12090:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   12094:	f9422e11 	ldr	x17, [x16, #1112]
   12098:	91116210 	add	x16, x16, #0x458
   1209c:	d61f0220 	br	x17

00000000000120a0 <_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@plt>:
   120a0:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   120a4:	f9423211 	ldr	x17, [x16, #1120]
   120a8:	91118210 	add	x16, x16, #0x460
   120ac:	d61f0220 	br	x17

00000000000120b0 <_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv@plt>:
   120b0:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   120b4:	f9423611 	ldr	x17, [x16, #1128]
   120b8:	9111a210 	add	x16, x16, #0x468
   120bc:	d61f0220 	br	x17

00000000000120c0 <_ZNSt8ios_baseD2Ev@plt>:
   120c0:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   120c4:	f9423a11 	ldr	x17, [x16, #1136]
   120c8:	9111c210 	add	x16, x16, #0x470
   120cc:	d61f0220 	br	x17

00000000000120d0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>:
   120d0:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   120d4:	f9423e11 	ldr	x17, [x16, #1144]
   120d8:	9111e210 	add	x16, x16, #0x478
   120dc:	d61f0220 	br	x17

00000000000120e0 <_Unwind_Resume@plt>:
   120e0:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   120e4:	f9424211 	ldr	x17, [x16, #1152]
   120e8:	91120210 	add	x16, x16, #0x480
   120ec:	d61f0220 	br	x17

00000000000120f0 <__getauxval@plt>:
   120f0:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   120f4:	f9424611 	ldr	x17, [x16, #1160]
   120f8:	91122210 	add	x16, x16, #0x488
   120fc:	d61f0220 	br	x17

0000000000012100 <memset@plt>:
   12100:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfe90>
   12104:	f9424a11 	ldr	x17, [x16, #1168]
   12108:	91124210 	add	x16, x16, #0x490
   1210c:	d61f0220 	br	x17
