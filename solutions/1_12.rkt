#lang sicp

(define (pascal-triangle level index)
  (cond ((> index level) 0)
        ((or (= index 0) (= index level)) 1)
        (else (+ (pascal-triangle (- level 1) (- index 1))
                 (pascal-triangle (- level 1) index)))))
;test
(pascal-triangle 0 0) ;Expected 1
(pascal-triangle 1 0) ;Expected 1
(pascal-triangle 1 1) ;Expected 1
(pascal-triangle 4 2) ;Expected 6
(pascal-triangle 6 4) ;Expected 15
