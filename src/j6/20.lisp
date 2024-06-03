(defun tower-of-hanoi (n)
    (transfer 'a 'b 'c n)
)

(defun move-disk (from to)
    (list (list 'MOVE 'DISK 'FROM from 'TO to))
)

(defun transfer (from to spare number)
    (cond
        ((equal number 1) (move-disk from to))
        (t (append (transfer from spare to (- number 1))
        (move-disk from to)
        (transfer spare to from (- number 1))))
    )
)
