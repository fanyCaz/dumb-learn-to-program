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

(defun select (selector-fn)
 (remove-if-not selector-fn *db*))

(defun artist-selector (artist)
 #'(lambda (cd) (equal (getf cd :artist) artist)))

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

(defun filter-by-artist (artist)
 (remove-if-not
  #'(lambda (cd) (equal (getf cd :artist) artist )) *db*))

(defun where (&key title artist rating (ripped nil ripped-p))
   #'(lambda (cd)
    (and
      (if title (equal (getf cd :title) title) t)
      (if artist (equal (getf cd :artist) artist) t)
      (if rating (equal (getf cd :rating) rating) t)
      (if ripped-p (equal (getf cd :ripped) ripped) t))))

(defun update (selector-fn &key title artist rating (ripped nil ripped-p))
  (setf *db*
    (mapcar
    #'(lambda (row)
      (when (funcall selector-fn row)
       (if title (setf (getf row :title) title))
       (if artist (setf (getf row :artist) artist))
       (if rating (setf (getf row :rating) rating))
       (if ripped-p (setf (getf row :ripped) ripped)))
      row) *db*)))

(defun make-comparison-expr (field value)
 (list 'equal (list 'geft 'cd field) value))

(defun delete-rows (selector-fn)
 (setf *db* (remove-if selector-fn *db*)))

(make-cd "Roses" "carly" 9 t)