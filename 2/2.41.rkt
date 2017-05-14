#lang racket
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

(define (unique-triples n)
  (flatmap (lambda (j)
             (map (lambda (x) (append (list j) x))
                  (unique-pairs (- j 1))))
       (range 
        3 
        (+ n 1))))

(define (sum-of-triple n)
  (accumulate + 0 n))

(unique-pairs 6)
(unique-triples 6)

(sum-of-triple (list 1 2 3))


(define (unique-triples-with-sum n s)
  (filter (lambda (x)
            (= (sum-of-triple x) n))
          (unique-triples s)))

(unique-triples-with-sum 7 10)
(unique-triples-with-sum 8 10)
(unique-triples-with-sum 11 10)
