#lang sicp

(define (make-point x y)
  (cons x y))  

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment start stop)
  (cons start stop))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))

(define (length-segment seg)
  (let ((start-x (x-point (start-segment seg)))
        (start-y (y-point (start-segment seg)))
        (end-x (x-point (end-segment seg)))
        (end-y (y-point (end-segment seg))))
    (sqrt (+ (square (- start-x end-x))
             (square (- start-y end-y))))))

(define (square x) (* x x))

(define (make-rectangle-1 l-seg w-seg)
  (cons l-seg w-seg))

(define (l-seg-rectangle rect)
  (car rect))

(define (w-seg-rectangle rect)
  (cdr rect))

(define (length-rectangle rect)
  (length-segment (l-seg-rectangle rect)))

(define (width-rectangle rect)
  (length-segment (w-seg-rectangle rect)))

(define (perimeter-rectangle rect)
  (+ (* 2 (length-rectangle rect))
     (* 2 (width-rectangle rect))))

(define (area-rectangle rect)
  (* (length-rectangle rect) (width-rectangle rect)))

(define l-seg (make-segment (make-point 0 0) (make-point 5 0)))
(define w-seg (make-segment (make-point 5 0) (make-point 5 6)))
(define rect-1 (make-rectangle-1 l-seg w-seg))

(perimeter-rectangle rect-1)
(area-rectangle rect-1)

