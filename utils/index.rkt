#lang racket

(provide
    sq
    cube
    fast-expt)
    
; (define <= (lambda (a b) (or (= a b) (< a b))))
(define (sq x) (* x x))
(define (cube x) (* x x x))
(define (fast-expt base exp)
    (cond ((= exp 0) 1)
        ((even? exp)
            (sq (fast-expt base (/ exp 2))))
        (else
            (* base (fast-expt base (- exp 1))))))