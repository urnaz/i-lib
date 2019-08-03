;;; entity.lsp

;; Return T if argument is entity
(defun enamep (e)
  (= 'ENAME (type e))
)

;; Return dxf property of entity
(defun get-prop (p e)
  (cdr (assoc p (entget e)))
)

;; Modify entity by by changing its property
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

