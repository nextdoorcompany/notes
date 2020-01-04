(car '(((a)) (b) (c) d))
;; ((a))
(car 'a)
;; error not a list
(car ())
;; nil
(car '((a b) c))
;; (a b)
(cdr '(((a)) (b) (c) d))
;; ((b) (c) d)
(cdr 'a)
;; error not a list
(cdr ())
;; nil
(cons 'a '(b c))
;; (a b c)
(cons 'a ())
;; (a)
(cons 'a 'b)
;; (a . b)
(cons '(a b) '(c d e))
;; ((a b) c d e)
(cons () '(a b))
;; (nil a b)
(cons () ())
;; (nil)
(cons (car '(a b)) (cdr '(a b)))
;; (a b)
(= 1 1)
;; t
(equal 'foo 'foo)
;; t
(equal '(1 2) '(1 2))
;; t
(string-equal "foo" "foo")
;; t
(atom 1)
;; t
(atom '(1 2 3))
;; nil
(null nil)
;; t
(defun latp (l)
  "Determines if a list is a lat."
  (cond ((not l) t)
        ((atom (car l)) (latp (cdr l)))
        (t nil)))
(latp '(1 2 3))
;;t
(latp '(1 2 (1 2) 3))
;; nil
(defun memberp (a lat)
  "Determines is a is in lat."
  (cond ((not lat) nil)
        (t (or (equal (car lat) a)
               (memberp a (cdr lat))))))
(memberp 3 '(1 2))
;; nil
(memberp 3 '(1 2 3))
;; t
(member 3 '(1 2))
;; nil
(member 3 '(1 2 3))
;; (3)
(member 3 '(1 (3)))
;; nil
(append '(1 2) '(3 4))
;; (1 2 3 4)
(list 1 2 3 4)
;; (1 2 3 4)
(reverse '(1 2 3 4))
;; (4 3 2 1)
(nth 2 '(1 2 3 4))
;; 3
(nthcdr 2 '(1 2 3 4))
;; (3 4)
(last '(1 2 3 4))
;; (4)
(defun rember (a lat)
  "Removes first a from lat."
  (cond ((not lat) nil)
        ((equal (car lat) a) (cdr lat))
        (t (cons (car lat) (rember a (cdr lat))))))
(rember 2 '(1 2 3))
;; (1 3)
(remove 2 '(1 2 3))
;; (1 3)
;; first commandment always ask null? as the first question
;; second commandment use cons to build lists
(defun firsts (l)
  "Collects the first element of every list in l."
  (cond ((not l) nil)
        (t (cons (car (car l)) (firsts (cdr l))))))
(firsts '((1 2) (x y) (9)))
;;(1 x 9)
;; third commandment when building a list, describe the first typical element,
;; and then cons it onto the natural recursion
(defun insertR (old new lat)
  "Inserts new to the right of old in lat."
  (cond ((not lat) nil)
        ((equal old (car lat)) (cons old (cons new (cdr lat))))
        (t (cons (car lat) (insertR old new (cdr lat))))))
(insertR 'foo 'bar '(x y foo z))
;;(x y foo bar z)
(cl-intersection '(1 2 3) '(2 4))
;; (2)
(cl-set-difference '(1 2 3) '(2 4))
;; (1 3)
(cl-subsetp '(1 2 3) '(1))
;; nil
(1+ 2)
;; 3
(1- 2)
;; 1
(zerop 0)
;; t
(null 0)
;; nil
(defun plus (n m)
  "Add n and m."
  (cond ((zerop m) n)
        (t (1+ (plus (1- m) n)))))
(plus 2 2)
;; 4
(defun addvec (vec)
  "Sums all numbers in a vector."
  (cond ((null vec) 0)
        (t (+ (car vec) (addvec (cdr vec))))))
(addvec '(2 3 4))
;; 9
(> 2 3)
;; nil
(< 2 3)
;; t
(defun gtp (n m)
  "Determines is n is greater than m."
  (cond ((zerop n) nil)
        ((zerop m) t)
        (t (gtp (1- n) (1- m)))))
(gtp 2 3)
;; nil
(gtp 3 2)
;; t
(gtp 3 3)
;; nil
(length '(1 2 3 (3)))
;; 4
(defun len (l)
  "Gives length of list."
  (cond ((null l) 0)
        (t (1+ (len (cdr l))))))
(len '(1 2 3 (3)))
;; 4
(numberp 3)
;; t
(number-or-marker-p 3)
;; t
