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
(defun occur (a lat)
  "Returns the number of times a occurs in lat."
  (cond ((null lat) 0)
        ((equal (car lat) a) (1+ (occur a (cdr lat))))
        (t (occur a (cdr lat)))))
(occur 3 '(1 2))
;; 0
(occur 3 '(1 2 3))
;; 1
(occur 3 '(3 3 3 3))
;; 4
(defun leftmost (l)
  "Returns the first atom from l regardless of depth."
  (cond ((null l) nil)
        ((atom (car l)) (car l))
        ((leftmost (car l)))))
(leftmost '(1 2 3))
;; 1
(leftmost '((((1)) 2) 3))
;; 1
(leftmost nil)
;; nil
(leftmost '(((() four))))
;; nil
(not t)
;; nil
(defun mynot (b)
  "Inverts truth of b."
  (cond (b nil)
        (t t)))
(mynot t)
;; nil
(mynot nil)
;; t
(defun rember* (a l)
  "Removes a from l regardless of depth."
  (cond ((null l) nil)
        ((atom (car l))
         (cond ((equal a (car l)) (rember* a (cdr l)))
               (t (cons (car l) (rember* a (cdr l))))))
        (t (cons (rember* a (car l)) (rember* a (cdr l))))))
(rember* 2 '(1 3))
;; (1 3)
(rember* 2 '(1 2 3))
;; (1 3)
(rember* 2 '(1 (2) 3))
;; (1 nil 3)
(defun occur* (a l)
  "Returns the number of times a occurs in list l."
  (cond ((null l) 0)
        ((atom (car l)) (cond ((equal a (car l)) (1+ (occur* a (cdr l))))
                              (t (occur* a (cdr l)))))
        (t (+ (occur* a (car l)) (occur* a (cdr l))))))
(occur* 3 '(1 (2 3) (1 3 (3))))
;; 3
(defun 1st-sub-exp (aexp)
  "Returns the first subexpression of aexp."
  (car aexp))

(defun 2nd-sub-exp (aexp)
  "Returns the second subexpression of aexp."
  (car (cdr (cdr aexp))))

(defun operator (aexp)
  "Returns the operator of aexp"
  (car (cdr aexp)))

(defun value (aexp)
  "Evaluates arithmetic expression aexp."
  (cond ((numberp aexp) aexp)
        ((equal (operator aexp) '+) (+ (value (1st-sub-exp aexp)) (value (2nd-sub-exp aexp))))
        (t (* (value (1st-sub-exp aexp)) (value (2nd-sub-exp aexp))))))
(value 2)
;; 2
(value '(2 + 2))
;; 4
(value '(2 + (2 + 2)))
;; 6
(value '(2 + (3 * 4)))
;; 14
(defun makeset (lat)
  "Makes a set from lat lat."
  (cond ((null lat) ())
        ((member (car lat) (cdr lat)) (makeset (cdr lat)))
        (t (cons (car lat) (makeset (cdr lat))))))

(makeset '(1 1 2 3))
;; (1 2 3)

(if (cl-oddp 1) 'odd 'even)
;; odd

(if (cl-evenp 1) 'odd 'even)
;; even

(and 1 2 3 4)
;; 4

(or 1 2 3 4)
;; 1

(defun my-average (x y)
  "Averages numbers x and y."
  (let ((sum (+ x y)))
    (list x y 'average 'is (/ sum 2.0))))

(my-average 2 3)
;; (2 3 average is 2.5)

(defun size-range (x y z)
  "Returns size range."
  (let* ((biggest (max x y z))
         (smallest (min x y z))
         (r (/ biggest smallest 1.0)))
    (list 'factor 'of r)))

(size-range 1 2 3)
;; (factor of 3.0)

;; let* crates variables one at a time

(setq words '((one . un)
              (two . deux)
              (three . trois)
              (four . quatre)
              (five . cinq)))

(assoc 'three words)
;; (three . trois)
(assoc 'foo words)
;; nil
(cdr (assoc 'three words))
;; trois
(rassoc 'trois words)
;; (three . trois)
(cl-subst 3 2 '(2 2 2))
;; (3 3 3)
(setq fn #'cons)
fn
;; cons
(type-of fn)
;; symbol
(funcall fn 'c 'd)
;; (c . d)
(mapcar #'car '((1 2) (5 6)))
;; (1 5)
(mapcar #'(lambda (n) (* n n)) '(1 2 3))
;; (1 4 9)
(cl-find-if #'cl-oddp '(2 4 6 7 9))
;; 7
(cl-find-if #'cl-oddp '(2 4 6 7 9) :from-end t)
;; 9
(defun my-assoc (key table)
  "Lookup key in table and return value."
  (cl-find-if #'(lambda (entry)
                  (equal key (cl-first entry)))
              table))
(my-assoc 'three words)
;; (three . trois)
(cl-remove-if #'cl-oddp '(1 2 3 4))
;; (2 4)
(cl-remove-if-not #'cl-oddp '(1 2 3 4))
;; (1 3)
(cl-reduce #'+ '(1 2 3))
;; 6
(cl-every #'cl-oddp '(1 2 3))
;; nil
(cl-every #'cl-oddp '(1 3))
;; t
(cl-mapcar #'+ '(1 2 3) '(10 20 30))
;; (11 22 33)
(1+ 3)
;; 4
(1- 3)
;; 2
(setq x nil)
(push '1 x)
;; (1)
(push '2 x)
;; (2 1)
(pop x)
;; 2
x
;; (1)
(defun picky-multiply (x y)
  "Compute X times Y.
   X must be odd; Y must be even."
  (unless (cl-oddp x)
    (setq x (1+ x)))
  (when (cl-oddp y)
    (setq y (1- y)))
  (list x 'times y 'equals (* x y)))
(picky-multiply 2 9)
;; (3 times 8 equals 24)
(defun atom-to-function (x)
  "Returns a function based on symbol."
  (cond ((equal x '+) #'+)
        ((equal x '*) #'*)))
(funcall (atom-to-function '+) 2 2)
;; 4
(dotimes (i 2)
  (print i))
;;
;; 0
;;
;; 1
;; nil
(dolist (x '(1 2))
  (print x))
;;
;; 1
;;
;; 2
;; nil
(cl-defstruct starship
  (name nil)
  (speed 0)
  (condition 'green)
  (shields 'down))
;; starship
(setq s1 (make-starship))
;; #s(starship nil 0 green down)
(setf (starship-name s1) "enterprise")
s1
;; #s(starship "enterprise" 0 green down)
(setq s2 (make-starship :name "reliant"))
;; #s(starship "reliant" 0 green down)
