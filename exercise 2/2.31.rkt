#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (tree-map factor tree)
    (if (pair? tree)
        (cons (tree-map factor (car tree))
            (tree-map factor (cdr tree)))
        (if (null? tree) '() (factor tree))))

(define (square-tree tree) (tree-map sq tree))

(define t (list 1
                (list 2 (list 3 4) 5)
                (list 6 7)))

(display (square-tree t))
