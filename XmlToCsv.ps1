#XML to CSV
$xml = [XML](Get-Content .\moto.xml) 

$xml.persons.ChildNodes | Select-Object id,name,age,@{Name="x";Expression={$_.location.x}},@{Name="y";Expression={$_.location.y}} | Export-Csv .\export.csv  -NoTypeInformation -Encoding UTF8
