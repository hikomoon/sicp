#lang racket
(require sicp)
(require "../utils/index.rkt")
(require "../utils/listoperations.rkt")

(define (origin-frame frame)
    (car frame))

(define (edge1-frame frame)
    (cadr frame))

(define (edge2-frame frame)
    (caddr frame))

(define (origin-frame frame)
    (car frame))

(define (edge1-frame frame)
    (cadr frame))

(define (edge2-frame frame)
    (cdr (cdr frame)))