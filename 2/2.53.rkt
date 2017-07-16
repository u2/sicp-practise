(define (memqq item x)
  (cond ((null? x) #f)
        ((eq? item (car x)) x)
        (else (memqq item (cdr x)))))


(list (quote a) (quote b) (quote c))
(list (list 'george))
(cdr '((x1 x2) (y1 y2)))
(cadr '((x1 x2) (y1 y2)))
(pair? (car '(a short list)))
(memqq 'red '((red shoes) (blue socks)))
(memqq 'red '(red shoes blue socks))