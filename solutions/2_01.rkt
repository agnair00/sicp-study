#lang sicp

(define (make-rat n d)
  (let ((g (gcd n d)))
    (let ((n-g (/ n g))
          (d-g (/ d g)))
      (if (negative? d-g)
          (cons (- n-g) (- d-g))
          (cons n-g d-g)))))

(make-rat 6 -8)
