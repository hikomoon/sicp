#lang sicp

(define (f row col)
    (cond ((or (< row 3) (= row col)) 1)
        ((= col 1) 1)
        ((= col 0) 0)
        (else (+ (f (- row 1) col) (f (- row 1) (- col 1))))))


(f 5 2)
(f 5 3)