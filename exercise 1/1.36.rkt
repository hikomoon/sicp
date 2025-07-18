#lang racket
(require sicp)
(require "../utils/index.rkt")
(define tolerance 0.00001)
(define (fixed-point-v1 f)
    (define (close-enough? a b)
        (< (abs (- a b)) tolerance))
    (define (next guess)
        (/ (+ guess (f guess)) 2))
    (define (iter guess)
        (display guess)
        (newline)
        (if (close-enough? guess (next guess))
            guess
            (iter (next guess))))
    (iter 2.0))

(define (fixed-point-v2 f)
    (define (close-enough? a b)
        (< (abs (- a b)) tolerance))
    (define (next guess) (f guess))
    (define (iter guess)
        (display guess)
        (newline)
        (if (close-enough? guess (next guess))
            guess
            (iter (next guess))))
    (iter 2.0))


(fixed-point-v1
    (lambda (x) (/ (log 1000) (log x))))

2.0
5.9828921423310435
4.922168721308343
4.628224318195455
4.568346513136242
4.5577305909237005
4.555909809045131
4.555599411610624
4.5555465521473675
4.5555465521473675

(fixed-point-v2
    (lambda (x) (/ (log 1000) (log x))))

9.965784284662087
3.004472209841214
6.279195757507157
3.759850702401539
5.215843784925895
4.182207192401397
4.8277650983445906
4.387593384662677
4.671250085763899
4.481403616895052
4.6053657460929
4.5230849678718865
4.577114682047341
4.541382480151454
4.564903245230833
4.549372679303342
4.559606491913287
4.552853875788271
4.557305529748263
4.554369064436181
4.556305311532999
4.555028263573554
4.555870396702851
4.555315001192079
4.5556812635433275
4.555439715736846
4.555599009998291
4.555493957531389
4.555563237292884
4.555517548417651
4.555547679306398
4.555527808516254
4.555540912917957
4.555540912917957

; average damping 有利于计算收敛