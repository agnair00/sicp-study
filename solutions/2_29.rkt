#lang sicp

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define (mobile? mobile)
  (list? mobile))

(define (total-weight mobile)
  (if (not (mobile? mobile))
      mobile
    (+ (total-weight (branch-structure (left-branch mobile)))
       (total-weight (branch-structure (right-branch mobile))))))

(define (balanced? mobile)
  (if (not (mobile? mobile))
      #t
      (let ((left-structure (branch-structure (left-branch mobile)))
            (left-length (branch-length (left-branch mobile)))
            (right-structure (branch-structure (right-branch mobile)))
            (right-length (branch-length (right-branch mobile))))
        (and (and (balanced? left-structure)
                  (balanced? right-structure))
             (= (* (total-weight left-structure) left-length)
                (* (total-weight right-structure) right-length))))))


;If representation of mobile and branch are changed, the only change that needs to be made is for selectors and mobile? procedure.

;test
(define branch1 (make-branch 4 10))
(define branch2 (make-branch 5 15))
(define mobile1 (make-mobile branch1 branch2))
(define branch3 (make-branch 2 20))
(define branch4 (make-branch 8 mobile1))
(define mobile2 (make-mobile branch3 branch4))

(define branch5 (make-branch 4 8))
(define branch6 (make-branch 8 4))
(define mobile3 (make-mobile branch5 branch6))
(define branch7 (make-branch 10 mobile3))
(define branch8 (make-branch 20 6))
(define mobile4 (make-mobile branch7 branch8))

(total-weight mobile2)
(balanced? mobile3)
(balanced? mobile4)
