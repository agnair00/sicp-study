#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      ;(op (car sequence) (accumulate op initial (cdr sequence)))))
      (op (accumulate op initial (cdr sequence)) (car sequence))))

(accumulate / 1 (list 1 2 3))
(/ 1 (/ 2 (/ 3 1)))
(/ (/ (/ 1 3) 2) 1)
