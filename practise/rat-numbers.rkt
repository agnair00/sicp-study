#lang sicp

;make-rat
;numer 
;denom

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (numer y) (denom x))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))

;(define (make-rat n d)
;  (cons n d))
;

(define (make-rat n d)
  (let ((g (gcd n d)))
       (cons (/ n g) (/ d g))))

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))

(define x (make-rat 1 2))
(define y (make-rat 1 2))

(add-rat x y)
(sub-rat x y)
(mul-rat x y)
(div-rat x y)
(equal-rat? x y)
(print-rat x)
