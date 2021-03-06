;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

;(add-to-list 'package-archives
;       '("melpa" . "http://melpa.org/packages/") t)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize) ;; You might already have this line

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    elpy
    ein
    magit
    flycheck
    leetcode
    projectile
    py-autopep8
    ycmd
    window-numbering
    youdao-dictionary
    google-translate
    google-c-style
    ggtags
    highlight-parentheses
    flycheck-ycmd
    company-ycmd
    magit
    modern-cpp-font-lock
    w3m
    clang-format
    nov
    spinner
    graphql
    material-theme))



(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------
(elpy-enable)
(setq load-prefer-newer t)
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")
(setq elpy-rpc-backend "jedi")

;;窗口最大化
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
;;permanently enable syntax checking with flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;;flycheck c++11
(require 'flycheck)
(flycheck-mode)
(add-hook 'c++-mode-hook
	  (lambda() (setq flycheck-clang-language-standard "c++11")))
;;
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally

;;MAGIT
(global-set-key (kbd "C-x g") 'magit-status)


;;set keys for Apple keyboard, for emacs in OSX
;(setq mac-command-modifier "mata")
;(setq mac-option-modifier "super")
(when (eq system-type 'darwin) ;; mac specific settings
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
;(global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
)

;; (when (eq system-type 'gnu/linux)
;;   (setq x-super-keysym 'meta)
;;   (setq x-option-keysym 'super)
;;   )





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-rpc-python-command "python3")
 '(package-selected-packages
   (quote
    (window-numbering youdao-dictionary google-translate nov spinner graphql ## w3m projectile google-c-style highlight-parentheses flycheck-ycmd company-ycmd magit material-theme better-defaults)))
 '(python-shell-interpreter "python3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;;add emacs search path
(add-to-list 'load-path "~/.emacs.d/whaoran")
(add-to-list 'load-path "~/.emacs.d/leetcode.el")
;;load el
(load "base.el")
;(load "cyexpand.el")
;(load "cykbd.el")
;(load "addon.el")

;;config for c/c++ code
(load "cycode.el")
(load "leetcode.el")

;;epub reader
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

;;clang-format
(require 'clang-format)
(global-set-key (kbd "C-c i") 'clang-format-region)
(global-set-key (kbd "C-c u") 'clang-format-buffer)

(setq clang-format-style-option "file")

;;font
;(global-set-key [C-kp-add] 'text-scale-increase)
					;(global-set-key [C-kp-subtract] 'text-scale-decrease)
(set-face-attribute 'default nil :height 200)
;; init.el ends here
