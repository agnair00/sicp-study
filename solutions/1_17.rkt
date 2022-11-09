#lang sicp

(define (double x) (* x 2))
(define (halve x) (/ x 2))

(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-mult a (halve b))))
        (else (+ a (fast-mult a (- b 1))))))

;test
(fast-mult 3 7)
(fast-mult 9 4)
(fast-mult 4 0)
