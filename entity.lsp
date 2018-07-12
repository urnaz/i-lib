(defun ent-p (e)
  (= 'ENAME (type e))
)


(defun get-prop (p e)
  (cdr (assoc p (entget e)))
)

(defun put-prop (p e / pair)
  (setq e    (entget e)
        pair (assoc (car p) e)
  )
  (entmod
    (if pair
      (subst p pair e)
      (append e (list p))
    )
  )
)

