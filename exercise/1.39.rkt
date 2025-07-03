#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (cont-frac n d k)
    (define (iter i res)
        (if (= i 0)
            res
            (iter (- i 1)
                (/ (n i)
                    (+ (d i) res)))))
    (iter k 0.0))

(define (tan x)
    (cont-frac
        (lambda (i)
            (if (= i 1) x (sq x)))
        (lambda (i)
            (- (* i 2) 1))
        1000))

(tan 3.14)