(defun first1 (list) (
    if (null list) nil
    (car list)
))
(defun rest1 (list) (
    if (null list) nil
    (cdr list)
))
(defun insert (elm list)
    (if (null list) (cons elm nil)
    (cons elm list)))

(defun second1 (list) (first1 (rest1 list)))
(defun third1 (list) (first1 (rest1 (rest1 list))))
