#lang sicp

#|
If the interpreter uses applicative-order evaluation, then the procedure called test
will not terminate. If the interpreter used normal-order evaluation, them the procedure
called test will evaluate to 0.
|#

;test
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p)) ;This will result in infinite recursion
