Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

#Variable
$Height = 300;
$Width = 300;
$Image = [system.drawing.image]::FromFile("C:\Users\djanin\Pictures\sopra-logo.jpg")
$Font = New-Object System.Drawing.Font("Impact",10,[System.Drawing.FontStyle]::Regular)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout
$Font1 = New-Object System.Drawing.Font("Arial",8,[System.Drawing.FontStyle]::Italic)



#creation de la fenetre, la form
$form = New-Object system.Windows.Forms.Form
$form.Size = New-Object System.Drawing.Size($Height,$Width) #la taille de la form, X , Y
$Form.AutoSize = $True

$Form.AutoSizeMode = "GrowAndShrink"
$form.Text = "Compteur"
$form.startposition ="CenterScreen" #sera affiché au milieu de l'écran
$form.TopMost = $true
$form.BackgroundImage = $Image
$form.BackgroundImageLayout = "Center"
$Form.Opacity = 0.95
#$Form.SizeGripStyle = "Hide"

$Form.Font = $Font


#creation d'un label Pseudo
$Pseudolabel = New-Object System.Windows.Forms.Label
$Pseudolabel.Location = New-Object System.Drawing.Point(10,($Height/8)) 
$Pseudolabel.Size = New-Object System.Drawing.Size(120,20) 
$Pseudolabel.Text = 'Pseudo du joueur :' 
$Pseudolabel.BackColor = "Transparent"
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
$Timelabel.BackColor = "Transparent"
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

$ResetCheck = New-Object System.Windows.Forms.CheckBox
$ResetCheck.Location = New-Object System.Drawing.Point(120,(($Height/8)*4))
$ResetCheck.Size = new-object System.Drawing.Size(250,50)
$ResetCheck.Text = "Reset le nombre de game ?"
$ResetCheck.Font = $Font1
$ResetCheck.Checked = $true
$ResetCheck.BackColor = "Transparent"
$Form.Controls.Add($ResetCheck) 



$form.Add_Shown({$PseudoBox.Select()})
$result = $form.ShowDialog() #affiche la fenetre


if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    
  
    if ($ResetCheck.CheckState -eq "Checked"){
        $reset = 1
    }else{
        $reset = 0
    }
    $Resultat = $PseudoBox.Text,$TimeBox.Text,$reset
    return $Resultat
}elseif ($result -eq [System.Windows.Forms.DialogResult]::Cancel) {
    return "CANCEL"
}
