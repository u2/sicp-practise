#lang racket
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n (non-zero-random n))
         (fast-prime? n (- times 1)))
        (else false)))


(define (miller-rabin-test n m)
  (cond ((= m 0) true)
    ((= (expmod m (- n 1) n) 1)
     (miller-rabin-test n (- m 1)))
    (else false)))


(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((nontrivial-square-root? base m) 0)  
        ((even? exp)
         (remainder 
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder 
          (* base (expmod base (- exp 1) m))
          m))))


(define (nontrivial-square-root? a n)
    (and (not (= a 1))
         (not (= a (- n 1)))
         (= 1 (remainder (square a) n))))

(define (non-zero-random n)
    (+ 1 (random (- n 1))))

(define (square x) (* x x))


(fast-prime? 561 11)
(fast-prime? 1105 11)
(fast-prime? 1729 11)
(fast-prime? 2465 11)
(fast-prime? 2821 11)
(fast-prime? 6601 11)

(fast-prime? 7 7)
(fast-prime? 13 13)
(fast-prime? 101 13)