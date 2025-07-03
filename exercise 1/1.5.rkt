;if use applicative order, interpreter will use "eval the arguments and apply" way,
;so it will try to evaluate (p) procedure
;and will meet an error(infinite loop and then interpreter will kill).
;but if use normal order, it will use "expand all and reduce" way,
;so it will expand to 
(if (= x 0) 0 (p))
(if (= 0 0) 0 (p))
0
;and will not evaluate (p) until it is needed, so it will not meet an error.