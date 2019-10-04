Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Compteur de games'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'
$form.Topmost = $true

$StopButton = New-Object System.Windows.Forms.Button
$StopButton.Location = New-Object System.Drawing.Point(75,120)
$StopButton.Size = New-Object System.Drawing.Size(75,23)
$StopButton.Text = 'Arreter'
$StopButton.DialogResult = [System.Windows.Forms.DialogResult]::STOP
$form.CancelButton = $StopButton
$form.Controls.Add($StopButton)



$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::STOP)
{
   return $null
}