#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (cubic a b c)
    (lambda (x)
        (+ (* x x x)
            (* a x x)
            (* b x)
            c)))

(newton-method (cubic 1 2 3) 1.0)