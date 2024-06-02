(defun my-union (lst1 lst2)
    "Return the union of two lists lst1 and lst2."
    ; (my-union '(1 2 3) '(3 4 5)) => (1 2 3 4 5)
    (cond
        ((null lst1) lst2) ; If lst1 is empty, return lst2.
        ((member (car lst1) lst2) (my-union (cdr lst1) lst2)) ; If the first element of lst1 is in lst2, skip it.
        (t (cons (car lst1) (my-union (cdr lst1) lst2))) ; Otherwise, add it to the union.
    )
)

(defun my-intersection (lst1 lst2)
    "Return the intersection of two lists lst1 and lst2."
    ; (my-intersection '(1 2 3) '(3 4 5)) => (3)
    (cond
        ((null lst1) nil) ; If lst1 is empty, return nil.
        ((member (car lst1) lst2) (cons (car lst1) (my-intersection (cdr lst1) lst2))) ; If the first element of lst1 is in lst2, add it to the intersection.
        (t (my-intersection (cdr lst1) lst2)) ; Otherwise, skip first element of lst1.
    )
)

(defun intersectp (lst1 lst2)
    "Return t if the intersection of two lists lst1 and lst2 is not empty. Otherwise, return nil."
    ; (intersectp '(1 2 3) '(3 4 5)) => t
    (not (null (my-intersection lst1 lst2))) ; If the intersection is not empty, return t.
)

(defun samesetp (lst1 lst2)
    "Return t if two lists lst1 and lst2 are the same set. Otherwise, return nil. Not order-sensitive."
    ; (samesetp '(1 2 3) '(3 2 1)) => t
    ; (samesetp '(1 2 3) '(3 4 5)) => nil
    (cond
        ((null lst1) (null lst2)) ; If both lists are empty, return t.
        ((null lst2) nil) ; If lst2 is empty but lst1 is not, return nil.
        ((not (equalp (length lst1) (length lst2))) nil) ; If the lengths of lst1 and lst2 are not equal, return nil.
        ((member (car lst1) lst2) (samesetp (cdr lst1) (remove (car lst1) lst2))) ; If the first element of lst1 is in lst2, remove it from lst2 and check the rest of the lists.
        (t nil)
    )
)
