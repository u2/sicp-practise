#lang racket
(define dx 0.00001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))


(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) 
            ((deriv g) x)))))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (fixed-point-of-transform 
         g transform guess)
  (fixed-point (transform g) guess))

(define (cubic x a b c)
  (fixed-point-of-transform 
   (lambda (y) (- (+ (* y y y) (* a y y) (* b y) c) x))
   newton-transform
   1.0))

(cubic 100 1 1 1)

(define (check y a b c)
  (+ (* y y y) (* a y y) (* b y) c)
  )

(check 4.248772982142824 1 1 1)