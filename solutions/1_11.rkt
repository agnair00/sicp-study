#lang sicp

;Recursive process that computes f
(define (f1 n)
  (if (< n 3)
      n
      (+ (f1 (- n 1))
         (* 2 (f1 (- n 2)))
         (* 3 (f1 (- n 3))))))

;Iterative process that computes f
(define (f2 n)
  (define (iter a b c counter)
    (if (= counter 0)
        a
        (iter b c (+ c (* 2 b) (* 3 a)) (- counter 1))))
  (iter 0 1 2 n))

;test
(f1 5)
(f2 5)
