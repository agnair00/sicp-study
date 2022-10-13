#lang sicp

(define (delta-fract old new) (/ (- new old) old))
(define (square x) (* x x))

(define (cubert-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubert-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (delta-fract guess (improve guess x))) 0.0001))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess))
     3))

(define (cubert x) (cubert-iter 1.0 x))

;test
(cubert 27)
