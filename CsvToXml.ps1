#CSV to XML
$t_person = [xml] @'
<person>
    <id />
    <name />
    <age />
</person>
'@

$t_location = [xml] @'
<location>
    <x />
    <y />
</location>
'@

$xml = [xml] @'
<?xml version="1.0" encoding="UTF-8"?>
<persons>
</persons>
'@

$csvs = Import-csv export.csv

foreach ($csv in $csvs) {
    $root = $xml.SelectSingleNode("/persons")

    [void]$root.AppendChild($xml.ImportNode($t_person.person, $true));

    $newElement = $root.SelectSingleNode("person[last()]");

    $newElement.id   = [String]$csv.id;
    $newElement.name = [String]$csv.name;
    $newElement.age  = [String]$csv.age;

    [void]$newElement.AppendChild($xml.ImportNode($t_location.location, $true));

    $newElement.location.x    = [String]$csv.x;
    $newElement.location.y    = [String]$csv.y;
}

$xml.Save("C:\Users\xxx\Desktop\ps1\xml\conv.xml")