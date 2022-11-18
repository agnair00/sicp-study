#lang sicp

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (reverse-by-fold-right seq)
  (fold-right (lambda (item rest) (append rest (list item))) 
              nil
              seq))

(define (reverse-by-fold-left seq)
  (fold-left (lambda (rest item) (cons item rest)) 
             nil
             seq))

;test
(define seq (list 1 2 3 4 5))
(reverse-by-fold-right seq)
(reverse-by-fold-left seq)

;Answer
;(define (reverse sequence)
;  (fold-right (lambda x y) (append y (list x)) nil sequence))
;
;(define (reverse sequence)
;  (fold-left (lambda x y) (cons x y) nil sequence))
