;;
;; SICP Exercise 1.6
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

(sqrt 9)
(sqrt (+ 100 37))
(sqrt (+ (sqrt 2) (sqrt 3)))
(square (sqrt 1000))

;;;
;;; Answer
;;;
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)

(define (sqrt-iter-new guess x)
  (new-if (good-enough? guess x)
	  guess
	  (sqrt-iter-new (improve guess x)
		     x)))

(define (sqrt-new x)
  (sqrt-iter-new 1.0 x))
	  
(sqrt-new 9)
;; Error => Aborting!: maximum recursion depth exceeded
;;
;; Explanation
;; new-if is a function, that is, all arguments will be evaluated before
;; entering it. sqrt-iter-new is part of the second argument and will recurse
;; infintely, causing the observerd error. 'if' instead is a special form that
;; evaluates either its second or it third argument (depending on the value of
;; the first), but never all of them.
 


