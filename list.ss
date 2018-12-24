;;
;; List utilities
;; Edwin Watkeys, edw@poseur.com
;;

(import (only-in :std/srfi/1 reverse!))

(export #t)

(def (chunk n col)
  (let lp ((col col) (even '()) (out '()) (i 0))
    (cond ((null? col) (reverse! out))
          ((= (remainder (1+ i) n) 0)
           (lp (cdr col)
               '()
               (cons (reverse! (cons (car col) even)) out)
               (1+ i)))
          (else
           (lp (cdr col)
               (cons (car col) even)
               out
               (1+ i))))))
