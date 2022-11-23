#lang sicp

(define (make-vect xcor ycor)
  (cons xcor ycor))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cdr v))

(define (add-vect a b)
  (make-vect (+ (xcor-vect a) (xcor-vect b))
             (+ (ycor-vect a) (ycor-vect b))))

(define (sub-vect a b)
  (make-vect (- (xcor-vect a) (xcor-vect b))
             (- (ycor-vect a) (ycor-vect b))))

(define (scale-vect v s)
  (make-vect (* s (xcor-vect v))
             (* s (ycor-vect v))))

;test
(define v1 (make-vect 2 -5))
(define v2 (make-vect 8 3))

(add-vect v1 v2)
(sub-vect v1 v2)
(scale-vect v1 3)
