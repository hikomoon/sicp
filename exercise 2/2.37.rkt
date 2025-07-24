#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (accumulate-n op init seqs)
    (if (null? (car seqs))
        nil
        (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

;这里的 map 是多列表，也就是会接受多个参数，并将参数应用给 p
(define (dot-product v w)
    (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
    (map (lambda (x) (dot-product v x)) m))

(define (transpose mat)
    (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
    (let ((cols (transpose n)))
        (map
            (lambda (mv) (matrix-*-vector cols mv))
            m)))

(define matrix (list (list 1 2 3) (list 4 5 6)))
(define matrix1 (list (list 7 8) (list 9 10) (list 11 12)))
(define v (list 1 2))

(dot-product v v)
(newline)
(display (matrix-*-vector matrix v))
(newline)
(display (transpose matrix))
(newline)
(display (matrix-*-matrix matrix matrix1))
