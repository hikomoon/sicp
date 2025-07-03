#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (iterative-improve good-enough? improve)
    (define (p guess)
        (if (good-enough? guess)
            guess
            (p (improve guess))))
    p)

(define (fixed-point f guess)
    (define tolerance 0.00001)
    (define (improve guess)
        ((average-damp f) guess))
    (define (good-enough? guess)
        (< (abs (- guess (improve guess))) tolerance))
    ((iterative-improve good-enough? improve) guess))

(define (sqrt x)
    (fixed-point
        (lambda (y) (/ x y))
        1.0))

(sqrt 2)