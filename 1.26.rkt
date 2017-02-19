#lang racket
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
          (* (expmod base (/ exp 2) m)
             (expmod base (/ exp 2) m))
          m))
        (else
         (remainder 
          (* base 
             (expmod base (- exp 1) m))
          m))))

; Louis 的算法能正确得出结果，但是会提高复杂度。
; 原来的算法使用square，可以先计算出square的参数，再计算square
; 而 Louis 的算法，需要对参数进行两次计算。
; 所以将原有的O(logn)计算复杂度变成了O(n)