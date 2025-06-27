#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (expmod base exp m)
    (cond ((= exp 0) 1)
        ((even? exp)
            (remainder 
                (sq (expmod base (/ exp 2) m)) 
                m))
        (else
            (remainder 
                (* base (expmod base (- exp 1) m))
                m))))

(define (fermat-test n)
    (define (try-it a)
        (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
    (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
    (if (fast-prime? n 10)
        (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))

(timed-prime-test 1000000021) ;6

; big O 并不代表实际运行速度，会收到别的因素影响，但是简单比较大小还是磨的问题，n 越大越明显