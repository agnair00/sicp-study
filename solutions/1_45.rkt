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

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (average a b) (/ (+ a b) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(define (square x) (* x x))

(define (cubert x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))

(define (cube x) (* x x x))

(define (4th-root x)
  (fixed-point (average-damp (lambda (y) (/ x (cube y))))
               1.0))

(define (power base exponent)
  (cond ((zero? exponent) 1)
        ((even? exponent) (square (power base (/ exponent 2))))
        (else (* base (power base (- exponent 1))))))

(define (log-base-2 x) (/ (log x) (log 2)))

(define (nth-root x n)
  (let ((num-damps (floor (log-base-2 n))))
    (fixed-point ((repeated average-damp num-damps) (lambda (y) (/ x (power y (- n 1)))))
                 1.0)))

;test
(nth-root (power 7 100) 100)
