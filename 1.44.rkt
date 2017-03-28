#lang racket
(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f x)
  (if (= x 1)
      f
      (compose f (repeated f (- x 1)))))

(define (smooth f dx)
  (lambda (x)
    (/ (+ (f x)
          (f (+ x dx))
          (f (- x dx)))
       3)))

(define (n-fold-smooth f dx n)
  (repeated (smooth f dx) n))

((n-fold-smooth sin 0.7 4) (/ pi 2))