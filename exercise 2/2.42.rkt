#lang racket
(require sicp)
(require "../utils/index.rkt")
(require "../utils/listoperations.rkt")

(define empty-board nil)

(define (queens board-size)
    (define (queen-cols k)
        (if (= k 0)
            (list empty-board)
            (filter
                (lambda (positions) (safe? k positions))
                (flatmap
                    (lambda (rest-of-queens)
                        (map (lambda (new-row)
                                (adjoin-position
                                    new-row k rest-of-queens))
                            (enumerate-interval 1 board-size)))
                    (queen-cols (- k 1))))))
    (queen-cols board-size))

(define (adjoin-position row col rest-of-queens)
    (cons (list row col) rest-of-queens))

(define (diagonal? p1 p2)
    (let ((a (+ (car p1) (cadr p1)))
        (b (- (car p1) (cadr p1)))
        (c (+ (car p2) (cadr p2)))
        (d (- (car p2) (cadr p2))))
        (or (= a c)
            (= b d))))

(define (safe? k positions)
    (define head (car positions))
    (and (not (ormap (lambda (position) (= (car position) (car head))) (cdr positions)))
        (not (ormap (lambda (position) (diagonal? position head)) (cdr positions)))))


(display (queens 2))
