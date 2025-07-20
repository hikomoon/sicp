#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (cons x y)
    (* (pow 2 x) (pow 3 y)))

(define (car p)
    (define x 0)
    (define (iter r)
        (if (not (= (remainder r 2) 0))
            x
            ((lambda ()
                (set! x (+ x 1))
                (iter (/ r 2))))))
    (iter p))

(define a (cons 3 2))
(car a)