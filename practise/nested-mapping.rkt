#lang sicp

(define (enumerate-interval a b)
  (define (next a)
    (if (> a b)
        nil
        (cons a (next (+ a 1)))))
  (next a))

(define (accumulate op inital seq)
  (if (null? seq)
      inital
      (op (car seq) (accumulate op inital (cdr seq)))))


(define (test1 n)
  (accumulate append
              nil
              (map (lambda (i)
                     (map (lambda (j) (list i j))
                          (enumerate-interval 1 (- i 1))))
                   (enumerate-interval 1 n))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (test2 n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))


(define (filter predicate seq)
  (cond ((null? seq) nil)
        ((predicate (car seq)) (cons (car seq) (filter predicate (cdr seq))))
        (else (filter predicate (cdr seq)))))

(define (prime-sum-pairs n)
  (map (lambda (pair) (append pair (list (accumulate + 0 pair))))
       (filter (lambda (pair) (prime? (accumulate + 0 pair)))
               (flatmap (lambda (i)
                          (map (lambda (j) (list i j))
                               (enumerate-interval 1 (- i 1))))
                        (enumerate-interval 1 n)))))

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

(define (remove item seq)
  (filter (lambda (x) (not (= x item))) seq))

(define (permutations s)
  (if (null? s)
      (list nil) 
      (flatmap (lambda (x) (map (lambda (p) (cons x p))
                                (permutations (remove x s))))
               s)))

(test1 6)
(test2 6)
(prime-sum-pairs 6)
(permutations (list 1 2 3))
