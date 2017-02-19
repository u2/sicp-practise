#lang racket
(define (fermat-test n m)
    (= (expmod m n n) m))

(define (test-carmichael n) (fast-prime? n n))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n (- times 1)) 
         (fast-prime? n (- times 1)))
        (else false)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder 
          (* base (expmod base (- exp 1) m))
          m))))

(define (square x) (* x x))

(test-carmichael 561)
(test-carmichael 1105)
(test-carmichael 1729)
(test-carmichael 2465)
(test-carmichael 2821)
(test-carmichael 6601)

(test-carmichael 560)
(test-carmichael 1104)
(test-carmichael 6600)
(test-carmichael 121)
