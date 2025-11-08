# fish/zsh 级智能预测
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource HistoryAndPlugin   # 历史+插件
Set-PSReadLineOption -PredictionViewStyle ListView        # 下拉列表式
Set-PSReadLineOption -EditMode Emacs                      # 习惯键位
Set-PSReadLineOption -HistorySearchCursorMovesToEnd       # 搜索后光标放末尾

# 常用键位
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete  # Tab 弹出候选
Set-PSReadLineKeyHandler -Key UpArrow   -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
