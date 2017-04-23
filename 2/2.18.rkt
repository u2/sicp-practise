#lang racket
(define (re l)
  (define (inner-re temp-l temp-result)
    (if (null? temp-l)
        temp-result
        (inner-re (cdr temp-l)
                  (cons (car temp-l) temp-result))))

  (inner-re (cdr l) (list (car l))))


(re (list 1 4 9 16 25))

(reverse (list 1 4 9 16 25))