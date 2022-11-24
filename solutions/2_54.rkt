#lang sicp

(define (equal? x y)
  (cond ((and (not (pair? x)) (not (pair? y))) (eq? x y))
        ((and (null? x) (null? y)) true)
        ((and (pair? x) (pair? y)) (and (equal? (car x) (car y)) (equal? (cdr x) (cdr y))))
        (else false)))
;test
(equal? '(a b c (c d e) (f g)) '(a b c (c d e) (f g)))
(equal? '(a b c (c d e i) (f g)) '(a b c (c d e) (f g)))
