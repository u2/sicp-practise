(define right-split (split beside below))
(define up-split (split below beside))

(define (split big-combiner small-combiner)
    (define (inner painter n)
        (if (= n 0)
            painter
            (let ((smaller (inner painter (- n 1))))
                (big-combiner painter   
                              (small-combiner smaller smaller)))))
    inner)


(define up-split (split below  beside))

(define right-split (split beside below))