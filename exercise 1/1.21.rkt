#lang sicp

; (define square (lambda (x) (* x x)))

; (define (expmod base exp m)
;     (cond ((= exp 0) 1)
;         ((even? exp)
;             (remainder 
;                 (square (expmod base (/ exp 2) m)) 
;                 m))
;         (else
;             (remainder 
;                 (* base (expmod base (- exp 1) m))
;                 m))))

; (define (fermat-test n)
;     (define (try-it a)
;         (= (expmod a n n) a))
;     (try-it (+ 1 (random (- n 1)))))

; (fermat-test 13)

(define (square x) (* x x))
(define (smallest-divisor n)
    (find-divisor n 2))
(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder a b) 0))
; fuck this a & b

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)