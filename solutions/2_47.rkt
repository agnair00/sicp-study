#lang sicp

(define (make-vect xcor ycor)
  (cons xcor ycor))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cdr v))


(define (make-frame1 origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame1 f)
  (car f))

(define (edge1-frame1 f)
  (cadr f))

(define (edge2-frame1 f)
  (cadr (cdr f)))


(define (make-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame2 f)
  (car f))

(define (edge1-frame2 f)
  (car (cdr f)))

(define (edge2-frame2 f)
  (cdr (cdr f)))


;test
(define f1 (make-frame1 (make-vect 2 3) (make-vect -1 4) (make-vect -2 8)))

(origin-frame1 f1)
(edge1-frame1 f1)
(edge2-frame1 f1)

(define f2 (make-frame2 (make-vect 2 3) (make-vect -1 4) (make-vect -2 8)))

(origin-frame2 f2)
(edge1-frame2 f2)
(edge2-frame2 f2)
