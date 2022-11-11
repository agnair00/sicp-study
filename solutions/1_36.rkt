#lang sicp

(define tolerance 0.001)

(define (fixed-point f first-guess)
  (define (abs-diff a b) (abs (- a b)))
  (define (percent-diff v1 v2)
    (/ (abs-diff v1 v2) v1))

  (define (close-enough? v1 v2)
    (< (percent-diff v1 v2) tolerance))

  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average a b) (/ (+ a b) 2))

(newline)
(display "fixed-point without average damping")
(newline)
(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)
(newline)
(display "fixed-point with average damping")
(newline)
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2.0)

;It takes much less steps with average damping
