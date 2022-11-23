#lang sicp
(#%require sicp-pict)

(define outline (segments->painter (list (make-segment (make-vect 0. 0.) (make-vect 1. 0.))
                                         (make-segment (make-vect 1. 0.) (make-vect 1. 1.))
                                         (make-segment (make-vect 1. 1.) (make-vect 0. 1.))
                                         (make-segment (make-vect 0. 1.) (make-vect 0. 0.)))))

(define x (segments->painter (list (make-segment (make-vect 0. 0.) (make-vect 1. 1.))
                                   (make-segment (make-vect 0. 1.) (make-vect 1. 0.)))))

(define diamond (segments->painter (list (make-segment (make-vect 0.5 0.) (make-vect 0. 0.5))
                                         (make-segment (make-vect 0. 0.5) (make-vect 0.5 1.))
                                         (make-segment (make-vect 0.5 1.) (make-vect 1. 0.5))
                                         (make-segment (make-vect 1. 0.5) (make-vect 0.5 0.)))))

;I copied this from a site that contained sicp solutions as I got too lazy to actually figure out all the points (https://wizardbook.wordpress.com/2010/12/03/exercise-2-49/)
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
                           (make-segment (make-vect 0.5 0.3) (make-vect 0.3 0.0)))))

;test
;Best to be run with DrRacket
(paint outline)
(paint x)
(paint diamond)
(paint wave)
