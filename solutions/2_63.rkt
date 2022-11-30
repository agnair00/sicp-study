#lang sicp

(define (entry tree)
  (car tree))

(define (left-branch tree)
  (cadr tree))

(define (right-branch tree)
  (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

(define set1 (make-tree 5 
                        (make-tree 3
                                   (make-tree 1 '() '())
                                   '())
                        (make-tree 9 
                                   (make-tree 7 '() '())
                                   (make-tree 11 '() '()))))

(tree->list-1 set1)
(tree->list-2 set1)

;a) Both give the same result
;b) I don't think the two procedures has the same order of growth. I think tree->list-2 grows slowly.
