#lang sicp

(define (count-leaves tree)
  (cond ((null? tree) 0)
        ((not (pair? tree)) 1)
        (else (+ (count-leaves (car tree)) (count-leaves (cdr tree))))))

;test
(define tree1 (cons (list 1 2) (list 3 4)))
(define tree2 (list (list 1 2 (list 3 4)) (list 5 6)))
(length tree1)
(count-leaves tree1)
(length tree2)
(count-leaves tree2)
