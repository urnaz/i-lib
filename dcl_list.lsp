;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  dcl_lst.lsp                                                             ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun dcl_init_list (tile initval lst)
;;; Функция заполнения списка
  (start_list tile)
  (mapcar 'add_list lst)
  (end_list)
  (set_tile tile initval))


(defun dcl_substitute (n i lst)
;;; Заменяет элемент в списке в заданной позиции
;;; (dcl_substitute 2 2 '(0 1 5 3 4 5 6))
  (if (zerop i)
    (cons n (cdr lst)) 
    (cons (car lst) (dcl_substitute n (1- i) (cdr lst)))))

(defun dcl_drop (v w)
;;; Удаляет элементы из списка по списку порядковых номеров
;;; (dcl_drop '(1 2 4) '(0 1 2 3 4 5 6))
  (cond
    ((or (null v) (null w)) w)
    ((zerop (car v)) (dcl_drop (mapcar '1- (cdr v)) (cdr w)))
    ((cons (car w) (dcl_drop (mapcar '1- v) (cdr w))))))


(defun dcl_push (u v w)
;;; Удаляет элементы из списка по списку порядковых номеров
;;; (dcl_push '(0 2 4) '(10 11 12 13 14 15 16) '(0 1 2 3 4 5 6))
  (cond
    ((or (null u) (null v) (null w)) w)
    ((zerop (car u)) (cons (car v) (dcl_push (cdr (mapcar '1- u)) (cdr v) (cdr w))))
    ((cons (car w) (dcl_push (mapcar '1- u) (cdr v)  (cdr w))))))


(defun dcl_split (s / i)
;;; преобразовывает строку в список индексов
;;; (dcl_split "10 12 13")
      (cons (read s)
	    (if (setq i (vl-string-search " " s))
	        (dcl_split (substr s (+ 2 i))))))