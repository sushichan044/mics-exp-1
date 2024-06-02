(defun my-reverse (ary)
  (if (equalp (length ary) 1)
    ary
    (append (my-reverse (cdr ary)) (list (car ary)))
  ))

(defun al-reverse (ary)
  (if (equalp (length ary) 1)
    ary
    (append (al-reverse (cdr ary)) (list (if (listp (car ary)) (al-reverse (car ary)) (car ary)))
    )))
