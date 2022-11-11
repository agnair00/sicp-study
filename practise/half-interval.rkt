#lang sicp

(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
      midpoint
      (let ((test-value (f midpoint)))
        (cond ((negative? test-value) (search f midpoint pos-point))
              ((positive? test-value) (search f neg-point midpoint))
              (else midpoint))))))

(define (abs-diff a b) (abs (- a b)))

(define (average a b) (/ (+ a b) 2))

(define (close-enough? a b) (< (abs-diff a b) 0.001))
          
(define (half-interval f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (positive? a-value) (negative? b-value))
           (search f b a))
          (else (error "Values are not of opposite signs" a b)))))

(half-interval sin 4.0 2.0)
