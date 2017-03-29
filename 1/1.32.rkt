#lang racket

(define (one-fourth-pi b)
  (define (accumulate combiner null-value term a next b)
    (define (iter a result)
      (if (> a b)
          result
          (iter (next a) (combiner result (term a)))))
    (iter a null-value))

  (define (product result new) (* result new))

  (define (square x) (* x x))

  (define (term k)      
    (/ (* (* 2 k) (+ 2 (* 2 k))) (square (+ 1 (* 2 k)))))

  (define (next k)
    (+ k 1))

  (accumulate product 1 term 1 next b)
)


(one-fourth-pi 10)