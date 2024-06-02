(defun rotate-1 (ary)
    "Rotate the array by 1 element to the left"
    ; (rotate-1 '(1 2 3 4)) => (2 3 4 1)
    (append (rest ary) (list(car ary))))
