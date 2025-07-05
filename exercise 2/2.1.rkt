#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (make-rat numer denom)
    (cond ((and (> numer 0) (> denom 0))
            (cons numer denom))
        ((and (< numer 0) (< denom 0))
            (cons (- 0 numer) (- 0 denom)))
        (else (if (> numer 0)
            (cons (- 0 numer) (- 0 denom))
            (cons numer denom)))))

(define (print-rat rat)
    (newline)
    (display (car rat))
    (display "/")
    (display (cdr rat)))

(define x (make-rat 1 -3))
(print-rat x)
(newline)

; fuck.

(define (make-rat-v1 n d)
    (if (< d 0)
        (cons (- n) (- d))
        (cons n d)))

(define x1 (make-rat-v1 1 -3))
(print-rat x1)
(newline)