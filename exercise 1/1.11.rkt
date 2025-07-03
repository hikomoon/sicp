#lang sicp

; (define (count-change amount)
;     (cc amount 5))
; (define (cc amount kinds)
;     (cond ((= amount 0) 1)
;         ((or (< amount 0) (= kinds 0)) 0)   
;         (else (+ (cc amount (- kinds 1))
;             (cc (- amount (first-denomination kinds)) kinds)))))
; (define (first-denomination kinds)
;     (cond ((= kinds 1) 1)
;         ((= kinds 2) 5)
;         ((= kinds 3) 10)
;         ((= kinds 4) 25)
;         ((= kinds 5) 50)))


(define (f n)
    (if (< n 3) n
        (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

(f 1)
(f 3)
(f 4)

(define (f n)
    (f-iter 0 1 2 n 0))

(define (f-iter a b c n count)
    (if (= count n) a
        (f-iter b c (+ (* 3 a) (* 2 b) c) n (+ count 1))))

(f 1)
(f 3)
(f 4)