#lang racket
(require sicp)
(require "../utils/index.rkt")
(require "../utils/listoperations.rkt")

(list 'a 'b 'c)
(list (list 'george))
(cdr '((x1 x2) (y1 y2)))
(cadr '((x1 x2) (y1 y2)))
(pair? (car '((red shoes) (blue socks))))
(memq 'red '((red shoes) (blue socks)))
(memq 'red '(red shoes blue socks))

; (a b c)
; ((george))
; ((y1 y2))
; (y1 y2)
; true
; false
; (red shoes blue socks)