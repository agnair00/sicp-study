#lang sicp

(define tolerance 0.001)

(define (fixed-point f first-guess)
  (define (abs-diff a b) (abs (- a b)))
  (define (percent-diff v1 v2)
    (/ (abs-diff v1 v2) v1))

  (define (close-enough? v1 v2)
    (< (percent-diff v1 v2) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average a b) (/ (+ a b) 2))

(define (cubert x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))

(define (square x) (* x x))


(define (deriv f)
  (let ((dx 0.000001))
    (lambda (x) (/ (- (f (+ x dx)) (f x)) dx))))

(define (newtons-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newtons-transform g) guess))

(define (sqrt-special x)
  (fixed-point (newtons-transform (lambda (y) (- x (square y))))
               1.0))

(define (cubert-special x)
  (newtons-method (lambda (y) (- x (cube y)))
                  1.0))

(define (cube x) (* x x x))

(define (newtons-transform-re g derivation x)
  (- x (/ (g x) (derivation g x))))

(define (derivation f x)
  (let ((dx 0.000001))
    (/ (- (f (+ x dx)) (f x)) dx)))

(derivation (lambda (x) (square x)) 10)
