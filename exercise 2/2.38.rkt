#lang racket
(require sicp)
(require "../utils/index.rkt")

; fold-right 是递归process，因为会延迟执行 op
; 最开始执行的是最右侧的 item

; fold-left 是迭代 process，最开始执行左侧 item 直到最右边

; 注意，要产生同样的结果，op 需要满足结合律。。