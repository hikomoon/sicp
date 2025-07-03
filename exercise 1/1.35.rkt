#lang racket
(require sicp)
(require "../utils/index.rkt")

(define tolerance 0.00001)
(define (fixed-point f)
    (define (close-enough? a b)
        (< (abs (- a b)) tolerance))
    (define (improve-guess guess)
        (/ (+ guess (f guess)) 2))
    (define (iter guess)
        (if (close-enough? guess (improve-guess guess))
            guess
            (iter (improve-guess guess))))
    (iter 1.0))

(define (sqrt-root a)
    (define (f x) (/ a x))
    (fixed-point f))

; (sqrt-root 2)

(define (golden-radio x) (+ 1 (/ 1 x)))
(fixed-point golden-radio)