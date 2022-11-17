#lang sicp

(define (square x) (* x x))

(define (square-tree-direct tree) 
  (cond ((null? tree) nil)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree-direct (car tree))
                    (square-tree-direct (cdr tree))))))

(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree sub-tree)
             (square sub-tree)))
       tree))

(define tree (list 1
                   (list 2 (list 3 4) 5)
                   (list 6 7)))

;test
(square-tree-direct tree)
(square-tree tree)
