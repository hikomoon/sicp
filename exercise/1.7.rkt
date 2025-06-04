; (sqrt 0.00001)
; 0.03135649010771716
; if use very small number, it will easy pass good-enough? test
; (sqrt 13789789781236121)
; if use very large number, it will take a long time to check every good-enough? test
; and new way is effective

#lang sicp

(define (square x) (* x x))
(define (abs x)
    (if (< x 0) (- x) x))

(define (good-enough? guess next)
    (define tolerance 0.001)
    (< (abs (- guess next)) tolerance))

(define (sqrt x)
    (define (sqrt-iter guess)
        (if (good-enough? guess (improve guess))
            guess
            (sqrt-iter (improve guess))))
    (define (improve guess)
        (/ (+ guess (/ x guess)) 2))
    (sqrt-iter 1.0))

(sqrt 0.00001)
;0.0034205558981478842
(sqrt 13789789781236121)
;117429935.62646675