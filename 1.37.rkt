#lang racket
(define (cont-frac n d k)
  (define (frac i)
    (if (< i k)
        (/ (n i) (+ (d i) (frac (+ i 1))))
        (/ (n k) (d k))))
  (frac 1))


(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           20)


(define (cont-frac-iter n d k)
  (define (frac i result)
    (if (= i 0)
        result
        (frac (- i 1) (/ (n (- i 1)) (+ (d (- i 1)) result)))))
  (frac (- k 1) (/ (n k) (d k))))


(cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           20)