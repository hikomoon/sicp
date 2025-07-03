#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (sum term a next b)
    (define (iter a res)
        (if (= a (+ b 1))
            res
            (iter (next a) (+ res (term a)))))
    (iter a 0))

(define (identity x) x)
(define (inc x) (+ x 1))
(sum identity 0 inc 10)