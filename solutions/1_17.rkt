#lang sicp

(define (double x) (* x 2))
(define (halve x) (/ x 2))

(define (fast-mult a b n)
  (cond ((= n 0) a)
        ((even? n) (fast-mult a (double b) (halve n)))
        (else (fast-mult (+ a b) b (- n 1)))))

;test
(fast-mult 0 3 7)
(fast-mult 0 9 4)
