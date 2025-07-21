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

(define (center i) (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i) (/ (- (upper-bound i) (lower-bound i)) 2))
(define (make-center-percent center percent)
    (make-interval (- center (* center percent))
        (+ center (* center percent))))
(define (percent i)
    (/ (width i) (center i)))

(define (par1 r1 r2)
    (div-interval 
        (mul-interval r1 r2)
        (add-interval r1 r2)))
(define (par2 r1 r2)
    (let ((one (make-interval 1 1)))
        (div-interval 
            one
            (add-interval 
                (div-interval one r1) 
                (div-interval one r2)))))

(define i1 (make-interval 3 4))
(define i2 (make-interval 6 8))
(par1 i1 i2)
(par2 i1 i2)


; 不同的计算路径（比如直接乘法 vs. 先取倒数再除）可能导致结果精度有明显不同。
; 数据抽象的接口背后可能隐藏着实现细节对精度的影响。