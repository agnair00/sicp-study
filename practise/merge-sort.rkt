#lang sicp


(define (first-n n seq)
  (cond ((> n (length seq)) (error "first-n: n is greater than length" n (length seq)))
        ((zero? n) '())
        (else (cons (car seq) (first-n (- n 1) (cdr seq))))))

(define (last-n n seq)
  (define (iter n seq)
    (if (zero? n)
        seq
        (iter (- n 1) (cdr seq))))
  (cond ((> n (length seq)) (error "last-n: n is greater than length" n (length seq)))
        ((zero? n) '())
        (else (iter n seq)))
  (iter (- (length seq) n) seq))

;(define (add-in-order item seq)
;  (cond ((and (null? (cdr seq)) (> item (car seq))) (list (car seq) item))
;        ((null? seq) '())
;        ((> item (car seq)) (cons (car seq) (add-in-order item (cdr seq))))
;        (else (cons item seq))))

(define (add-in-order item seq)
  (cond ((null? seq) (cons item '()))
        ((< item (car seq)) (cons item seq))
        (else (cons (car seq) (add-in-order item (cdr seq))))))

(define (merge seq1 seq2)
  (cond ((null? seq1) seq2)
        ((null? seq2) seq1)
        (else (merge (cdr seq1) (add-in-order (car seq1) seq2)))))

(define (merge-sort seq)
  (if (null? seq)
      '()
      (let ((len (length seq)))
        (if (= len 1)
            seq
            (let ((len1 (floor (/ len 2))))
              (merge (merge-sort (first-n len1 seq))
                     (merge-sort (last-n (- len len1) seq))))))))

;test
;(#%require racket/trace)
;(trace merge-sort)
(merge-sort (list 1 5 9 7 2 8 6 3 3 7 1 3 8 4 1 7 9 3 2))
