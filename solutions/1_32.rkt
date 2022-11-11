#lang sicp

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (sum-ints start stop)
  (define (inc x) (+ x 1))
  (define (identity x) x)
  (sum identity start inc stop))

(define (factorial n)
  (define (indentity x) x)
  (define (inc x) (+ x 1))
  (product identity 1 inc n))

(define  (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))

(define (product-iter term a next b)
  (accumulate-iter * 1 term a next b))

(define (sum-ints-iter start stop)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (sum-iter identity start inc stop))

(define (factorial-iter n)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (product-iter identity 1 inc n))

;test
(sum-ints 1 5)
(factorial 6)
(sum-ints-iter 1 5)
(factorial-iter 6)
