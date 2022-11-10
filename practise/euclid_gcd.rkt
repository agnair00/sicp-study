#lang sicp

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (modulo a b))))

;test
(gcd 206 40)
