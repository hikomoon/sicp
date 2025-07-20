#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (make-interval a b) (cons a b))
(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))

(define (sub-interval i1 i2)
    (make-interval (- (lower-bound i1) (upper-bound i2))
        (- (upper-bound i1) (lower-bound i2))))

(define i1 (make-interval 1 3)) width 1
(define i2 (make-interval -2 4)) width 3
(sub-interval i1 i2)
(cons -3 5)
width is 4
for add
(cons -1 7)
width is 4

but mul
(cons -6 12) width is 9
不同的区间乘法，width 也会有区别
div
(cons -Infinity Infinity)? 或者跨越0

在不确定性传播时，有些操作是可控的，有些则不是
