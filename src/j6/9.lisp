(defun palindromep (list)
  "Return t if list is a palindrome, nil otherwise."
  ; (palindromep '(a b c b a)) => t
  ; (palindromep '(a b c c b a)) => t
  ; (palindromep '(a b c d e)) => nil
  (equal list (reverse list)))
