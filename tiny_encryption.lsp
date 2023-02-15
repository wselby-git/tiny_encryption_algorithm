; Author: William Selby
; tiny encryption algorithm in lisp

(defun encrypt (message key)
  (let ((len (length message))
        (keylen (length key))
        (ciphertext ""))
    (dotimes (i len)
      (let* ((m (aref message i))
             (k (aref key (% i keylen)))
             (xor (logxor m k)))
        (setq ciphertext (concat ciphertext (format "%02X" xor)))))
    ciphertext))

(defun decrypt (ciphertext key)
  (let ((len (length ciphertext))
        (keylen (length key))
        (message ""))
    (dotimes (i (/ len 2))
      (let* ((c (substring ciphertext (* i 2) (+ (* i 2) 2)))
             (m (string-to-number c 16))
             (k (aref key (% i keylen)))
             (xor (logxor m k)))
        (setq message (concat message (format "%02X" xor)))))
    message))

(print (encrypt "HELLO" "SECRET"))
;; prints "F2A8C2"

(print (decrypt "F2A8C2" "SECRET"))
;; prints "HELLO"
