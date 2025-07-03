; #lang sicp

; for applicative order

; (gcd 206 40)
; (gcd 40 (remainder 206 40))
; (gcd 6 (remainder 40 6))
; (gcd 4 (remainder 6 4))
; (gcd 2 (remainder 4 2))
; 2

; 一共四次

; for normal order

; 需要疯狂替换 if，然后执行 predicates，然后子句，次数多的多