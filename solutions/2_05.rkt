#lang sicp

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (n-divide x n)
  (define (iter a result)
    (if (zero? (modulo a n))
        (iter (/ a n) (+ n 1))
        result))
  (iter x 0))
    

(define (car c)
  (n-divide c 2))

(define (cdr c)
  (n-divide c 3))

(car (cons 4 5))
(cdr (cons 4 5))
