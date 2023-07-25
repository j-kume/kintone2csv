# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 定数
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
$CONFIG = "_config.json"

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 設定情報の読み込み
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
$setting_data = ConvertFrom-Json -InputObject(Get-Content -Raw -Encoding UTF8 $CONFIG -ErrorAction Stop)

Write-Output("[setting_data]")
Write-Output($setting_data.clikintone_path)
Write-Output($setting_data.output_dir)
Write-Output($setting_data.base_url)
Write-Output("")

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 出力先フォルダの生成
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
$dir_output = $setting_data.output_dir + $(Get-Date -Format "yyyyMMdd_HHmm") + "\"
New-Item $dir_output -ItemType Directory | Out-Null

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# データ取得 & CSV生成
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
foreach ($app in $setting_data.apps) {
  $now = Get-Date -Format "yyyyMMddHHmmss"
  $target_id = $app.id
  $target_file = $app.file_name + "_" + $now + ".csv"
  Write-Output('####################################################')
  Write-Output("[EXPORT]   " + $app.app_name + " : " + $target_id + " -> " + $target_file)
  Write-Output("[start]    " + $(Get-Date -Format "yyyy/MM/dd HH:mm:ss"))
  Start-Process -FilePath $setting_data.clikintone_path -ArgumentList "record export --base-url $($setting_data.base_url) --app $($target_id) --api-token $($app.token) --encoding sjis" -Wait -NoNewWindow -RedirectStandardOutput $($dir_output + $target_file)
  Write-Output("[finished] " + $(Get-Date -Format "yyyy/MM/dd HH:mm:ss"))
  Write-Output("")
}

