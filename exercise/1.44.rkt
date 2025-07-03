#lang racket
(require sicp)
(require "../utils/index.rkt")


(define (compose f g)
    (lambda (x)
        (f (g x))))

(define (repeated-v1 f nth)
    (if (= nth 2)
        (compose f f)
        (compose f (repeated-v1 f (- nth 1)))))

(define dx 0.00001)
(define (average x1 x2 x3) (/ (+ x1 x2 x3) 3))
(define (smooth f)
    (lambda (x)
        (average (f x) (f (+ x dx)) (f (- x dx)))))

(define (smooth-nth f n)
    ((repeated-v1 smooth n) f))


((smooth-nth cube 2) 3)