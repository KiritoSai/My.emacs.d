;;display time
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;;缓冲区
;;=================================
;;设定行距
;;(setq default-line-spaceing 4)
;;页宽
;;(setq default-fill-column 60)
;;缺省模式 text-mode
;;(setq default-major-mode 'text-mode)
;;设置删除记录
;;(setq kill-ring-max 200)
;;以空行结束
;;(setq require-final-newline t)
;;开启语法高亮
(global-font-lock-mode 1)
;;高亮显示区域选择
(transient-mark-mode t)

;;回显区
;;===============
;;闪屏报警
;;(setq visible-bell t)
;;使用y or n提问
;;(fset 'yes-or-no-p 'y-or-n-p)
;;锁定行高
;;(setq resize-mini-windows nil)
;;递归minibuffer
(setq enable-recursive-minibuffers t)

;;设置默认工作目录
(setq default-directory "~/ROVER5.0/")

;;eww
(setq eww-search-prefix "https://www.bing.com/search?q=")
;; (use-package eww
;;   :defer t
;;   :preface
;;   (defun helm-eww-bookmarks ()
;;     "Alternative to `eww-list-bookmarks'."
;;     (interactive)
;;     (require 'helm)
;;     (require 'eww)
;;     (helm :sources
;;           (helm-build-sync-source "EWW Bookmarks"
;;             :candidates
;;             (lambda ()
;;               (cl-loop for elt in (eww-read-bookmarks)
;;                        collect (cons (plist-get elt :title)
;;                                      (plist-get elt :url))))
;;             :action #'eww)
;;           :buffer "*Helm EWW Bookmarks*"))

;;   (defun chunyang-eww-import-bookmarks (bookmarks-html-file)
;;     "Import bookmarks from BOOKMARKS-HTML-FILE."
;;     (interactive "fBookmarks HTML File: ")

;;     ;; Check if some libraries exist
;;     (require 'eww)
;;     (unless (require 'dom nil 'no-error)
;;       (user-error "dom.el not available, it was added in Emacs 25.1"))
;;     (unless (fboundp 'libxml-parse-html-region)
;;       (user-error "`libxml-parse-html-region' not available, \
;; your Emacs doesn't have libxml2 support"))

;;     (with-temp-buffer
;;       (insert-file-contents bookmarks-html-file)
;;       (setq eww-bookmarks
;;             (loop with dom = (libxml-parse-html-region (point-min) (point-max))
;;                   for a in (dom-by-tag dom 'a)
;;                   for url = (dom-attr a 'href)
;;                   for title = (dom-text a)
;;                   for time = (current-time-string
;;                               (seconds-to-time
;;                                (string-to-number
;;                                 (dom-attr a 'add_date))))
;;                   collect (list :url url
;;                                 :title title
;;                                 :time time)))
;;       (eww-write-bookmarks)))
;;   :config
;;   ;; XXX Both Google & DuckDuckGo are currently bocked in China
;;   (setq eww-search-prefix "https://duckduckgo.com/html/?q=")
;;   ;; Eww doesn't support Javascript, but HTTPS version of Google requires it (?)
;;   ;; (setq eww-search-prefix "https://www.google.com.hk/search?q=")
;;   (setq eww-search-prefix "http://www.google.com.hk/search?q=")
;;   (setq eww-search-prefix "https://www.bing.com/search?q="))

;; (use-package shr-tag-pre-highlight
;;   :ensure t
;;   :after shr
;;   :config
;;   (add-to-list 'shr-external-rendering-functions
;;                '(pre . shr-tag-pre-highlight))

;;   (when (version< emacs-version "26")
;;     (with-eval-after-load 'eww
;;       (advice-add 'eww-display-html :around
;;                   'eww-display-html--override-shr-external-rendering-functions))))

;; (use-package shr
;;   :defer t
;;   :config
;;   ;; Don't use proportional fonts for text
;;   (setq shr-use-fonts nil))

;; (use-package shr-color
;;   :defer t
;;   :preface
;;   (defun chunyang-theme-dark-p ()
;;     "Return t if using Dark theme."
;;     ;; FIXME: Use a proper way for this
;;     (let ((theme (car custom-enabled-themes)))
;;       (and theme
;;            (or (string-match-p (rx (or "night" "eighties" "dark" "deep"))
;;                                (symbol-name theme))
;;                (string= (symbol-name theme) "wombat"))
;;            t)))
;;   :config
;;   (when (chunyang-theme-dark-p)
;;     ;; (info "(Mu4e) Displaying rich-text messages")
;;     (setq shr-color-visible-luminance-min 75)))

;; google translate
(require 'google-translate)
(require 'google-translate-default-ui)
;;If google-translate-enable-ido-completion is non-NIL, the input will be read with ido-style completion.
(setq-default google-translate-enable-ido-completion t)
(global-set-key "\C-ct" 'google-translate-at-point)
(global-set-key "\C-cT" 'google-translate-query-translate)

(setq-default google-translate-default-source-language "en")
(setq-default google-translate-default-target-language "zh-CN")

;;youdao-dictionary
;; Enable Cache
(setq url-automatic-caching t)
;; Example Key binding
(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point)

;; Integrate with popwin-el (https://github.com/m2ym/popwin-el)
;; (push "*Youdao Dictionary*" popwin:special-display-config)

;; Set file path for saving search history
;; (setq youdao-dictionary-search-history-file "~/.emacs.d/.youdao")

;; Enable Chinese word segmentation support (支持中文分词)
;; (setq youdao-dictionary-use-chinese-word-segmentation t)

;; window numbering: M-0..9 jump to the window
(require 'window-numbering)
(window-numbering-mode 1)

;;
(when (fboundp 'winner-mode)
  (winner-mode 1))
;; copied from http://puntoblogspot.blogspot.com/2011/05/undo-layouts-in-emacs.html
(global-set-key (kbd "C-x 4 u") 'winner-undo)
(global-set-key (kbd "C-x 4 r") 'winner-redo)

;;以root权限修改文件
(defun sudo-edit-current-file ()
  (interactive)
  (when (buffer-file-name)
    (let ((old-point (point)))
      (find-file (concat "/sudo:root@localhost:" (buffer-file-name)))
      (goto-char old-point))))
