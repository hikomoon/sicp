#lang racket
(require sicp)
(require "../utils/index.rkt")
(require "../utils/listoperations.rkt")

(define (make-vert x y)
    (list x y))

(define (xcor-vert v)
    (car v))

(define (ycor-vert v)
    (cadr v))

(define (add-vert v1 v2)
    (make-vert (+ (xcor-vert v1) (xcor-vert v2)) (+ (ycor-vert v1) (ycor-vert v2))))

(define (sub-vert v1 v2)
    (make-vert (- (xcor-vert v1) (xcor-vert v2)) (- (ycor-vert v1) (ycor-vert v2))))

(define (scale-vert v s)
    (make-vert (* s (xcor-vert v)) (* s (ycor-vert v))))

    