#lang racket
(define (average a b)
  (/ (+ a b) 2))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) 
    (average x (f x))))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f x)
  (if (= x 1)
      f
      (compose f (repeated f (- x 1)))))

(define (log2 x)
  (/ (log x) (log 2)))

(define (nth-root x n)
  (fixed-point
     ((repeated average-damp (floor (log2 n)))
        (lambda (y) (/ x (expt y (- n 1)))))
     1.0))

(nth-root 100 2)
(nth-root 1000 3)
(nth-root 10000 4)
(nth-root 1000000 6)
(nth-root 256 8)
(nth-root 4096 12)
(nth-root 4294967296 32)
(nth-root 18446744073709551616 64)
(nth-root 340282366920938463463374607431768211456 128)
