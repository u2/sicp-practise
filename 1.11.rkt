(define (f n)
  (if (< n 4)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(f 1)
(f 2)
(f 3)
(f 4)
(f 5)

(define (ff n)
   (if (< n 4)
       n
       (ff-iter 1 2 3 1 (- n 3))))

(define (ff-iter p1 p2 p3 counter n)
  (if (> counter n)
      p3
      (ff-iter p2
               p3
               (+ p3 (* 2 p2) (* 3 p1))
               (+ counter 1)
               n)))

(ff 1)
(ff 2)
(ff 3)
(ff 4)
(ff 5)
