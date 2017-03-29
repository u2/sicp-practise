(define (fib n) 
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

(define a (/ (+ 1 (sqrt 5))
          2))

(define b (/ (- 1 (sqrt 5))
             2))

(define (power x n)
  (power-iter x 1 0 n))

(define (power-iter x product counter n)
  (if (= counter n)
      product
      (power-iter x (* product x) (+ counter 1) n)))

(define (f2 n)
   (/ (- (power a n) (power b n))
      (sqrt 5)))

(power 2 0)
(power 2 3)
(power 3 2)

(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 11)
(fib 20)

(f2 1)
(f2 2)
(f2 3)
(f2 4)
(f2 11)
(f2 20)
      