#lang sicp

(define (iterative-improve good-enough? improve-guess)
  (define (iter guess)
    (let ((next-guess (improve-guess guess)))
      (if (good-enough? guess next-guess)
          next-guess 
          (iter (improve-guess guess)))))
  iter)


(define (abs-diff a b) (abs (- a b)))
(define (percent-diff v1 v2) (/ (abs-diff v1 v2) v1))
(define (square x) (* x x))
(define (average a b) (/ (+ a b) 2))

(define (sqrt x)
  (define (good-enough? guess next-guess)
    (< (percent-diff guess next-guess) 0.0001))
  ((iterative-improve good-enough? (lambda (guess) (average guess (/ x guess))))
   1.0))


(define (fixed-point f first-guess)
  (define (close-enough? v1 v2) (< (percent-diff v1 v2) 0.0001))
  ((iterative-improve close-enough? (lambda (guess) (f guess)))
   first-guess))

;test
(sqrt 16)
(fixed-point cos 1.0)
