(define (mul a b)
  (mul-iter 0 a b))

(define (mul-iter product a b)
  (if (= b 1)
      (+ product a)
      (if (even? b)
          (mul-iter product (+ a a) (/ b 2))
          (mul-iter (+ a product) (+ a a) (/ (- b 1) 2)))))

(mul 3 5)
(mul 4 4)
(mul 5 5)