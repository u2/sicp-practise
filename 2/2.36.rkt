#lang racket
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence)))))

(define (car-seqs seqs)
  (map car seqs))

(define (cdr-seqs seqs)
  (map cdr seqs))

(car-seqs (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(cdr-seqs (list (list 1 2 4) (list 4 5 6) (list 7 8 9)))


(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      null
      (cons (accumulate op init (car-seqs seqs))
            (accumulate-n op init (cdr-seqs seqs)))))


(define s
  (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(accumulate-n + 0 s)

