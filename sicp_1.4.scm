;;
;; SICP Exercise 1.4
;;

;; The expression (if (> b 0) + -) defines an anonymous procedure on the fly,
;; selecting either the + or - procedure depending on b being negative or not.
;; This is equivalent to calcuating the absolute value of b and subsequently
;; adding a.

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(= (a-plus-abs-b 1 2) 3)
(= (a-plus-abs-b 1 -2) 3)
(= (a-plus-abs-b 1 0) 1)
(= (a-plus-abs-b 1 -0) 1)

	
		   
