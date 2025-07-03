#lang racket

(provide
    sq
    cube
    fast-expt
    prime?
    newton-method
    fixed-point
    fixed-point-of-transform
    pow
    average-damp
)
    
; (define <= (lambda (a b) (or (= a b) (< a b))))
(define (sq x) (* x x))
(define (cube x) (* x x x))
(define (fast-expt base exp)
    (cond ((= exp 0) 1)
        ((even? exp)
            (sq (fast-expt base (/ exp 2))))
        (else
            (* base (fast-expt base (- exp 1))))))

(define (smallest-divisor n)
    (find-divisor n 2))
(define (find-divisor n test-divisor)
    (cond ((> (sq test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b) (= (remainder a b) 0))
(define (prime? n)
    (= (smallest-divisor n) n))
(define (next test-divisor)
    (if (= test-divisor 2)
        3
        (+ test-divisor 2)))

(define tolerance 0.00001)
(define (fixed-point f guess)
    (define (close-enough? a b)
        (< (abs (- a b)) tolerance))
    (define (improve-guess guess)
        (/ (+ guess (f guess)) 2))
    (define (iter guess)
        (if (close-enough? guess (improve-guess guess))
            guess
            (iter (improve-guess guess))))
    (iter guess))
(define (fixed-point-of-transform g transform guess)
    (fixed-point (transform g) guess))

(define dx 0.00001)
(define (deriv g)
    (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define (newton-transform g)
    (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newton-method g guess)
    (fixed-point (newton-transform g) guess))

(define (pow base n)
    (if (= n 1) base
        (* base (pow base (- n 1)))))

(define (average-damp f)
    (lambda (x)
        (/ (+ x (f x)) 2)))