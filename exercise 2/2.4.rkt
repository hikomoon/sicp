#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (cons x y)
    (lambda (m) (m x y)))

(define (car z)
    (z (lambda (p q) p)))

(define (cdr z)
    (z (lambda (p q) q)))

; (car (cons 1 2))
; ((cons 1 2) (lambda (p q) p))
; (lambda (1 2) 1)
; 1
