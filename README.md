# Data-Driven-Art
2017年秋学期 データドリブンアート 最終課題

# チーム「どうする？明日行く？」
Motoki Watanabe (https://twitter.com/XxGodmoonxX)<br>
Takashi Tsukasa (https://twitter.com/tsukisob)

# やったこと

脳波でラジコンを動かしました。

openFrameworksのBandPowerToCarDirectionはかなり真鍋大度さんに助けていただきました。<br>
ありがとうございました。

# 使い方
ArduinoとProcessingの連携はFirmataライブラリを使います。<br>
ArduinoにはStandard Firmataを書き込んでおくと<br>
ProcessingからArduinoを操作できます。

# 構成
### OpenBCI→openFrameworks→Processing→Arduino<br>
OpenBCIで脳波データのbandPowerをOSCでopenFrameworksに送り、<br>
openFramwworksで3チャンネル、4チャンネルのα波、β波の値によって<br>
4つのdirection（前進か、右旋回か、左旋回か、停止か）を導き出します。<br>
そのデータをOSCでProcessingに送り、Processingからその値に応じた動きを<br>
Arduinoに送信、ラジコンを制御します。
