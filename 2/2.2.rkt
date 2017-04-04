#lang racket
;;; 2.2rkt
(define (make-point x y)
  (cons x y))

(define (x-point a)
  (car a))

(define (y-point a)
  (cdr a))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define a (make-point 1 2))
(x-point a)
(y-point a)
(print-point a)

(newline)
(define b (make-point 5 6))
(x-point b)
(y-point b)
(print-point b)

(define (make-segment x y)
  (cons x y))

(define (start-segment l)
  (car l))

(define (end-segment l)
  (cdr l))

(define (average x y)
    (/ (+ x y)
       2.0))

(define (midpoint-segment l)
  (make-point (average (x-point (start-segment l))
                       (x-point (end-segment l)))
              (average (y-point (start-segment l))
                       (y-point (end-segment l)))))

(define l (make-segment a b))

(newline)
(print-point (midpoint-segment l))
