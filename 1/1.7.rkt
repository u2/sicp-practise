
(define (sqrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
      guess          
      (sqrt-iter (improve guess x) guess x)))

(define (square x)
        (* x x))

(define (good-enough? guess prev-guess)
  (< (abs (- prev-guess guess)) 0.001))

(define (average x y) 
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (new-sqrt x)
  (sqrt-iter 1.0 0 x))

(new-sqrt 0.000000000001)

; 0.0009765628413329842
