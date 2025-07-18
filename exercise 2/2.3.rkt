#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (make-segment p1 p2) (cons p1 p2))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))
(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))

(define (midpoint-segment s)
    (make-point
        (/ 
            (+ (x-point (start-segment s))
                (x-point (end-segment s)))
            2.0)
        (/ 
            (+ (y-point (start-segment s))
                (y-point (end-segment s)))
            2.0)))

(define (make-rec p1 p2 p3)
    (cons p1 (cons p2 p3)))
(define (a-rec r)
    (car r))
(define (b-rec r)
    (car (cdr r)))
(define (c-rec r)
    (cdr (cdr r)))
(define (distance p1 p2)
    (cond ((= (x-point p1) (x-point p2)) (abs (- (y-point p2) (y-point p1))))
        ((= (y-point p1) (y-point p2)) (abs (- (x-point p2) (x-point p1))))
        (else (let ((s1 (- (x-point p2) (x-point p1))) (s2 (- (y-point p2) (y-point p1))))
            (sqrt (+ (sq s1) (sq s2)))))))
(define (perimeter r)
    (+ (distance (a-rec r) (b-rec r))
        (distance (c-rec r) (b-rec r)) 
        (distance (a-rec r) (c-rec r))))
(define (area r)
    (let ((p (/ (perimeter r) 2)))
        (sqrt (* p 
                (- p (distance (a-rec r) (b-rec r)))
                (- p (distance (a-rec r) (c-rec r)))
                (- p (distance (c-rec r) (b-rec r)))))))

(define r (make-rec
            (make-point 0 0)
            (make-point 0 1)
            (make-point 1 0)))
(perimeter r)
(area r)


