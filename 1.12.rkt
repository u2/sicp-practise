(define (triangle m n)
  (cond ((= n 0) 1)
        ((= m n) 1)
        (else
         (+ (triangle (- m 1) (- n 1))
            (triangle (- m 1) n)))))

(triangle 0 0)
(triangle 1 0)
(triangle 1 1)
(triangle 2 0)
(triangle 2 1)
(triangle 2 2)
(triangle 3 0)
(triangle 3 1)
(triangle 3 2)
(triangle 3 3)
(triangle 4 0)
(triangle 4 1)
(triangle 4 2)
(triangle 4 3)
(triangle 4 4)

(define (factorial n)
    (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
    (if (> counter max-count)
        product
        (fact-iter (* counter product)
                   (+ counter 1)
                   max-count)))


(define (pascal row col)
    (/ (factorial row)
       (* (factorial col)
          (factorial (- row col)))))

(pascal 0 0)
(pascal 1 0)
(pascal 1 1)
(pascal 2 0)
(pascal 2 1)
(pascal 2 2)
(pascal 3 0)
(pascal 3 1)
(pascal 3 2)
(pascal 3 3)
(pascal 4 0)
(pascal 4 1)
(pascal 4 2)
(pascal 4 3)
(pascal 4 4)



