#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (last-pair items)
    (if (null? (cdr items))
        (car items)
        (last-pair (cdr items))))

(last-pair (list 1 3 423 654 1 23))