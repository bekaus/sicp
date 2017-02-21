;;
;; SICP Exercise 1.8
;;

;;
;; Newton's method for cube roots
;;
(define (square x)
  (* x x))

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x)
		 x)))

(define (improve guess x)
  (if (= guess 0.)
      0.
      (/ (+ (/ x (square guess))
	    (* 2. guess))
	 3.)))

(define (good-enough? guess x)
  (<= (abs (- guess (improve guess x))) ; "<=" because of potential 0 guess
     (* 0.001 (abs guess))))

(define (cbrt x)
  (cbrt-iter 1.0 x))

;;
;; Tests
;;
(cbrt 1000) ;Value: 10.000000145265767
(cbrt 3) ;Value: 1.4422497895989996
(cbrt 1e-60) ;Value: 1.0000000054960131e-20
(cbrt 0) ;Value: 4.9406564584124654e-324
(cbrt -1) ;Value: -1.000000001794607
(cbrt -3) ;Value: -1.442249577880968
(cbrt -1000) ;Value: -10.00000012834623
