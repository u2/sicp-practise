#lang racket
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (expt (car things) 2)
                    answer))))
  (iter items null))

(square-list (list 1 2 4 9))
; '(81 16 4 1)
; 顺序反了

(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (expt 
                     (car things) 2)))))
  (iter items null))

(square-list2 (list 1 2 4 9))
; '((((() . 1) . 4) . 16) . 81)
; cons 只能是 Hierarchical pair


; 正确做法
(define (square-list3 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer
                    (list (expt (car things) 2))))))
  (iter items (list)))

(square-list3 (list 1 2 4 9))