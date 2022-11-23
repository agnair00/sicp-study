#lang sicp
(#%require sicp-pict)

;Had to append new to procedure names as they are already defined

(define (flip-horiz-new painter)
  (transform-painter painter (make-vect 1. 0.) (make-vect 0. 0.) (make-vect 1. 1.)))

(define (rotate180-new painter)
  (transform-painter painter (make-vect 1. 1.) (make-vect 0. 1.) (make-vect 1. 0.)))

(define (rotate270-new painter)
  (transform-painter painter (make-vect 0. 1.) (make-vect 0. 0.) (make-vect 1. 1.)))

;test
;Best tested with DrRacket
(paint (flip-horiz-new einstein))
(paint (rotate180-new einstein))
(paint (rotate270-new einstein))
