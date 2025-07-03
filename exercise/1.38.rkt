#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (cont-frac n d k)
    (define (iter i res)
        (if (= i 0)
            res
            (iter (- i 1)
                (/ (n i)
                    (+ (d i) res)))))
    (iter k 0.0))

; i 从 1 开始
(define (d i)
    (if (= (remainder i 3) 2)
        (* 2 (/ (+ i 1) 3))
        1))

(cont-frac
    (lambda (i) 1.0)
    d
    100)

