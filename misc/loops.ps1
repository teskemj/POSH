#Examples of Loops and arrays
$loop = read-host "Which loop would you like to sample?  Enter for, do, foreach"


switch($loop){
	"for"{
		for ($i=1; $i -le 5; $i++){
			Write-Host "Round $i done"
		}
	}
	"foreach"{
		[array]$sampleArray
		$sampleArray = "1", "2", "3", "4"
		foreach ($digit in $sampleArray){
			#Here is where you do something with each element of the array created above
			Write-Host $digit
			}
		#now we can add to the array
		$sampleArray = $sampleArray + "4", "3", "2", "1"
		Write-Host "Now I will sleep for 5 seconds so you can see the screen before it clears"
		sleep 5
		cls
		foreach ($digit in $sampleArray){
			#Here is where you do something with each element of the array created above
			Write-Host $digit
		}
	}
	"do"{
		[int]$x = 0
		do{
			Write-Host "looping until $x = 10"
			$x = $x + 1
		}
		until($x -eq 10)
		}
	}







