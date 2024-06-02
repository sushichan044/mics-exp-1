(defun max-1 (ary)
    (cond ((null ary) nil)
          ((null (cdr ary)) (car ary))
          (t (max (car ary) (max-1 (cdr ary))))))

(defun al-max (ary)
  (cond ((null ary) nil)
        ((atom ary) ary)
        ((equalp (length ary) 1) (
            if (listp (car ary))
                (al-max (car ary))
                (car ary)))
        (t (max (al-max (car ary)) (al-max (cdr ary))))))
