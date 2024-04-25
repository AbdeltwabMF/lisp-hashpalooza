;; Source: http://www.isthe.com/chongo/tech/comp/fnv/index.html

(defconstant +prime-32+ #x01000193)
(defconstant +offset-32+ #x811c9dc5)

(defconstant +prime-64+ #x00000100000001B3)
(defconstant +offset-64+ #xcbf29ce484222325)

(defconstant +prime-128+ #x0000000001000000000000000000013B)
(defconstant +offset-128+ #x6c62272e07bb014262b821756295c58d)

(defconstant +prime-256+ #x0000000000000000000001000000000000000000000000000000000000000163)
(defconstant +offset-256+ #xdd268dbcaac550362d98c384c4e576ccc8b1536847b6bbb31023b4c8caee0535)

(defun fnv-32a (bytes)
  (let ((hash +offset-32+))
    (declare (type (unsigned-byte 32) hash))
    (loop for b across bytes do
    	 (setf hash (mod (* (logxor hash (char-code b)) +prime-32+) (ash 1 32))))
    hash))

(defun fnv-64a (bytes)
  (let ((hash +offset-64+))
    (declare (type (unsigned-byte 64) hash))
    (loop for b across bytes do
    	 (setf hash (mod (* (logxor hash (char-code b)) +prime-64+) (ash 1 64))))
    hash))


(defun fnv-128a (bytes)
  (let ((hash +offset-128+))
    (declare (type (unsigned-byte 128) hash))
    (loop for b across bytes do
    	 (setf hash (mod (* (logxor hash (char-code b)) +prime-128+) (ash 1 128))))
    hash))


(defun fnv-256a (bytes)
  (let ((hash +offset-256+))
    (declare (type (unsigned-byte 256) hash))
    (loop for b across bytes do
    	 (setf hash (mod (* (logxor hash (char-code b)) +prime-256+) (ash 1 256))))
    hash))


(fnv-32a "Abdeltwab")
(fnv-64a "Abdeltwab")
(fnv-128a "Abdeltwab")
(fnv-256a "Abdeltwab")
