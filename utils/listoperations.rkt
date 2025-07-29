#lang racket
(require sicp)

(provide
    enumerate-interval
    accumulate
    filter
    ; map
    flatmap
    ormap
)

(define (enumerate-interval i j)
    (if (> i j)
        nil
        (cons i (enumerate-interval (+ i 1) j))))

(define (accumulate op initial seq)
    (if (null? seq)
        initial
        (op (car seq)
            (accumulate op initial (cdr seq)))))

(define (filter predicate seq)
    (if (null? seq)
        nil
        (if (predicate (car seq))
            (cons (car seq) (filter predicate (cdr seq)))
            (filter predicate (cdr seq)))))

; (define (map p sequence)
;     (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (flatmap proc s)
    (accumulate append nil (map proc s)))

(define (ormap pred seq)
    (cond ((null? seq) false)
        ((pred (car seq)) true)
        (else (ormap pred (cdr seq)))))
