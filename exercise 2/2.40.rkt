#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (flatmap proc s)
    (accumulate append nil (map proc s)))

(define (enumerate-interval i j)
    (if (= j i)
        (list j)
        (append (list j) (enumerate-interval i (- j 1)))))

; (display (enumerate-interval 1 10))

(define (unique-pairs n)
    (flatmap (lambda (j) 
            (if (= j 1)
                nil
                (map (lambda (i) (list i j))
                    (enumerate-interval 1 (- j 1)))))
        (enumerate-interval 1 n)))

(display (unique-pairs 4))
(newline)

(define (prime-sum? s)
    (prime? (+ (car s) (cadr s))))

(display (prime-sum? (list 2 3)))
(newline)

(define (filter predicate seq)
    (if (null? seq)
        nil
        (if (predicate (car seq))
            (cons (car seq) (filter predicate (cdr seq)))
            (filter predicate (cdr seq)))))

(define (prime-sum-pairs n)
    (let ((s (unique-pairs n)))
        (filter prime-sum? s)))

(display (prime-sum-pairs 4))
(newline)