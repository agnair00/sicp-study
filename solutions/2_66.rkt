#lang sicp

(define (entry tree)
  (car tree))

(define (left-branch tree)
  (cadr tree))

(define (right-branch tree)
  (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (make-record key data)
  (list key data))

(define (key record)
  (car record))

(define (data record)
  (cadr record))

(define (add-record record set-of-records)
  (cond ((null? set-of-records) (make-tree record '() '()))
        ((< (key record) (key (entry set-of-records))) (make-tree (entry set-of-records)
                                                                  (add-record record (left-branch set-of-records))
                                                                  (right-branch set-of-records)))
        ((> (key record) (key (entry set-of-records))) (make-tree (entry set-of-records)
                                                                  (left-branch set-of-records)
                                                                  (add-record record (right-branch set-of-records))))
        (else (error "add-record: Unexpected condition" record set-of-records))))

(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) #f)
        ((= given-key (key (entry set-of-records))) (entry set-of-records))
        ((< given-key (key (entry set-of-records))) (lookup given-key (left-branch set-of-records)))
        ((> given-key (key (entry set-of-records))) (lookup given-key (right-branch set-of-records)))
        (else (error "lookup: Unexpected condition" given-key set-of-records))))


;test
(define rec1 (make-record 1 '(V Violet)))
(define rec2 (make-record 2 '(I Indigo)))
(define rec3 (make-record 3 '(B Blue)))
(define rec4 (make-record 4 '(G Green)))
(define rec5 (make-record 5 '(Y Yellow)))
(define rec6 (make-record 6 '(O Orange)))
(define rec7 (make-record 7 '(R Red)))

(define set-of-records (add-record rec6 (add-record rec1 (add-record rec3 (add-record rec5 (add-record rec2 (add-record rec7 (add-record rec4 '()))))))))

(lookup 1 set-of-records)
(lookup 2 set-of-records)
(lookup 3 set-of-records)
(lookup 4 set-of-records)
(lookup 5 set-of-records)
(lookup 6 set-of-records)
(lookup 7 set-of-records)
