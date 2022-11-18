#lang sicp (define (accumulate op initial seq)
  (if (null? seq)
      initial
      (op (car seq) (accumulate op initial (cdr seq)))))

(define (accumulate-n op inital seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op inital (map car seqs))
            (accumulate-n op inital (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (mv) (dot-product mv v))
       m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (mv) (matrix-*-vector cols mv))
         m)))

;test
(define vec1 (list 1 2 3))
(define vec2 (list 4 5 6))
(define vec3 (list 7 8 9))
(define vec4 (list 7 8 9 10))
(define vec5 (list 11 12 13 14))
(define vec6 (list 15 16 17 18))
(define mat1 (list vec1 vec2))
(define mat2 (list vec4 vec5 vec6))
(dot-product vec1 vec2)
(matrix-*-vector mat1 vec3)
(transpose mat1)
(matrix-*-matrix mat1 mat2)
