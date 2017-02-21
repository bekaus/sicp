;;
;; SICP Exercise 1.7
;;

;;;;
;;;; Preliminary: the sqrt code
;;;;
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;;;;
;;;; Answer
;;;;
;; The relative error is increasing tremendously after the number gets below the
;; order of magnitude of the good-enough difference 0.001. If the number is x is
;; really small, any squared guess just below 0.001 will pass:
;; |guess^2 - x| < 0.001
;; => guess^2 < x + 0.001 and guess^2 > x - 0.001
;; for very small x, this is always true for x~0.001
(define (rel-error x)
  (/ (abs (- x (square (sqrt x))))
     x))

(rel-error 1000000) ;Value: 2.3632310330867767e-14
(rel-error 10) ;Value: 3.1668918154537097e-9
(rel-error 0.1) ;Value: 1.1255662039411085e-4
(rel-error 0.001) ;Value: .7011851721075595
(rel-error 1e-5) ;Value: 97.32294718753641
(rel-error 1e-10) ;Value: 9765624.666015629

;; For very large numbers the rel error is decreasing. However, the algorithm may
;; never terminate because the floating point representation is not able to resolve
;; a difference of 0.001 for very large numbers:
(define (difference x)
  (- (+ x 0.001) x))
(difference 100) ;Value: 1.0000000000047748e-3
(difference 1e12) ;Value: .0009765625
(difference 1e13) ;Value: .001953125
(difference 1e14) ;Value: 0.
(difference 1e30) ;Value: 0.

;; Given a large enough number, the improve guess procedure will not be able to
;; update the guess (just returning the same guess) and the sqrt-iter procedure
;; will be stuck in an infinite loop. For example:

(define (no-improvement? guess x)
  (= guess (improve guess x)))

(no-improvement? 31622776.601683795 1e15) ;Value: #t
(good-enough? 31622776.601683795 1e15) ;Value: #f
(- (square  31622776.601683795) 1e15) ;Value: .125

;;;;
;;;; an improved good-enough? procedure
;;;;
(define (good-enough? guess x)
  (<= (abs (- guess (improve guess x))) ; <= because of potential 0 guess
     (* 0.001 guess)))

;; Problem is fixed for very large numbers, since the relative error will be
;; exactly zero:
(good-enough? 31622776.601683795 1e15) ;Value: #t

;; Problem for small numbers is fixed as well since the relative error of the guess
;; is independent of the absolute "smallness" of the number.
;; See relative errors for small numbers compared to above:
(rel-error 0.1) ;Value: 1.1255662039411085e-4
(rel-error 0.001) ;Value: 1.217168231948092e-3
(rel-error 1e-5) ;Value: 9.478984465262992e-6
(rel-error 1e-10) ;Value: 1.117317358177749e-4
