
/bench/bench:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000011340 <_start>:
   11340:	d503201f 	nop
   11344:	d280001d 	mov	x29, #0x0                   	// #0
   11348:	d280001e 	mov	x30, #0x0                   	// #0
   1134c:	aa0003e5 	mov	x5, x0
   11350:	f94003e1 	ldr	x1, [sp]
   11354:	910023e2 	add	x2, sp, #0x8
   11358:	910003e6 	mov	x6, sp
   1135c:	d503201f 	nop
   11360:	10001c00 	adr	x0, 116e0 <main>
   11364:	d2800003 	mov	x3, #0x0                   	// #0
   11368:	d2800004 	mov	x4, #0x0                   	// #0
   1136c:	94000341 	bl	12070 <__libc_start_main@plt>
   11370:	9400033c 	bl	12060 <abort@plt>

0000000000011374 <call_weak_fn>:
   11374:	b0000080 	adrp	x0, 22000 <__getauxval@plt+0xfe50>
   11378:	f9421800 	ldr	x0, [x0, #1072]
   1137c:	b4000040 	cbz	x0, 11384 <call_weak_fn+0x10>
   11380:	14000340 	b	12080 <__gmon_start__@plt>
   11384:	d65f03c0 	ret
	...

0000000000011390 <deregister_tm_clones>:
   11390:	d503201f 	nop
   11394:	101086e0 	adr	x0, 32470 <__TMC_END__>
   11398:	d503201f 	nop
   1139c:	101086a1 	adr	x1, 32470 <__TMC_END__>
   113a0:	eb00003f 	cmp	x1, x0
   113a4:	540000c0 	b.eq	113bc <deregister_tm_clones+0x2c>  // b.none
   113a8:	b0000081 	adrp	x1, 22000 <__getauxval@plt+0xfe50>
   113ac:	f9421c21 	ldr	x1, [x1, #1080]
   113b0:	b4000061 	cbz	x1, 113bc <deregister_tm_clones+0x2c>
   113b4:	aa0103f0 	mov	x16, x1
   113b8:	d61f0200 	br	x16
   113bc:	d65f03c0 	ret

00000000000113c0 <register_tm_clones>:
   113c0:	d503201f 	nop
   113c4:	10108560 	adr	x0, 32470 <__TMC_END__>
   113c8:	d503201f 	nop
   113cc:	10108521 	adr	x1, 32470 <__TMC_END__>
   113d0:	cb000021 	sub	x1, x1, x0
   113d4:	d37ffc22 	lsr	x2, x1, #63
   113d8:	8b810c41 	add	x1, x2, x1, asr #3
   113dc:	9341fc21 	asr	x1, x1, #1
   113e0:	b40000c1 	cbz	x1, 113f8 <register_tm_clones+0x38>
   113e4:	b0000082 	adrp	x2, 22000 <__getauxval@plt+0xfe50>
   113e8:	f9422042 	ldr	x2, [x2, #1088]
   113ec:	b4000062 	cbz	x2, 113f8 <register_tm_clones+0x38>
   113f0:	aa0203f0 	mov	x16, x2
   113f4:	d61f0200 	br	x16
   113f8:	d65f03c0 	ret
   113fc:	d503201f 	nop

0000000000011400 <__do_global_dtors_aux>:
   11400:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   11404:	910003fd 	mov	x29, sp
   11408:	f9000bf3 	str	x19, [sp, #16]
   1140c:	b0000113 	adrp	x19, 32000 <_DYNAMIC+0xfda8>
   11410:	3954e260 	ldrb	w0, [x19, #1336]
   11414:	35000140 	cbnz	w0, 1143c <__do_global_dtors_aux+0x3c>
   11418:	b0000080 	adrp	x0, 22000 <__getauxval@plt+0xfe50>
   1141c:	f9422400 	ldr	x0, [x0, #1096]
   11420:	b4000080 	cbz	x0, 11430 <__do_global_dtors_aux+0x30>
   11424:	b0000100 	adrp	x0, 32000 <_DYNAMIC+0xfda8>
   11428:	f9423000 	ldr	x0, [x0, #1120]
   1142c:	94000319 	bl	12090 <__cxa_finalize@plt>
   11430:	97ffffd8 	bl	11390 <deregister_tm_clones>
   11434:	52800020 	mov	w0, #0x1                   	// #1
   11438:	3914e260 	strb	w0, [x19, #1336]
   1143c:	f9400bf3 	ldr	x19, [sp, #16]
   11440:	a8c27bfd 	ldp	x29, x30, [sp], #32
   11444:	d65f03c0 	ret
   11448:	d503201f 	nop
   1144c:	d503201f 	nop

0000000000011450 <frame_dummy>:
   11450:	17ffffdc 	b	113c0 <register_tm_clones>
	...

0000000000011460 <__aarch64_cas8_relax>:
   11460:	d503245f 	bti	c
   11464:	b0000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   11468:	3954e610 	ldrb	w16, [x16, #1337]
   1146c:	34000070 	cbz	w16, 11478 <__aarch64_cas8_relax+0x18>
   11470:	c8a07c41 	cas	x0, x1, [x2]
   11474:	d65f03c0 	ret
   11478:	aa0003f0 	mov	x16, x0
   1147c:	c85f7c40 	ldxr	x0, [x2]
   11480:	eb10001f 	cmp	x0, x16
   11484:	54000061 	b.ne	11490 <__aarch64_cas8_relax+0x30>  // b.any
   11488:	c8117c41 	stxr	w17, x1, [x2]
   1148c:	35ffff91 	cbnz	w17, 1147c <__aarch64_cas8_relax+0x1c>
   11490:	d65f03c0 	ret
	...

00000000000114a0 <init_have_lse_atomics>:
   114a0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   114a4:	d2800200 	mov	x0, #0x10                  	// #16
   114a8:	910003fd 	mov	x29, sp
   114ac:	94000341 	bl	121b0 <__getauxval@plt>
   114b0:	53082000 	ubfx	w0, w0, #8, #1
   114b4:	b0000101 	adrp	x1, 32000 <_DYNAMIC+0xfda8>
   114b8:	a8c17bfd 	ldp	x29, x30, [sp], #16
   114bc:	3914e420 	strb	w0, [x1, #1337]
   114c0:	d65f03c0 	ret
	...

00000000000114d0 <__aarch64_ldadd8_relax>:
   114d0:	d503245f 	bti	c
   114d4:	b0000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   114d8:	3954e610 	ldrb	w16, [x16, #1337]
   114dc:	34000070 	cbz	w16, 114e8 <__aarch64_ldadd8_relax+0x18>
   114e0:	f8200020 	ldadd	x0, x0, [x1]
   114e4:	d65f03c0 	ret
   114e8:	aa0003f0 	mov	x16, x0
   114ec:	c85f7c20 	ldxr	x0, [x1]
   114f0:	8b100011 	add	x17, x0, x16
   114f4:	c80f7c31 	stxr	w15, x17, [x1]
   114f8:	35ffffaf 	cbnz	w15, 114ec <__aarch64_ldadd8_relax+0x1c>
   114fc:	d65f03c0 	ret

0000000000011500 <_Z15producer_threadP5QueueiP12ThreadResult>:
   11500:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
   11504:	f9000bfb 	str	x27, [sp, #16]
   11508:	910003fd 	mov	x29, sp
   1150c:	a90267fa 	stp	x26, x25, [sp, #32]
   11510:	a9035ff8 	stp	x24, x23, [sp, #48]
   11514:	a90457f6 	stp	x22, x21, [sp, #64]
   11518:	a9054ff4 	stp	x20, x19, [sp, #80]
   1151c:	52884818 	mov	w24, #0x4240                	// #16960
   11520:	aa0203f3 	mov	x19, x2
   11524:	72a001f8 	movk	w24, #0xf, lsl #16
   11528:	aa0003f4 	mov	x20, x0
   1152c:	aa1f03f9 	mov	x25, xzr
   11530:	91440015 	add	x21, x0, #0x100, lsl #12
   11534:	9b387c3a 	smull	x26, w1, w24
   11538:	14000002 	b	11540 <_Z15producer_threadP5QueueiP12ThreadResult+0x40>
   1153c:	940002f5 	bl	12110 <sched_yield@plt>
   11540:	f94002b6 	ldr	x22, [x21]
   11544:	8b36329b 	add	x27, x20, w22, uxth #4
   11548:	c8dfff68 	ldar	x8, [x27]
   1154c:	eb160108 	subs	x8, x8, x22
   11550:	540000a0 	b.eq	11564 <_Z15producer_threadP5QueueiP12ThreadResult+0x64>  // b.none
   11554:	b7ffff48 	tbnz	x8, #63, 1153c <_Z15producer_threadP5QueueiP12ThreadResult+0x3c>
   11558:	f94002b6 	ldr	x22, [x21]
   1155c:	d5033fdf 	isb
   11560:	17fffff9 	b	11544 <_Z15producer_threadP5QueueiP12ThreadResult+0x44>
   11564:	910006d7 	add	x23, x22, #0x1
   11568:	aa1603e0 	mov	x0, x22
   1156c:	aa1703e1 	mov	x1, x23
   11570:	aa1503e2 	mov	x2, x21
   11574:	97ffffbb 	bl	11460 <__aarch64_cas8_relax>
   11578:	eb16001f 	cmp	x0, x22
   1157c:	54000080 	b.eq	1158c <_Z15producer_threadP5QueueiP12ThreadResult+0x8c>  // b.none
   11580:	aa0003f6 	mov	x22, x0
   11584:	d5033fdf 	isb
   11588:	17ffffef 	b	11544 <_Z15producer_threadP5QueueiP12ThreadResult+0x44>
   1158c:	92403ec8 	and	x8, x22, #0xffff
   11590:	91000739 	add	x25, x25, #0x1
   11594:	8b1a0329 	add	x9, x25, x26
   11598:	eb18033f 	cmp	x25, x24
   1159c:	8b081288 	add	x8, x20, x8, lsl #4
   115a0:	f9000509 	str	x9, [x8, #8]
   115a4:	c89fff77 	stlr	x23, [x27]
   115a8:	54fffcc1 	b.ne	11540 <_Z15producer_threadP5QueueiP12ThreadResult+0x40>  // b.any
   115ac:	f9000678 	str	x24, [x19, #8]
   115b0:	f9400bfb 	ldr	x27, [sp, #16]
   115b4:	a9454ff4 	ldp	x20, x19, [sp, #80]
   115b8:	a94457f6 	ldp	x22, x21, [sp, #64]
   115bc:	a9435ff8 	ldp	x24, x23, [sp, #48]
   115c0:	a94267fa 	ldp	x26, x25, [sp, #32]
   115c4:	a8c67bfd 	ldp	x29, x30, [sp], #96
   115c8:	d65f03c0 	ret

00000000000115cc <_Z15consumer_threadP5QueuePSt6atomicImEmP12ThreadResult>:
   115cc:	d101c3ff 	sub	sp, sp, #0x70
   115d0:	a9027bfd 	stp	x29, x30, [sp, #32]
   115d4:	910083fd 	add	x29, sp, #0x20
   115d8:	f9001bf9 	str	x25, [sp, #48]
   115dc:	a9045ff8 	stp	x24, x23, [sp, #64]
   115e0:	a90557f6 	stp	x22, x21, [sp, #80]
   115e4:	a9064ff4 	stp	x20, x19, [sp, #96]
   115e8:	f9400028 	ldr	x8, [x1]
   115ec:	aa0303f3 	mov	x19, x3
   115f0:	6f00e400 	movi	v0.2d, #0x0
   115f4:	eb02011f 	cmp	x8, x2
   115f8:	3d8007e0 	str	q0, [sp, #16]
   115fc:	54000602 	b.cs	116bc <_Z15consumer_threadP5QueuePSt6atomicImEmP12ThreadResult+0xf0>  // b.hs, b.nlast
   11600:	52800029 	mov	w9, #0x1                   	// #1
   11604:	91440008 	add	x8, x0, #0x100, lsl #12
   11608:	6f00e401 	movi	v1.2d, #0x0
   1160c:	aa0203f4 	mov	x20, x2
   11610:	aa0103f5 	mov	x21, x1
   11614:	aa0003f6 	mov	x22, x0
   11618:	91010117 	add	x23, x8, #0x40
   1161c:	4e080d20 	dup	v0.2d, x9
   11620:	ad0007e0 	stp	q0, q1, [sp]
   11624:	14000005 	b	11638 <_Z15consumer_threadP5QueuePSt6atomicImEmP12ThreadResult+0x6c>
   11628:	940002ba 	bl	12110 <sched_yield@plt>
   1162c:	f94002a8 	ldr	x8, [x21]
   11630:	eb14011f 	cmp	x8, x20
   11634:	54000442 	b.cs	116bc <_Z15consumer_threadP5QueuePSt6atomicImEmP12ThreadResult+0xf0>  // b.hs, b.nlast
   11638:	f94002f8 	ldr	x24, [x23]
   1163c:	8b3832d9 	add	x25, x22, w24, uxth #4
   11640:	91000701 	add	x1, x24, #0x1
   11644:	c8dfff28 	ldar	x8, [x25]
   11648:	eb010108 	subs	x8, x8, x1
   1164c:	540000a0 	b.eq	11660 <_Z15consumer_threadP5QueuePSt6atomicImEmP12ThreadResult+0x94>  // b.none
   11650:	b7fffec8 	tbnz	x8, #63, 11628 <_Z15consumer_threadP5QueuePSt6atomicImEmP12ThreadResult+0x5c>
   11654:	f94002f8 	ldr	x24, [x23]
   11658:	d5033fdf 	isb
   1165c:	17fffff8 	b	1163c <_Z15consumer_threadP5QueuePSt6atomicImEmP12ThreadResult+0x70>
   11660:	aa1803e0 	mov	x0, x24
   11664:	aa1703e2 	mov	x2, x23
   11668:	97ffff7e 	bl	11460 <__aarch64_cas8_relax>
   1166c:	eb18001f 	cmp	x0, x24
   11670:	54000080 	b.eq	11680 <_Z15consumer_threadP5QueuePSt6atomicImEmP12ThreadResult+0xb4>  // b.none
   11674:	aa0003f8 	mov	x24, x0
   11678:	d5033fdf 	isb
   1167c:	17fffff0 	b	1163c <_Z15consumer_threadP5QueuePSt6atomicImEmP12ThreadResult+0x70>
   11680:	92403f08 	and	x8, x24, #0xffff
   11684:	52800020 	mov	w0, #0x1                   	// #1
   11688:	ad4007e0 	ldp	q0, q1, [sp]
   1168c:	8b0812c8 	add	x8, x22, x8, lsl #4
   11690:	aa1503e1 	mov	x1, x21
   11694:	91002108 	add	x8, x8, #0x8
   11698:	0d408500 	ld1	{v0.d}[0], [x8]
   1169c:	91404308 	add	x8, x24, #0x10, lsl #12
   116a0:	4ee18401 	add	v1.2d, v0.2d, v1.2d
   116a4:	3d8007e1 	str	q1, [sp, #16]
   116a8:	c89fff28 	stlr	x8, [x25]
   116ac:	97ffff89 	bl	114d0 <__aarch64_ldadd8_relax>
   116b0:	f94002a8 	ldr	x8, [x21]
   116b4:	eb14011f 	cmp	x8, x20
   116b8:	54fffc03 	b.cc	11638 <_Z15consumer_threadP5QueuePSt6atomicImEmP12ThreadResult+0x6c>  // b.lo, b.ul, b.last
   116bc:	3dc007e0 	ldr	q0, [sp, #16]
   116c0:	a94557f6 	ldp	x22, x21, [sp, #80]
   116c4:	3d800260 	str	q0, [x19]
   116c8:	f9401bf9 	ldr	x25, [sp, #48]
   116cc:	a9464ff4 	ldp	x20, x19, [sp, #96]
   116d0:	a9445ff8 	ldp	x24, x23, [sp, #64]
   116d4:	a9427bfd 	ldp	x29, x30, [sp, #32]
   116d8:	9101c3ff 	add	sp, sp, #0x70
   116dc:	d65f03c0 	ret

00000000000116e0 <main>:
   116e0:	d102c3ff 	sub	sp, sp, #0xb0
   116e4:	a9057bfd 	stp	x29, x30, [sp, #80]
   116e8:	910143fd 	add	x29, sp, #0x50
   116ec:	a9066ffc 	stp	x28, x27, [sp, #96]
   116f0:	a90767fa 	stp	x26, x25, [sp, #112]
   116f4:	a9085ff8 	stp	x24, x23, [sp, #128]
   116f8:	a90957f6 	stp	x22, x21, [sp, #144]
   116fc:	a90a4ff4 	stp	x20, x19, [sp, #160]
   11700:	52801001 	mov	w1, #0x80                  	// #128
   11704:	52800800 	mov	w0, #0x40                  	// #64
   11708:	72a00201 	movk	w1, #0x10, lsl #16
   1170c:	94000265 	bl	120a0 <aligned_alloc@plt>
   11710:	b40023a0 	cbz	x0, 11b84 <main+0x4a4>
   11714:	aa0003f7 	mov	x23, x0
   11718:	aa1f03e8 	mov	x8, xzr
   1171c:	91002009 	add	x9, x0, #0x8
   11720:	f81f8128 	stur	x8, [x9, #-8]
   11724:	91000508 	add	x8, x8, #0x1
   11728:	f140411f 	cmp	x8, #0x10, lsl #12
   1172c:	f801053f 	str	xzr, [x9], #16
   11730:	54ffff81 	b.ne	11720 <main+0x40>  // b.any
   11734:	52a00208 	mov	w8, #0x100000              	// #1048576
   11738:	52800809 	mov	w9, #0x40                  	// #64
   1173c:	72a00209 	movk	w9, #0x10, lsl #16
   11740:	f8286aff 	str	xzr, [x23, x8]
   11744:	52812008 	mov	w8, #0x900                 	// #2304
   11748:	72a007a8 	movk	w8, #0x3d, lsl #16
   1174c:	f8296aff 	str	xzr, [x23, x9]
   11750:	a93edfbf 	stp	xzr, x23, [x29, #-24]
   11754:	a901ffff 	stp	xzr, xzr, [sp, #24]
   11758:	f81e03a8 	stur	x8, [x29, #-32]
   1175c:	f90017ff 	str	xzr, [sp, #40]
   11760:	52800800 	mov	w0, #0x40                  	// #64
   11764:	94000277 	bl	12140 <_Znwm@plt>
   11768:	6f00e400 	movi	v0.2d, #0x0
   1176c:	aa0003f4 	mov	x20, x0
   11770:	ad010000 	stp	q0, q0, [x0, #32]
   11774:	ad000000 	stp	q0, q0, [x0]
   11778:	52800800 	mov	w0, #0x40                  	// #64
   1177c:	94000271 	bl	12140 <_Znwm@plt>
   11780:	6f00e400 	movi	v0.2d, #0x0
   11784:	f90007e0 	str	x0, [sp, #8]
   11788:	ad010000 	stp	q0, q0, [x0, #32]
   1178c:	ad000000 	stp	q0, q0, [x0]
   11790:	94000248 	bl	120b0 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
   11794:	aa1f03fc 	mov	x28, xzr
   11798:	aa1f03f5 	mov	x21, xzr
   1179c:	aa1f03f8 	mov	x24, xzr
   117a0:	aa1f03f3 	mov	x19, xzr
   117a4:	f90003e0 	str	x0, [sp]
   117a8:	14000006 	b	117c0 <main+0xe0>
   117ac:	aa1503fb 	mov	x27, x21
   117b0:	91002375 	add	x21, x27, #0x8
   117b4:	9100079c 	add	x28, x28, #0x1
   117b8:	f100139f 	cmp	x28, #0x4
   117bc:	54000d60 	b.eq	11968 <main+0x288>  // b.none
   117c0:	8b1c129b 	add	x27, x20, x28, lsl #4
   117c4:	eb1802bf 	cmp	x21, x24
   117c8:	540002c0 	b.eq	11820 <main+0x140>  // b.none
   117cc:	f90002bf 	str	xzr, [x21]
   117d0:	52800500 	mov	w0, #0x28                  	// #40
   117d4:	9400025b 	bl	12140 <_Znwm@plt>
   117d8:	b0000088 	adrp	x8, 22000 <__getauxval@plt+0xfe50>
   117dc:	b900101c 	str	w28, [x0, #16]
   117e0:	9107a108 	add	x8, x8, #0x1e8
   117e4:	f81f83a0 	stur	x0, [x29, #-8]
   117e8:	a9006c08 	stp	x8, x27, [x0]
   117ec:	d503201f 	nop
   117f0:	10ffe888 	adr	x8, 11500 <_Z15producer_threadP5QueueiP12ThreadResult>
   117f4:	a901a017 	stp	x23, x8, [x0, #24]
   117f8:	d10023a1 	sub	x1, x29, #0x8
   117fc:	aa1503e0 	mov	x0, x21
   11800:	aa1f03e2 	mov	x2, xzr
   11804:	9400025b 	bl	12170 <_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@plt>
   11808:	f85f83a0 	ldur	x0, [x29, #-8]
   1180c:	b4fffd00 	cbz	x0, 117ac <main+0xcc>
   11810:	f9400008 	ldr	x8, [x0]
   11814:	f9400508 	ldr	x8, [x8, #8]
   11818:	d63f0100 	blr	x8
   1181c:	17ffffe4 	b	117ac <main+0xcc>
   11820:	cb1302b6 	sub	x22, x21, x19
   11824:	b27defe8 	mov	x8, #0x7ffffffffffffff8    	// #9223372036854775800
   11828:	eb0802df 	cmp	x22, x8
   1182c:	54001c20 	b.eq	11bb0 <main+0x4d0>  // b.none
   11830:	9343feda 	asr	x26, x22, #3
   11834:	f10002df 	cmp	x22, #0x0
   11838:	9a9f1748 	csinc	x8, x26, xzr, ne  // ne = any
   1183c:	ab1a0108 	adds	x8, x8, x26
   11840:	d37cfd09 	lsr	x9, x8, #60
   11844:	1a9f37ea 	cset	w10, cs  // cs = hs, nlast
   11848:	f100013f 	cmp	x9, #0x0
   1184c:	1a9f07e9 	cset	w9, ne  // ne = any
   11850:	2a090149 	orr	w9, w10, w9
   11854:	7100013f 	cmp	w9, #0x0
   11858:	92fe0009 	mov	x9, #0xfffffffffffffff     	// #1152921504606846975
   1185c:	9a881138 	csel	x24, x9, x8, ne  // ne = any
   11860:	b40000b8 	cbz	x24, 11874 <main+0x194>
   11864:	d37df300 	lsl	x0, x24, #3
   11868:	94000236 	bl	12140 <_Znwm@plt>
   1186c:	aa0003f9 	mov	x25, x0
   11870:	14000002 	b	11878 <main+0x198>
   11874:	aa1f03f9 	mov	x25, xzr
   11878:	8b1a0f3a 	add	x26, x25, x26, lsl #3
   1187c:	f900035f 	str	xzr, [x26]
   11880:	52800500 	mov	w0, #0x28                  	// #40
   11884:	9400022f 	bl	12140 <_Znwm@plt>
   11888:	b0000088 	adrp	x8, 22000 <__getauxval@plt+0xfe50>
   1188c:	b900101c 	str	w28, [x0, #16]
   11890:	9107a108 	add	x8, x8, #0x1e8
   11894:	f81f83a0 	stur	x0, [x29, #-8]
   11898:	a9006c08 	stp	x8, x27, [x0]
   1189c:	d503201f 	nop
   118a0:	10ffe308 	adr	x8, 11500 <_Z15producer_threadP5QueueiP12ThreadResult>
   118a4:	a901a017 	stp	x23, x8, [x0, #24]
   118a8:	d10023a1 	sub	x1, x29, #0x8
   118ac:	aa1a03e0 	mov	x0, x26
   118b0:	aa1f03e2 	mov	x2, xzr
   118b4:	9400022f 	bl	12170 <_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@plt>
   118b8:	f85f83a0 	ldur	x0, [x29, #-8]
   118bc:	b4000080 	cbz	x0, 118cc <main+0x1ec>
   118c0:	f9400008 	ldr	x8, [x0]
   118c4:	f9400508 	ldr	x8, [x8, #8]
   118c8:	d63f0100 	blr	x8
   118cc:	6f00e402 	movi	v2.2d, #0x0
   118d0:	aa1903fb 	mov	x27, x25
   118d4:	eb15027f 	cmp	x19, x21
   118d8:	54000360 	b.eq	11944 <main+0x264>  // b.none
   118dc:	d10022c9 	sub	x9, x22, #0x8
   118e0:	aa1903fb 	mov	x27, x25
   118e4:	aa1303e8 	mov	x8, x19
   118e8:	f100613f 	cmp	x9, #0x18
   118ec:	54000223 	b.cc	11930 <main+0x250>  // b.lo, b.ul, b.last
   118f0:	d343fd28 	lsr	x8, x9, #3
   118f4:	9100432a 	add	x10, x25, #0x10
   118f8:	91000509 	add	x9, x8, #0x1
   118fc:	aa1303eb 	mov	x11, x19
   11900:	927eed28 	and	x8, x9, #0x3ffffffffffffffc
   11904:	aa0803ec 	mov	x12, x8
   11908:	8b080f3b 	add	x27, x25, x8, lsl #3
   1190c:	ad400560 	ldp	q0, q1, [x11]
   11910:	f100118c 	subs	x12, x12, #0x4
   11914:	ad3f8540 	stp	q0, q1, [x10, #-16]
   11918:	9100814a 	add	x10, x10, #0x20
   1191c:	ac810962 	stp	q2, q2, [x11], #32
   11920:	54ffff61 	b.ne	1190c <main+0x22c>  // b.any
   11924:	eb08013f 	cmp	x9, x8
   11928:	54000100 	b.eq	11948 <main+0x268>  // b.none
   1192c:	8b080e68 	add	x8, x19, x8, lsl #3
   11930:	f9400109 	ldr	x9, [x8]
   11934:	f8008769 	str	x9, [x27], #8
   11938:	f800851f 	str	xzr, [x8], #8
   1193c:	eb15011f 	cmp	x8, x21
   11940:	54ffff81 	b.ne	11930 <main+0x250>  // b.any
   11944:	b4000073 	cbz	x19, 11950 <main+0x270>
   11948:	aa1303e0 	mov	x0, x19
   1194c:	940001f5 	bl	12120 <_ZdlPv@plt>
   11950:	8b180f38 	add	x24, x25, x24, lsl #3
   11954:	aa1903f3 	mov	x19, x25
   11958:	91002375 	add	x21, x27, #0x8
   1195c:	9100079c 	add	x28, x28, #0x1
   11960:	f100139f 	cmp	x28, #0x4
   11964:	54fff2e1 	b.ne	117c0 <main+0xe0>  // b.any
   11968:	d10063b6 	sub	x22, x29, #0x18
   1196c:	f94007fc 	ldr	x28, [sp, #8]
   11970:	f81f83b6 	stur	x22, [x29, #-8]
   11974:	f9000bfc 	str	x28, [sp, #16]
   11978:	910063e0 	add	x0, sp, #0x18
   1197c:	d10043a1 	sub	x1, x29, #0x10
   11980:	d10023a2 	sub	x2, x29, #0x8
   11984:	d10083a3 	sub	x3, x29, #0x20
   11988:	910043e4 	add	x4, sp, #0x10
   1198c:	940000c6 	bl	11ca4 <_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJRFvP5QueuePSt6atomicImEmP12ThreadResultERS5_S8_RKmSA_EEEvDpOT_>
   11990:	91004388 	add	x8, x28, #0x10
   11994:	f81f83b6 	stur	x22, [x29, #-8]
   11998:	f9000be8 	str	x8, [sp, #16]
   1199c:	910063e0 	add	x0, sp, #0x18
   119a0:	d10043a1 	sub	x1, x29, #0x10
   119a4:	d10023a2 	sub	x2, x29, #0x8
   119a8:	d10083a3 	sub	x3, x29, #0x20
   119ac:	910043e4 	add	x4, sp, #0x10
   119b0:	940000bd 	bl	11ca4 <_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJRFvP5QueuePSt6atomicImEmP12ThreadResultERS5_S8_RKmSA_EEEvDpOT_>
   119b4:	d10063b6 	sub	x22, x29, #0x18
   119b8:	91008388 	add	x8, x28, #0x20
   119bc:	f81f83b6 	stur	x22, [x29, #-8]
   119c0:	f9000be8 	str	x8, [sp, #16]
   119c4:	910063e0 	add	x0, sp, #0x18
   119c8:	d10043a1 	sub	x1, x29, #0x10
   119cc:	d10023a2 	sub	x2, x29, #0x8
   119d0:	d10083a3 	sub	x3, x29, #0x20
   119d4:	910043e4 	add	x4, sp, #0x10
   119d8:	940000b3 	bl	11ca4 <_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJRFvP5QueuePSt6atomicImEmP12ThreadResultERS5_S8_RKmSA_EEEvDpOT_>
   119dc:	9100c388 	add	x8, x28, #0x30
   119e0:	f81f83b6 	stur	x22, [x29, #-8]
   119e4:	f9000be8 	str	x8, [sp, #16]
   119e8:	910063e0 	add	x0, sp, #0x18
   119ec:	d10043a1 	sub	x1, x29, #0x10
   119f0:	d10023a2 	sub	x2, x29, #0x8
   119f4:	d10083a3 	sub	x3, x29, #0x20
   119f8:	910043e4 	add	x4, sp, #0x10
   119fc:	940000aa 	bl	11ca4 <_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJRFvP5QueuePSt6atomicImEmP12ThreadResultERS5_S8_RKmSA_EEEvDpOT_>
   11a00:	eb15027f 	cmp	x19, x21
   11a04:	54000100 	b.eq	11a24 <main+0x344>  // b.none
   11a08:	aa1303f9 	mov	x25, x19
   11a0c:	aa1903e0 	mov	x0, x25
   11a10:	940001ac 	bl	120c0 <_ZNSt6thread4joinEv@plt>
   11a14:	91002328 	add	x8, x25, #0x8
   11a18:	eb1b033f 	cmp	x25, x27
   11a1c:	aa0803f9 	mov	x25, x8
   11a20:	54ffff61 	b.ne	11a0c <main+0x32c>  // b.any
   11a24:	a941dbf9 	ldp	x25, x22, [sp, #24]
   11a28:	eb16033f 	cmp	x25, x22
   11a2c:	540000e0 	b.eq	11a48 <main+0x368>  // b.none
   11a30:	aa1903fa 	mov	x26, x25
   11a34:	aa1a03e0 	mov	x0, x26
   11a38:	940001a2 	bl	120c0 <_ZNSt6thread4joinEv@plt>
   11a3c:	9100235a 	add	x26, x26, #0x8
   11a40:	eb16035f 	cmp	x26, x22
   11a44:	54ffff81 	b.ne	11a34 <main+0x354>  // b.any
   11a48:	9400019a 	bl	120b0 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
   11a4c:	f94003e8 	ldr	x8, [sp]
   11a50:	d2d09009 	mov	x9, #0x848000000000        	// #145685290680320
   11a54:	f2e825c9 	movk	x9, #0x412e, lsl #48
   11a58:	f940168e 	ldr	x14, [x20, #40]
   11a5c:	a9412b8d 	ldp	x13, x10, [x28, #16]
   11a60:	cb080008 	sub	x8, x0, x8
   11a64:	d2809004 	mov	x4, #0x480                 	// #1152
   11a68:	9e670121 	fmov	d1, x9
   11a6c:	f9401e8f 	ldr	x15, [x20, #56]
   11a70:	f0ffff60 	adrp	x0, 0 <__abi_tag-0x2c4>
   11a74:	f2b4a8e4 	movk	x4, #0xa547, lsl #16
   11a78:	9e620100 	scvtf	d0, x8
   11a7c:	d2c80008 	mov	x8, #0x400000000000        	// #70368744177664
   11a80:	f2e811e8 	movk	x8, #0x408f, lsl #48
   11a84:	9137b000 	add	x0, x0, #0xdec
   11a88:	f2c0e8c4 	movk	x4, #0x746, lsl #32
   11a8c:	d280901a 	mov	x26, #0x480                 	// #1152
   11a90:	f2b4a8fa 	movk	x26, #0xa547, lsl #16
   11a94:	1e611800 	fdiv	d0, d0, d1
   11a98:	9e670101 	fmov	d1, x8
   11a9c:	a9402389 	ldp	x9, x8, [x28]
   11aa0:	f2c0e8da 	movk	x26, #0x746, lsl #32
   11aa4:	8b0901a9 	add	x9, x13, x9
   11aa8:	8b080148 	add	x8, x10, x8
   11aac:	a9422f8a 	ldp	x10, x11, [x28, #32]
   11ab0:	8b090149 	add	x9, x10, x9
   11ab4:	8b080168 	add	x8, x11, x8
   11ab8:	a943338b 	ldp	x11, x12, [x28, #48]
   11abc:	8b090178 	add	x24, x11, x9
   11ac0:	8b080182 	add	x2, x12, x8
   11ac4:	f9400688 	ldr	x8, [x20, #8]
   11ac8:	f9400e8c 	ldr	x12, [x20, #24]
   11acc:	aa1803e3 	mov	x3, x24
   11ad0:	9e630042 	ucvtf	d2, x2
   11ad4:	1e611801 	fdiv	d1, d0, d1
   11ad8:	8b080188 	add	x8, x12, x8
   11adc:	8b0801c8 	add	x8, x14, x8
   11ae0:	8b0801e1 	add	x1, x15, x8
   11ae4:	1e611841 	fdiv	d1, d2, d1
   11ae8:	9400017a 	bl	120d0 <printf@plt>
   11aec:	aa1703e0 	mov	x0, x23
   11af0:	9400017c 	bl	120e0 <free@plt>
   11af4:	aa1c03e0 	mov	x0, x28
   11af8:	eb1a031f 	cmp	x24, x26
   11afc:	1a9f07f7 	cset	w23, ne  // ne = any
   11b00:	94000188 	bl	12120 <_ZdlPv@plt>
   11b04:	aa1403e0 	mov	x0, x20
   11b08:	94000186 	bl	12120 <_ZdlPv@plt>
   11b0c:	eb16033f 	cmp	x25, x22
   11b10:	540000c0 	b.eq	11b28 <main+0x448>  // b.none
   11b14:	aa1903e8 	mov	x8, x25
   11b18:	f8408509 	ldr	x9, [x8], #8
   11b1c:	b5000489 	cbnz	x9, 11bac <main+0x4cc>
   11b20:	eb16011f 	cmp	x8, x22
   11b24:	54ffffa1 	b.ne	11b18 <main+0x438>  // b.any
   11b28:	b4000079 	cbz	x25, 11b34 <main+0x454>
   11b2c:	aa1903e0 	mov	x0, x25
   11b30:	9400017c 	bl	12120 <_ZdlPv@plt>
   11b34:	eb15027f 	cmp	x19, x21
   11b38:	540000e0 	b.eq	11b54 <main+0x474>  // b.none
   11b3c:	d1002268 	sub	x8, x19, #0x8
   11b40:	f9400509 	ldr	x9, [x8, #8]
   11b44:	b5000349 	cbnz	x9, 11bac <main+0x4cc>
   11b48:	91002108 	add	x8, x8, #0x8
   11b4c:	eb1b011f 	cmp	x8, x27
   11b50:	54ffff81 	b.ne	11b40 <main+0x460>  // b.any
   11b54:	b4000073 	cbz	x19, 11b60 <main+0x480>
   11b58:	aa1303e0 	mov	x0, x19
   11b5c:	94000171 	bl	12120 <_ZdlPv@plt>
   11b60:	2a1703e0 	mov	w0, w23
   11b64:	a94a4ff4 	ldp	x20, x19, [sp, #160]
   11b68:	a94957f6 	ldp	x22, x21, [sp, #144]
   11b6c:	a9485ff8 	ldp	x24, x23, [sp, #128]
   11b70:	a94767fa 	ldp	x26, x25, [sp, #112]
   11b74:	a9466ffc 	ldp	x28, x27, [sp, #96]
   11b78:	a9457bfd 	ldp	x29, x30, [sp, #80]
   11b7c:	9102c3ff 	add	sp, sp, #0xb0
   11b80:	d65f03c0 	ret
   11b84:	b0000088 	adrp	x8, 22000 <__getauxval@plt+0xfe50>
   11b88:	d503201f 	nop
   11b8c:	50f795a0 	adr	x0, e42 <_IO_stdin_used+0x5a>
   11b90:	52800321 	mov	w1, #0x19                  	// #25
   11b94:	52800022 	mov	w2, #0x1                   	// #1
   11b98:	52800037 	mov	w23, #0x1                   	// #1
   11b9c:	f9422908 	ldr	x8, [x8, #1104]
   11ba0:	f9400103 	ldr	x3, [x8]
   11ba4:	9400017b 	bl	12190 <fwrite@plt>
   11ba8:	17ffffee 	b	11b60 <main+0x480>
   11bac:	94000155 	bl	12100 <_ZSt9terminatev@plt>
   11bb0:	f0ffff60 	adrp	x0, 0 <__abi_tag-0x2c4>
   11bb4:	91397000 	add	x0, x0, #0xe5c
   11bb8:	9400015e 	bl	12130 <_ZSt20__throw_length_errorPKc@plt>
   11bbc:	aa0003f7 	mov	x23, x0
   11bc0:	aa1f03f6 	mov	x22, xzr
   11bc4:	aa1f03f8 	mov	x24, xzr
   11bc8:	aa1f03f5 	mov	x21, xzr
   11bcc:	aa1f03f3 	mov	x19, xzr
   11bd0:	1400002b 	b	11c7c <main+0x59c>
   11bd4:	aa0003f7 	mov	x23, x0
   11bd8:	aa1f03f6 	mov	x22, xzr
   11bdc:	aa1f03f8 	mov	x24, xzr
   11be0:	aa1f03f5 	mov	x21, xzr
   11be4:	aa1f03f3 	mov	x19, xzr
   11be8:	14000027 	b	11c84 <main+0x5a4>
   11bec:	14000020 	b	11c6c <main+0x58c>
   11bf0:	f85f83a8 	ldur	x8, [x29, #-8]
   11bf4:	aa0003f7 	mov	x23, x0
   11bf8:	b40000e8 	cbz	x8, 11c14 <main+0x534>
   11bfc:	f9400109 	ldr	x9, [x8]
   11c00:	aa0803e0 	mov	x0, x8
   11c04:	f9400529 	ldr	x9, [x9, #8]
   11c08:	d63f0120 	blr	x9
   11c0c:	14000002 	b	11c14 <main+0x534>
   11c10:	aa0003f7 	mov	x23, x0
   11c14:	aa1703e0 	mov	x0, x23
   11c18:	94000136 	bl	120f0 <__cxa_begin_catch@plt>
   11c1c:	aa1903e0 	mov	x0, x25
   11c20:	94000140 	bl	12120 <_ZdlPv@plt>
   11c24:	9400014b 	bl	12150 <__cxa_rethrow@plt>
   11c28:	14000010 	b	11c68 <main+0x588>
   11c2c:	14000010 	b	11c6c <main+0x58c>
   11c30:	1400000f 	b	11c6c <main+0x58c>
   11c34:	f85f83a8 	ldur	x8, [x29, #-8]
   11c38:	aa0003f7 	mov	x23, x0
   11c3c:	b4000108 	cbz	x8, 11c5c <main+0x57c>
   11c40:	f9400109 	ldr	x9, [x8]
   11c44:	aa0803e0 	mov	x0, x8
   11c48:	f9400529 	ldr	x9, [x9, #8]
   11c4c:	d63f0120 	blr	x9
   11c50:	14000003 	b	11c5c <main+0x57c>
   11c54:	aa0003f7 	mov	x23, x0
   11c58:	94000142 	bl	12160 <__cxa_end_catch@plt>
   11c5c:	f94007fc 	ldr	x28, [sp, #8]
   11c60:	14000004 	b	11c70 <main+0x590>
   11c64:	940000ca 	bl	11f8c <__clang_call_terminate>
   11c68:	f94007fc 	ldr	x28, [sp, #8]
   11c6c:	aa0003f7 	mov	x23, x0
   11c70:	aa1c03e0 	mov	x0, x28
   11c74:	9400012b 	bl	12120 <_ZdlPv@plt>
   11c78:	a941dbf8 	ldp	x24, x22, [sp, #24]
   11c7c:	aa1403e0 	mov	x0, x20
   11c80:	94000128 	bl	12120 <_ZdlPv@plt>
   11c84:	aa1803e0 	mov	x0, x24
   11c88:	aa1603e1 	mov	x1, x22
   11c8c:	940000b1 	bl	11f50 <_ZNSt6vectorISt6threadSaIS0_EED2Ev>
   11c90:	aa1303e0 	mov	x0, x19
   11c94:	aa1503e1 	mov	x1, x21
   11c98:	940000ae 	bl	11f50 <_ZNSt6vectorISt6threadSaIS0_EED2Ev>
   11c9c:	aa1703e0 	mov	x0, x23
   11ca0:	94000140 	bl	121a0 <_Unwind_Resume@plt>

0000000000011ca4 <_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJRFvP5QueuePSt6atomicImEmP12ThreadResultERS5_S8_RKmSA_EEEvDpOT_>:
   11ca4:	d101c3ff 	sub	sp, sp, #0x70
   11ca8:	a9017bfd 	stp	x29, x30, [sp, #16]
   11cac:	910043fd 	add	x29, sp, #0x10
   11cb0:	a9026ffc 	stp	x28, x27, [sp, #32]
   11cb4:	a90367fa 	stp	x26, x25, [sp, #48]
   11cb8:	a9045ff8 	stp	x24, x23, [sp, #64]
   11cbc:	a90557f6 	stp	x22, x21, [sp, #80]
   11cc0:	a9064ff4 	stp	x20, x19, [sp, #96]
   11cc4:	a940a014 	ldp	x20, x8, [x0, #8]
   11cc8:	aa0403fa 	mov	x26, x4
   11ccc:	aa0303f9 	mov	x25, x3
   11cd0:	aa0003f3 	mov	x19, x0
   11cd4:	aa0203f7 	mov	x23, x2
   11cd8:	aa0103f8 	mov	x24, x1
   11cdc:	eb08029f 	cmp	x20, x8
   11ce0:	540003a0 	b.eq	11d54 <_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJRFvP5QueuePSt6atomicImEmP12ThreadResultERS5_S8_RKmSA_EEEvDpOT_+0xb0>  // b.none
   11ce4:	52800600 	mov	w0, #0x30                  	// #48
   11ce8:	f900029f 	str	xzr, [x20]
   11cec:	94000115 	bl	12140 <_Znwm@plt>
   11cf0:	b0000089 	adrp	x9, 22000 <__getauxval@plt+0xfe50>
   11cf4:	f9400348 	ldr	x8, [x26]
   11cf8:	9108a129 	add	x9, x9, #0x228
   11cfc:	f940032a 	ldr	x10, [x25]
   11d00:	f94002eb 	ldr	x11, [x23]
   11d04:	f90007e0 	str	x0, [sp, #8]
   11d08:	a9002009 	stp	x9, x8, [x0]
   11d0c:	90000009 	adrp	x9, 11000 <__FRAME_END__+0xff68>
   11d10:	f9400308 	ldr	x8, [x24]
   11d14:	91173129 	add	x9, x9, #0x5cc
   11d18:	a9012c0a 	stp	x10, x11, [x0, #16]
   11d1c:	a9022408 	stp	x8, x9, [x0, #32]
   11d20:	910023e1 	add	x1, sp, #0x8
   11d24:	aa1403e0 	mov	x0, x20
   11d28:	aa1f03e2 	mov	x2, xzr
   11d2c:	94000111 	bl	12170 <_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@plt>
   11d30:	f94007e0 	ldr	x0, [sp, #8]
   11d34:	b4000080 	cbz	x0, 11d44 <_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJRFvP5QueuePSt6atomicImEmP12ThreadResultERS5_S8_RKmSA_EEEvDpOT_+0xa0>
   11d38:	f9400008 	ldr	x8, [x0]
   11d3c:	f9400508 	ldr	x8, [x8, #8]
   11d40:	d63f0100 	blr	x8
   11d44:	f9400668 	ldr	x8, [x19, #8]
   11d48:	91002108 	add	x8, x8, #0x8
   11d4c:	f9000668 	str	x8, [x19, #8]
   11d50:	1400005a 	b	11eb8 <_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJRFvP5QueuePSt6atomicImEmP12ThreadResultERS5_S8_RKmSA_EEEvDpOT_+0x214>
   11d54:	f9400276 	ldr	x22, [x19]
   11d58:	b27defe8 	mov	x8, #0x7ffffffffffffff8    	// #9223372036854775800
   11d5c:	cb16029c 	sub	x28, x20, x22
   11d60:	eb08039f 	cmp	x28, x8
   11d64:	54000ba0 	b.eq	11ed8 <_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJRFvP5QueuePSt6atomicImEmP12ThreadResultERS5_S8_RKmSA_EEEvDpOT_+0x234>  // b.none
   11d68:	9343ff9b 	asr	x27, x28, #3
   11d6c:	f100039f 	cmp	x28, #0x0
   11d70:	9a9f1768 	csinc	x8, x27, xzr, ne  // ne = any
   11d74:	ab1b0108 	adds	x8, x8, x27
   11d78:	d37cfd09 	lsr	x9, x8, #60
   11d7c:	1a9f37ea 	cset	w10, cs  // cs = hs, nlast
   11d80:	f100013f 	cmp	x9, #0x0
   11d84:	1a9f07e9 	cset	w9, ne  // ne = any
   11d88:	2a090149 	orr	w9, w10, w9
   11d8c:	7100013f 	cmp	w9, #0x0
   11d90:	92fe0009 	mov	x9, #0xfffffffffffffff     	// #1152921504606846975
   11d94:	9a881128 	csel	x8, x9, x8, ne  // ne = any
   11d98:	f90003e8 	str	x8, [sp]
   11d9c:	b40000a8 	cbz	x8, 11db0 <_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJRFvP5QueuePSt6atomicImEmP12ThreadResultERS5_S8_RKmSA_EEEvDpOT_+0x10c>
   11da0:	d37df100 	lsl	x0, x8, #3
   11da4:	940000e7 	bl	12140 <_Znwm@plt>
   11da8:	aa0003f5 	mov	x21, x0
   11dac:	14000002 	b	11db4 <_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJRFvP5QueuePSt6atomicImEmP12ThreadResultERS5_S8_RKmSA_EEEvDpOT_+0x110>
   11db0:	aa1f03f5 	mov	x21, xzr
   11db4:	8b1b0ebb 	add	x27, x21, x27, lsl #3
   11db8:	f900037f 	str	xzr, [x27]
   11dbc:	52800600 	mov	w0, #0x30                  	// #48
   11dc0:	940000e0 	bl	12140 <_Znwm@plt>
   11dc4:	b0000088 	adrp	x8, 22000 <__getauxval@plt+0xfe50>
   11dc8:	f9400349 	ldr	x9, [x26]
   11dcc:	9108a108 	add	x8, x8, #0x228
   11dd0:	f940032a 	ldr	x10, [x25]
   11dd4:	f94002eb 	ldr	x11, [x23]
   11dd8:	f90007e0 	str	x0, [sp, #8]
   11ddc:	a9002408 	stp	x8, x9, [x0]
   11de0:	90000009 	adrp	x9, 11000 <__FRAME_END__+0xff68>
   11de4:	f9400308 	ldr	x8, [x24]
   11de8:	91173129 	add	x9, x9, #0x5cc
   11dec:	a9012c0a 	stp	x10, x11, [x0, #16]
   11df0:	a9022408 	stp	x8, x9, [x0, #32]
   11df4:	910023e1 	add	x1, sp, #0x8
   11df8:	aa1b03e0 	mov	x0, x27
   11dfc:	aa1f03e2 	mov	x2, xzr
   11e00:	940000dc 	bl	12170 <_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@plt>
   11e04:	f94007e0 	ldr	x0, [sp, #8]
   11e08:	b4000080 	cbz	x0, 11e18 <_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJRFvP5QueuePSt6atomicImEmP12ThreadResultERS5_S8_RKmSA_EEEvDpOT_+0x174>
   11e0c:	f9400008 	ldr	x8, [x0]
   11e10:	f9400508 	ldr	x8, [x8, #8]
   11e14:	d63f0100 	blr	x8
   11e18:	aa1503e8 	mov	x8, x21
   11e1c:	eb1402df 	cmp	x22, x20
   11e20:	540003c0 	b.eq	11e98 <_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJRFvP5QueuePSt6atomicImEmP12ThreadResultERS5_S8_RKmSA_EEEvDpOT_+0x1f4>  // b.none
   11e24:	d100238a 	sub	x10, x28, #0x8
   11e28:	aa1503e8 	mov	x8, x21
   11e2c:	aa1603e9 	mov	x9, x22
   11e30:	f1005d5f 	cmp	x10, #0x17
   11e34:	54000289 	b.ls	11e84 <_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJRFvP5QueuePSt6atomicImEmP12ThreadResultERS5_S8_RKmSA_EEEvDpOT_+0x1e0>  // b.plast
   11e38:	d343fd48 	lsr	x8, x10, #3
   11e3c:	910042ab 	add	x11, x21, #0x10
   11e40:	9100050a 	add	x10, x8, #0x1
   11e44:	aa1603ec 	mov	x12, x22
   11e48:	927eed49 	and	x9, x10, #0x3ffffffffffffffc
   11e4c:	6f00e400 	movi	v0.2d, #0x0
   11e50:	aa0903ed 	mov	x13, x9
   11e54:	8b090ea8 	add	x8, x21, x9, lsl #3
   11e58:	ad400981 	ldp	q1, q2, [x12]
   11e5c:	f10011ad 	subs	x13, x13, #0x4
   11e60:	ad3f8961 	stp	q1, q2, [x11, #-16]
   11e64:	9100816b 	add	x11, x11, #0x20
   11e68:	ac810180 	stp	q0, q0, [x12], #32
   11e6c:	54ffff61 	b.ne	11e58 <_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJRFvP5QueuePSt6atomicImEmP12ThreadResultERS5_S8_RKmSA_EEEvDpOT_+0x1b4>  // b.any
   11e70:	eb09015f 	cmp	x10, x9
   11e74:	54000061 	b.ne	11e80 <_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJRFvP5QueuePSt6atomicImEmP12ThreadResultERS5_S8_RKmSA_EEEvDpOT_+0x1dc>  // b.any
   11e78:	91002114 	add	x20, x8, #0x8
   11e7c:	14000009 	b	11ea0 <_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJRFvP5QueuePSt6atomicImEmP12ThreadResultERS5_S8_RKmSA_EEEvDpOT_+0x1fc>
   11e80:	8b090ec9 	add	x9, x22, x9, lsl #3
   11e84:	f940012a 	ldr	x10, [x9]
   11e88:	f800850a 	str	x10, [x8], #8
   11e8c:	f800853f 	str	xzr, [x9], #8
   11e90:	eb14013f 	cmp	x9, x20
   11e94:	54ffff81 	b.ne	11e84 <_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJRFvP5QueuePSt6atomicImEmP12ThreadResultERS5_S8_RKmSA_EEEvDpOT_+0x1e0>  // b.any
   11e98:	91002114 	add	x20, x8, #0x8
   11e9c:	b4000076 	cbz	x22, 11ea8 <_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJRFvP5QueuePSt6atomicImEmP12ThreadResultERS5_S8_RKmSA_EEEvDpOT_+0x204>
   11ea0:	aa1603e0 	mov	x0, x22
   11ea4:	9400009f 	bl	12120 <_ZdlPv@plt>
   11ea8:	f94003e8 	ldr	x8, [sp]
   11eac:	a9005275 	stp	x21, x20, [x19]
   11eb0:	8b080ea8 	add	x8, x21, x8, lsl #3
   11eb4:	f9000a68 	str	x8, [x19, #16]
   11eb8:	a9464ff4 	ldp	x20, x19, [sp, #96]
   11ebc:	a94557f6 	ldp	x22, x21, [sp, #80]
   11ec0:	a9445ff8 	ldp	x24, x23, [sp, #64]
   11ec4:	a94367fa 	ldp	x26, x25, [sp, #48]
   11ec8:	a9426ffc 	ldp	x28, x27, [sp, #32]
   11ecc:	a9417bfd 	ldp	x29, x30, [sp, #16]
   11ed0:	9101c3ff 	add	sp, sp, #0x70
   11ed4:	d65f03c0 	ret
   11ed8:	f0ffff60 	adrp	x0, 0 <__abi_tag-0x2c4>
   11edc:	91397000 	add	x0, x0, #0xe5c
   11ee0:	94000094 	bl	12130 <_ZSt20__throw_length_errorPKc@plt>
   11ee4:	f94007e8 	ldr	x8, [sp, #8]
   11ee8:	aa0003f3 	mov	x19, x0
   11eec:	b40000e8 	cbz	x8, 11f08 <_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJRFvP5QueuePSt6atomicImEmP12ThreadResultERS5_S8_RKmSA_EEEvDpOT_+0x264>
   11ef0:	f9400109 	ldr	x9, [x8]
   11ef4:	aa0803e0 	mov	x0, x8
   11ef8:	f9400529 	ldr	x9, [x9, #8]
   11efc:	d63f0120 	blr	x9
   11f00:	14000002 	b	11f08 <_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJRFvP5QueuePSt6atomicImEmP12ThreadResultERS5_S8_RKmSA_EEEvDpOT_+0x264>
   11f04:	aa0003f3 	mov	x19, x0
   11f08:	aa1303e0 	mov	x0, x19
   11f0c:	94000079 	bl	120f0 <__cxa_begin_catch@plt>
   11f10:	aa1503e0 	mov	x0, x21
   11f14:	94000083 	bl	12120 <_ZdlPv@plt>
   11f18:	9400008e 	bl	12150 <__cxa_rethrow@plt>
   11f1c:	f94007e8 	ldr	x8, [sp, #8]
   11f20:	aa0003f3 	mov	x19, x0
   11f24:	b4000108 	cbz	x8, 11f44 <_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJRFvP5QueuePSt6atomicImEmP12ThreadResultERS5_S8_RKmSA_EEEvDpOT_+0x2a0>
   11f28:	f9400109 	ldr	x9, [x8]
   11f2c:	aa0803e0 	mov	x0, x8
   11f30:	f9400529 	ldr	x9, [x9, #8]
   11f34:	d63f0120 	blr	x9
   11f38:	14000003 	b	11f44 <_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJRFvP5QueuePSt6atomicImEmP12ThreadResultERS5_S8_RKmSA_EEEvDpOT_+0x2a0>
   11f3c:	aa0003f3 	mov	x19, x0
   11f40:	94000088 	bl	12160 <__cxa_end_catch@plt>
   11f44:	aa1303e0 	mov	x0, x19
   11f48:	94000096 	bl	121a0 <_Unwind_Resume@plt>
   11f4c:	94000010 	bl	11f8c <__clang_call_terminate>

0000000000011f50 <_ZNSt6vectorISt6threadSaIS0_EED2Ev>:
   11f50:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   11f54:	910003fd 	mov	x29, sp
   11f58:	eb01001f 	cmp	x0, x1
   11f5c:	540000c0 	b.eq	11f74 <_ZNSt6vectorISt6threadSaIS0_EED2Ev+0x24>  // b.none
   11f60:	aa0003e8 	mov	x8, x0
   11f64:	f8408509 	ldr	x9, [x8], #8
   11f68:	b5000109 	cbnz	x9, 11f88 <_ZNSt6vectorISt6threadSaIS0_EED2Ev+0x38>
   11f6c:	eb01011f 	cmp	x8, x1
   11f70:	54ffffa1 	b.ne	11f64 <_ZNSt6vectorISt6threadSaIS0_EED2Ev+0x14>  // b.any
   11f74:	b4000060 	cbz	x0, 11f80 <_ZNSt6vectorISt6threadSaIS0_EED2Ev+0x30>
   11f78:	a8c17bfd 	ldp	x29, x30, [sp], #16
   11f7c:	14000069 	b	12120 <_ZdlPv@plt>
   11f80:	a8c17bfd 	ldp	x29, x30, [sp], #16
   11f84:	d65f03c0 	ret
   11f88:	9400005e 	bl	12100 <_ZSt9terminatev@plt>

0000000000011f8c <__clang_call_terminate>:
   11f8c:	f81f0ffe 	str	x30, [sp, #-16]!
   11f90:	94000058 	bl	120f0 <__cxa_begin_catch@plt>
   11f94:	9400005b 	bl	12100 <_ZSt9terminatev@plt>

0000000000011f98 <_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP5QueueiP12ThreadResultES4_iS6_EEEEED0Ev>:
   11f98:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   11f9c:	f9000bf3 	str	x19, [sp, #16]
   11fa0:	910003fd 	mov	x29, sp
   11fa4:	aa0003f3 	mov	x19, x0
   11fa8:	94000076 	bl	12180 <_ZNSt6thread6_StateD2Ev@plt>
   11fac:	aa1303e0 	mov	x0, x19
   11fb0:	f9400bf3 	ldr	x19, [sp, #16]
   11fb4:	a8c27bfd 	ldp	x29, x30, [sp], #32
   11fb8:	1400005a 	b	12120 <_ZdlPv@plt>

0000000000011fbc <_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP5QueueiP12ThreadResultES4_iS6_EEEEE6_M_runEv>:
   11fbc:	a9418c08 	ldp	x8, x3, [x0, #24]
   11fc0:	b9401001 	ldr	w1, [x0, #16]
   11fc4:	f9400402 	ldr	x2, [x0, #8]
   11fc8:	aa0803e0 	mov	x0, x8
   11fcc:	d61f0060 	br	x3

0000000000011fd0 <_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP5QueuePSt6atomicImEmP12ThreadResultES4_S7_mS9_EEEEED0Ev>:
   11fd0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   11fd4:	f9000bf3 	str	x19, [sp, #16]
   11fd8:	910003fd 	mov	x29, sp
   11fdc:	aa0003f3 	mov	x19, x0
   11fe0:	94000068 	bl	12180 <_ZNSt6thread6_StateD2Ev@plt>
   11fe4:	aa1303e0 	mov	x0, x19
   11fe8:	f9400bf3 	ldr	x19, [sp, #16]
   11fec:	a8c27bfd 	ldp	x29, x30, [sp], #32
   11ff0:	1400004c 	b	12120 <_ZdlPv@plt>

0000000000011ff4 <_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP5QueuePSt6atomicImEmP12ThreadResultES4_S7_mS9_EEEEE6_M_runEv>:
   11ff4:	a941a001 	ldp	x1, x8, [x0, #24]
   11ff8:	a9408803 	ldp	x3, x2, [x0, #8]
   11ffc:	f9401404 	ldr	x4, [x0, #40]
   12000:	aa0803e0 	mov	x0, x8
   12004:	d61f0080 	br	x4

Disassembly of section .init:

0000000000012008 <_init>:
   12008:	d503201f 	nop
   1200c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   12010:	910003fd 	mov	x29, sp
   12014:	97fffcd8 	bl	11374 <call_weak_fn>
   12018:	a8c17bfd 	ldp	x29, x30, [sp], #16
   1201c:	d65f03c0 	ret

Disassembly of section .fini:

0000000000012020 <_fini>:
   12020:	d503201f 	nop
   12024:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   12028:	910003fd 	mov	x29, sp
   1202c:	a8c17bfd 	ldp	x29, x30, [sp], #16
   12030:	d65f03c0 	ret

Disassembly of section .plt:

0000000000012040 <abort@plt-0x20>:
   12040:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
   12044:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   12048:	f9424211 	ldr	x17, [x16, #1152]
   1204c:	91120210 	add	x16, x16, #0x480
   12050:	d61f0220 	br	x17
   12054:	d503201f 	nop
   12058:	d503201f 	nop
   1205c:	d503201f 	nop

0000000000012060 <abort@plt>:
   12060:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   12064:	f9424611 	ldr	x17, [x16, #1160]
   12068:	91122210 	add	x16, x16, #0x488
   1206c:	d61f0220 	br	x17

0000000000012070 <__libc_start_main@plt>:
   12070:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   12074:	f9424a11 	ldr	x17, [x16, #1168]
   12078:	91124210 	add	x16, x16, #0x490
   1207c:	d61f0220 	br	x17

0000000000012080 <__gmon_start__@plt>:
   12080:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   12084:	f9424e11 	ldr	x17, [x16, #1176]
   12088:	91126210 	add	x16, x16, #0x498
   1208c:	d61f0220 	br	x17

0000000000012090 <__cxa_finalize@plt>:
   12090:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   12094:	f9425211 	ldr	x17, [x16, #1184]
   12098:	91128210 	add	x16, x16, #0x4a0
   1209c:	d61f0220 	br	x17

00000000000120a0 <aligned_alloc@plt>:
   120a0:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   120a4:	f9425611 	ldr	x17, [x16, #1192]
   120a8:	9112a210 	add	x16, x16, #0x4a8
   120ac:	d61f0220 	br	x17

00000000000120b0 <_ZNSt6chrono3_V212system_clock3nowEv@plt>:
   120b0:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   120b4:	f9425a11 	ldr	x17, [x16, #1200]
   120b8:	9112c210 	add	x16, x16, #0x4b0
   120bc:	d61f0220 	br	x17

00000000000120c0 <_ZNSt6thread4joinEv@plt>:
   120c0:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   120c4:	f9425e11 	ldr	x17, [x16, #1208]
   120c8:	9112e210 	add	x16, x16, #0x4b8
   120cc:	d61f0220 	br	x17

00000000000120d0 <printf@plt>:
   120d0:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   120d4:	f9426211 	ldr	x17, [x16, #1216]
   120d8:	91130210 	add	x16, x16, #0x4c0
   120dc:	d61f0220 	br	x17

00000000000120e0 <free@plt>:
   120e0:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   120e4:	f9426611 	ldr	x17, [x16, #1224]
   120e8:	91132210 	add	x16, x16, #0x4c8
   120ec:	d61f0220 	br	x17

00000000000120f0 <__cxa_begin_catch@plt>:
   120f0:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   120f4:	f9426a11 	ldr	x17, [x16, #1232]
   120f8:	91134210 	add	x16, x16, #0x4d0
   120fc:	d61f0220 	br	x17

0000000000012100 <_ZSt9terminatev@plt>:
   12100:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   12104:	f9426e11 	ldr	x17, [x16, #1240]
   12108:	91136210 	add	x16, x16, #0x4d8
   1210c:	d61f0220 	br	x17

0000000000012110 <sched_yield@plt>:
   12110:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   12114:	f9427211 	ldr	x17, [x16, #1248]
   12118:	91138210 	add	x16, x16, #0x4e0
   1211c:	d61f0220 	br	x17

0000000000012120 <_ZdlPv@plt>:
   12120:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   12124:	f9427611 	ldr	x17, [x16, #1256]
   12128:	9113a210 	add	x16, x16, #0x4e8
   1212c:	d61f0220 	br	x17

0000000000012130 <_ZSt20__throw_length_errorPKc@plt>:
   12130:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   12134:	f9427a11 	ldr	x17, [x16, #1264]
   12138:	9113c210 	add	x16, x16, #0x4f0
   1213c:	d61f0220 	br	x17

0000000000012140 <_Znwm@plt>:
   12140:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   12144:	f9427e11 	ldr	x17, [x16, #1272]
   12148:	9113e210 	add	x16, x16, #0x4f8
   1214c:	d61f0220 	br	x17

0000000000012150 <__cxa_rethrow@plt>:
   12150:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   12154:	f9428211 	ldr	x17, [x16, #1280]
   12158:	91140210 	add	x16, x16, #0x500
   1215c:	d61f0220 	br	x17

0000000000012160 <__cxa_end_catch@plt>:
   12160:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   12164:	f9428611 	ldr	x17, [x16, #1288]
   12168:	91142210 	add	x16, x16, #0x508
   1216c:	d61f0220 	br	x17

0000000000012170 <_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@plt>:
   12170:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   12174:	f9428a11 	ldr	x17, [x16, #1296]
   12178:	91144210 	add	x16, x16, #0x510
   1217c:	d61f0220 	br	x17

0000000000012180 <_ZNSt6thread6_StateD2Ev@plt>:
   12180:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   12184:	f9428e11 	ldr	x17, [x16, #1304]
   12188:	91146210 	add	x16, x16, #0x518
   1218c:	d61f0220 	br	x17

0000000000012190 <fwrite@plt>:
   12190:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   12194:	f9429211 	ldr	x17, [x16, #1312]
   12198:	91148210 	add	x16, x16, #0x520
   1219c:	d61f0220 	br	x17

00000000000121a0 <_Unwind_Resume@plt>:
   121a0:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   121a4:	f9429611 	ldr	x17, [x16, #1320]
   121a8:	9114a210 	add	x16, x16, #0x528
   121ac:	d61f0220 	br	x17

00000000000121b0 <__getauxval@plt>:
   121b0:	90000110 	adrp	x16, 32000 <_DYNAMIC+0xfda8>
   121b4:	f9429a11 	ldr	x17, [x16, #1328]
   121b8:	9114c210 	add	x16, x16, #0x530
   121bc:	d61f0220 	br	x17
