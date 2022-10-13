#lang sicp

(define (pascals-triangle row col)
  (cond ((> col row) 0)
        ((or (= col 1) (= row col)) 1)
        (else (+ (pascals-triangle (- row 1) col)
                 (pascals-triangle (- row 1) (- col 1))))))
;test
(pascals-triangle 1 1) ;Expected 1
(pascals-triangle 2 1) ;Expected 1
(pascals-triangle 2 2) ;Expected 1
(pascals-triangle 5 3) ;Expected 6
(pascals-triangle 7 5) ;Expected 15
