$counter = 1
$prefix = "cover"
$targetFolder = ".\covers\"

Write-Host "正在处理文件夹: $targetFolder"
Write-Host "----------------------------------"

Get-ChildItem -Path $targetFolder -File | Sort-Object CreationTime | ForEach-Object {
   $extension = $_.Extension

   $newName = "{0}{1:D3}{2}" -f $prefix, $counter, $extension
   Write-Host "正在重命名: '$($_.Name)' -> '$newName'"

   Rename-Item -Path $_.FullName -NewName $newName
   $counter++ 
} 

Write-Host "----------------------------------"
Write-Host "完成！总共重命名了 $( $counter - 1 ) 个文件。"
Read-Host "按任意键退出"