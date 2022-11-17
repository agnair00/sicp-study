#lang sicp

(define (reverse lst)
  (define (reverse-iter rev-lst lst)
    (if (null? lst)
        rev-lst
        (reverse-iter (cons (car lst) rev-lst)
                      (cdr lst))))
  (reverse-iter nil lst))

(reverse (list 1 2 3 4 5 6))
