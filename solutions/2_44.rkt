#lang sicp
(#%require sicp-pict)

(define (up-split painter n)
  (if (zero? n)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

;test
;This is best done in DrRacket
(paint (up-split einstein 3))
