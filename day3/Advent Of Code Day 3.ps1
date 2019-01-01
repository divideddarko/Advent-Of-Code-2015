#Advent Of Code 2015 Day 3
#Part 1

#starting location (first location)
# ^ - move north 1 
# v - more south 1
# > - more east 1
# < - more west 1
#a present is added for every location visited 

#How many houses get 1 or more presents - count houses which have at least one visit discard any above 1 as it's already counted
$Direction = Get-Content "$ENV:USERPROFILE\Documents\GIT\AOC-2015\day3\houses.txt"
#break up the input into an array
$Direction = $Direction.ToCharArray()    
#X, Y coords to get the current location of santa
$X = 0
$Y = 0
#create hash table, key is value of x,y value is value++
$NewHouse = @{}
#Add a starting location
$NewHouse.Add("X$($x):Y$($y)", 1)

$Direction | ForEach-Object {
     #check what the input is equal to
     if ($_ -eq ">") {
          #increate X direction from starting 0
          $X++
          #get an item from the hash array + 1 if it exists
          $AddVal = $NewHouse.Item("X$($X):Y$($Y)") + 1
          #does the hash array contain the coords already given if so set the new value to $a
          if ($NewHouse.Contains("X$($X):Y$($Y)")) {
               $NewHouse.Set_Item("X$($X):Y$($Y)", $AddVal)
          } else {
               #Add value to hash if it doesn't already exist.
               $NewHouse.Add("X$($X):Y$($Y)", 1)
          }
     }
     if ($_ -eq "<") {
          $X--
          $AddVal = $NewHouse.Item("X$($X):Y$($Y)") + 1
          if ($NewHouse.Contains("X$($X):Y$($Y)")) {
               $NewHouse.Set_Item("X$($X):Y$($Y)", $AddVal)
          } else {
               $NewHouse.Add("X$($X):Y$($Y)", 1)
          }
     }
     if ($_ -eq "^") {
          $Y++
          $AddVal = $NewHouse.Item("X$($X):Y$($Y)") + 1
          if ($NewHouse.Contains("X$($X):Y$($Y)")) {
               $NewHouse.Set_Item("X$($X):Y$($Y)", $AddVal)
          } else {
               $NewHouse.Add("X$($X):Y$($Y)", 1)
          }
     }
     if ($_ -eq "v") {
          $Y--
          $AddVal = $NewHouse.Item("X$($X):Y$($Y)") + 1
          if ($NewHouse.Contains("X$($X):Y$($Y)")) {
               $NewHouse.Set_Item("X$($X):Y$($Y)", $AddVal)
          } else {
               $NewHouse.Set_Item("X$($X):Y$($Y)", 1)
          }
     }
}
#output the count of hasharray this will give anything above 1
"$($NewHouse.Count)"