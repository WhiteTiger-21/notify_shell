# notify_shell
Notify you by webhook

#####################
Cube氏(https://cubezeero.work/aboutme)が作成された「RenderNotify」を参考に、LinuxやmacOS、BSD向けにShell Scriptで書いたスクリプトです。
bashがインストールされておれば、terminalから動かせます。
*zenityがインストールされていれば、GUIになる可能性が高いです。未検証。
現時点ではslackのみに対応。
MITライセンスですので、コードを見てご自身に使いやすいように改良してください。

使い方
このshellを入力し、その後に「対象のファイルのパス」「コメント」「webhookURL」「ファイルの確認方式」を入力します。
ファイルの確認方式は「exist」か「size」です。「exist」の場合はファイルが存在するかどうかで判断。「size」はファイルサイズの変化があるかどうかで判断。
例:/tmpにある0144.pngという画像の出力が終了したらslack(webhookがhttps://hooks.slack.com/xxxxx)に「End」とメッセージを投稿する場合、
  「./slack_notify.sh <<< '/tmp/0144.png End https://hooks.slack.com/xxxxx exist'」
例:/tmpにあるaviファイルが出力を終了し、サイズが変わらなくなったらslack(webhookがhoge)に「Rendered」とメッセージを投稿する場合、
  「./slack_notify.sh <<< '/tmp/*.avi Rendered https://hoge size'」

