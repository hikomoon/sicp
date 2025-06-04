#lang sicp

(define (cube x) (* x x x))
(define (abs x)
    (if (< x 0) (- x) x))

(define (good-enough? guess next)
    (define tolerance 0.001)
    (< (abs (- guess next)) tolerance))

(define (cube-root x)
    (define (iter guess)
        (if (good-enough? guess (improve guess))
            guess
            (iter (improve guess))))
    (define (improve guess)
        (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
    (iter 1.0))

(cube-root 1.0)
(cube-root 27)