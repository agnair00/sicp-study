#lang sicp

;This ideally should be done with a math equation but I can't do it here.

(define (make-interval a b) (cons a b))
(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))

(define (width-interval i)
  (/ (- (upper-bound i) (lower-bound i))
     2))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4)))) 

(define (div-interval x y)
  (cond ((or (zero? (lower-bound y)) (zero? (upper-bound y))) (error "Dividing by 0!" y))
        ((and (negative? (lower-bound y)) (positive? (upper-bound y))) (error "Dividing by 0!!" y))
        (else (mul-interval x
                            (make-interval (/ 1.0 (upper-bound y))
                                           (/ 1.0 (lower-bound y)))))))

;test
(define interval1 (make-interval 5.0 10.0))
(define interval2 (make-interval 8.0 12.0))

(width-interval interval1)
(width-interval interval2)
(width-interval (add-interval interval1 interval2)) ;Will be the sum of width of interval1 and interval 2
(width-interval (sub-interval interval1 interval2)) ;Will be the sum of width of interval1 and interval 2
(width-interval (mul-interval interval1 interval2))
(width-interval (div-interval interval1 interval2))
