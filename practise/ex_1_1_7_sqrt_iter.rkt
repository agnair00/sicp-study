#lang sicp

#|
The simple mathematical fact to use to get a better guess for
x is to find the average of x and x / guess. So the idea is to
iterate and improve our guesses.
|#

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x) (< (abs-diff (square guess) x) 0.001))
(define (abs-diff x y) (abs (- x y)))
(define (square x) (* x x))
(define (improve guess x) (average guess (/ x guess)))
(define (average x y) (/ (+ x y) 2))

(define (sqrt x) (sqrt-iter 1.0 x))

(sqrt 2)
