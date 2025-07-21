#lang racket
(require sicp)
(require "../utils/index.rkt")



; (define (square-list items)
;     (if (null? items)
;         nil
;         (cons (sq (car items)) (square-list (cdr items)))))

(define (square-list items)
    (map sq items))

(display (square-list (list 1 2 3 4)))