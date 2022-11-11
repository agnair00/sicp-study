#lang sicp

(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (factorial n)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (product identity 1 inc n))

(define (pi-by-4-approx n)
  (define (inc x) (+ x 1))

  (define (numer-term k)
    (if (odd? k)
      (+ 2 (* 2 (/ (- k 1) 2)))
      (+ 2 k)))

  (define (denom-term k)
    (if (odd? k)
        (+ 3 (* 2 (/ (- k 1) 2)))
        (+ 3 (* 2 (/ (- k 2) 2)))))
  
  (define (term k) (/ (numer-term k) (denom-term k)))

  (product term 1 inc n))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (+ a 1) (* a result))))
  (iter a 1))

(define (factorial-iter n)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (product-iter identity 1 inc n))

(factorial 6)
(* (pi-by-4-approx 200) 4.0)
(factorial-iter 6)
