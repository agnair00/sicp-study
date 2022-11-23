#lang sicp

(define (make-vect xcor ycor)
  (cons xcor ycor))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cdr v))

(define (make-segment start end)
  (cons start end))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

;test
(define v1 (make-vect 2 3))
(define v2 (make-vect 8 9))

(define s (make-segment v1 v2))
(start-segment s)
(end-segment s)
