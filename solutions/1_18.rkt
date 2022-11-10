#lang sicp

(define (double x) (* x 2))
(define (halve x) (/ x 2))

(define (fast-mult q a b)
  (cond ((= b 0) q)
        ((even? b) (fast-mult q (double a) (halve b)))
        (else (fast-mult (+ q a) a (- b 1)))))

;test
(fast-mult 0 3 7)
(fast-mult 0 9 4)
(fast-mult 0 4 0)
