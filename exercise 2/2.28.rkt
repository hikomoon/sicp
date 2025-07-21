#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (fringe items)
    (if (pair? items)
        (append (fringe (car items)) (fringe (car (cdr items))))
        (list items)))

(define l (list (list 1 2) (list 3 4)))
(display (fringe (list l l)))
