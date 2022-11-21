#lang sicp

(define (filter predicate seq)
  (cond ((null? seq) nil)
        ((predicate (car seq)) (cons (car seq) (filter predicate (cdr seq))))
        (else (filter predicate (cdr seq)))))

(define (enumerate-interval a b)
  (define (next a)
    (if (> a b)
        nil
        (cons a (next (+ a 1)))))
  (next a))

(define (accumulate op initial seq)
  (if (null? seq)
      initial
      (op (car seq) (accumulate op initial (cdr seq)))))


(define (flatmap op seq)
  (accumulate append nil (map op seq)))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter (lambda (positions) (safe? k positions))
                (flatmap (lambda (rest-of-queens)
                           (map (lambda (new-row)
                                  (adjoin-position new-row k rest-of-queens))
                                (enumerate-interval 1 board-size)))
                         (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (safe? k positions)
  (define (count x seq)
    (length (filter (lambda (i) (= i x))
                     seq)))
  (accumulate (lambda (i rest) (and i rest))
              #t
              (map (lambda (i) (= i 1))
                   (map (lambda (position) (count position positions))
                        positions))))

(define empty-board nil)

(define (adjoin-position new-row k rest-of-queens)
  (append rest-of-queens (list new-row)))

;test
(queens 10)
