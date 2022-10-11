#lang sicp

(define (factorial1 n)
  (if (= n 0)
      1
      (* n (factorial1 (- n 1)))))

(factorial1 0)
(factorial1 1)
(factorial1 2)
(factorial1 3)
(factorial1 4)
(factorial1 5)

(define (factorial2 n)
  (define (iter product counter)
    (if (> counter n)
      product
      (iter (* product counter) (+ counter 1))))
  (iter 1 1))

(factorial2 0)
(factorial2 1)
(factorial2 2)
(factorial2 3)
(factorial2 4)
(factorial2 5)
