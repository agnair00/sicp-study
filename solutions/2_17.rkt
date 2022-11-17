#lang sicp

(define (last-pair lst)
  (if (null? (cdr lst))
      lst
      (last-pair (cdr lst))))

;test
(last-pair (list 1 2 3 4 5 6 7))
