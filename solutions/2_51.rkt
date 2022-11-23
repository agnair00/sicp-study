#lang sicp
(#%require sicp-pict)

(define (below-new1 painter1 painter2)
  (let ((split-point (make-vect 0. 0.5)))
    (let ((paint-bottom (transform-painter painter1 (make-vect 0. 0.) (make-vect 1. 0.) split-point))
          (paint-top (transform-painter painter2 split-point (make-vect 1. 0.5) (make-vect 0. 1.))))
      (lambda (frame)
        (paint-bottom frame)
        (paint-top frame)))))

(define (below-new2 painter1 painter2)
  (rotate180 (rotate270 (beside (rotate270 painter1) (rotate270 painter2)))))

;test
;Best tested with DrRacket
(paint (below-new1 einstein mark-of-zorro))
(paint (below-new2 einstein mark-of-zorro))
