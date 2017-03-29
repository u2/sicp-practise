#lang racket
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

(expmod 2 5 3)
(expmod 2 4 3)

(define (expmod2 base exp m)
  (remainder (fast-expt base exp) m))

(define (fast-expt b n)
  (cond ((= n 0) 
         1)
        ((even? n) 
         (square (fast-expt b (/ n 2))))
        (else 
         (* b (fast-expt b (- n 1))))))

(expmod2 2 5 3)
(expmod2 2 4 3)

;可以正确得出结构，但是Alyssa的算法需要计算出(fast-expt base exp)，再求remainder。
;而原来的算法，是不断通过每次对乘幂进行 remainder 操作，使得乘幂限制再一个
;比较小的范围内，这样可以避免溢出和并且计算的更快。