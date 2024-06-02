(defun depth (lst)
; >(depth '(1 (2) 3)))
; 2
; >(depth '(1 2 (((3)) 4))
; 4
;use apply,max,mapcar
  (if (null lst) 0
      (1+ (apply #'max (mapcar 'depth lst)))))
