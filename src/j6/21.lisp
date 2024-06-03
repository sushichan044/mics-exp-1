(defun flatten (lst)
    "Flatten a list of lists into a single list."
    ; (setq s '(a (b (c d) e) (f (g (h i) j) k) l))
    ; (flatten (list '(THE ATOMS IN S ARE) s))
    ; => (THE ATOMS IN S ARE A B C D E F G H I J K L)
    (cond
        ((null lst) nil)
        ((atom lst) (list lst)) ; if lst is an atom, return it as a list
        (t (append (flatten (car lst)) (flatten (cdr lst)))))) ; otherwise, flatten the car and cdr and append them

(defun p (lst)
    "Print given atom as not-nested list."
    (print (flatten lst)))

(defun pc (expr atm)
    "Print given atm only if expr is not nil."
    ;(setq n 'robbie)
    ;(pc (not (numberp n)) (list 'WARNING n '(IS NOT A NUMBER)))
    ; => (WARNING ROBBIE IS NOT A NUMBER)
    (if (not (null expr))
        (p atm)
        nil
    )
)

(defun rq (atm)
    "Print atm as non-nested list, and read user input then return it."
    (p atm)
    (read)
)
