#lang racket
(define (cont-frac n d k)
  (define (frac i)
    (if (< i k)
        (/ (n i) (+ (d i) (frac (+ i 1))))
        (/ (n k) (d k))))
  (frac 1))


(define (di i)
   (if (not (= 0 (remainder (+ i 1) 3)))
       1
       (* 2 (/ (+ i 1) 3))))


(define e
  (+ 2(cont-frac (lambda (i) 1.0)
           di
           10)))

e

