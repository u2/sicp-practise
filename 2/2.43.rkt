#lang racket
(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define (enumerate-interval i j)
  (range 1 (+ j 1)))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) 
           (safe? k positions))
         (flatmap
          (lambda (new-row)
            (map (lambda (rest-of-queens)
                   (adjoin-position 
                    new-row k rest-of-queens))
                 (queen-cols (- k 1))))
          (enumerate-interval 1 board-size))
         )))
  (queen-cols board-size))


(define (adjoin-position new-row k rest-of-queens)
    (cons new-row rest-of-queens))

(define empty-board
  null)

(define (safe? k position)
  (define (iter-check i value distance position result)
    (if (= k i)
        result
        (iter-check (+ i 1)
                    value
                    (+ distance 1)
                    (cdr position)
                    (and result
                         (not (= value (car position))) ;In the same row
                         (not (= (+ value distance) (car position))) ; In diagonal
                         (not (= (- value distance) (car position)))))))

  (iter-check 1 (car position) 1 (cdr position) true))



(queens 8)

; Thanks http://www.billthelizard.com/2011/06/sicp-242-243-n-queens-problem.html.
; By moving queen-cols so it gets called by flatmap, we're transforming a linear recursive process to a tree-recursive process.




