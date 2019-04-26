;;=====================
;;gdb-UI configure
;;=====================
(setq gdb-many-windows t)
;;(load-library "multi-gud.el")
;;(load-library "multi-gdb-ui.el")

;;折叠和打开整个buffer的所有代码
;(define-key semantic-tag-folding-mode-map (kbd "C--") 'semantic-tag-folding-dold-all)
;(define-key semantic-tag-folding-mode-map (kbd "C-=") 'semantic-tag-folding-show-all)
;;折叠和打开整个buffer的所有代码
;(define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-dold-block)
;(define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-block)


;;clang-format can be triggered using C-c C-f
;; Create clang-format file using google style
;; clang-format -style=google -dump-config > clang-format
(require 'clang-format)
(global-set-key (kbd "C-c C-f") 'clang-format-region)
;;ggtags
;;==================
(require 'ggtags)
;;c,c++,java mode setting
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
	      (ggtags-mode 1))))
(provide 'init-ggtags)


;;ecb configure
;;===================
;(require 'ecb)
;;开启ecb用,M-x:ecb-activate
;(require 'ecb-autoloads)
;;自动启动ecb病不显示每日提示
;(setq ecb-auto-activate t)
;;(setq ecb-tip-of-the-day nil)

;;自动补全
;;YASnippet configure
;;========================
;;(require 'yasnippet)         ;;not yasnoppet-bundle
;;(yas/initialize)
;;(yas/load-directory "~/install/yasnippet-0.6.1c/snippets")
;;配置semantic 搜索范围
;(setq semanticdb-project-roots)
;(list
; (expand-file-name "/")))
;;自动以补全命令,如果单词在中间就补全,否则就tab
;(defun my-indent-or-complete()
;(interactive)
;(if (looking-at "\\>")
;    (hippie-expand nil)
;  (indent-for-tab-command))
;)
;;补全快捷键,ctrl+tab用senator补全,不显示列表
;;alt+/补全,显示列表让选择
;; (global-set-key [(control tab)] 'my-indent-or-complete)
;; (define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)
;; (autoload 'senator-tyr-expand-semantic "senator")
;; (setq hippie-expand-try-functions-list
;; '(
;;   senator-try-expand-semantic
;;   try-expand-dabbrev
;;   try-expand-dabbrev-visible
;;   try-expand-dabbrev-all-buffers
;;   try-expand-dabbrev-from-kill
;;   try-expand-list
;;   try-expand-list-all-buffers
;;   try-expand-line
;;   try-expand-line-all-buffers
;;   try-complete-file-name-partially
;;   try-complete-file-name
;;   try-expand-whole-kill
;;   )
;; )

;; ;;speedbar快捷键
;; (global-set-key [(f4)] 'speedbar-get-focus)
;; ;;显示/隐藏菜单栏
;; (global-set-key [f5] 'tool-bar-mode)
;; (global-set-key [C-f5] 'menu-bar-mode)
;; (global-set-key [f6] 'gdb)
;; ;;新开一个shell的buffer,用来运行程序
;; (defun open-eshell-other-buffer()
;; "Open eshell in other buffer"
;; (interactive)
;; (split-window-vertically)
;; (eshell)
;; )
;; (defun my-eshell-clear-buffer()
;; "Eshell clear buffer"
;; (interactive)
;; (let ((eshell-buffer-maximum-lines 0))
;;   (eshell-truncate-buffer)))
;; (global-set-key [(f8)] 'open-eshell-other-buffer)
;; (global-set-key [C-f8] 'eshell)
;; (global-set-key [S-f8] 'my-eshell-clear-buffer)
;; ;;设置C-f12快速查看日程安排
;; ;;f12调到函数定义
;; (global-set-key [f12] 'semantic-ia-fast-jump)
;; (global-set-key [C-f12] 'list-bookmarks)
;; ;;shift-f12跳回去
;; (global-set-key [S-f12])

;; ;;=======ecb的配置===========
;; ;;为了ecb窗口的切换
;; (global-set-key [M-left] 'windmove-left)
;; (global-set-key [M-right] 'windmove-right)
;; (global-set-key [M-up] 'windmove-up)
;; (global-set-key [M-down] 'windmove-down)
;; ;;隐藏和显示ecb窗口
;; (global-set-key [f11] 'ecb-hide-ecb-windows)
;; (global-set-key [S-f11] 'ecb-show-ecb-windows)



;;;;================================================= < for ycmd start >

;;;; To use ycmd-mode in all supported modes
(require 'ycmd)
(add-hook 'after-init-hook #'global-ycmd-mode)

;;;; Specify only support c/c++ mode
;;(require 'ycmd)
;;(add-hook 'c++-mode-hook 'company-mode)
;;(add-hook 'c++-mode-hook 'ycmd-mode)

;;;; Specify how to run the server
(set-variable 'ycmd-server-command '("/usr/bin/python3" "/home/uisee/ycmd/ycmd"))
;;(set-variable 'ycmd-server-command '("/usr/bin/python" "~/ycmd/ycmd")) ;; Cannot use ~, should use abspath

;;;; Specify a global emacs configuration
(set-variable 'ycmd-global-config "/home/uisee/ycmd/examples/.ycm_extra_conf.py")
;;(set-variable 'ycmd-global-config "~/ycmd/examples/.ycm_extra_conf.py") ;; Cannot use ~, should use abspath

;;;; Completion framework
(require 'company-ycmd)
(company-ycmd-setup)
(add-hook 'after-init-hook #'global-company-mode)  

;;;; Enable flycheck
(require 'flycheck-ycmd)
(flycheck-ycmd-setup)
(add-hook 'after-init-hook #'global-flycheck-mode)  

;;;; Set always complete immediately
(setq company-idle-delay 0)


;;;;================================================== < for ycmd end >


;;语法高亮
(require 'modern-cpp-font-lock)
(modern-c++-font-lock-global-mode t)

;;括号匹配高亮
(require 'highlight-parentheses)
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

;;======================            google-c-style        ===========
(require 'google-c-style)
(load-file "~/.emacs.d/elpa/google-c-style-20180130.1736/google-c-style.el")
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
;;----------------------        END    google-c-style        ---------


;;内置的智能自动补全括号
(require 'electric)
(electric-pair-mode t)
(electric-layout-mode t)

;;cycode.el ends here
