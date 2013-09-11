;If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
;Find the sum of all the multiples of 3 or 5 below 1000.

(define (solve limit)
  (define (inner-solve x y)
    (if (>= x limit)
      (if (>= y limit)
        0
        (if (= (remainder y 15) 0)
          (inner-solve x (+ y 3))
          (+ y (inner-solve x (+ y 3)))))
      (if (= (remainder y 15) 0)
        (+ x (inner-solve (+ x 5) (+ y 3)))
        (+ x y (inner-solve (+ x 5) (+ y 3))))))
  (inner-solve 0 0))
