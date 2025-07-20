#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (make-interval a b) (cons a b))
(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))

(define (add-interval i1 i2)
    (make-interval (+ (lower-bound i1) (lower-bound i2))
        (+ (upper-bound i1) (upper-bound i2))))
(define (sub-interval i1 i2)
    (make-interval (- (lower-bound i1) (upper-bound i2))
        (- (upper-bound i1) (lower-bound i2))))
(define (mul-interval i1 i2)
    (if )
    (let ((p1 (* (lower-bound i1) (lower-bound i2)))
        (p2 (* (lower-bound i1) (upper-bound i2)))
        (p3 (* (upper-bound i1) (lower-bound i2)))
        (p4 (* (upper-bound i1) (upper-bound i2))))
        (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))
(define (div-interval i1 i2)
    (if (or (= (lower-bound i2) 0) (= (upper-bound i2) 0))
        (error "fuck 0")
        (mul-interval
            i1
            (make-interval (/ 1.0 (lower-bound i2))
                (/ 1.0 (upper-bound i2))))))

; (define i1 (make-interval 1 3))
; (define i2 (make-interval 0 2))
; (add-interval i1 i2)
; (sub-interval i1 i2)
; (mul-interval i1 i2)
; (div-interval i1 i2)

; 目的，将一个通用但是低效的方法，通过 case by condition 优化

(define (mul i1 i2)
    (if (and (< (lower-bound i1) 0)
            (> (upper-bound i1) 0)
            (< (lower-bound i2) 0)
            (> (upper-bound i2) 0))
        (make-interval (min (* (lower-bound i1) (upper-bound i2)) (* (lower-bound i2) (upper-bound i1) (* (lower-bound i2) (lower-bound i1) (* (upper-bound i2) (upper-bound i1)))))
            (max (* (lower-bound i1) (upper-bound i2)) (* (lower-bound i2) (upper-bound i1) (* (lower-bound i2) (lower-bound i1) (* (upper-bound i2) (upper-bound i1))))))
        (make-interval (min (* (lower-bound i1) (upper-bound i2)) (* (lower-bound i2) (upper-bound i1)))
            (max (* (lower-bound i1) (upper-bound i2)) (* (lower-bound i2) (upper-bound i1))))))