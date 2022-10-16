#lang sicp

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (identity x) x)

(define (inc x) (+ x 1))

(define (sum-integers a b)
  (sum identity a inc b))

;test
(sum-integers 1 5) ;result = 15

(define (square x) (* x x))

(define (sum-squares a b)
  (sum square a inc b))

;test
(sum-squares 2 5) ;result = 54

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1 (* x (+ x 2))))
  (define (pi-next n)
    (+ n 4))
  (sum pi-term a pi-next b))

;test
(* (pi-sum 1 1000) 8.0) ;Result ~ 3.14

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(define (cube x) (* x x x))

;test
(integral cube 0 1 0.001) ;result ~ 0.25
