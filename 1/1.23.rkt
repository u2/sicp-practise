(#%require (only racket/base current-milliseconds))
(define (runtime) (current-milliseconds))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) 
         n)
        ((divides? test-divisor n) 
         test-divisor)
        (else (find-divisor 
               n 
               (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square x)
  (* x x))

(define (next test-divisor)
  (cond ((= test-divisor 2) 3)
        (else (+ test-divisor 2))))

(define (timed-divisor-test n)
  (newline)
  (display n)
  (start-divisor-test n (runtime)))

(define (start-divisor-test n start-time)
  (smallest-divisor n)
  (report-prime (- (runtime) 
                start-time)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(timed-divisor-test 10000000019)
(timed-divisor-test 10000000033)
(timed-divisor-test 10000000061)

;10000000019 *** 20
;10000000033 *** 17
;10000000061 *** 17

;10000000019 *** 9
;10000000033 *** 8
;10000000061 *** 9