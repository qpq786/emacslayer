;;发送选中内容到shell中并运行
(global-set-key (kbd "C-c l") 'sh-send-line-or-region-and-step)
(global-set-key (kbd "C-c j") 'sh-switch-to-process-buffer)


(evil-leader/set-key
  "gw" 'open-my-gtd-week-file ;;快捷打开文件
  "gn" 'open-my-gtd-night-file
  "gd" 'open-my-gtd-dayr-file
  "bc" 'close-and-kill-this-pane ;;关闭buffer与window
  )

