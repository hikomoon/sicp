#lang racket
(require sicp)
(require "../utils/index.rkt")
(require "../utils/listoperations.rkt")

(define (flip-horiz painter)
    (transform-painter painter
        (make-vert 1 0)
        (make-vert 0 0)
        (make-vert 1 1)))

(define (rotate180 painter)
    (transform-painter painter
        (make-vert 1 1)
        (make-vert 0 1)
        (make-vert 1 0)))

(define (rotate270 painter)
    (transform-painter painter
        (make-vert 0 1)
        (make-vert 0 0)
        (make-vert 1 1)))