(defun al-member (atm lst)
    "Return t if atm is a member of lst, nil otherwise."
    ; (al-member 'a '(a b c)) => t
    ; (al-member 'd '(a b c)) => nil
    ; (al-member 'a '(b ((a) c) d)) => t
    (cond ((null lst) nil) ; if lst is empty, return nil
          ((atom lst) (if (eq atm lst) t nil)) ; if lst is an atom, return t if atm is equal to lst, nil otherwise
          ; recursively check if atm is a member of the car or cdr of lst
            (t (or (al-member atm (car lst))
                     (al-member atm (cdr lst))))))
