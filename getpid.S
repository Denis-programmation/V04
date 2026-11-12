	.arch armv8-a

	.include	"system.def"

	.global main           
        .text        
        .align  2    

main:   stp     x29, x30, [sp, -16]!	// save link register
        mov     x8, __NR_getpid         // getpid on ARM64
        svc     0                       // execute
        mov     w1, w0			// w0 contient le PID
//        ldr     x0, =fmt
	adr	x0, fmt
	mov	w2, 1234
	mov	w3, 2345
	mov	w4, 3456
	mov	w5, 4567
	mov	w6, 5678
	adr	x7, str
        bl      printf
        ldp     x29, x30, [sp], 16	// restore link register
        mov     w0, wzr
        ret

        .data
fmt:    .asciz  "Greetings from: %d, a= %d, b= %d, c= %d, d= %d, e= %d, f= %s\n"
str:	.asciz	"blabla"

        .end
