(defun palindrome (ary)
  "Make a palindrome with the given list"
  ; (palindrome '(1 2 3)) => (1 2 3 3 2 1)
  (append ary (reverse ary)))
