
output.elf:     file format elf32-littlearm


Disassembly of section .text:

08008000 <g_pfnVectors>:
 8008000:	00 9a 00 20 4d 82 00 08 0b 82 00 08 0b 82 00 08     ... M...........
 8008010:	0b 82 00 08 0b 82 00 08 0b 82 00 08 00 00 00 00     ................
	...
 800802c:	09 82 00 08 09 82 00 08 00 00 00 00 09 82 00 08     ................
 800803c:	09 82 00 08 0b 82 00 08 0b 82 00 08 0b 82 00 08     ................
 800804c:	0b 82 00 08 0b 82 00 08 0b 82 00 08 0b 82 00 08     ................
 800805c:	0b 82 00 08 0b 82 00 08 0b 82 00 08 0b 82 00 08     ................
 800806c:	0b 82 00 08 0b 82 00 08 0b 82 00 08 0b 82 00 08     ................
 800807c:	0b 82 00 08 0b 82 00 08 0b 82 00 08 0b 82 00 08     ................
 800808c:	09 82 00 08 09 82 00 08 09 82 00 08 09 82 00 08     ................
 800809c:	0b 82 00 08 0b 82 00 08 0b 82 00 08 0b 82 00 08     ................
 80080ac:	0b 82 00 08 0b 82 00 08 0b 82 00 08 0b 82 00 08     ................
 80080bc:	0b 82 00 08 0b 82 00 08 0b 82 00 08 0b 82 00 08     ................
 80080cc:	0b 82 00 08 0b 82 00 08 0b 82 00 08 0b 82 00 08     ................
 80080dc:	0b 82 00 08 0b 82 00 08 0b 82 00 08 0b 82 00 08     ................
 80080ec:	0b 82 00 08 0b 82 00 08 0b 82 00 08 0b 82 00 08     ................
 80080fc:	0b 82 00 08 0b 82 00 08 0b 82 00 08 0b 82 00 08     ................
 800810c:	0b 82 00 08 0b 82 00 08 0b 82 00 08 0b 82 00 08     ................
 800811c:	0b 82 00 08 0b 82 00 08 0b 82 00 08 0b 82 00 08     ................
 800812c:	0b 82 00 08                                         ....

08008130 <GetRegister>:
 8008130:	4b02      	ldr	r3, [pc, #8]	; (800813c <GetRegister+0xc>)
 8008132:	f853 0020 	ldr.w	r0, [r3, r0, lsl #2]
 8008136:	ea40 0081 	orr.w	r0, r0, r1, lsl #2
 800813a:	4770      	bx	lr
 800813c:	08008260 	.word	0x08008260

08008140 <SetState>:
 8008140:	4b0b      	ldr	r3, [pc, #44]	; (8008170 <SetState+0x30>)
 8008142:	2907      	cmp	r1, #7
 8008144:	f853 0020 	ldr.w	r0, [r3, r0, lsl #2]
 8008148:	f04f 030f 	mov.w	r3, #15
 800814c:	bfc8      	it	gt
 800814e:	f001 0107 	andgt.w	r1, r1, #7
 8008152:	b510      	push	{r4, lr}
 8008154:	bfc8      	it	gt
 8008156:	3004      	addgt	r0, #4
 8008158:	0089      	lsls	r1, r1, #2
 800815a:	fa03 f401 	lsl.w	r4, r3, r1
 800815e:	6803      	ldr	r3, [r0, #0]
 8008160:	fa02 f101 	lsl.w	r1, r2, r1
 8008164:	ea23 0304 	bic.w	r3, r3, r4
 8008168:	4319      	orrs	r1, r3
 800816a:	6001      	str	r1, [r0, #0]
 800816c:	bd10      	pop	{r4, pc}
 800816e:	bf00      	nop
 8008170:	08008260 	.word	0x08008260

08008174 <SetPin>:
 8008174:	4b05      	ldr	r3, [pc, #20]	; (800818c <SetPin+0x18>)
 8008176:	f853 0020 	ldr.w	r0, [r3, r0, lsl #2]
 800817a:	2301      	movs	r3, #1
 800817c:	fa03 f101 	lsl.w	r1, r3, r1
 8008180:	b10a      	cbz	r2, 8008186 <SetPin+0x12>
 8008182:	6101      	str	r1, [r0, #16]
 8008184:	4770      	bx	lr
 8008186:	6141      	str	r1, [r0, #20]
 8008188:	4770      	bx	lr
 800818a:	bf00      	nop
 800818c:	08008260 	.word	0x08008260

08008190 <GetPin>:
 8008190:	4b05      	ldr	r3, [pc, #20]	; (80081a8 <GetPin+0x18>)
 8008192:	f853 2020 	ldr.w	r2, [r3, r0, lsl #2]
 8008196:	2301      	movs	r3, #1
 8008198:	fa03 f101 	lsl.w	r1, r3, r1
 800819c:	6893      	ldr	r3, [r2, #8]
 800819e:	4219      	tst	r1, r3
 80081a0:	bf14      	ite	ne
 80081a2:	2001      	movne	r0, #1
 80081a4:	2000      	moveq	r0, #0
 80081a6:	4770      	bx	lr
 80081a8:	08008260 	.word	0x08008260

080081ac <pinWrite>:
 80081ac:	b570      	push	{r4, r5, r6, lr}
 80081ae:	4604      	mov	r4, r0
 80081b0:	460d      	mov	r5, r1
 80081b2:	4616      	mov	r6, r2
 80081b4:	2202      	movs	r2, #2
 80081b6:	f7ff ffc3 	bl	8008140 <SetState>
 80081ba:	b2f2      	uxtb	r2, r6
 80081bc:	4629      	mov	r1, r5
 80081be:	4620      	mov	r0, r4
 80081c0:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 80081c4:	f7ff bfd6 	b.w	8008174 <SetPin>

080081c8 <main>:
 80081c8:	2400      	movs	r4, #0
 80081ca:	b507      	push	{r0, r1, r2, lr}
 80081cc:	4d0d      	ldr	r5, [pc, #52]	; (8008204 <main+0x3c>)
 80081ce:	2201      	movs	r2, #1
 80081d0:	210a      	movs	r1, #10
 80081d2:	4610      	mov	r0, r2
 80081d4:	f7ff ffea 	bl	80081ac <pinWrite>
 80081d8:	9401      	str	r4, [sp, #4]
 80081da:	9b01      	ldr	r3, [sp, #4]
 80081dc:	42ab      	cmp	r3, r5
 80081de:	d90c      	bls.n	80081fa <main+0x32>
 80081e0:	2200      	movs	r2, #0
 80081e2:	210a      	movs	r1, #10
 80081e4:	2001      	movs	r0, #1
 80081e6:	f7ff ffe1 	bl	80081ac <pinWrite>
 80081ea:	9401      	str	r4, [sp, #4]
 80081ec:	9b01      	ldr	r3, [sp, #4]
 80081ee:	42ab      	cmp	r3, r5
 80081f0:	d8ed      	bhi.n	80081ce <main+0x6>
 80081f2:	9b01      	ldr	r3, [sp, #4]
 80081f4:	3301      	adds	r3, #1
 80081f6:	9301      	str	r3, [sp, #4]
 80081f8:	e7f8      	b.n	80081ec <main+0x24>
 80081fa:	9b01      	ldr	r3, [sp, #4]
 80081fc:	3301      	adds	r3, #1
 80081fe:	9301      	str	r3, [sp, #4]
 8008200:	e7eb      	b.n	80081da <main+0x12>
 8008202:	bf00      	nop
 8008204:	0001869f 	.word	0x0001869f

08008208 <Dummy_Handler>:
 8008208:	4770      	bx	lr

0800820a <Default_Handler>:
 800820a:	e7fe      	b.n	800820a <Default_Handler>

0800820c <__Init_Data>:
 800820c:	4a0a      	ldr	r2, [pc, #40]	; (8008238 <__Init_Data+0x2c>)
 800820e:	4b0b      	ldr	r3, [pc, #44]	; (800823c <__Init_Data+0x30>)
 8008210:	429a      	cmp	r2, r3
 8008212:	d003      	beq.n	800821c <__Init_Data+0x10>
 8008214:	490a      	ldr	r1, [pc, #40]	; (8008240 <__Init_Data+0x34>)
 8008216:	3a04      	subs	r2, #4
 8008218:	428b      	cmp	r3, r1
 800821a:	d305      	bcc.n	8008228 <__Init_Data+0x1c>
 800821c:	2100      	movs	r1, #0
 800821e:	4b09      	ldr	r3, [pc, #36]	; (8008244 <__Init_Data+0x38>)
 8008220:	4a09      	ldr	r2, [pc, #36]	; (8008248 <__Init_Data+0x3c>)
 8008222:	4293      	cmp	r3, r2
 8008224:	d305      	bcc.n	8008232 <__Init_Data+0x26>
 8008226:	4770      	bx	lr
 8008228:	f852 0f04 	ldr.w	r0, [r2, #4]!
 800822c:	f843 0b04 	str.w	r0, [r3], #4
 8008230:	e7f2      	b.n	8008218 <__Init_Data+0xc>
 8008232:	f843 1b04 	str.w	r1, [r3], #4
 8008236:	e7f4      	b.n	8008222 <__Init_Data+0x16>
 8008238:	0800827c 	.word	0x0800827c
 800823c:	20000000 	.word	0x20000000
 8008240:	20000000 	.word	0x20000000
 8008244:	20000000 	.word	0x20000000
 8008248:	20000000 	.word	0x20000000

0800824c <Reset_Handler>:
 800824c:	4668      	mov	r0, sp
 800824e:	f020 0107 	bic.w	r1, r0, #7
 8008252:	468d      	mov	sp, r1
 8008254:	b508      	push	{r3, lr}
 8008256:	f7ff ffd9 	bl	800820c <__Init_Data>
 800825a:	f7ff ffb5 	bl	80081c8 <main>
 800825e:	e7fe      	b.n	800825e <Reset_Handler+0x12>

08008260 <arrGpioBase>:
 8008260:	0800 4001 0c00 4001 1000 4001 1400 4001     ...@...@...@...@
 8008270:	1800 4001 1c00 4001 2000 4001               ...@...@. .@
