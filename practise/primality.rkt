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



(define (expmod base pow m)
  (cond ((= pow 0) 1)
        ((even? pow)
         (modulo (square (expmod base (/ pow 2) m))
                 m))
        (else (modulo (* base (expmod base (- pow 1) m))
              m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) (modulo a n)))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

;test
(prime? 173)
(fast-prime? 173 10)
