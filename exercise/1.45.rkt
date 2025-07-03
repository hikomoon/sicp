#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (compose f g)
    (lambda (x) (f (g x))))

(define (repeated-v1 f n)
    (if (= n 1)
        f
        (compose f (repeated-v1 f (- n 1)))))

(define (nth-root x n)
    (define (nth-root-transform y)
        (/ x (expt y (- n 1))))
    (fixed-point-of-transform
        nth-root-transform
        (repeated-v1 average-damp (ceiling (/ (log n) (log 2))))
        1.0))

(nth-root 100 2)
(nth-root 27 3)
(nth-root 16 4)
(nth-root 256 8)
; assume that average damp need log2nth times.(because 1 damp for ^2)