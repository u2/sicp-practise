#lang racket
(define (deep-reverse l)
  (define (inner-reverse temp-l temp-result)
    (if (null? temp-l)
        temp-result
        (inner-reverse (cdr temp-l)
                       (cons (reverse-item (car temp-l)) temp-result))))

  (define (reverse-item item)
    (if (list? item)
        (deep-reverse item)
        item))

  (inner-reverse l (list)))


(deep-reverse (list (list 1 4) (list 9 16 25)))