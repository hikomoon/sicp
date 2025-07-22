#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (square-tree tree factor)
    (if (pair? tree)
        (cons (square-tree (car tree) factor)
            (square-tree (cdr tree) factor))
        (if (null? tree) '() (factor tree))))

(define t (list 1
                (list 2 (list 3 4) 5)
                (list 6 7)))

(display (square-tree t (lambda (x) (sq x))))

(define (square-tree-v1 tree factor)
    (map (lambda (node)
        (if (pair? node)
            (square-tree-v1 node factor)
            (if (null? node) '() (factor node))))
    tree))
(display (square-tree-v1 t (lambda (x) (sq x))))