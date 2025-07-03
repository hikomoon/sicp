#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (compose f g)
    (lambda (x)
        (f (g x))))

((compose sq inc) 6)