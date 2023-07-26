# kintone2csv

1. [cli-kintone](https://github.com/kintone/cli-kintone) をインストールする
2. _config.json に各種情報をセットする
3. data_download.ps1 を実行

* タスクスケジューラーで設定すれば、batch的に実行可能
    * 参考
      * https://bgt-48.blogspot.com/2020/12/powershell.html
      * https://www.intellilink.co.jp/column/ms/2022/032300.aspx
      * https://soypocket.com/it/powershell/powershell-taskscheduler-set/



# 制限事項
* windows用です。
* フィールドの指定はできません。
* ゲストスペースは対象外です。
* APIトークンでの認証しかできません
* CSVはshift-jisで書き出されます。


# 注意事項
* あくまでもサンプルコードですので、ご利用には十分注意いただき、自己責任でご利用ください。


