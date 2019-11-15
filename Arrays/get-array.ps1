# Examples from Kevin Marquettes blog regarding arrays
# https://kevinmarquette.github.io/2018-10-15-Powershell-arrays-Everything-you-wanted-to-know/?utm_source=twitter&utm_medium=post
#
# Check this one out later
# https://kevinmarquette.github.io/2018-01-12-Powershell-switch-statement/?utm_source=blog&utm_medium=blog&utm_content=arrays


$data = @()
$data.Count

$data = @('Zero', 'One', 'Two', 'Three')
$data.Count

#Comma after value is optional
$data = @(
    'zero'
    'one'
    'two'
    'three'
)

# @() is syntax for creating an array, however comma separated lists work as well
$data = 'zero', 'one', 'two', 'three'

#You can create strings strings at the console
$data = Write-Output zero one two three

# Iteration
$data | ForEach-Object {"Item: [$psitem]"}

foreach ($node in $data) {
    "Item: [$node]"
}

$data.ForEach( {"Item [$psitem]"})
$data.ForEach{"Item [$psitem]"}

for ( $index = 0; $index -lt $data.count; $index++) {
    "Item: [{0}]" -f $data[$index]
}

$data = @(
    [pscustomobject]@{FirstName = 'Michael'; LastName = 'Teske'}
    [pscustomobject]@{FirstName = 'John'; LastName = 'Doe'}
)

$data[0]

$data | Where-Object {$_.FirstName -eq 'michael'}
$data | where firstname -eq michael
$data.Where( {$_.firstname -eq 'michael'})