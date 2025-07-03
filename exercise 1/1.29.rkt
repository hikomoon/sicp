#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (integral f a b n)
    (define h (/ (- b a) n))
    (define (k nth)
        (cond ((or (= nth 0) (= nth n)) 1)
            ((odd? nth) 4)
            (else 2)))
    (define (y nth) (f (+ a (* nth h))))
    (/ (* h (integral-iter n 0 y k)) 3.0))

(define (integral-iter nth sum y k)
    (if (= nth 0) 
        sum
        (integral-iter
            (- nth 1)
            (+ sum (* (k nth) (y nth)))
            y
            k)))

(define (cube x) (* x x x))
(integral cube 0 1 100)
(integral cube 0 1 1000)