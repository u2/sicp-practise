(load "2.46.rkt")

(define (make-segment start end)
  (list start end))

(define (start-segment line)
  (car line))

(define (end-segment line)
  (cadr line))

(define line (make-segment (make-vect 2 3) (make-vect 0 0)))

(start-segment line)

(end-segment line)