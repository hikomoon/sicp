#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (expmod base exp m)
    (cond ((= exp 0) 1)
        ((nontrivial-square-root? base m) 0)
        ((even? exp)
            (remainder 
                (sq (expmod base (/ exp 2) m)) 
                m))
        (else
            (remainder 
                (* base (expmod base (- exp 1) m))
                m))))

(define (nontrivial-square-root? a n)
    (and (not (= a 1))
         (not (= a (- n 1)))
         (= 1 (remainder (sq a) n))))

(define (fermat-test-pro n a)
    (= (expmod a n n) a))

(define (test-iter n times)
    (cond ((= times 0) true)
        ((fermat-test-pro n times) (test-iter n (- times 1)))
        (else false)))

(define (Miller-Rabin-test n)
    (let ((times (ceiling (/ n 2))))
        (test-iter n times)))

(Miller-Rabin-test 561)
(Miller-Rabin-test 1105)
(Miller-Rabin-test 7)
(Miller-Rabin-test 17)
(Miller-Rabin-test 19)