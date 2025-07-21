#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (foreach f items)
    (if (null? items)
        (newline)
        (begin
            (f (car items))
            (foreach f (cdr items)))))

(foreach (lambda (x) (newline) (display x))
    (list 1 2 3 4 5))
