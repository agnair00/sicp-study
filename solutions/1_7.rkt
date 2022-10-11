#lang sicp

;Setup
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x) (< (abs-diff (square guess) x) 0.001))
(define (abs-diff x y) (abs (- x y)))
(define (square x) (* x x))
(define (improve guess x) (average guess (/ x guess)))
(define (average x y) (/ (+ x y) 2))

(define (sqrt x) (sqrt-iter 1.0 x))

#|For small enough numbers, the good-enough? procedure will evaluate to
#t in the first iteration because the square of the numbers will be smaller
than the difference that is being checked against.|#

(sqrt 0.0001) ;This should give the incorrect result

#|For large enough numbers, the good-enough? procdeure will always evaluate
to #f because of lost precision which does not allow to determine the difference
accurately|#

;(sqrt 100000000000000000000000000000000) ;This won't terminate

;An sqrt-iter with a different end test

(define (delta old new) (/ (- new old) old))
(define (good-enough2? guess x)
  (< (abs (delta guess (improve guess x))) 0.001))

(define (sqrt-iter2 guess x)
  (if (good-enough2? guess x)
      guess
      (sqrt-iter2 (improve guess x) x)))

(define (sqrt2 x) (sqrt-iter2 1.0 x))

(sqrt2 0.0001)
(sqrt2 0.00000001)
(sqrt2 10000000000000000000000000000000000000000000000000000000000000000)
