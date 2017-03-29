 #lang racket
(#%require (only racket/base current-milliseconds))
(define (runtime) (current-milliseconds))
(#%require (only racket/base random))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) 
                       start-time))
    (display "no a prime")))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) 
         n)
        ((divides? test-divisor n) 
         test-divisor)
        (else (find-divisor 
               n 
               (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square x) (* x x))

(timed-prime-test 100000007)
(timed-prime-test 100000037)
(timed-prime-test 100000039)

;;;

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

; random: undefined

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) 
         (fast-prime? n (- times 1)))
        (else 0)))

(define (timed-fast-prime n m)
  (newline)
  (display n)
  (prime-test n m (runtime)))

(define (prime-test n m start-time)
      (fast-prime? n m)
      (report-prime (- (runtime) 
                       start-time)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder 
          (* base (expmod base (- exp 1) m))
          m))))



(timed-fast-prime 100000007 20)
(timed-fast-prime 100000037 20)
(timed-fast-prime 100000039 20)
