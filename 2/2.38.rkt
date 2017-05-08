#lang racket
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(fold-left / 1 (list 1 2 3))
(/ (/ (/ 1 1) 2) 3)
(fold-left list null (list 1 2 3))
(list (list (list null 1) 2) 3)

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define fold-right accumulate)

(fold-right  / 1 (list 1 2 3))
(/ 1 (/ 2 (/ 3 1)))

(fold-right list null (list 1 2 3))
(list 1 (list 2 (list 3 null)))


(fold-left * 1 (list 1 2 3 4))
(fold-left * 1 (list 1 2 3 4))


(fold-left + 0 (list 1 2 3 4))
(fold-right + 0 (list 1 2 3 4))