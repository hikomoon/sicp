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
    (define (iter res i)
        (if (= k i)
            res
            (iter
                (/ (n k)
                    (+ (d k) res))
                (+ i 1))))
    (iter (/ (n k) (d k)) 0))

(cont-frac
    (lambda (i) 1.0)
    (lambda (i) 1.0)
    8)
