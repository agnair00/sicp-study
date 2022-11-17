#lang sicp

(define x (list (list 1 2) (list 3 4)))

(reverse x)

(define (deep-reverse tree)
  (if (not (pair? tree))
      tree
      (reverse (map deep-reverse tree))))

;test
(deep-reverse x)
