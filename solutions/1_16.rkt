#lang sicp


(define (square x) (* x x))
(define (even? x) (= (modulo x 2) 0))

(define (fast-exp-iter a b n)
  (cond ((= n 0) a)
        ((even? n) (fast-exp-iter a (square b) (/ n 2)))
        (else (fast-exp-iter (* a b) b (- n 1)))))

;test
(fast-exp-iter 1 3 5)
(fast-exp-iter 1 5 4)
