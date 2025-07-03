#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (smallest-divisor n)
    (find-divisor n 2))
(define (find-divisor n test-divisor)
    (cond ((> (sq test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b) (= (remainder a b) 0))
(define (prime? n)
    (= (smallest-divisor n) n))
(define (next test-divisor)
    (if (= test-divisor 2)
        3
        (+ test-divisor 2)))

(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))

; old version is 89
(timed-prime-test 1000000021) ;64

; because the halves number of steps is wrong 🤣?? see 1.24