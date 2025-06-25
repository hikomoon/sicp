#lang sicp

(define (expt b n)
    (if (= n 0)
        1
        (* b (expt b (- n 1)))))

(expt 2 3)

(define (expt b n)
    (expt-iter b n 1))

(define (expt-iter b counter product)
    (cond ((= counter 0) product)
        (else (expt-iter b (- counter 1) (* product b)))))

(expt 2 3)

(define (even? n) (= (remainder n 2) 0))
(define (square n) (* n n))

(define (fast-expt b n)
    (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(fast-expt 2 0)
(fast-expt 2 3)
(fast-expt 2 4)
(fast-expt 2 8)
(fast-expt 2 16)

(define (fast-expt b n)
    (fast-expt-iter b n 1))

(define (fast-expt-iter b counter product)
    (cond ((= counter 0) product)
        ((even? counter) (fast-expt-iter (square b) (/ counter 2) product))
        (else (fast-expt-iter b (- counter 1) (* b product)))))

(fast-expt 2 0)
(fast-expt 2 3)
(fast-expt 2 4)
(fast-expt 2 8)
(fast-expt 2 16)