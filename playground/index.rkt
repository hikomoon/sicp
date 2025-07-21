#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (list-ref items n)
    (if (= n 0)
        (car items)
        (list-ref (cdr items) (- n 1))))
(define (length items)
    (if (null? items)
        0
        (+ 1 (length (cdr items)))))

(define a (list 1 2 3 4))
(list-ref a 2)
(length a)