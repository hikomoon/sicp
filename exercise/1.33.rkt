#lang racket
(require sicp)
(require "../utils/index.rkt")


(define (filter-accumulate predicate combiner null-value term a next b)
    (define (iter a res)
        (if (> a b)
            res
            (iter (next a)
                (if (predicate a)
                    (combiner res (term a))
                    res))))
    (iter a null-value))

; (define (p x) (= (remainder x 2) 0))
; (filter-accumulate prime? + 0 identity 0 inc 10) ;1 2 3 5 7

(define (coprime? n)
    (lambda (i)
        (and (< i n)
            (= 1 (gcd i n)))))
(filter-accumulate (coprime? 10) * 1 identity 1 inc 10) ;