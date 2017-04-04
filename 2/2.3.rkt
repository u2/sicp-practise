#lang racket
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

(define (make-rectangle origin length width)
      (cons origin (cons length width)))

(define (length x)
  (car (cdr x)))

(define (width x)
  (cdr (cdr x)))

(define rec (make-rectangle a 3 4))

(newline)
(length rec)
(width rec)

(define (perimeter x)
  (* 2 (+ (length x) (width x))))

(define (area x)
  (* (length x) (width x)))

(perimeter rec)
(area rec)

