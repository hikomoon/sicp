#lang racket
(require sicp)
(require "../utils/index.rkt")

(define x (list 1 2 3))
(define y (list 4 5 6))

(display (append x y))
; (list 1 2 3 4 5 6)
(display (cons x y))
; ((list 1 2 3) 4 5 6)
(display (list x y))
; ((list 1 2 3) (list 4 5 6) nil)
