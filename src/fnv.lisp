(defpackage lisp-hashpalooza/fnv
  (:use :cl)
  (:export :fnv-32a
	   :fnv-64a
	   :fnv-128a
	   :fnv-256a
	   :fnv-512a
	   :fnv-1024a))
(in-package :lisp-hashpalooza/fnv)

;; Source: http://www.isthe.com/chongo/tech/comp/fnv/index.html

(defconstant +prime-32+ 16777619)
(defconstant +offset-32+ 2166136261)
(defconstant +mod-32+ (ash 1 32))

(defconstant +prime-64+ 1099511628211)
(defconstant +offset-64+ 14695981039346656037)
(defconstant +mod-64+ (ash 1 64))

(defconstant +prime-128+ 309485009821345068724781371)
(defconstant +offset-128+ 144066263297769815596495629667062367629)
(defconstant +mod-128+ (ash 1 128))

(defconstant +prime-256+ 374144419156711147060143317175368453031918731002211)
(defconstant +offset-256+ 100029257958052580907070968620625704837092796014241193945225284501741471925557)
(defconstant +mod-256+ (ash 1 256))

(defconstant +prime-512+ 35835915874844867368919076489095108449946327955754392558399825615420669938882575126094039892345713852759)
(defconstant +offset-512+ 9659303129496669498009435400716310466090418745672637896108374329434462657994582932197716438449813051892206539805784495328239340083876191928701583869517785)
(defconstant +mod-512+ (ash 1 512))

(defconstant +prime-1024+ 5016456510113118655434598811035278955030765345404790744303017523831112055108147451509157692220295382716162651878526895249385292291816524375083746691371804094271873160484737966720260389217684476157468082573)
(defconstant +offset-1024+ 14197795064947621068722070641403218320880622795441933960878474914617582723252296732303717722150864096521202355549365628174669108571814760471015076148029755969804077320157692458563003215304957150157403644460363550505412711285966361610267868082893823963790439336411086884584107735010676915)
(defconstant +mod-1024+ (ash 1 1024))

(defun fnv-hash (offset prime mod bytes)
  "Compute FNV hash for given OFFSET, PRIME, MOD, and BYTES."
  (let ((hash offset))
    (loop for b across bytes do
      (setf hash (mod (* (logxor hash (char-code b)) prime) mod)))
    hash))

(defun fnv-32a (bytes)
  "Compute 32-bit FNV-1a hash."
  (fnv-hash +offset-32+ +prime-32+ +mod-32+ bytes))

(defun fnv-64a (bytes)
  "Compute 64-bit FNV-1a hash."
  (fnv-hash +offset-64+ +prime-64+ +mod-64+ bytes))

(defun fnv-128a (bytes)
  "Compute 128-bit FNV-1a hash."
  (fnv-hash +offset-128+ +prime-128+ +mod-128+ bytes))

(defun fnv-256a (bytes)
  "Compute 256-bit FNV-1a hash."
  (fnv-hash +offset-256+ +prime-256+ +mod-256+ bytes))

(defun fnv-512a (bytes)
  "Compute 512-bit FNV-1a hash."
  (fnv-hash +offset-512+ +prime-512+ +mod-512+ bytes))

(defun fnv-1024a (bytes)
  "Compute 1024-bit FNV-1a hash."
  (fnv-hash +offset-1024+ +prime-1024+ +mod-1024+ bytes))
