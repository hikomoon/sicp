#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (accumulate op initial seq)
    (if (null? seq)
        initial
        (op (car seq)
            (accumulate op initial (cdr seq)))))

(define (map p sequence)
    (accumulate (lambda (x y) (cons (p x) y)) nil sequence))
(define (append seq1 seq2)
    (accumulate cons seq2 seq1))
(define (length sequence)
    (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

(define seq1 (list 1 2 3))
(define seq2 (list 4 5 6))

(display (append seq1 seq2))
(display (length seq1))