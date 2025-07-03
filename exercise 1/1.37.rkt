#lang racket
(require sicp)
(require "../utils/index.rkt")

; (define (cont-frac n d k)
;     (if (= k 0)
;         (/ (n k) (d k))
;         (/ (n k) (+ (d k) (cont-frac n d (- k 1))))))

; (cont-frac
;     (lambda (i) 1.0)
;     (lambda (i) 1.0)
;     8)

(define (cont-frac n d k)
    (define (iter i res)
        (if (= i 0)
            res
            (iter (- i 1)
                (/ (n i)
                    (+ (d i) res)))))
    (iter k 0.0))

(cont-frac
    (lambda (i) 1.0)
    (lambda (i) 1.0)
    11)
