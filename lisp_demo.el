;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

(eldoc-mode)

(insert "foo")

(message "echo")

(+ 1 1)

"foo"

path-separator

(quote (1 2 3))

'(1 2 3)

(car '(1 2 3))
;; 1

(cdr '(1 2 3))
;; 2 3

nil

()

(null nil)
;; t

(cons 1 '(2 3))
;; (1 2 3)

(append '(1 2) '(3 4))
;; (1 2 3 4)

(set 'some-list '(1 2 3))

some-list

(setq my-list '(1 2 3))

my-list

(let ((a 1)
      (b 4))
  (format "a is %d and b is %d" a b))

(defun say-hello ()
  (message "hello"))

(say-hello)


(defun square (x)
  (* x x))

(square 2)

(when (= (+ 2 2) 5)
  (message "true"))

(defun evens-or-odds (n)
  (if (= 0 (% n 2))
      "even!"
    "odd"))

(evens-or-odds 4)
(evens-or-odds 5)

((lambda (x) (* x x x)) 5)

(fset 'cube (lambda (x) (* x x x)))

(cube 4)

(mapcar 'upcase '("foo" "bar"))

(global-set-key (kbd "M-#") 'sort-lines)

major-mode
;; emacs-lisp-mode

(add-hook 'c-mode-common-hook
     (lambda ()
       (local-set-key (kbd "<f5>") 'recompile)))

(describe-key (kbd "M-#"))

(defun other-window-backward (&optional n)
  "Select Nth previous window."
  (interactive "P")
  (other-window (- (prefix-numeric-value n))))

(other-window-backward)

(defun point-to-top ()
  "Put point on top line of window."
  (interactive)
  (move-to-window-line 0))

(point-to-top)

(defun point-to-bottom ()
  "Put point on bottom line of window."
  (interactive)
  (move-to-window-line -1))

(yes-or-no-p "foo?")


