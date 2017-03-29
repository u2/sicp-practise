#lang racket
(define (one-fourth-pi b)
  (define (product term a next b)
    (if (> a b)
        1
        (* (term a) (product term (next a) next b))))

  (define (square x) (* x x))

  (define (term k)      
    (/ (* (* 2 k) (+ 2 (* 2 k))) (square (+ 1 (* 2 k)))))

  (define (next k)
    (+ k 1))

  (product term 1 next b)
)

(one-fourth-pi 10)