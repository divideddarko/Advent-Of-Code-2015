#Day 1 of Advent of Code 2015, Part one
#finding the right floor

#Default count to 0 on each run
$i = 0
#get the contents of the text file
$Brackets = Get-Content "$ENV:USERPROFILE\Documents\GIT\AOC-2015\day1\brackets.txt"
#convert the file contents to an Array of Data
$BracketsSplit = $Brackets.ToCharArray()

#foreach value of data within the array check to see which bracket it is
#Either add or remove a value based on bracket
$BracketsSplit | ForEach-Object {
     if ($_ -eq "(") {
          $i++               
     }
     elseif ($_ -eq ")") {
          $i--
     }
}
Write-Host $i