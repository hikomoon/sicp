#lang racket
(require sicp)
(require "../utils/index.rkt")



(define (same-parity x . l)
    (define arr (list x))
    (define r (remainder x 2))
    (define (f l)
        (if (null? l)
            arr
            ((lambda ()
                (if (= r (remainder (car l) 2))
                    (set! arr (append arr (list (car l)))))
                (f (cdr l))))))
    (f l))

(display (same-parity 1 2 3 4 5 6 7))
(display (same-parity 2 3 4 5 6 7))