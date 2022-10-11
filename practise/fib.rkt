#lang sicp

;fib recursive
(define (fib1 n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib1 (- n 1)) (fib1 (- n 2))))))
;test
(fib1 0)
(fib1 1)
(fib1 2)
(fib1 3)
(fib1 4)
(fib1 5)
(fib1 6)

;fib iterative
(define (fib2 n)
  (define (iter a b counter)
    (if (= counter n)
        a
        (iter b (+ a b) (+ counter 1))))
  (iter 0 1 0))

;test
(fib2 0)
(fib2 1)
(fib2 2)
(fib2 3)
(fib2 4)
(fib2 5)
(fib2 6)
