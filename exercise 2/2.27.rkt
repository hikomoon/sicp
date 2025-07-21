#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (reverse items)
  (if (null? items)
      '()
      (append (reverse (cdr items)) (list (car items)))))

(define (deep-reverse items)
    (if (null? items)
        '()
        (append (deep-reverse (cdr items)) (list (if (pair? (car items))
            (deep-reverse (car items))
            (car items))))))

(define x (list (list 1 2) (list 3 4)))
(display (deep-reverse x))
