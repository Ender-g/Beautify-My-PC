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

# 简化的配置文件：支持 UTF-8 编码 + Oh My Posh（如果已安装）+ 显式指定配置路径的 Fastfetch
try {
    [Console]::InputEncoding  = [System.Text.Encoding]::UTF8
    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
    $OutputEncoding = [System.Text.UTF8Encoding]::new($false)
    chcp 65001 > $null
} catch {}

Clear-Host # 清屏

# Oh My Posh 配置（如果已安装）
if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
    oh-my-posh init pwsh  --eval --config "C:/Users/ender/.config/oh-my-posh/config.json" | Invoke-Expression
}

# 强制每次使用你自己的 Fastfetch 配置（绕过路径混乱问题）
if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
    echo "Welcome back to your terminal!!! :)"
    fastfetch -c "C:/Users/ender/.config/fastfetch/config.jsonc"
    echo "Have a nice day!"
}
