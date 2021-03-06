#This the hang man game by Brian Pedigo
#this is writen in powershell 2.0

#define variables used in this script
$playGame = "False" #contorls gameplay and when to stop the game
$response = "" #Stores the player's input
$randomNo = New-Object System.Random #create an object to get random numbers
$numbers = 0 #Stores the random number
$secertWord = "" #Stores the secert word for the current game
$attempts = 0
$status = "True"
$guesses = "" #list of  letters by player
$reply  #Player letter guesses
$tempstring # Displays string with Hidden letters
$validReply #New game response
$rejectList = '~!@#$%^&*()_+<>?:][\|:"*' #string listing unacceptable input
$GuessesRemaining
$correct = 0
$right = ""

#Create an Associative array and load it with words
$words = @{}
$words[0] = @("","","","","","","","","","","","","","","")
$words[1] = @("C","O","M","M","A","N","D","E","R")
$words[2] = @("F","L","A","G")
$Words[3] = @("T","O","A","S","T","E","R")
$Words[4] = @("M","A","R","K","E","R")
$words[5] = @("P","I","C","T","U","R","E")
$words[6] = @("D","E","S","K")
$words[7] = @("G","L","O","B","E")
$words[8] = @("S","P","E","A","K","E","R")
$words[9] = @("B","A","C","K","Y","A","R","D")
$words[10] = @("P","E","N","C","I","L")
$words[11] = @("U","S","E")
$words[12] = @("C","A","T","T","E","R","Y")
$words[13] = @("O","W","L","S")
$words[14] = @("J","E","A","N")
$words[15] = @("S","T","U","B")
$words[16] = @("F","O","O","D")
$words[17] = @("W","H","O","L","E","S")
$words[18] = @("H","E","L","P","S")
$words[19] = @("G","R","I","P","S")
$words[20] = @("I","D","E","A")
$words[21] = @("P","E","A","C","E")








#This Function determines if the player's guess is correct or incorrect 
function Check-Answer{
param($reply)
$script:guesses = $script:guesses +""+ $reply
For($i = 0; $i -le $secertWord.Length -1; $i++){
if($secertWord[$i] -ne $reply){
if($words[0][$i] -eq ""){$words[0][$i] = "_"}
}
else{
$words[0][$i] = $reply
$script:right = "True"
}
}
}

function hal-mary{
param($reply)
$j = -join $secertWord
if( $j -eq $reply){
Clear-Host
Write-host "You guessed the Secert Word"
Read-host
$reply = "Done"
continue
}
}


#drawing the hanging
Function Open{
write-host "`n"
write-host "                                           ************"
write-host "                                           *          *"
write-host "                                                      *"
write-host "                                                      *"
write-host "                                                      *"
write-host "                                                      *"
write-host "                                                      *"
Write-host "                                                      *"
Write-host "                                                      *"
write-host "                                                      *"
Write-host "                                                 ************"
}

Function head{
write-host "`n"
write-host "One Incorrect                              ************"
write-host "                                           *          *"
write-host "Your head appears on the hang man's        0          *"
write-host "Rope!                                                 *"
write-host "                                                      *"
write-host "                                                      *"
write-host "                                                      *"
Write-host "                                                      *"
Write-host "                                                      *"
write-host "                                                      *"
Write-host "                                                 ************"
}

function body{
write-host "`n"
write-host "Two Incorrect                             ************"
write-host "                                           *          *"
write-host "Your head and body apears                  0          *"
write-host "on the hang man's rope!                    |          *"
write-host "                                           |          *"
write-host "                                                      *"
write-host "                                                      *"
Write-host "                                                      *"
Write-host "                                                      *"
write-host "                                                      *"
Write-host "                                                 ************"
}

function leftArm{
write-host "`n"
write-host "Three incorrect                            ************"
write-host "                                           *          *"
write-host "Your head, body and one arm                0          *"
write-host "appear on the hang man's                  _|          *"
write-host "rope!                                      |          *"
write-host "                                                      *"
write-host "                                                      *"
Write-host "                                                      *"
Write-host "                                                      *"
write-host "                                                      *"
Write-host "                                                 ************"
}

function RightArm{
write-host "`n"
write-host "Four incorrect                             ************"
write-host "                                           *          *"
write-host "Your head, body and arms                   0          *"
write-host "appear on the hang mans rope!             _|_         *"
write-host "                                           |          *"
write-host "                                                      *"
write-host "                                                      *"
Write-host "                                                      *"
Write-host "                                                      *"
write-host "                                                      *"
Write-host "                                                 ************"
}

function Leftleg{
write-host "`n"
write-host "Five incorrect                             ************"
write-host "                                           *          *"
write-host "Your head, body, arms and                  0          *"
write-host "left leg appear on the hang               _|_         *"
write-host "man's rope!                                |          *"
write-host "                                          /           *"
write-host "                                                      *"
Write-host "                                                      *"
Write-host "                                                      *"
write-host "                                                      *"
Write-host "                                                 ************"
}

function RightLeg{
write-host "`n"
write-host "         Hang Man                          ************"
write-host "                                           *          *"
write-host "        Game Over!                         0          *"
write-host "                                          _|_         *"
write-host "                                           |          *"
write-host "                                          / \         *"
write-host "                                                      *"
Write-host "                                                      *"
Write-host "                                                      *"
write-host "                                                      *"
Write-host "                                                 ************" 
}

#Prompt the player to play this could be truned into a funcion maybe call it opening
function opening{
While($playGame -ne "True"){#ao
clear-host
write-host "`n`n`n`n"
write-host "Welcome to the                             ************"
write-host "                                           *          *"
write-host "PowerShell Hangman Game!                   0          *"
write-host "                                          _|_         *"
write-host "                                           |          *"
write-host "                                          / \         *"
write-host "                                                      *"
Write-host "                                                      *"
Write-host "                                                      *"
write-host "                                                      *"
Write-host "                                                 ************"
$response = Read-host "`n`n`n Would you like to play? (Y/N)"
if( $response -eq "Y"){#bo
$playGame = "True"
}#bc
elseif($response -eq "N"){#co
Clear-Host
write-host "`n`n Please return and play again soon."
Read-host
exit
}#cc
else{#do
clear-host
write-host " `n`n Invalid input. Please presss Enter and try again"
Read-Host
}#dc
}#ac
}

#Generate a random number between 1 and 10 This could easly be a function that is called random-number
function random-number{
$number = $randomNo.Next(1, 22)
$script:secertWord = $words[$number]
$script:secertWordLength = $secertWord.length
}



#function for opening game play
opening 
#!!!!!!!!! main 1st** Loop of to control gameplay the overall on/ off switch
While($status -eq "True"){
#reset variables at the start of each round of play
$tempString = ""
$words[0] = @("","","","","","","","","","","","","","","","")
$attempts = 0
$guesses = ""
$reply = ""
$script:right = "Flase"
$correct = 0
#function for picking the secert word!
random-number


#creat 2nd** another while loop this is loop does the processing as long as the main loop is on
While($reply -eq "" ){
Clear-Host
$reply = Read-Host "`n`n`n Enter a guess."


#the following if statements vaildate the players reply
# this frist function is if the player guesses the secert word at anytime during game play
Hal-Mary $reply

if($reply -eq ""){ continue } #incase the player chosses nothing

if($reply.Length -gt 1){    #incase the player chosses more than one letter
clear-host
Write-host "`n`n Error:You entered more than one letter"
Read-host "`n`n`n`n`n`n`n Press Enter to continue"
$reply = ""
}

if(1234567890 -match $reply){ #incase the player chosses a number
Write-host "`n`n`n`n`n Error: Numberic guesses are not allowed"
read-host "`n`n`n`n`n`n`n`n`n Press Enter to continue."
$reply = ""
continue
}

if($rejectList -match $reply){ #incase the player uses a speacial character
Clear-Host
Write-Host "`n`n Error: Special characters are not permitted."
Read-Host "`n`n`n`n`n`n`n`n`n`n Press Enter to continue."
$reply = ""
continue
}

if($guesses -match $reply){ #incase the player uses the same letter twice
Clear-Host
Write-Host "`n`n Error: Cant chose the same letter twice"
Read-host "`n`n`n`n`n`n`n`n Press Enter to continue"
$reply = ""
continue
}

Clear-Host
$attempts++ # this is the counter for number of trys

Check-Answer $reply #calling the function that does the main processing and passing it the $varible as an argument

#counting correct response with a boolean in case the serect word has two of the same letters it throws off the count if not boolean
if($right -eq "True"){$correct++}
#creating a temporary display string that shows the state of the word being guessed
$tempString = ""
For($i=0; $i -le $words[0].length -1; $i++){
$tempString =$tempString +""+""+$words[0][$i]
}
$guessesRemaining = (6 - $attempts + $correct)
#Display current state of the secert word based on the input collected form the player
#as on screen txt graphic each wrong guess gets closer to Hang Man
switch($guessesRemaining){
6 { Open}
5 { Head}
4 { Body}
3 { LeftArm }
2 { RightArm }
1 { LeftLeg }
0 { RightLeg}
}
#the code below is for debugging and can be easered once script is finalized
#Write-Host "`n`n`t`t`t`t Results: `n"
#Write-Host "the word has $secertWordlength letters in it"
#write-host "$right"
#write-host "$reply"
#Write-Host "$secertWord" #this is for debuging only please comint this out! Write-Host "$secertWord" 
#Write-Host "`t`t`t ==========================================`n"
#Write-host "`t`t`t`t $tempString `n"
Write-host "`==============================================================================`n`n"
Write-Host "`nThe word is $secertWordlength letters long. Correct letters: $tempString"
Write-host "`nLetters guessed: $guesses `n"
# this is for debugging only please leave this commented out Write-host "Number of worng guess $script:wrong"
# this is for debugging only please leave this commented out Write-host "Number of rigth guess $script:right"

#calculate the number of guesses that the player has left
# $guessesRemaining = (6 - $attempts + $script:right)
#display the number of guesses remainin in the current round of play
Write-host "guesses remaining: $guessesRemaining"
Read-Host "`n`n`n`n`n`n`n`n`n`n Press Enter to continue" #pauseing the game so the player can reveiw the  status of game
#the secert word has been guessed if there are no more underscores

if($tempString -notmatch "_"){
clear-host
Write-Host "`n Game Over. You have guessed the secret word!in $attempts guesses.`n`n"
write-host "`n`n`n`n The Secert Word was $secertWord `n`n"
Write-host "`n`n`n`n`n`n`n`n`n"
Read-Host #pause the game
$reply = "Done" # this singles the second while loop 
continue 
}

#this is were the second if statment goes to test if atmepts is above tewelv.e
if($guessesRemaining -eq 0){
Clear-Host
Write-Host "`n Game Over. You have exceeded the maximum allowed number of guesses!"
write-host "`n`n`n The sceret word was $secertWord."
Write-host "`n`n The best you could do was $tempString `n`n`n`n`n`n`n`n`n`n"
Read-host
$reply = "Done"
continue
}
$right = "Flase"
$reply = ""

}

$response = ""
$validReply = "Flase"
While($validReply -ne "True"){
Clear-host
$response = Read-Host "`n`n`n Play Again? (Y\N)"
if($response -eq "Y"){
$ValidReply = "True"
$status = "True"
}
elseif($response -eq "N"){
Clear-host
write-host "`n`n`n Please return and play again soon."
$validReply ="True"
$status = "False"
read-host
clear-host
}
else{
Clear-host
write-host "you must pick a vaild option try again"
Read-host
}
}
} #end of main loop of control
    