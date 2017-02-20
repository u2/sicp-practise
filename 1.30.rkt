#lang racket

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (cube x) (* x x x))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  
  (define (y k) (f (+ a (* k h))))
  
  (define (term k)
    (cond ((or (= k 0) (= k n)) (y k))
          ((odd? k) (* 4 (y k)))
          (else (* 2 (y k)))))

  (define (next k)
    (+ k 1))
  
  (* (/ h 3)
     (sum term 0 next n)))

(simpson cube 0.0 1.0 100)


