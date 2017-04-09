#lang racket
(define (make-interval a b) (cons a b))

(define (upper-bound intrvl)
   (cdr intrvl))

(define (lower-bound intrvl)
   (car intrvl))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) 
                    (lower-bound y))
                 (+ (upper-bound x) 
                    (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) 
                    (lower-bound y))
                 (- (upper-bound x) 
                    (upper-bound y))))

(define (width x)
  (/ (- (upper-bound x) (lower-bound x)) 2))

(define a (make-interval 90 100))
(width a)

(define b (make-interval 70 80))
(width b)

(width (add-interval a b))
(width (sub-interval a b))

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



(width (mul-interval a b))

(define (div-interval x y)
  (mul-interval x 
                (make-interval 
                 (/ 1.0 (upper-bound y)) 
                 (/ 1.0 (lower-bound y)))))

(width (div-interval a b))
