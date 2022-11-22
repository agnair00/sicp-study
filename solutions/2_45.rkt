#lang sicp
(#%require sicp-pict)

(define (split op1 op2)
  (define (recur painter n)
    (if (zero? n)
        painter
        (let ((smaller (recur painter (- n 1))))
          (op1 smaller (op2 smaller smaller)))))
  recur)

(define right-split (split beside below))
(define up-split (split below beside))

;test
;This is best done in DrRacket
(paint (right-split einstein 3))
(paint (up-split einstein 3))
