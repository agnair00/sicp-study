#lang sicp

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (average a b c) (/ (+ a b c) 3))

(define (smooth f)
  (let ((dx 0.000001))
    (lambda (x) (average (f (- x dx))
                         (f x)
                         (f (+ x dx))))))

(define (n-fold-smoothed f n)
  ((repeated smooth n) f))
