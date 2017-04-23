#lang racket
(define (last-p l)
  (define (get-last sub-l la)
    (if (null? sub-l)
        (list la)
        (get-last (cdr sub-l) (car sub-l))))

  (get-last (cdr l) (car l)))

(last-p (list 23 72 149 34))

(last-pair (list 23 72 149 34))
