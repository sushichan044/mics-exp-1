(defun check-temperture (temp)
  (cond ((> temp 100) 'RIDICULOUSLY-HOT)
        ((< temp 0) 'RIDICULOUSLY-COLD)
        (t 'OK)))
