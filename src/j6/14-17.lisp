(defun my-union (lst1 lst2)
    (cond
        ((null lst1) lst2)
        ((member (car lst1) lst2) (my-union (cdr lst1) lst2))
        (t (cons (car lst1) (my-union (cdr lst1) lst2)))
    )
)

(defun my-intersection (lst1 lst2)
    (cond
        ((null lst1) nil)
        ((member (car lst1) lst2) (cons (car lst1) (my-intersection (cdr lst1) lst2)))
        (t (my-intersection (cdr lst1) lst2))
    )
)

(defun intersectp (lst1 lst2)
    (not (null (my-intersection lst1 lst2)))
)

(defun samesetp (lst1 lst2)
    (cond
        ((null lst1) (null lst2))
        ((null lst2) nil)
        ((not (equalp (length lst1) (length lst2))) nil)
        ((member (car lst1) lst2) (samesetp (cdr lst1) (remove (car lst1) lst2)))
        (t nil)
    )
)
