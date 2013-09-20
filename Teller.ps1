#Clear the Windows Command console screen
Clear-Host

#Define the variable used in this script to collect player input
$question = "" #this variable will store the players questions
$status = "Play" #THis veriabe will be used to control game termination
$answer = 0 #this variable strores a randomly generated number
$time = (get-date).hour #this variable stores the current hour of the day
$randomNo = New-Object System.Random  #This variable stores a random object


#Display the game's opening screen
Write-Host
Write-Host
Write-Host
Write-Host "                  W E L C O M E  T O   T H E  W I N D O W S"
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host "               P O W E R S H E L L  F O R T U N E   T E L L E R"
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host "                                  By Brian Pedigo"
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host " Press Enter to continue"



#pause the script executoin and wait for the player to press the enter key.
Read-Host

#Clear the Windows command console screen
Clear-Host

#Provide the player with instructions 
Write-Host 
Write-Host "The teller is a very busy and impatient mystic. Make"
Write-Host
Write-Host "your questions brief and simple and only expect to receive"
Write-Host
Write-Host "Yes or No styled answers."
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host "Press Enter to continue"
#pause script execution and wait for the player to press the Enter Key
Read-Host

#Continue gameplay until the player decides to stop 

while($status -ne "Stop"){

#ask the player the frist question

while ($question -eq ""){
Clear-Host #Clear the Windows command console screen
Write-Host
$question = read-host "What is your question for the Teller?"
}

$question = "" #Rest variable to an empty string

#Retrieve a random number between 1 and 4
$answer = $randomNo.Next(1, 5)

#select and answer based on the time and the random number
#if it is the afternoon the teller will be crancky

if($time -gt 12){
write-host
if($answer -eq 1){"Its really late in the day to ask me that..By the way the answer is no!"}
if($answer -eq 2){"Really you are going to ask me something like that afternoon?? answer is never!"}
if($answer -eq 3){"I need a drink its afternoon and I am hot..Your answer is unclear!"}
if($answer -eq 4){"Grrrrr. The answer is YES!"}
}
#if it is morning, the fortne teller will be in a good mood
else{
Write-Host
if($answer -eq 1){"Ah. The answer is yest!"}
if($answer -eq 2){"Ah. The answer is always!"}
if($answer -eq 3){"Ah. The answer is unceartain"}
if($answer -eq 4){"Ah. The answer is no!"}
}

Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
write-Host
Write-Host
Write-Host
Write-Host "Press Enter to continue"

#pasuse the game 
read-host
#clear the screen
Clear-Host
Write-Host
#prompt the player to continue or quit
$reply = read-host "Press Enter to ask another quesiton or type Q to quit."
if($reply -eq "q"){$status = "Stop"}
}