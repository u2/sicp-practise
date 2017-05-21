(load "2.46.rkt")

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin frame)
  (car frame))

(define (edge1 frame)
  (cadr frame))

(define (edge2 frame)
  (cddr frame))

(define frame-x (make-frame (make-vect 2 3) (make-vect 0 0) (make-vect 4 4)))

(origin frame-x)

(edge1 frame-x)

(edge2 frame-x)