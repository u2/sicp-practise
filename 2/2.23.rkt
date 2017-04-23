#lang racket
(define (for-each2 p listx)
  (cond ((not (null? listx))
      (p (car listx))
       (for-each2 p (cdr listx)))))


(for-each2 
 (lambda (x) (newline) (display x))
 (list 57 321 88))

(for-each 
 (lambda (x) (newline) (display x))
 (list 57 321 88))
