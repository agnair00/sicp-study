#lang sicp

(define tolerance 0.001)

(define (fixed-point f first-guess)
  (define (abs-diff a b) (abs (- a b)))
  (define (percent-diff v1 v2)
    (/ (abs-diff v1 v2) v1))

  (define (close-enough? v1 v2)
    (< (percent-diff v1 v2) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))

(define (average a b) (/ (+ a b) 2))

(fixed-point cos 1.0)
(sqrt 25)
