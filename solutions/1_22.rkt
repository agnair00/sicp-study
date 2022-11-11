#lang sicp

(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) 
  (= (modulo b a) 0))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      #f))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (iter start found to-find)
  (cond ((= found to-find) (newline) (display "done") (newline))
        ((timed-prime-test start) (iter (+ start 1) (+ found 1) to-find))
        (else (iter (+ start 1) found to-find))))

(iter 1000 0 3) ;1009 1013 1019
(iter 10000 0 3) ;10007 10009 10037
(iter 100000 0 3) ;100003 100019 100043
(iter 1000000 0 3) ;1000003 10000033 1000037
