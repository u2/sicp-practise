#lang racket
(define (make-interval a b) (cons a b))

(define (upper-bound intrvl)
   (cdr intrvl))

(define (lower-bound intrvl)
   (car intrvl))


(define (sub-interval x y)
  (make-interval (- (lower-bound x) 
                    (lower-bound y))
                 (- (upper-bound x) 
                    (upper-bound y))))