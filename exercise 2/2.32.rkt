#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (subsets s)
    (if (null? s)
        (list nil)
        (let ((rest (subsets (cdr s))))
            (append rest (map
                (lambda (sub-s) 
                    (append (list (car s)) sub-s)) rest)))))

(define l (list 1 2 3))

(display (subsets l))

; 一个集合，等于除去第一个元素的所有集合，和第一个元素和剩下的所有集合分别组成的集合？
; 😓
; 可能要参考下组合数学，虽然做出来了，但是不完全明白