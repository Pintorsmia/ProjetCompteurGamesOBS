Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

#Variable
$Height = 300;
$Width = 300;

#creation de la fenetre, la form
$form = New-Object system.Windows.Forms.Form
$form.Size = New-Object System.Drawing.Size($Height,$Width) #la taille de la form, X , Y
$form.Text = "Compteur"
$form.startposition ="CenterScreen" #sera affiché au milieu de l'écran
$form.TopMost = $true

#creation d'un label Pseudo
$Pseudolabel = New-Object System.Windows.Forms.Label
$Pseudolabel.Location = New-Object System.Drawing.Point(10,($Height/8)) 
$Pseudolabel.Size = New-Object System.Drawing.Size(100,20) 
$Pseudolabel.Text = 'Pseudo du joueur :' 
$form.Controls.Add($Pseudolabel)

#Champ Pseudo
$PseudoBox = New-Object System.Windows.Forms.TextBox
$PseudoBox.Location = New-Object System.Drawing.Point(10,(($Height/8)*2)) 
$PseudoBox.Size = New-Object System.Drawing.Size(100,100) 
$form.Controls.Add($PseudoBox)

#creation d'un label Heure de début
$Timelabel = New-Object System.Windows.Forms.Label
$Timelabel.Location = New-Object System.Drawing.Point(10,(($Height/8)*3)) 
$Timelabel.Size = New-Object System.Drawing.Size(200,20) 
$Timelabel.Text = 'Heure avant la première game :' 
$form.Controls.Add($Timelabel)

#Champ Heure
$TimeBox = New-Object System.Windows.Forms.TextBox
$TimeBox.Location = New-Object System.Drawing.Point(10,(($Height/8)*4)) 
$TimeBox.Size = New-Object System.Drawing.Size(100,100) 
$form.Controls.Add($TimeBox)

$Valider = New-Object System.Windows.Forms.Button
$Valider.Location = New-Object System.Drawing.Point(10,(($Height/8)*6)) #la position de la forme, coordonnée x, y
$Valider.Size = New-Object System.Drawing.Size(75,23)
$Valider.text = "Valider" #le nom afficher dans le bouton
$Valider.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $Valider
$form.Controls.add($Valider)


$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Point(100,(($Height/8)*6))
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = 'Cancel'
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $CancelButton
$form.Controls.Add($CancelButton)

$form.Add_Shown({$PseudoBox.Select()})
$result = $form.ShowDialog() #affiche la fenetre

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $Resultat = $PseudoBox.Text,[int]$TimeBox.Text
    $Resultat
    #return $Resultat
}
