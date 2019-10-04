

$i = $args[1]
$reset = $args[2]
$reset
if($reset -eq 1){
    while($true){
        Clear-Content -Path C:\Users\djanin\Documents\Test\Test.txt
        Add-Content -path C:\Users\djanin\Documents\Test\Test.txt -value $args[0],$i 
        $i++
        Start-Sleep -s 1
    }
}else{
    while($true){
        Clear-Content -Path C:\Users\djanin\Documents\Test\Test.txt
        Add-Content -path C:\Users\djanin\Documents\Test\Test.txt -value $args[0],$i 
        $i--
        Start-Sleep -s 1
    }
}