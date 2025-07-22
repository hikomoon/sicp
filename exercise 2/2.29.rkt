#lang racket
(require sicp)
(require "../utils/index.rkt")

(define (make-mobile left right)
    (list left right))

(define (make-branch length structure)
    (list length structure))

(define (left-branch mobile)
    (car mobile))

(define (right-branch mobile)
    (car (cdr mobile)))

(define (branch-length branch)
    (car branch))

(define (branch-structure branch)
    (car (cdr branch)))

(define (total-weight mobile)
    (+ (branch-weight (left-branch mobile))
        (branch-weight (right-branch mobile))))

(define (branch-weight branch)
    (if (pair? (branch-structure branch))
        (total-weight (branch-structure branch))
        (branch-structure branch)))

(define (branch-torque branch)
    (* (branch-length branch) (branch-weight branch)))

(define (mobile-balanced? mobile)
    (and (branch-balanced? (left-branch mobile))
        (branch-balanced? (right-branch mobile))
        (= (branch-torque (left-branch mobile)) (branch-torque (right-branch mobile)))))

(define (branch-balanced? branch)
    (if (pair? (branch-structure branch))
        (mobile-balanced? (branch-structure branch))
        true))


;d just change left right branchlength branchstructure fn

(define mobile (make-mobile (make-branch 10 25)
                                  (make-branch 5 20)))

(display (left-branch mobile))
(display (right-branch mobile))
(branch-length (left-branch mobile))
(branch-structure (left-branch mobile))
(total-weight mobile)

(define balance-mobile (make-mobile (make-branch 10 10) (make-branch 10 10)))
(mobile-balanced? balance-mobile)
(mobile-balanced? mobile)