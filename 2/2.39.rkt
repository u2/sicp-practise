#lang racket

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define fold-right accumulate)

(define (reverse1 sequence)
  (fold-right 
   (lambda (x y) (append y (list x)))
   null
   sequence))

(reverse1 (list 1 4 9 16 25))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (reverse2 sequence)
  (fold-left 
   (lambda (x y) (cons y x)) null sequence))


(reverse2 (list 1 4 9 16 25))