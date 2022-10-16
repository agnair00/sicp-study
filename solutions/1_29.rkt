#lang sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (identity x) x)
(define (inc x) (+ x 1))
(define (even? x) (= (modulo x 2) 0))

(define (simpsons f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (term k)
    (define mult (cond ((or (= k 0) (= k n)) 1)
                       ((even? k) 2)
                       (else 4)))
    (* mult (y k)))
  (* (/ h 3.0) (sum term 0 inc n)))

(define (cube x) (* x x x))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

;test
(simpsons cube 0 1 10) ;result = 0.25
(integral cube 0 1 0.1) ;result = 0.248..

;Compared to integral procedure, simpsons converges faster on the solution.
