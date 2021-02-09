(defvar *db* nil)

(defun make-cd (title artist rating ripped)
   (list :title title :artist artist :rating rating :ripped ripped))

(defun add-record (cd)(push cd *db*))

(defun dump-db()
  (dolist (cd *db*)
    (format t "~{~a:~10t~a~%~}~%" cd)))

(defun prompt-read (prompt)
  (format *query-io* "~a): " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun prompt-for-cd ()
 (add-record
  (make-cd
    (prompt-read "Title")
    (prompt-read "Artist")
    (or (parse-integer (prompt-read "Rating") :junk-allowed t) 0)
    (y-or-n-p "Ripped [y/n]:"))))

(defun save-db (filename)
  (with-open-file (out filename
  		  :direction :output
		  :if-exists :supersede)
    (with-standard-io-syntax
      (print *db* out))))

(defun load-db (filename)
  (with-open-file (in filename)
    (with-standard-io-syntax
      (setf *db* (read in)))))

(make-cd "Roses" "carly" 9 t)

(add-record (make-cd "boy" "carly" 10 t))
(add-record (make-cd "heath muscle" "carly" 7 t))
(add-record (make-cd "call me maybe" "carly" 10 t))