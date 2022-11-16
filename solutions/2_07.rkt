#lang sicp

(define (make-interval a b) (cons a b))
(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))

;test

(define test-interval (make-interval 1.2 3.9))
(upper-bound test-interval)
(lower-bound test-interval)
