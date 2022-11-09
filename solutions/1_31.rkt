#lang sicp

(define (product-recur term a next b)
  (if (> a b)
      1
      (* (term a) (product-recur term (next a) next b))))

(define (identity x) x)
(define (inc x) (+ 1 x))

(define (factorial n)
  (product-recur identity 1 inc n))

(factorial 5)

(define (even? x) (= (modulo x 2) 0))

(define (approx-pi n-terms)
  (define (next x)
    (if (< x 1) (+ x 
  (product <> 1 inc n-terms))
