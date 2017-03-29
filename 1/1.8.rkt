(define (cube-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
      guess          
      (cube-iter (improve guess x) guess x)))

(define (good-enough? guess prev-guess)
  (< (abs (- prev-guess guess)) 0.001))

(define (average x y) 
  (/ (+ x y) 2))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (new-cube x)
  (cube-iter 1.0 0 x))