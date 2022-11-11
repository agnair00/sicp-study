#lang sicp

(define (prime? n)
  (define (smallest-divisor n)
    (define (find-divisor n test-divisor)
      (define (divides? a b) (= (modulo b a) 0))
      (if (divides? test-divisor n)
          test-divisor
          (find-divisor n (+ test-divisor 1))))
    (find-divisor n 2))
  (if (= n 1)
      #f
      (= (smallest-divisor n) n)))


(define (filtered-accumulate combiner null-value term a next b filter)
  (cond ((> a b) null-value)
        ((filter a) (combiner (term a)
                              (filtered-accumulate combiner null-value term (next a) next b filter)))
        (else (filtered-accumulate combiner null-value term (next a) next b filter)))) 

(define (sum-squares-primes a b)
  (define (square x) (* x x))
  (define (inc x) (+ x 1))
  (filtered-accumulate + 0 square a inc b prime?))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (modulo a b))))

(define (relative-prime? a b)
  (= (gcd a b) 1))

(define (product-pos-ints-rel-prime n)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (define (relative-prime-to-n? i) (relative-prime? i n))
  (filtered-accumulate * 1 identity 1 inc (- n 1) relative-prime-to-n?))

(sum-squares-primes 1 5)
(product-pos-ints-rel-prime 10)
