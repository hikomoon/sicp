#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (expmod base exp m)
    (cond ((= exp 0) 1)
        ((even? exp)
            ; (remainder 
            ;     (sq (expmod base (/ exp 2) m)) 
            ;     m))
            (remainder 
                (* (expmod base (/ exp 2) m) (expmod base (/ exp 2) m)) 
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
    (if (fast-prime? n 1); notice this
        (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))

(timed-prime-test 1000000021) ;7773939 with n equals 1

; explain

; (expmod 2 10 1)

; (expmod 2 5 1) (expmod 2 5 1)
; 2(expmod 2 4 1) 2(expmod 2 4 1)


; old version

; (expmod 2 10 1)
; sq(expmod 2 5 1)
; 2sq(expmod 2 4 1)
; sq2sq(expmod 2 2 1)
