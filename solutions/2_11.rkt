#lang sicp

(define (make-interval a b) (cons a b))
(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))

(define (mul-interval x y)
  (let ((lx (lower-bound x))
        (ux (upper-bound x))
        (ly (lower-bound y))
        (uy (upper-bound y)))
    (cond ((and (positive? lx) (positive? ux) (positive? ly) (positive? uy))
           (make-interval (* lx ly) (* ux uy)))
          ((and (positive? lx) (positive? ux) (negative? ly) (positive? uy))
           (make-interval (* ux ly) (* ux uy)))
          ((and (positive? lx) (positive? ux) (negative? ly) (negative? uy))
           (make-interval (* ux ly) (* lx uy)))
          ((and (negative? lx) (positive? ux) (positive? ly) (positive? uy))
           (make-interval (* lx uy) (* ux uy)))
          ((and (negative? lx) (positive? ux) (negative? ly) (positive? uy))
           (make-interval (* lx uy) (max (* lx ly) (* ux uy))))
          ((and (negative? lx) (positive? ux) (negative? ly) (negative? uy))
           (make-interval (* ux ly) (* lx ly)))
          ((and (negative? lx) (negative? ux) (positive? ly) (positive? uy))
           (make-interval (* lx uy) (* ux ly)))
          ((and (negative? lx) (negative? ux) (negative? ly) (positive? uy))
           (make-interval (* lx uy) (* lx ly)))
          ((and (negative? lx) (negative? ux) (negative? ly) (negative? uy))
           (make-interval (* ux uy) (* lx ly)))
          (else (error "Something is not right")))))

(define (mul-interval1 x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4)))) 

           
;test 
(define interval1 (make-interval 1 2))
(define interval2 (make-interval -2 1))
(define interval3 (make-interval -2 -1))

(mul-interval interval1 interval1)
(mul-interval1 interval1 interval1)

(mul-interval interval1 interval2)
(mul-interval1 interval1 interval2)

(mul-interval interval1 interval3)
(mul-interval1 interval1 interval3)

(mul-interval interval2 interval1)
(mul-interval1 interval2 interval1)

(mul-interval interval2 interval2)
(mul-interval1 interval2 interval2)

(mul-interval interval2 interval3)
(mul-interval1 interval2 interval3)

(mul-interval interval3 interval1)
(mul-interval1 interval3 interval1)

(mul-interval interval3 interval2)
(mul-interval1 interval3 interval2)

(mul-interval interval3 interval3)
(mul-interval1 interval3 interval3)
