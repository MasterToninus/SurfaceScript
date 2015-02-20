# Variabile con la chiave di registro del autohide taskbar
$Registry_Key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects2"

# Show della struttura dati della chiave di registro
 Get-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects2 -Name Settings

# Riempo un vettore con i valori della chiave di registro
 $data= (Get-ItemProperty -Path $Registry_Key -Name Settings).Settings

#Il valore chiave è l' 8 ( 2= fissa, 3= nascosta)
 if ($data[8] -eq 2){$data[8]=3}
 else{$data[8]=2}

#Riscrivo la chiave di registro
 Set-ItemProperty -Path $Registry_Key -Name Settings -Value $data

#Restart Explorer
 Stop-Process -ProcessName explorer
