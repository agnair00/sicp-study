#lang sicp

(define (entry tree)
  (car tree))

(define (left-branch tree)
  (cadr tree))

(define (right-branch tree)
  (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (entry set)) true)
        ((< x (entry set)) (element-of-set? x (left-branch set)))
        ((> x (entry set)) (element-of-set? x (right-branch set)))
        (else (error "element-of-set?: Unexpected condition"))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((< x (entry set)) (make-tree (entry set) (adjoin-set x (left-branch set)) (right-branch set)))
        ((> x (entry set)) (make-tree (entry set) (left-branch set) (adjoin-set x (right-branch set))))
        (else (error "adjoin-set: Unexpected conditions"))))

(define (tree->list tree)
  (if (null? tree) 
      '()
      (cons (entry tree) (append (tree->list (left-branch tree)) (tree->list (right-branch tree))))))

(define set1 (make-tree 5 (make-tree 3 (make-tree 1 '() '()) '()) (make-tree 9 (make-tree 7 '() '()) (make-tree 11 '() '()))))
(tree->list (adjoin-set 4 (adjoin-set 15 set1)))
