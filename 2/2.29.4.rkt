#lang racket
(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))

(define (is-mobile structure)
  (pair? structure))

(define (branch-weight branch)
  (let ([structure (branch-structure branch)])
    (if (is-mobile structure)
        (total-weight structure)
        structure)))
                    
(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define mobile-x
  (make-mobile (make-branch 2 3) (make-branch 3 5)))

(left-branch mobile-x)
(right-branch mobile-x)
(branch-structure (left-branch mobile-x))
(branch-structure (left-branch mobile-x))

(total-weight mobile-x)

(define mobile-y
  (make-mobile (make-branch 2 11) (make-branch 3 mobile-x)))

(left-branch mobile-y)
(right-branch mobile-y)
(branch-structure (left-branch mobile-y))
(branch-structure (right-branch mobile-y))

(total-weight mobile-y)

(define (balanced? mobile)
  (and (=
        (torque (left-branch mobile))
        (torque (right-branch mobile)))
       (branch-balance? (left-branch mobile))
       (branch-balance? (right-branch mobile))))

(define (branch-balance? branch)
  (let ([structure (branch-structure branch)])
    (if (is-mobile structure)
        (balanced? structure)
        true)))

(define (torque branch)
  (* (branch-length branch)
     (branch-weight branch)))

(balanced? mobile-x)
(balanced? mobile-y)

(define mobile-a
  (make-mobile (make-branch 4 12) (make-branch 3 16)))

(balanced? mobile-a)

(define mobile-b
  (make-mobile (make-branch 2 mobile-a) (make-branch 7 8)))


(torque (left-branch mobile-b))
(balanced? mobile-b)
