#lang racket
(require sicp)
(require "../utils/index.rkt")
(require "../utils/listoperations.rkt")

(define (equal? l1 l2)
    (cond ((or (null? l1) (null? l2)) (and (null? l1) (null? l2)))
        ((not (eq? (car l1) (car l2))) false)
        (else (equal? (cdr l1) (cdr l2)))))

(equal? '(a b c d) '(a b c d e))
(equal? '(a b c d) '(a b c d))