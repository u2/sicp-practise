#lang racket
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (filtered-accumulate combiner null-value term a next b filter)
    (define (iter a result)
      (if (> a b)
          result
          (if (filter a)
             (iter (next a) (combiner result (term a)))
             (iter (next a) result)
          )))
    (iter a null-value))


(define (coprime? i n)
    (and (< i n)
         (= 1 (gcd i n))))


(define (product-of-coprimes n)
  (filtered-accumulate * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) n (lambda (x) (coprime? x n)))
)

(product-of-coprimes 4)
(product-of-coprimes 6)
(product-of-coprimes 7)