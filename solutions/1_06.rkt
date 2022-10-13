#lang sicp

;The program won't terminate as sqrt-iter will keep getting evaluated infinitely

;test
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 5 6) 10 11)
(new-if (> 9 8) 10 11)

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x) (< (abs-diff (square guess) x) 0.001))
(define (abs-diff x y) (abs (- x y)))
(define (square x) (* x x))
(define (improve guess x) (average guess (/ x guess)))
(define (average x y) (/ (+ x y) 2))

(sqrt-iter 1.0 2) ;This will result in infinite recursion
