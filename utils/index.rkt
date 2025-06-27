#lang racket

(provide
    sq
    cube)
    
; (define <= (lambda (a b) (or (= a b) (< a b))))
(define (sq x) (* x x))
(define (cube x) (* x x x))