#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) 
              null sequence))

(map sqrt (list 1 4 9 16))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(append (list 1 2) (list 2 3 4))

(define (length sequence)
  (accumulate
   (lambda (x y) (+ y 1))
   0 sequence))

(length (list 1 2 3))