#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (flatmap proc s)
    (accumulate append nil (map proc s)))

(define (enumerate-interval i j)
    (if (= j i)
        (list j)
        (append (list j) (enumerate-interval i (- j 1)))))

(define (unique-pairs n)
    (flatmap (lambda (j) 
            (if (= j 1)
                nil
                (map (lambda (i) (list i j))
                    (enumerate-interval 1 (- j 1)))))
        (enumerate-interval 1 n)))

; (display (unique-pairs 4))
; (newline)

(define (unique-triples n)
    (if (= n 3)
        (list (list 1 2 3))
        (append (map (lambda (p) (append (list n) p)) (unique-pairs (- n 1)))
            (unique-triples (- n 1)))))

(define (unique-triples-v1 n)
    (flatmap (lambda (i) (if (= i 3) (list (list 1 2 3))
        (map (lambda (j) (cons i j)) (unique-pairs (- i 1)))))
            (enumerate-interval 3 n)))

(length (unique-triples 7))
(display (unique-triples-v1 7))
(length (unique-triples-v1 7))
(newline)

    