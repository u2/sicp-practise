#lang racket

(define (tan-cf x k)
  (define (ik i)
    (- (* 2 i) 1))
  
  (define (ix i)
    (if (= i 1)
        x
        (* x x)))
  
  (define (frac i)
    (if (< i k)
        (/ (ix i) (- (ik i) (frac (+ i 1))))
        (/ (ix i) (ik i))))
  
  (frac 1))


(tan-cf (/ pi 4) 10)

(tan-cf (/ pi 6) 10)

(tan-cf (/ pi 3) 10)
