#lang racket
(define (filtered-accumulate combiner null-value term a next b filter)
    (define (iter a result)
      (if (> a b)
          result
          (if (filter a)
             (iter (next a) (combiner result (term a)))
             (iter (next a) result)
          )))
    (iter a null-value))


(define (smallest-divisor n)
  (find-divisor n 2))

(define (square x) (* x x))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) 
         n)
        ((divides? test-divisor n) 
         test-divisor)
        (else (find-divisor 
               n 
               (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (next k)
    (+ k 1))

(define (term x) x)

(filtered-accumulate + 0 term 1 next 11 prime?)

