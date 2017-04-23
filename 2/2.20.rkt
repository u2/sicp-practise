#lang racket

(define (same-parity x . z)
  (define (iter subx result)
    (if (null? subx)
        result
        (if (odd? (- (car subx) x))
            (iter (cdr subx) result)
            (iter (cdr subx) (append result (list (car subx)))))))

  (iter z (list x)))
        
      

(same-parity 1 2 3 4 5 6 7)

(same-parity 2 3 4 5 6 7)

