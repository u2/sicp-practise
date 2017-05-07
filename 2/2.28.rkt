#lang racket
(define (fringe x)
  (define (inner-fringe temp result)
    (if (null? temp)
        result
        (inner-fringe (cdr temp) (append-item result (car temp)))))

  (define (append-item result item)
    (if (list? item)
        (append result (fringe item))
        (append result (list item))))
        

  (inner-fringe x (list)))

(define x 
  (list (list 1 2) (list 3 4)))

(fringe x)

(fringe (list x x))

(list 1 2)
(cons 2 (cons 1 (cons (list 1) 2)))
(cons 2 (cons 1 (cons 1 (list 2))))
