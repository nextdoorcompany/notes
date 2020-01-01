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







