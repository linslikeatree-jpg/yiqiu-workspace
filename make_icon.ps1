Add-Type -AssemblyName System.Drawing
$bmp = New-Object System.Drawing.Bitmap(180,180)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$g.FillRectangle([System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(91,158,181)),0,0,180,180)
$font = New-Object System.Drawing.Font("Arial",72,[System.Drawing.FontStyle]::Bold)
$sf = New-Object System.Drawing.StringFormat
$sf.Alignment = [System.Drawing.StringAlignment]::Center
$sf.LineAlignment = [System.Drawing.StringAlignment]::Center
$g.DrawString([char]0x79CB,$font,[System.Drawing.SolidBrush]::new([System.Drawing.Color]::White),[System.Drawing.RectangleF]::new(0,0,180,180),$sf)
$ms = New-Object System.IO.MemoryStream
$bmp.Save($ms,[System.Drawing.Imaging.ImageFormat]::Png)
$bytes = $ms.ToArray()
$target = Join-Path $PSScriptRoot "icon.png"
[System.IO.File]::WriteAllBytes($target,$bytes)
$ms.Dispose()
$bmp.Dispose()
$g.Dispose()
Write-Host "done: $target"
