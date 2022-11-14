#lang sicp

;make-point
;x-point
;y-point
;make-segment
;start-segment
;end-segment
;midpoint-segment

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

(define (midpoint-segment seg)
  (let ((start (start-segment seg))
        (end (end-segment seg)))
    (make-point (average (x-point start) (x-point end))
                (average (y-point start) (y-point end)))))

(define (average a b) (/ (+ a b) 2))

;test
(define p1 (make-point 3 4))
(define p2 (make-point 5 2))

(midpoint-segment (make-segment p1 p2))
