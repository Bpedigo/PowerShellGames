#Clear the Windows command console screen

Clear-Host

#Define the variables used in the script to collect player input

$animal = ""  #stores the name of an animal supplied by the player
$vehicle = "" #stores the name of a vehicle supplied by the player
$store = ""   #stores the name of store supplied by the player
$dessert = "" #stores the name of a desser supplied by the player
$guy = ""     #stores the name of a video game guy
$brid = ""    #stores the name of a favorite brid


#display the game's opening screen
write-host
write-host
write-host
write-host
write-host "                          T H E   S T O R Y "
write-host
write-host
write-host
write-host "                   O F  T H E  T R E E  A M I G O S"
write-host
write-host
write-host
write-host
write-host "                            By Brian Pedigo"
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host "  Press Enter to continue"

#Pause script execution and wait for the player to press Enter key
Read-Host

#Clear the Windows command console screen
Clear-Host

#Provide the player with instructions
write-host
write-host
write-host
write-host
write-host "This is an interactive mad-lib styled story. Before it can be"
write-host
write-host "told, you must answer a few questions"
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host "Press Enter to continue."

#Pause script execution and wait for the player to press the Enter key
Read-Host

#ask the player the first question
while ($animal -eq ""){

Clear-Host #Clear the Windows command console screen

write-host
write-host
write-host
write-host
write-host
write-host
write-host

$animal = read-host "Enter the name of a scary animal"
}

#ask the player the scecond question
While ($vehicle -eq ""){
Clear-Host #Clear the windows command console screen

write-host
write-host
write-host
write-host
write-host
write-host

$vehicle = read-host "Enter the name of a something moves people"
}

#ask the player the thrid quesiton
while ($store -eq ""){

Clear-Host #clear the windows coommand console screen

write-host
write-host
write-host
write-host
write-host
write-host

$store = read-host "Enter the name of your Favorite type of shoes"
}

#ask the player the fourth question
while($dessert -eq ""){

Clear-Host #Clear the windows command console screen

write-host
write-host
write-host
write-host
write-host
write-host

$dessert= read-host "Enter the name of your favorite dessert"
}

#ask the player the fith question
while($guy -eq ""){

Clear-Host #Clear the windows command console screen

write-host
write-host
write-host
write-host
write-host
write-host

$guy= read-host "Enter the name of your favorite video game character"
}

#ask the player the sixth question
while($brid -eq ""){

Clear-Host #Clear the windows command console screen

write-host
write-host
write-host
write-host
write-host
write-host

$brid = read-host "Enter the name of your favorite type of brid"
}

#clear the windows comman console screen
Clear-Host
#provide the player with the mad-lib style story putting the 4 variables into the text string

write-host
write-host "Once upon a time there was a scarry $animal that hunted hummans."
write-host "One day while on the prowell for humans the $animal came across a dark row of"
write-host "trees. These were no ordinary tree because they just finished a long trip on their"
write-host "$vehicle. They were mean and in a $vehicle gang; when the $animal came to"  
write-host "to stand right in the center of the tree amigos $guy appeared infornt of her."
write-host "The trees began throwing $dessert. Dazed and confused due ot $guy and $dessert the beast ran"
write-host "to the nearst $store store to buy whip cream. But when the $animal can back"
write-host "the trees a flew away on $brid with $guy eating $dessert"
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host "Press Enter to continue"

#pause script execution and wait fo the player to press the Enter key
Read-Host

#The End
clear-host
write-host
write-host
write-host
write-host
write-host
write-host "                        T H E  E N D "
write-host
write-host
write-host
write-host
write-host
write-host "                  copyright@ 2013 By Brian Pedigo"                  
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host
write-host

#Pause script execution and wait of the player to press the enter key
Read-Host

#clear the windows command console screen
Clear-Host