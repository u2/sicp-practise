#lang racket
(define (make-interval a b) (cons a b))

(define (upper-bound intrvl)
   (cdr intrvl))

(define (lower-bound intrvl)
   (car intrvl))

(define a (make-interval 90 100))
(upper-bound a)
(lower-bound a)
  