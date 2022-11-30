#lang sicp

(define (adjoin-set x set)
  (cond ((null? set) (cons x set))
        ((= x (car set)) set)
        ((< x (car set)) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))))

;test
(define set1 (list 2 7 9))
(adjoin-set 1 set1)
(adjoin-set 3 set1)
(adjoin-set 10 set1)
