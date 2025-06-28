#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (expmod base exp m)
    (cond ((= exp 0) 1)
        ((even? exp)
            (remainder 
                (sq (expmod base (/ exp 2) m)) 
                m))
        (else
            (remainder 
                (* base (expmod base (- exp 1) m))
                m))))

(define (fermat-test n a)
    (= (expmod a n n) a))

(define (prime? n a)
    (cond ((= a 1) true)
        ((fermat-test n a) (prime? n (- a 1)))
        (else false)))

(prime? 561 560)
(/ 561 3)