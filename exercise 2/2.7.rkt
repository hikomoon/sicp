#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (make-interval a b) (cons a b))
(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))


