#lang racket
(define (cons x y) 
  (* (expt 2 x)
     (expt 3 y)))

(define (exp-num n b)
  (define (iter x time)
    (if (= 0 (remainder x b))
        (iter (/ x b) (+ time 1))
        time))
  (iter n 0))


(exp-num 8 2)
    

(define (car z) 
  (exp-num z 2))

(define (cdr z)
  (exp-num z 3))

(car (cons 2 3))
(cdr (cons 2 3))