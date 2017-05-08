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

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      null
      (cons (accumulate op init (car-seqs seqs))
            (accumulate-n op init (cdr-seqs seqs)))))


(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map
   (lambda (raw)
     (dot-product raw v))
   m))

(matrix-*-vector (list (list 1 2 3) (list 4 5 6) (list 7 8 9)) (list 2 3 4))


(define (transpose mat)
  (accumulate-n
   cons
   null
   mat))

(transpose (list (list 1 2 3) (list 4 5 6)))

(define (matrix-*-matrix m n)
   (let ((cols (transpose n)))
     (map (lambda (row) (matrix-*-vector cols row)) m)))

(matrix-*-matrix (list (list 1 2) (list 3 4)) (list (list 2 3) (list 4 6)))



