;; set username and mail address
(setq user-full-name "Timothy Chen")
(setq user-mail-address "tnachen@gmail.com")

(add-to-list 'load-path "~/.emacs.d/lisp")

;; Set transparency of emacs
(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))

(set-frame-parameter (selected-frame) 'alpha 80)

;; (load-theme 'solarized-dark)
;; not to show GNU startup
;; (setq inhibit-startup-message t)
;; show key seq fast
(setq echo-keystrokes 0.1)
;; show line number
;;(add-hook 'find-file-hook (lambda () (linum-mode 1)))

;; not asking yes or no, use y/n
(fset 'yes-or-no-p 'y-or-n-p)
;; prevent rolling page jump too much, scroll-margin 3
(setq scroll-margin 3
      scroll-conservatively 10000)
(setq scroll-step 1)

;; move 4 line
(global-set-key "\M-n"  (lambda () (interactive) (next-line   4)) )
(global-set-key "\M-p"  (lambda () (interactive) (previous-line 4)) )

;; no menu bar
;;(menu-bar-mode nil)
;; no tool bar
;;(tool-bar-mode nil)
;; no scroll bar

;;(auto-image-file-mode t);;image mode
(show-paren-mode t);;
(column-number-mode t);;
(setq mouse-yank-at-point t);; yank with middle key
(setq x-selet-enable-clipboard t);;emacs paste clip with other program
;; full screen

;;color theme
(add-to-list 'load-path "~/.emacs.d/lisp/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn (color-theme-initialize) ;;(color-theme-billw)
          (color-theme-tangotango)
          ))
;;font
(set-default-font "Monospace-10")
;;(set-frame-font "Monaco-10")

;; indent
(setq-default indent-tabs-mode nil)
(setq c-default-style "linux")
;;      c-basic-offset 4)

(require 'cc-mode)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "RET") 'newline-and-indent)

(require 'google-c-style)
(add-hook 'c++-mode-hook 'google-set-c-style)
(add-hook 'c++-mode-hook 'google-make-newline-indent)

;;python autoindent
;;(add-hook 'python-mode-hook '(lambda ()
;;							   (local-set-key (kbd "RET") 'newline-and-indent)))
;;shell-scriptmode autoindent
;;(add-hook 'sh-mode-hook '(lambda()

;;							  (local-set-key (kbd "RET") 'newline-and-indent)))
;;elisp mode autoindent
;;(add-hook 'emacs-lisp-mode-hook '(lambda()
;;							  (local-set-key (kbd "RET") 'newline-and-indent)))
;;(add-hook 'javascript-mode-hook '(lambda()
;;								   (local-set-key (kbd "RET") 'newline-and-indent)))
;;(add-hook 'html-mode-hook '(lambda()
;;		  (local-set-key (kbd "RET") 'newline-and-indent)))
;;

;;autopair
;;(require 'autopair)
;;(autopair-global-mode) ;; enable autopair in all buffers

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;bash-complete
(require 'bash-completion)
(bash-completion-setup)

;;buffer-move: swap windows
(require 'buffer-move)
(global-set-key (kbd "<M-S-up>")     'buf-move-up)
(global-set-key (kbd "<M-S-down>")   'buf-move-down)
(global-set-key (kbd "<M-S-left>")   'buf-move-left)
(global-set-key (kbd "<M-S-right>")  'buf-move-right)
;;bind window move key
(global-set-key (kbd "<S-up>") 'windmove-up)
(global-set-key (kbd "<S-down>") 'windmove-down)
(global-set-key (kbd "<S-right>") 'windmove-right)
(global-set-key (kbd "<S-left>") 'windmove-left)

(global-set-key (kbd "<M-S-i>") 'indent-region)


;;fringe background color black,
;;(custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;; )
;;(custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;; '(fringe ((((class color) (background dark)) (:background "black")))))

;;color for shell
(setq ansi-color-names-vector
      ["black" "#EF2929" "green" "#FCE94F" "#728FCF" "#AD7FA8" "#34E2E2" "white"])
;;default vector:["black" "red" "green" "yellow" "blue" "magenta" "cyan" "white"]
;;
;;ibus for chinese input
;;(require 'ibus)
;;(add-hook 'after-init-hook 'ibus-mode-on)

;; Autoindent open-*-lines
(defvar newline-and-indent t
  "Modify the behavior of the open-*-line functions to cause them to autoindent.")

(setq explicit-shell-file-name "bash")
(setq explicit-bash-args '("-ct" "export EMACS=;; stty echo;; bash"))
(setq comint-process-echoes t)

(require 'readline-complete)

;;enable hi-lock-mode
(global-hi-lock-mode 1)

;;highlight symbol
;;(add-to-list 'load-path "~/.emacs.d/lisp/highlight-symbol")
(require 'highlight-symbol)
(global-set-key [f11] 'highlight-symbol-at-point)
(global-set-key [(control f11)] 'highlight-symbol-next)
(global-set-key [(meta f11)] 'highlight-symbol-prev)

;;indent for js
(setq js-indent-level 2)

;;protobuf mode
(require 'protobuf-mode)

(defconst my-protobuf-style
  '((c-basic-offset . 2)
    (indent-tabs-mode . nil)))

(add-hook 'protobuf-mode-hook
  (lambda () (c-add-style "my-style" my-protobuf-style t)))

;; git-modes
(add-to-list 'load-path "~/.emacs.d/lisp/git-modes/")
;; magit
(add-to-list 'load-path "~/.emacs.d/lisp/magit/")
(eval-after-load 'info
  '(progn (info-initialize)
          (add-to-list 'Info-directory-list "~/.emacs.d/lisp/magit/")))
(require 'magit)

;; format whole
(load "yformat")
(require 'yformat)

;; wrapper for open recentf
(load "recentf-wrapper")
(require 'recentf-wrapper)
(global-set-key (kbd "C-x 4 C-r") 'open-recentf-in-new-window)


(when (>= emacs-major-version 24)
    (require 'package)
      (package-initialize)
        (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
          )

;; add package PPAs
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; for c++11 standard
(require 'font-lock)

(defun --copy-face (new-face face)
  "Define NEW-FACE from existing FACE."
  (copy-face face new-face)
  (eval `(defvar ,new-face nil))
  (set new-face new-face))

(--copy-face 'font-lock-label-face  ; labels, case, public, private, proteced, namespace-tags
             'font-lock-keyword-face)
(--copy-face 'font-lock-doc-markup-face ; comment markups such as Javadoc-tags
             'font-lock-doc-face)
(--copy-face 'font-lock-doc-string-face ; comment markups
             'font-lock-comment-face)

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

(add-hook 'c++-mode-hook
          '(lambda()
             (font-lock-add-keywords
              nil '(;; complete some fundamental keywords
                    ("\\<\\(void\\|unsigned\\|signed\\|char\\|short\\|bool\\|int\\|long\\|float\\|double\\)\\>" . font-lock-type-face)
                    ;; add the new C++11 keywords
                    ("\\<\\(alignof\\|alignas\\|constexpr\\|decltype\\|noexcept\\|nullptr\\|static_assert\\|thread_local\\|override\\|final\\)\\>" . font-lock-keyword-face)
                    ("\\<\\(char[0-9]+_t\\)\\>" . font-lock-keyword-face)
                    ;; PREPROCESSOR_CONSTANT
                    ("\\<[A-Z]+[A-Z_]+\\>" . font-lock-constant-face)
                    ;; hexadecimal numbers
                    ("\\<0[xX][0-9A-Fa-f]+\\>" . font-lock-constant-face)
                    ;; integer/float/scientific numbers
                    ("\\<[\\-+]*[0-9]*\\.?[0-9]+\\([ulUL]+\\|[eE][\\-+]?[0-9]+\\)?\\>" . font-lock-constant-face)
                    ;; user-types (customize!)
                    ("\\<[A-Za-z_]+[A-Za-z_0-9]*_\\(t\\|type\\|ptr\\)\\>" . font-lock-type-face)
                    ("\\<\\(xstring\\|xchar\\)\\>" . font-lock-type-face)
                    ))
             ) t)
