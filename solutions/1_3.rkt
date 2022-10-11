#lang sicp

(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (sum-squares-largest-two a b c)
  (cond ((and (<= a b) (<= a c)) (sum-of-squares b c))
        ((and (<= b a) (<= b c)) (sum-of-squares a c))
        (else (sum-of-squares a b))))

;test
(sum-squares-largest-two 2 2 2) ;8
(sum-squares-largest-two 2 2 3) ;13
(sum-squares-largest-two 2 3 2)
(sum-squares-largest-two 3 2 2)
(sum-squares-largest-two 2 3 4) ;25
(sum-squares-largest-two 2 4 3)
(sum-squares-largest-two 3 2 4)
(sum-squares-largest-two 3 4 2)
(sum-squares-largest-two 4 2 3)
(sum-squares-largest-two 4 3 2)
