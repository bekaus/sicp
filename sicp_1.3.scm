;;
;; SICP Exercise 1.3
;;

(define (largest-squares a b c)
  (cond ((and (<= a b) (<= a c)) (+ (* b b) (* c c)))
	((and (<= b a) (<= b c)) (+ (* a a) (* c c)))
	(else (+ (* a a) (* b b)))))

(= (largest-squares 1 2 3) 13)
(= (largest-squares 2 1 3) 13)
(= (largest-squares 3 2 1) 13)
(= (largest-squares 1 1 1) 2)
(= (largest-squares 0 0 0) 0)
(= (largest-squares -1 -3 -2) 5)
	
		   
