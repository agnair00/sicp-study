#lang sicp

(define (for-each proc items)
  (cond ((null? items) 2)
        (else (proc (car items)) (for-each proc (cdr items)))))

;test
(for-each (lambda (i) (newline) (display i)) (list 35 1245 814 123)) 
