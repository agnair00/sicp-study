#lang sicp

(define (accumulate op inital seq)
  (if (null? seq)
      inital
      (op (car seq) (accumulate op inital (cdr seq)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (enumerate-interval a b)
  (define (next a)
    (if (> a b)
        nil
        (cons a (next (+ a 1)))))
  (next a))

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))  

;(define (prime-sum-pairs n)
;  (map make-pair-sum
;       (filter prime-sum?
;               (unique-pairs n))))

;test
(unique-pairs 5)
