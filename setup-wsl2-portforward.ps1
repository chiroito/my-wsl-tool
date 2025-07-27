### 実行方法
# powershell -ExecutionPolicy Bypass -File "D:\script\setup-wsl2-portforward.ps1"

### 設定可能項目
# 固定するWindows側の待ち受けポート
$windowsPort = 20022

$windowsHostname = "*"

# WSLの名前
$wslName = "ubuntu-24.04-wsl2"

# WSLが公開しているポート
$wslPort = 22


### 以下は変更しないこと

# WSLのIPアドレス取得
$wslHostname = wsl -d $wslName hostname -I | ForEach-Object { $_.Split(" ")[0] }

# 前回設定したポートフォワードの設定を削除
netsh interface portproxy delete v4tov4 listenport=$windowsPort listenaddres=$windowsHostname protocol=tcp

# 新しいポートフォワードを追加
netsh interface portproxy add v4tov4 listenport=$windowsPort listenaddress=$windowsHostname connectport=22 connectaddress=$wslHostname

### デバッグ時に使いそうなコマンド
#netsh interface portproxy show v4tov4
