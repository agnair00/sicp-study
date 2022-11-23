#lang sicp
(#%require sicp-pict)


(define wave
  (segments->painter (list (make-segment (make-vect 0.2 0.0) (make-vect 0.4 0.4))
                           (make-segment (make-vect 0.4 0.4) (make-vect 0.3 0.5))
                           (make-segment (make-vect 0.3 0.5) (make-vect 0.1 0.3))
                           (make-segment (make-vect 0.1 0.3) (make-vect 0.0 0.6))
                           (make-segment (make-vect 0.0 0.8) (make-vect 0.1 0.5))
                           (make-segment (make-vect 0.1 0.5) (make-vect 0.3 0.6))
                           (make-segment (make-vect 0.3 0.6) (make-vect 0.4 0.6))
                           (make-segment (make-vect 0.4 0.6) (make-vect 0.3 0.8))
                           (make-segment (make-vect 0.3 0.8) (make-vect 0.4 1.0))
                           (make-segment (make-vect 0.6 1.0) (make-vect 0.7 0.8))
                           (make-segment (make-vect 0.7 0.8) (make-vect 0.6 0.6))
                           (make-segment (make-vect 0.6 0.6) (make-vect 0.8 0.6))
                           (make-segment (make-vect 0.8 0.6) (make-vect 1.0 0.4))
                           (make-segment (make-vect 1.0 0.2) (make-vect 0.6 0.4))
                           (make-segment (make-vect 0.6 0.4) (make-vect 0.8 0.0))
                           (make-segment (make-vect 0.7 0.0) (make-vect 0.5 0.3))
                           (make-segment (make-vect 0.5 0.3) (make-vect 0.3 0.0))
                           (make-segment (make-vect 0.4 0.8) (make-vect 0.5 0.7))
                           (make-segment (make-vect 0.5 0.7) (make-vect 0.6 0.8)))))

(define (corner-split painter n)
  (if (zero? n)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((corner (corner-split painter (- n 1))))
          (below (beside painter right)
                 (beside up corner))))))

(define (square-limit painter n)
  (let ((combine4 (square-of-four identity identity identity identity)))
    (combine4 (corner-split painter n))))

(define (split op1 op2)
  (define (recur painter n)
    (if (zero? n)
        painter
        (let ((smaller (recur painter (- n 1))))
          (op1 smaller (op2 smaller smaller)))))
  recur)

(define right-split (split beside below))
(define up-split (split below beside))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

;test
;Better results with DrRacket
(paint wave)
(paint (corner-split wave 2))
(paint (square-limit wave 2))
