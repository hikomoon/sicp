#lang racket
(require sicp)
(require "../utils/index.rkt")


(define (reverse items)
    (define (iter i r)
        (if (null? i)
            r
            (iter (cdr i)
                (cons (car i) r))))
    (iter items '()))


(define n (reverse (list 1 2 3 4 5 6)))
(display (list 1 2 3 4 5 6))
(display n)