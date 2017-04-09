#lang racket
(define (make-interval a b) (cons a b))

(define (upper-bound intrvl)
   (cdr intrvl))

(define (lower-bound intrvl)
   (car intrvl))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) 
               (lower-bound y)))
        (p2 (* (lower-bound x) 
               (upper-bound y)))
        (p3 (* (upper-bound x) 
               (lower-bound y)))
        (p4 (* (upper-bound x) 
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

;http://www.billthelizard.com/2010/12/sicp-27-211-extended-exercise-interval.html

(define (spans-zero? y)
   (and (<= (lower-bound y) 0)
        (>= (upper-bound y) 0)))

(define (div-interval x y)
   (if (spans-zero? y)
       (error "Error: The denominator should not span 0.")
       (mul-interval x
                 (make-interval (/ 1.0 (upper-bound y))
                                (/ 1.0 (lower-bound y))))))

