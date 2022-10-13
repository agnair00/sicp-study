#lang sicp

;The procedure will always give the sum of a and the absolute value of b

;test
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
 
(a-plus-abs-b 3 1) ;4
(a-plus-abs-b 3 -1) ;4
