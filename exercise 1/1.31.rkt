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
    
; (define (identity x) x)
; (define (inc x) (+ x 1))
; (product identity 1 inc 4)


(define (pi)
    (define (term x) (/ (* (+ x 1) (- x 1)) (sq x)))
    (define (next a) (+ a 2))
    (exact->inexact (* 4 (product term 3 next 10000))))

(pi)