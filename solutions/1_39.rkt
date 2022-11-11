#lang sicp

(define (cont-frac n d k)
  (define (recur i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (recur (+ i 1))))))
  (recur 1))

(define (square x) (* x x))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1) x (- (square x))))
             (lambda (i) (+ 1 (* 2 (- i 1))))
             k))

;test
(tan-cf 13.0 100)
(tan 13.0)
;Pretty accurate!
