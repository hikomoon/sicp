;lisp use applicative order, so we should follow this way
;"evaluate arguments and apply"
;if use new-if for example:
(sqrt-iter 1.0 2)
(new-if (good-enough? 1.0 2)
        1.0
        (sqrt-iter (improve 1.0 2) 2))
;and interpreter will try to evaluate the second operand
;and the stack will overflow
;notice that here is some contrast with infinite loop, because it is not tail recursive