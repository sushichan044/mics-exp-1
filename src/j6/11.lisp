(defun my-reverse (ary)
  "Reverse the order of elements in a list."
  ; (my-reverse '(1 2 3 4 5)) => (5 4 3 2 1)
  ; (my-reverse '(1 (2 3) 4 5)) => (5 4 (2 3) 1)
  (if (equalp (length ary) 1) ary ; if the list has only one element, return it
    (append (my-reverse (cdr ary)) (list (car ary)))
  ))

(defun al-reverse (ary)
  "Reverse the order of elements in a nested list."
  ; (al-reverse '(1 2 3 4 5)) => (5 4 3 2 1)
  ; (al-reverse '(1 (2 3) 4 5)) => (5 4 (3 2) 1)
  (if (equalp (length ary) 1) ary
    (append (al-reverse (cdr ary)) (list (if (listp (car ary)) (al-reverse (car ary)) (car ary)))
    ; move the first element to the end of the list
    ; then recursively call al-reverse on the rest of the list
    )))
