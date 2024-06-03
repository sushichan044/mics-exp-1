(defun factorial (int)
    "Return the factorial of the first element of the list."
    ; (factorial 5) => 120
    ; (factorial 1) => 1
    ; (factorial 0) => 1
    (if (or (not (integerp int)) (< int 0))
        (error "factorial: argument must be a non-negative integer"))
    (prog (result counter)
        (setq result 1)
        (setq counter int)
        loop
        (if (zerop counter)
            (return result)); return from prog
        (setq result (* result counter))
        (setq counter (1- counter))
        (go loop)
    )
)
