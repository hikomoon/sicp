#lang sicp

(define (even? n) (= (remainder n 2) 0))
(define (square n) (* n n))
(define (double x) (* x 2))
(define (halve x) (/ x 2))


(define (fast-mult a b)
    (fast-mult-iter a b 0))

(define (fast-mult-iter a b res)
    (cond ((= b 0) res)
        ((even? b) (fast-mult-iter (double a) (halve b) res))
        (else (fast-mult-iter a (- b 1) (+ res a)))))


(fast-mult 5 6)