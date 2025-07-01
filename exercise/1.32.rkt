#lang racket
(require sicp)
(require "../utils/index.rkt")

; (define (accumulate combiner null-value term a next b)
;     (if (> a b)
;         null-value
;         (combiner
;             (term a)
;             (accumulate
;                 combiner
;                 null-value
;                 term
;                 (next a)
;                 next
;                 b))))


(define (accumulate combiner null-value term a next b)
    (define (iter a res)
        (if (> a b)
            res
            (iter (next a)
                (combiner res (term a)))))
    (iter a null-value))

(accumulate + 0 identity 0 inc 10)