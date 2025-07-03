#lang racket
(require "../utils/index.rkt")

(define (sum-of-squares a b)
  (+ (* a a) (* b b)))
(define (f a b c)
    (cond ((and (<= a b) (<= a c)) (sum-of-squares b c))
          ((and (<= b a) (<= b c)) (sum-of-squares a c))
          ((and (<= c a) (<= c b)) (sum-of-squares a b))))

;test
(= (f 2 3 4) 25)