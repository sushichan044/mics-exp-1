(defun fetch (atm alst)
    "Fetch the value of atm from the association list alst."
    ;(setq chart '((temperature 100) (pressure (120 60)) (pulse 72)))
    ;(fetch 'temperature chart) => 100
    ;(fetch 'pressure chart) => (120 60)
    ;(fetch 'pulse chart) => 72
    ;(fetch 'complains chart) => ?
    (setq res (cadr (assoc atm alst))) ; cadr is used to get the value of atm
    (if (null res)
        (setq res '?)) ; if atm is not found in alst, return ?
    res
)
