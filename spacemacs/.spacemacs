;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
 values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     (markdown-command :variables markdown-live-preview-engine 'vmd)
     typescript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t)
     ;; better-defaults
     themes-megapack
     emacs-lisp
     markdown
     html
     ;; react
     colors
     javascript
     markdown
     syntax-checking
     eyebrowse
     ;;evil-snipe
     git
     ;; markdown
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     spell-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      f
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(monokai
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Roboto Mono Light for Powerline"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.3)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
  This function is called at the very end of Spacemacs initialization after
  layers configuration.
  This is the place where most of your configurations should be done. Unless it is
  explicitly specified that a variable should be set before a package is loaded,
  you should place your code here."

  ;;-----------------------------------------------
  ;; react related settings:
  ;;--------------------------------------{{{{{{{{{

  ;;switch to web-mode when opening a file with .js extension
  ;; (add-to-list 'auto-mode-alist '("\\.js\\'" . react-mode))

  ;; optional checker for flowtype
  ;; Flow (JS) flycheck config (http://flowtype.org)
  ;; from https://github.com/bodil/emacs.d/blob/master/bodil/bodil-js.el
  ;; this will enable javascript-flow with eslint for flycheck
  ;; (require 'f)
  ;; (require 'json)
  ;; (require 'flycheck)

  ;; (defun flycheck-parse-flow (output checker buffer)
  ;;   (let ((json-array-type 'list))
  ;;     (let ((o (json-read-from-string output)))
  ;;       (mapcar #'(lambda (errp)
  ;;                   (let ((err (cadr (assoc 'message errp))))
  ;;                     (flycheck-error-new
  ;;                     :line (cdr (assoc 'line err))
  ;;                     :column (cdr (assoc 'start err))
  ;;                     :level 'error
  ;;                     :message (cdr (assoc 'descr err))
  ;;                     :filename (f-relative
  ;;                                 (cdr (assoc 'path err))
  ;;                                 (f-dirname (file-truename
  ;;                                             (buffer-file-name))))
  ;;                     :buffer buffer
  ;;                     :checker checker)))
  ;;               (cdr (assoc 'errors o))))))

  ;; (flycheck-define-checker javascript-flow
  ;;   "Javascript type checking using Flow Type."
  ;;   :command ("flow" "--json" source-original)
  ;;   :error-parser flycheck-parse-flow
  ;;   :modes react-mode
  ;;   ;; :modes web-mode
  ;;   :next-checkers ((error . javascript-eslint))
  ;;   )

  ;; (add-to-list 'flycheck-checkers 'javascript-flow)
  ;; since we are using flycheck with eslint and flow to check syntax
  ;; and js2 has problem with flowtypw
  ;; we need to remove the js2-minor-mode hook setted in the react layer
  ;; since we should do it here since updating layer will reenable js2-minor-mode in react layer
  ;; putting it here just in case
  ;; (remove-hook 'react-mode-hook 'js2-minor-mode)

  ;;}}}}}}}}}}}}}}}}}}}}}---------- react related settings end here

  ;; Emacs server for editing input on chrome:
  (add-to-list 'load-path "~/config/spacemacs/others")
  (require 'edit-server)
  (edit-server-start)

  ;; just in case js2-minor-mode tries to check the js, I want to only flycheck
  ;; with eslint
  (remove-hook 'javascript-mode-hook 'js2-minor-mode)

  (setq-default
   ;; js2-mode
   js2-basic-offset 2
   js-indent-level 2
   ;; typescript
   typescript-indent-level 2
   ;; web-mode
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2
   )

  (with-eval-after-load 'web-mode
    (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))


  ;; to do: put color on css

  ;; Set escape keybinding to "jk"
  ;; (setq-default evil-escape-key-sequence "jk")

  ;; how to define function in lisp
  ;; (defun name (param1 param2, param3, etc...) (interactive) (command/function arg))
  ;; what is (interactive)
  ;; using a function as argument/callback:  'funtName
  ;; make sure to use the '
  ;;calling lisp functions: (functName arg1 arg2 arg3...)

  ;;<<fake smooth scroll half page up/down>>
  (defvar scrollLineAmount 6) ;;how many lines to move each time the evil-scroll-up/down is call
  (defvar scrollRepetAmount 7) ;; how many times of evil-scoll-up/down to call. Together with the native lips function: (redisplay) we will be able to scroll stop and display and scroll again, thereby creating a fake sense of 'smooth' scroll
  (defun scrollDown ()
    (interactive)
    (dotimes (n scrollRepetAmount) ;; (dotimes (variableName howManyTimeToLoop) (code here and varibaleName is accessible here))
      (evil-scroll-up scrollLineAmount)
      (redisplay) )
    )
  (defun scrollUp ()
    (interactive)
    (dotimes (n scrollRepetAmount)
      (evil-scroll-down scrollLineAmount)
      (redisplay) )
    )

  (global-set-key (kbd "s-k") 'scrollDown)
  (global-set-key (kbd "s-j") 'scrollUp)

  ;; go forward in cursor history
  ;; (global-set-key (kbd "c-i") 'evil-jump-forward)

  ;;<<window related settings>>
  ;; closing a window qicker and more intuitive like closing tap on browser
  (global-set-key (kbd "s-w") (lambda () (interactive) (delete-window)))

  ;;resizing window horizontally
  (defvar windowWidth 10) ;;how many columns to move left or right
  (global-set-key (kbd "s-=") (lambda () (interactive) (evil-window-increase-width windowWidth)))
  (global-set-key (kbd "s--") (lambda () (interactive) (evil-window-decrease-width windowWidth)))

  ;;previous or next buffer:
  (global-set-key (kbd "s-[") (lambda () (interactive) (previous-buffer)))
  (global-set-key (kbd "s-]") (lambda () (interactive) (next-buffer)))
  ; Show line numbers
  (global-linum-mode)

  ;; code length related
  (require 'whitespace)
  (setq whitespace-line-column 80) ;; limit line length
  (setq whitespace-style '(face lines-tail))
  (add-hook 'prog-mode-hook 'whitespace-mode)
  ;; if want to make it global
  ;;(global-whitespace-mode +1)

  ;; Show 80-column marker
  ;;(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
  ;;(setq fci-rule-color "sky blue")
  ;; (setq fci-rule-color "black")
  ;;(global-fci-mode 1)

  ;; <<avy jump>>
  ;;avy jump straigh to any part of word instead of only jumpping to the beginning of word
  ;;(spacemacs/set-leader-keys "a j" 'avy-goto-char-2)
  ;;(global-set-key "a j" 'avy-goto-char-2)
  (spacemacs/set-leader-keys "o" 'avy-goto-char-2)

  ;;<<better moving large chunk of text up and down:>>
  ;; usage: be sure in visually selecte mode then shift-j or k to move up or down
  ;; this will move entire line even if line is not even completely selected
  (define-key evil-visual-state-map "J"
    (concat ":m '>+1" (kbd "RET") "gv=gv"))
  (define-key evil-visual-state-map "K"
    (concat ":m '<-2" (kbd "RET") "gv=gv"))

  ;; (define-key evil-normal-state-map "o" (lambda() (interactive) (evil-insert-newline-below)))
  ;; (define-key evil-normal-state-map "O" (lambda() (interactive) (evil-insert-newline-above)))
  ;;<<the follwing lines set eslint to use local eslint>>
  (defun my/use-eslint-from-node-modules ()
    (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                  "node_modules"))
           (eslint (and root
                        (expand-file-name "node_modules/eslint/bin/eslint.js"
                                          root))))
      (when (and eslint (file-executable-p eslint))
        (setq-local flycheck-javascript-eslint-executable eslint))))

  (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules))
  ;; local eslint setup done here
(setq-default create-lockfiles nil)

;;opening new window like opening new tag on browser and moving cursor over to new window
(global-set-key (kbd "s-n") (lambda ()
                              (interactive)
                              (split-window-right-and-focus)))

;; if there is a path under the cursor:
;;   and if the path points to one specific file, this will open that file in new window
;;   but if the path points to a directory, this will open a new window and a dialog for you to choose which file in that path to open in the new window
;; if there is no path under the cursor, then this will open a new window and ask which file in the same directory as current file to open.
(global-set-key (kbd "s-t") (lambda ()
                              (interactive)
                              (split-window-right-and-focus)
                              (projectile-find-file-dwim)
                              ))

;;for the color layer
(setq-default dotspacemacs-configuration-layers '(
  (colors :variables colors-enable-rainbow-identifiers t)))



;; -------------------------------------------------------------------
;; danger
;; DANGER!!!!
;; DO NOT DELETE ANYTHING BELOW
;; -------------------------------------------------------------------
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (org-plus-contrib flycheck diminish smartparens magit magit-popup git-commit with-editor evil yasnippet projectile helm helm-core async markdown-mode js2-mode dash s vmd-mode web-completion-data dash-functional tern company auto-complete tide typescript-mode zonokai-theme zenburn-theme zen-and-art-theme ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode seti-theme scss-mode sass-mode reverse-theme restart-emacs rainbow-mode rainbow-identifiers rainbow-delimiters railscasts-theme purple-haze-theme pug-mode professional-theme popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pastels-on-dark-theme paradox orgit organic-green-theme org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum livid-mode linum-relative link-hint light-soap-theme less-css-mode json-mode js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme inkpot-theme info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md gandalf-theme fuzzy flyspell-correct-helm flycheck-pos-tip flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu espresso-theme emmet-mode elisp-slime-nav dumb-jump dracula-theme django-theme define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme company-web company-tern company-statistics column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-identifiers-mode coffee-mode clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
