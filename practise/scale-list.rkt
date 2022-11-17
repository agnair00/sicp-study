#lang sicp

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))


(define (scale-list items factor)
  (map (lambda (x) (* factor x))
        items))

(scale-list (list 1 2 3 4 5) 20)
