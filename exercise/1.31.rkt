#lang racket
(require sicp)
(require "../utils/index.rkt")

; (define (product term a next b)
;     (define (iter a res)
;         (if (> a b)
;             res
;             (iter (next a) (* res (term a)))))
;     (iter a 1))

; (define (identity x) x)
; (define (inc x) (+ x 1))
; (product identity 1 inc 4)

(define (product term a next b)
    (if (> a b) 1
        (* (term a) (product term (next a) next b))))
    

(define (identity x) x)
(define (inc x) (+ x 1))
(product identity 1 inc 4)