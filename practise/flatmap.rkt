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


(define (test n)
  (flatmap (lambda (i)
             (map (lambda (j)
                    (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (filter predicate seq)
  (cond ((null? seq) nil)
        ((predicate (car seq)) (cons (car seq) (filter predicate (cdr seq))))
        (else (filter predicate (cdr seq)))))

(define (ordered-triples n s)
  (filter (lambda (triple) (= s (accumulate + 0 triple)))
          (flatmap (lambda (i)
                     (flatmap (lambda (j)
                                (map (lambda (k)
                                       (list i j k))
                                     (enumerate-interval 1 (- j 1))))
                          (enumerate-interval 1 (- i 1))))
                   (enumerate-interval 1 n))))

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

(define (last seq)
  (if (null? (cdr seq))
      (car seq)
      (last (cdr seq))))

;(define (unique-k-sets k n)
;  (if (= k 1)
;      (map list (enumerate-interval 1 n))
;      (flatmap (lambda (s)
;                 (filter (lambda (x) (not (null? x)))
;                         (map (lambda (i)
;                                (if (> i (last s))
;                                    (append s (list i))
;                                    nil))
;                              (enumerate-interval 1 n))))
;               (unique-k-sets (- k 1) n))))

(define (unique-k-sets k n)
  (if (= k 1)
      (map list (enumerate-interval 1 n))
      (flatmap (lambda (s)
                 (map (lambda (i)
                        (append s (list i)))
                      (enumerate-interval (+ (last s) 1) n)))
               (unique-k-sets (- k 1) n))))

(define (cartesian-product seq1 seq2)
  (flatmap (lambda (i)
             (map (lambda (j) (append (list i) (list j)))
                  seq2))
           seq1))

(define (unique-pairs-by-cartesian-product n)
  (filter (lambda (pair)
            (< (car pair) (cadr pair)))
          (cartesian-product (enumerate-interval 1 n) (enumerate-interval 1 n))))

;test
(unique-k-sets 3 7)
(cartesian-product (enumerate-interval 1 5) (enumerate-interval 1 5))
(unique-pairs-by-cartesian-product 5)
