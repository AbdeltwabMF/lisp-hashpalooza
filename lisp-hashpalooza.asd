(defsystem "lisp-hashpalooza"
  :version "0.1.0"
  :author "Abd El-Twab M. Fakhry"
  :license "GPLv3"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "fnv"))))
  :description "Diverse array of non-cryptographic hash functions in Common Lisp"
  :in-order-to ((test-op (test-op "lisp-hashpalooza/tests"))))

(defsystem "lisp-hashpalooza/tests"
  :depends-on ("lisp-hashpalooza"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "fnv"))))
  :perform (test-op (op c) (symbol-call :rove :run c)))
