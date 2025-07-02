#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (f g) (g 2))

(f f)
(f 2)
2 is not a procedure