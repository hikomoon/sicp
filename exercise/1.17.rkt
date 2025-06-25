#lang sicp

(define (even? n) (= (remainder n 2) 0))
(define (square n) (* n n))
(define (double x) (* x 2))
(define (halve x) (/ x 2))


(define (fast-mult a b)
    (cond ((= b 1) a)
        ((even? b) (fast-mult (double a) (halve b)))
        (else (+ a (fast-mult a (- b 1))))))


(fast-mult 5 6)