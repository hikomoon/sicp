#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (repeated f nth)
    (lambda (x)
        (if (= nth 1)
            (f x)
            ((repeated f (- nth 1)) (f x)))))

((repeated inc 10) 1)
((repeated sq 2) 5)

(define (compose f g)
    (lambda (x)
        (f (g x))))

(define (repeated-v1 f nth)
    (if (= nth 2)
        (compose f f)
        (compose f (repeated-v1 f (- nth 1)))))

((repeated-v1 inc 10) 1)
((repeated-v1 sq 2) 5)