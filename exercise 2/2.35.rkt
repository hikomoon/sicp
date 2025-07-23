#lang racket
(require sicp)
(require "../utils/index.rkt")

; (define (count-leaves x)
;   (cond ((null? x) 0)
;         ((not (pair? x)) 1)
;         (else (+ (count-leaves (car x))
;                  (count-leaves (cdr x))))))

(define (map p sequence)
    (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (count-leaves t)
    (accumulate
        +
        0
        (map (lambda (node)
                (cond ((null? node) 0)
                    ((not (pair? node)) 1)
                    (else (count-leaves node)))) t)))


(define t (list (list 1 2) (list 3 4)))
(count-leaves (list t t))