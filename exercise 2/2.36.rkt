#lang racket
(require sicp)
(require "../utils/index.rkt")


(define (accumulate-n op init seqs)
    (if (null? (car seqs))
        nil
        (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define l (list (list 1 2 3) (list 1 2 3) (list 1 2 3) (list 1 2 3)))

(display (accumulate-n + 0 l))