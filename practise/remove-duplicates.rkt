#lang sicp

;(define (element-of-set? x set)
;  (cond ((null? set) #f)
;        ((equal? x (car set)) true)
;        (else (element-of-set? x (cdr set)))))
;
;(define (adjoin-set x set)
;  (if (element-of-set? x set)
;      set
;      (cons x set)))
;

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((= x (car set)) #t)
        ((< x (car set)) #f)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cond ((null? set) (cons x set))
        ((= x (car set)) set)
        ((< x (car set)) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))))

(define (remove-duplicates seq)
  (if (null? seq)
      '()
      (adjoin-set (car seq) (remove-duplicates (cdr seq)))))

(define (fold-right initial op seq)
  (if (null? seq)
      initial
      (op (car seq) (fold-right initial op (cdr seq)))))

(define (fold-left initial op seq)
  (define (iter result seq)
    (if (null? seq)
        result
        (iter (op result (car seq)) (cdr seq))))
  (iter initial seq))

(define list1 (list 1 2 7 2 3 7 9 8 7))
list1
(remove-duplicates list1)
(fold-right '() adjoin-set list1)
(fold-left '()
            (lambda (rest x) (adjoin-set x rest))
            list1)
