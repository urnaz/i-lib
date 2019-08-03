;; determines if argument is pickset
(defun picksetp (ss)
    (= 'PICKSET (type ss)))

;; Applies function f to pickset ss
(defun mapset ( ss f / lst)
   (if  (setq lst (vl-remove-if 'listp
				(mapcar 'cadr (ssnamex ss))))
	(mapcar f lst)))
