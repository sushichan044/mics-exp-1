(defun max-1 (ary)
    "Return the maximum element of a list of numbers."
    ; (max-1 '(1 2 3 4 5)) => 5
    ; (max-1 '(5 4 3 2 1)) => 5
    (cond ((null ary) nil)
          ((null (cdr ary)) (car ary))
          (t (max (car ary) (max-1 (cdr ary))))))

(defun al-max (ary)
    "Return the maximum element of a nested list of numbers."
    ; (al-max '(1 2 3 4 5)) => 5
    ; (al-max '(4 (5 3) 2 1)) => 5
    (cond ((null ary) nil)
        ((atom ary) ary)
        ((equalp (length ary) 1) (
            if (listp (car ary))
                (al-max (car ary))
                (car ary)))
        (t (max (al-max (car ary)) (al-max (cdr ary))))))
