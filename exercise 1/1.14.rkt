#lang sicp

(define (count-change amount)
    (cc amount 5))
(define (cc amount kinds)
    (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds 0)) 0)   
        (else (+ (cc amount (- kinds 1))
            (cc (- amount (first-denomination kinds)) kinds)))))
(define (first-denomination kinds)
    (cond ((= kinds 1) 1)
        ((= kinds 2) 5)
        ((= kinds 3) 10)
        ((= kinds 4) 25)
        ((= kinds 5) 50)))

(count-change 11)
(cc 11 5)
(cc 11 4) (cc -39 5)
(cc 11 3) (cc -14 4)
(cc 11 2) (cc 1 3)

; easy to see that space is prop with deep so O(kinds)
; time is 2^kinds