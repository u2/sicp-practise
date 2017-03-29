#lang racket
(define (f g) (g 2))

(define (square x) (* x x))

(f square)

(f (lambda (z) (* z (+ z 1))))

; error
(f f)
; (f f) 第一步解析参数 (f f) -> (f 2) -> (2 2), error