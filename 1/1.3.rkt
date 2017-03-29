(define (square a)
        (* a a))

(define (sum-of-squares a b c)
        (if (> a b)
            (+ (square a) (square (max b c)))
            (+ (square b) (square (max a c)))
         ))

(sum-of-squares 1 2 5)

(sum-of-squares 2 1 5)

(sum-of-squares 5 2 1)

(sum-of-squares 5 1 2)