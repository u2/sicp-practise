#lang racket
(require math/number-theory)

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))



(define (unique-pairs n)
  (flatmap
   (lambda (i)
     (map (lambda (j) 
            (list i j))
          (range 
           1 
           i)))
   (range 1 (+ n 1))))


(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(unique-pairs 6)

(define (make-pair-sum pair)
  (list (car pair) 
        (cadr pair) 
        (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter
        prime-sum?
        (unique-pairs n)
        )
       )
  )

(prime-sum-pairs 6)
   
   