(defun check-temperture (temp)
  "Check the temperature and return a symbol indicating the temperature range."
  ; (check-temperture 100) => OK
  ; (check-temperture 101) => RIDICULOUSLY-HOT
  ; (check-temperture -1) => RIDICULOUSLY-COLD
  ; (check-temperture 0) => OK
  ; (check-temperture 50) => OK
  (cond ((> temp 100) 'RIDICULOUSLY-HOT)
        ((< temp 0) 'RIDICULOUSLY-COLD)
        (t 'OK)))
