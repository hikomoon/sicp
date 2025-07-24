#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (fold-left op initial seq)
    (define (iter result rest)
        (if (null? rest)
            result
            (iter (op result (car rest))
                (cdr rest))))
    (iter initial seq))

(define (reverse seq)
    (accumulate (lambda (x y) (append y (list x))) nil seq))

(define (reverse-v1 seq)
    (fold-left (lambda (x y) (cons y x)) nil seq))

(define l (list 1 2 3 4 5 6))

(display (reverse l))
(display (reverse-v1 l))