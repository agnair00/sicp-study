#lang sicp

(define (cont-frac n d k)
  (define (recur i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (recur (+ i 1))))))
  (recur 1))

;test
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)
;k needs to be 11 for 1/golden-ratio to be accurate to 4 decimal places

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (zero? i)
        result
        (iter (- i 1)
              (/ (n i)
                 (+ (d i) result)))))
  (iter k 0))

;test
(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                11)
