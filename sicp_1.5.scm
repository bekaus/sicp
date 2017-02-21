;;
;; SICP Exercise 1.5
;;

;;;; applicative order
;; (test 0 (p))
;; (test 0 (p))
;; (test 0 (p))
;; ...
;; => leads to infinte recursion

;;;; normal-order
;; (test 0 (p))
;; (if (= 0 0) 0 (p)) ; fully expandend, now reduce
;; Since the predicate is true, the alternative is never evaluated (which would
;; lead to infinte recursion). The expression returns with value 0.

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))
