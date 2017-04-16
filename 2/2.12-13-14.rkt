#lang racket
; Represent intervals as a center value and a width
(define (make-center-width c w)
   (make-interval (- c w) (+ c w)))

(define (center i)
   (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
   (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-interval a b) (cons a b))

(define (upper-bound x)
  (if (> (car x) (cdr x))
      (car x)
      (cdr x)))

(define (lower-bound x)
  (if (< (car x) (cdr x))
      (car x)
      (cdr x)))

(define (make-center-percent c p)
   (make-center-width c (* c (/ p 100.0))))

(define (percent i)
   (* 100.0 (/ (width i) (center i))))

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

(define (add-interval x y)
  (make-interval (+ (lower-bound x) 
                    (lower-bound y))
                 (+ (upper-bound x) 
                    (upper-bound y))))


(define (div-interval x y)
  (mul-interval x 
                (make-interval 
                 (/ 1.0 (upper-bound y)) 
                 (/ 1.0 (lower-bound y)))))


(define (par1 r1 r2)
   (div-interval (mul-interval r1 r2)
                 (add-interval r1 r2)))

(define (par2 r1 r2)
   (let ((one (make-interval 1 1)))
      (div-interval one
                    (add-interval (div-interval one r1)
                                  (div-interval one r2)))))


(define a (make-center-percent 100 5))
(define b (make-center-percent 200 2))
(define aa (div-interval a a))

aa

(define ab (div-interval a b))

ab

(center aa)

(center ab)

(percent aa)

(percent ab)

(define apb1 (par1 a b))
(define apb2 (par2 a b))

apb1
apb2


(define apa1 (par1 a a))
(define apa2 (par2 a a))

apa1
apa2


