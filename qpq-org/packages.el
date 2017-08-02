;;; packages.el --- qpq-org layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: qpq <qpq@qpq-pc>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `qpq-org-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `qpq-org/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `qpq-org/pre-init-PACKAGE' and/or
;;   `qpq-org/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst qpq-org-packages
      '(
        cdlatex
        ))

(defun qpq-org/init-cdlatex()
  (use-package cdlatex)
  (add-to-list 'load-path "/Users/pcs-pc/.emacs.d/private/local/orgjulia/ob-julia.el"))

(with-eval-after-load  'org
  ;;org 折行
  (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

  ;;代码块高亮
  (setq org-confirm-babel-evaluate nil
        org-src-fontify-natively t
        org-src-tab-acts-natively t)

  ;;org自动缩进
  (setq org-startup-indented t)

  ;; 代码块代码直接执行
  (setq org-confirm-babel-evaluate nil)

  ;;设定org-gtd
  (setq org-agenda-dir "~/ownCloud/emacs")
  (setq org-agenda-file-gtd (expand-file-name "orgs/gtd-today.org" org-agenda-dir))
  (setq org-agenda-file-emacs (expand-file-name "orgs/emacs-learning.org" org-agenda-dir))
  (setq org-agenda-file-journal-QW (expand-file-name "journal/quantum_walk.org" org-agenda-dir))
  (setq org-agenda-file-dayreport (expand-file-name "orgs/day-report.org" org-agenda-dir))
  (setq org-agenda-file-daylifereport (expand-file-name "orgs/day-life-report.org" org-agenda-dir))
  (setq org-capture-templates
        '(("t" "Todo-today" entry (file+headline org-agenda-file-gtd "Today")
           "* TODO thinking, solving and finding the key problem in%?\nkey task: \nkey problem:\n  %i\n"
           :empty-lines 1)
          ("r" "Report")
          ("rd" "Day-report" entry (file+headline org-agenda-file-dayreport "Day Report")
           "* %?\n** 计划\n1. \n** 时间\n|上午|||\n|下午|||\n|有效时间||\n** 完成与否？\n\n** 轻松／吃力？\n\n** 调整／改进\n\n** 奖惩"
           :empty-lines 1)
          ("rw" "week-report" entry (file+headline org-agenda-file-dayreport "Day Report")
           "* %?月 周\n** 时间\n|有效时间||\n|平均有效时间||\n** 周目标完成与否？\n\n** 轻松／吃力？\n\n** 调整／改进\n\n** 奖惩"
           :empty-lines 1)
          ("lr" "Day-life-report" entry (file+headline org-agenda-file-daylifereport "Life Report")
           "* %?\n** 食物\n上午： \n中午： \n下午： \n** 饮水\n\n** 工作状态与心情\n\n** 改进\n"
           :empty-lines 1)
          ("e" "emacs-learing" entry (file+headline org-agenda-file-emacs "Emacs")
           "* TODO %?\n  %i\n"
           :empty-lines 1)
          ("j" "journal")
          ("jw" "journal-quantum_walk" entry (file+headline org-agenda-file-journal-QW "Quantum walk")
           "* %?\n** Basic\n*** author: \n*** Infor: \n*** link\n** Background: \n** Object: \n** Result: "
           :empty-lines 1)))

  ;;关闭org图像原始尺寸显示
  (setq org-image-actual-width '(300))

  ;;配置进入capture以后，直接进入输入模式
  (add-hook 'org-capture-mode-hook 'evil-insert-state)

  ;;配置在org中使用latex的快捷输入方式
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex)

  ;;设定todo事项的完成相关关键字
  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "PARTIAL(p)" "|" "DONE(d)")
                (sequence "KEY(k)" "|" "COMPLETE(c)"))))

  ;;设定关键字字体颜色等
  (setq org-todo-keyword-faces
        '(("KEY" . "orange") ("PARTIAL" . "SpringGreen2")))

  ;;添加Done删除线
  (setq org-fontify-done-headline t)
  (custom-set-faces
   '(org-done ((t (:foreground "PaleGreen"))))
   '(org-headline-done
     ((((class color) (min-colors 16) (background dark))
       (:foreground "#b58900" :strike-through t)))))

  ;;Switch entry to DONE when all subentries are done, to TODO otherwise.
  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise."
    (let (org-log-done org-log-states)   ; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
  (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

  )
