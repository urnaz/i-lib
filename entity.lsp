(defun ent-p (e)
  (= 'ENAME (type e))
)


(defun get-prop (p e)
  (cdr (assoc p (entget e)))
)

