









































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































	.CODE
	extern abort:near
	extern ffi_closure_win64_inner:near







	ALIGN	8
	PUBLIC	ffi_call_win64

	; 
ffi_call_win64 proc 
	
	
	mov	RAX, [RSP] ; 	movq	(%rsp), %rax
	mov [rsi], RBP ; movq	%rbp, (rsi)
	mov [rsi + 8], RAX;	movq	%rax, 8(rsi)
	mov	 RBP, rsi; movq	rsi, %rbp
	
	
	
	
	
	mov	RSP, rdi ;	movq	rdi, %rsp

	mov	R10, rdx ; movq	rdx, %r10

	
	mov	RCX, [RSP] ;	movq	(%rsp), %rcx
	movsd XMM0, qword ptr [RSP] ; movsd	(%rsp), %xmm0
	mov	RDX, [RSP + 8] ;movq	8(%rsp), %rdx
	movsd XMM1, qword ptr [RSP + 8];	movsd	8(%rsp), %xmm1
	mov R8, [RSP + 16] ; movq	16(%rsp), %r8
	movsd	XMM2, qword ptr [RSP + 16] ; movsd	16(%rsp), %xmm2
	mov	R9, [RSP + 24] ; movq	24(%rsp), %r9
	movsd	XMM3, qword ptr [RSP + 24] ;movsd	24(%rsp), %xmm3

	CALL qword ptr [RBP + 16] ; call	*16(%rbp)

	mov	 ECX, [RBP + 24] ; movl	24(%rbp), %ecx
	mov	R8, [RBP + 32] ; movq	32(%rbp), %r8
	LEA	R10, ffi_call_win64_tab ; leaq	0f(%rip), %r10
	CMP	ECX, (15 + 3) ; cmpl	$FFI_TYPE_SMALL_STRUCT_4B, %ecx
	LEA	R10, [R10 + RCX*8] ; leaq	(%r10, %rcx, 8), %r10
	JA	L99 ; ja	99f
	JMP	R10 ; jmp	*%r10



epilogue macro
	LEAVE
	
	
	
	RET
	
endm

	ALIGN 8
ffi_call_win64_tab LABEL NEAR
ALIGN 8; ORG 0b + (0) * 8
	epilogue
ALIGN 8; ORG 0b + (1) * 8
	movsxd rax, eax ; movslq	%eax, %rax
	mov qword ptr [r8], rax; movq	%rax, (%r8)
	epilogue
ALIGN 8; ORG 0b + (2) * 8
	movss dword ptr [r8], xmm0 ; movss	%xmm0, (%r8)
	epilogue
ALIGN 8; ORG 0b + (3) * 8
	movsd qword ptr[r8], xmm0; movsd	%xmm0, (%r8)
	epilogue

ALIGN 8; ORG 0b + (3 + 1) * 8
	call	abort
ALIGN 8; ORG 0b + (5) * 8
	movzx eax, al ;movzbl	%al, %eax
	mov qword ptr[r8], rax; movq	%rax, (%r8)
	epilogue
ALIGN 8; ORG 0b + (6) * 8
	movsx rax, al ; movsbq	%al, %rax
	jmp	L98
ALIGN 8; ORG 0b + (7) * 8
	movzx eax, ax ; movzwl	%ax, %eax
	mov qword ptr[r8], rax; movq	%rax, (%r8)
	epilogue
ALIGN 8; ORG 0b + (8) * 8
	movsx rax, ax; movswq	%ax, %rax
	jmp	L98
ALIGN 8; ORG 0b + (9) * 8
	mov eax, eax; movl	%eax, %eax
	mov qword ptr[r8], rax ; movq	%rax, (%r8)
	epilogue
ALIGN 8; ORG 0b + (10) * 8
	movsxd rax, eax; movslq	%eax, %rax
	mov qword ptr [r8], rax; movq	%rax, (%r8)
	epilogue
ALIGN 8; ORG 0b + (11) * 8
L98 LABEL near
	mov qword ptr [r8], rax ; movq	%rax, (%r8)
	epilogue
ALIGN 8; ORG 0b + (12) * 8
	mov qword ptr [r8], rax;movq	%rax, (%r8)
	epilogue
ALIGN 8; ORG 0b + (13) * 8
	epilogue
ALIGN 8; ORG 0b + (14) * 8
	mov qword ptr [r8], rax ;movq	%rax, (%r8)
	epilogue
ALIGN 8; ORG 0b + (15) * 8
	call	abort
ALIGN 8; ORG 0b + ((15 + 1)) * 8
	mov byte ptr [r8], al ; movb	%al, (%r8)
	epilogue
ALIGN 8; ORG 0b + ((15 + 2)) * 8
	mov word ptr [r8], ax ; movw	%ax, (%r8)
	epilogue
ALIGN 8; ORG 0b + ((15 + 3)) * 8
	mov dword ptr [r8], eax ; movl	%eax, (%r8)
	epilogue

	align	8
L99 LABEL near
	call	abort

	epilogue

	
	ffi_call_win64 endp








	align	8
	PUBLIC	ffi_go_closure_win64

ffi_go_closure_win64 proc
	
	
	mov qword ptr [rsp + 8], rcx; movq	%rcx, 8(%rsp)
	mov qword ptr [rsp + 16], rdx; movq	%rdx, 16(%rsp)
	mov qword ptr [rsp + 24], r8; movq	%r8, 24(%rsp)
	mov qword ptr [rsp + 32], r9 ;movq	%r9, 32(%rsp)

	mov rcx, qword ptr [r10 + 8]; movq	8(%r10), %rcx			
	mov rdx, qword ptr [r10 + 16];  movq	16(%r10), %rdx			
	mov r8, r10 ; movq	%r10, %r8			
	jmp	ffi_closure_win64_2
	
	ffi_go_closure_win64 endp

	align	8
	
PUBLIC ffi_closure_win64
ffi_closure_win64 proc
	
	
	mov qword ptr [rsp + 8], rcx; movq	%rcx, 8(%rsp)
	mov qword ptr [rsp + 16], rdx;	movq	%rdx, 16(%rsp)
	mov qword ptr [rsp + 24], r8; 	movq	%r8, 24(%rsp)
	mov qword ptr [rsp + 32], r9;	movq	%r9, 32(%rsp)

	mov rcx, qword ptr [16 + r10]	;movq	16(%r10), %rcx		
	mov rdx, qword ptr [16 + 8 + r10] ;	movq	16+8(%r10), %rdx	
	mov r8, qword ptr [16+16+r10] ;movq	16+16(%r10), %r8	
ffi_closure_win64_2 LABEL near
	sub rsp, (32+8+16+32) ;subq	$ffi_clo_FS, %rsp
	
	
	

	
	movsd qword ptr [(32+8+16) + rsp], xmm0	; movsd	%xmm0, (32+8+16)(%rsp)
	movsd qword ptr [(32+8+16)+8+rsp], xmm1 ; movsd	%xmm1, (32+8+16)+8(%rsp)
	movsd qword ptr [(32+8+16)+16+rsp], xmm2 ; movsd %xmm2, (32+8+16)+16(%rsp)
	movsd qword ptr [(32+8+16)+24+rsp], xmm3 ; movsd %xmm3, (32+8+16)+24(%rsp)

	lea	r9, [(32+8) + rsp] ; leaq	(32+8)(%rsp), %r9
	call ffi_closure_win64_inner

	
	
	mov rax, qword ptr [(32+8) + rsp] ;movq    (32+8)(%rsp), %rax
	movsd xmm0, qword ptr [rsp + (32+8)] ;movsd   (32+8)(%rsp), %xmm0

	add rsp, (32+8+16+32) ;addq	$ffi_clo_FS, %rsp
	
	ret

	
	ffi_closure_win64 endp




_text ends
end
