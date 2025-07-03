#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (expmod base exp m)
    (remainder (fast-expt base exp) m))

(display (runtime))
(expmod 17 1000000021 1000000021)
(display (runtime)) ;????
; 因为乘幂过大，难以计算。

; (define (expmod base exp m)
;     (cond ((= exp 0) 1)
;         ((even? exp)
;             (remainder 
;                 (sq (expmod base (/ exp 2) m)) 
;                 m))
;         (else
;             (remainder 
;                 (* base (expmod base (- exp 1) m))
;                 m))))

; (display (runtime))
; (expmod 17 1000000021 1000000021)
; (display (runtime)) ;20