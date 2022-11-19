#lang sicp

(define (accumulate op initial seq)
  (if (null? seq)
      initial
      (op (car seq) (accumulate op initial (cdr seq)))))

(define (enumerate-interval a b)
  (if (> a b)
      nil
      (cons a
            (enumerate-interval (+ a 1) b))))

(define (flatmap op seq)
  (accumulate append nil (map op seq)))

(define (filter predicate seq)
  (cond ((null? seq) nil)
        ((predicate (car seq)) (cons (car seq) (filter predicate (cdr seq))))
        (else (filter predicate (cdr seq)))))

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j)
                    (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (unique-triples n)
  (flatmap (lambda (i)
             (map (lambda (pair)
                    (cons i pair))
                  (unique-pairs (- i 1))))
           (enumerate-interval 1 n)))

(define (sum-n-triples n s)
  (filter (lambda (triple) (= s (accumulate + 0 triple)))
          (unique-triples n)))

;test
(sum-n-triples 5 8)
