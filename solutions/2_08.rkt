#lang sicp

(define (make-interval a b) (cons a b))
(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

;test
(define interval-1 (make-interval 1.2 3.9))
(define interval-2 (make-interval 4.2 9.7))

(sub-interval interval-2 interval-1)
