#lang racket
(require sicp)
(require "../utils/index.rkt")
(require "../utils/listoperations.rkt")
(require "./2.46.rkt")

(define (make-segment start end)
    (list start end))

(define (start-segment s)
    (car s))

(define (end-segment s)
    (cadr s))

