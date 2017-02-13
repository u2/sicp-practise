(#%require (only racket/base current-milliseconds))
(define (runtime) (current-milliseconds))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) 
                       start-time))))

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

(define (search-for-primes from n)
  (cond ((> n 0)
      (cond ((prime? from)
             (timed-prime-test from)
             (search-for-primes (next-odd from) (- n 1))
           )
       (else (search-for-primes (next-odd from) n))))))

(define (next-odd n)
  (if (odd? n)
      (+ n 2)
      (+ n 1)))


(search-for-primes 1000 3)
(search-for-primes 10000 3)
(search-for-primes 1000000 3)
(search-for-primes 10000000 3)
(search-for-primes 100000000 3)
(search-for-primes 1000000000 3)
(search-for-primes 10000000000 3)


