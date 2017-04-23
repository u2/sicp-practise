#lang racket
(define (square-list items)
  (if (null? items)
      null
      (cons (expt (car items) 2)
            (square-list (cdr items)))))

(define (square-list2 items)
  (map (lambda (x) (* x x)) items))


(square-list (list 1 2 4 9))

(square-list2 (list 1 2 4 9))