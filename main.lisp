(in-package :hash)

(defun main ()
  (let ((hash-32 (fnv-32a "Abdeltwab"))
	(hash-64 (fnv-64a "Abdeltwab"))
	(hash-128 (fnv-128a "Abdeltwab"))
	(hash-256 (fnv-256a "Abdeltwab"))
	(hash-512 (fnv-512a "Abdeltwab"))
	(hash-1024 (fnv-1024a "Abdeltwab")))
    (format t "FNV (32-bit): ~a~%" hash-32)
    (format t "FNV (64-bit): ~a~%" hash-64)
    (format t "FNV (128-bit): ~a~%" hash-128)
    (format t "FNV (256-bit): ~a~%" hash-256)
    (format t "FNV (512-bit): ~a~%" hash-512)
    (format t "FNV (1024-bit): ~a~%" hash-1024)))

(main)

