#lang sicp

(define (make-interval a b) (cons a b))
(define (upper-bound i) (car i))
(define (lower-bound i) (cdr i))

;test

(define test-interval (make-interval 1.2 3.9))
(upper-bound test-interval)
(lower-bound test-interval)
