;; Source: http://www.isthe.com/chongo/tech/comp/fnv/index.html

(defconstant +prime-64+ #x00000100000001B3)
(defconstant +offset-64+ #xcbf29ce484222325)

(defconstant +prime-32+ #x01000193)
(defconstant +offset-32+ #x811c9dc5)

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

(fnv-32a "Abdeltwab")
(fnv-64a "Abdeltwab")
