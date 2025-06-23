#lang sicp

; (define (+ a b)
;   (if (= a 0)
;       b
;       (inc (+ (dec a) b))))

; (define (+ a b)
;   (if (= b 0)
;       a
;       (+ (inc a) (dec b))))
; (+ 4 5)
; (inc (+ 3 5))
; (inc (inc (+ 2 5)))
; (inc (inc (inc (+ 1 5))))
; (inc (inc (inc (inc (+ 0 5)))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9

; (+ 4 5)
; (+ 5 4)
; (+ 6 3)
; (+ 7 2)
; (+ 8 1)
; (+ 9 0)
; 9

; easy to see that first is recursive, second is iterative