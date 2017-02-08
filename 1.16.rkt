(define (fast-expt b n)
  (expt-iter 1 b n))


(define (expt-iter a b n)
  (cond ((= n 0) 
         a)
        ((even? n)
         (expt-iter a (square b) (/ n 2)))
        (else 
         (expt-iter (* a b) (square b) (/ (- n 1) 2)))))

(define (square n)
  (* n n))

(fast-expt 2 10)


(fast-expt 2 4)