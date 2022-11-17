#lang sicp

(define (filter predicate? lst)
  (cond ((null? lst) nil)
        ((predicate? (car lst)) (cons (car lst)
                                      (filter predicate? (cdr lst)))) 
        (else (filter predicate? (cdr lst)))))

(define (same-parity i . n)
  (cons i (filter (if (even? i) even? odd?)
                  n)))

;test
(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
