#lang racket
(define (average x y) 
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (iterative-improve good-enough improve)
  (define (iter-improve guess)
    (if (good-enough guess)
      guess
      (iter-improve (improve guess)))) iter-improve)

(define (improve x)
  (lambda (guess)
    (average guess (/ x guess))))

(define (good-enough? x)
  (lambda (guess)
    (< (abs (- (square guess) x)) 0.001)))

(define (sqrt x)
   ((iterative-improve (good-enough? x) (improve x)) 1.0))

(sqrt 36)
(sqrt 49)

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough?)
    (lambda (guess)
       (< (abs (- guess (f guess))) tolerance)))

  (define (next)
    (lambda (guess)
      (f guess)))

  ((iterative-improve (close-enough?) (next)) first-guess))
  

(fixed-point cos 1.0)
