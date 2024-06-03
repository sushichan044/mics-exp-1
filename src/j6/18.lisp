(defun depth (lst)
    "Return the depth of the deepest nested list in LST."
    ;(depth '(1 (2) 3))) => 2
    ;(depth '(1 2 (((3)) 4)) => 4
  (if (atom lst)
      0
      (1+ (apply #'max (mapcar #'depth lst)))))
