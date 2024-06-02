(defun first1 (lst)
    "Return the first element of a lst"
    ; (first1 '(1 2 3)) => 1
    ; (first1 '()) => nil
     (if (null lst) nil ; if the lst is empty, return nil
    (car lst)
))

(defun rest1 (lst)
    "Return the rest of the elements of a lst"
    ; (rest1 '(1 2 3)) => (2 3)
    ; (rest1 '()) => nil
    (if (null lst) nil ; if the lst is empty, return nil
    (cdr lst)
))

(defun insert (elm lst)
    "Insert an element at the beginning of a lst"
    ; (insert 1 '(2 3)) => (1 2 3)
    ; (insert 1 '()) => (1)
    (if (null lst) (list elm) ; if the lst is empty, return a lst with the element
    (cons elm lst)))

(defun second1 (lst)
    "Return the second element of a lst"
    ; (second1 '(1 2 3)) => 2
    ; (second1 '()) => nil
    (first1 (rest1 lst)))

(defun third1 (lst)
    "Return the third element of a lst"
    ; (third1 '(1 2 3)) => 3
    ; (third1 '()) => nil
(first1 (rest1 (rest1 lst))))
