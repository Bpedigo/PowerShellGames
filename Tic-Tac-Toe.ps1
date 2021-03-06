#Tic Tac Toe Game
#PowerShell 2.0
#Brian Pedigo
#September 2013


#intizalization of variables this is not required in Power Shell By the way. It helps things stay organized 
$startGame = "Flase"
$playGame = "True"
$player = "X"
$winner = ""
$moves = 0
$move = ""
$tie = "Flase"
$Xwins = 0
$Owins = 0
$numofties = 0
$x = ""
$y = ""
$script:custom = ""
$script:G = ""


#Vairables representing the game board
$A1 = "1"
$A2 = "1"
$A3 = "1"
$B1 = "1"
$B2 = " "
$B3 = " "
$C1 = " "
$C2 = " "
$C3 = " "

#FUNCTIONS 

function Clear-Board { # Clears the Game Board 
$script:A1 = " "
$script:A2 = " "
$script:A3 = " "
$script:B1 = " "
$script:B2 = " "
$script:B3 = " "
$script:C1 = " "
$script:C2 = " "
$script:C3 = " "
}

#Score board to keep track of players stats
#function score {
#Write-Host "`n`n Player X has won variablehere"
#Write-host "`n`n Player Y has won Variablehere"
#Write-host "`n`n Number of ties Variablehere"
#Write-host
#}


#This function is for custom names
function names {
clear-host
$script:x = read-host "first players will be X enter your name"
clear-host
$script:y = read-host "Second players will be O enter your name"

}


#this function is for naming the players
function name-switch {
param($palyer)
if($player -eq "X"){ $custom = $X}
if($player -eq "O"){ $custom = $Y}
$custom
}



#help Screen for players new to the tic tac toe game
function help {
clear-host
Write-host "`n The object of the tic tac toe game is to have your mark"
Write-host "`n be lined up in either three in a row, across or diagonlay."
Write-host "`n The frist player to get three in a row wins. However,"
Write-host "`n if neither player can get three markers in a row then the game"
write-host "`n ends in a tie!"
write-host "`n`n`n`n` Press enter to go back to the welcom screen"
read-host
Get-Permission
}

#Opening Screen in the game!
function Get-Permission { 
While( $startGame -eq "Flase") {
clear-host
write-host "`n`n`n`n"
write-host "                                          |     |"
write-host "   Welcome to the                      X  |  O  |"
write-host "                                          |     |"
write-host "                                     -----------------"
write-host " T I C - T A C - T O E                    |     |"
write-host "                                          |  X  |"
write-host "                                          |     |"
write-host "      G A M E !                      -----------------"
write-host "                                          |     |"     
write-host "                                          |  0  |  X  "
write-host "                                          |     | "
Write-host ""
Write-host "`t`t`t  Game Options"
Write-host "`nChoose(Y) to start the game"
Write-host "Choose(N) if you do not wish to play"
Write-host "Choose(H) to learn how to play the game"
Write-host "Choose(C) to enter the players names"
$startGame = Read-Host "`n`n`nwhat is your choice?"
if( $startGame -eq "Y") {$startGame = "True"}
if( $startGame -eq "N") {$startGame = "Flase"
clear-host
exit
}
if( $startGame -eq "H") {$startGame = "Flase"
Help}
if ($startGame -eq "C") {$startGame = "True"
Names }
}
} 



#This function shows the game board, showing each players mover
function Display-Board {
$G = name-switch $player
clear-host
write-host "`n`n                                TIC -TAC -TOE`n`n`n"
write-host "                                        1     2     3`n"
write-host "                                        |     |"
write-host "                               A      $A1 | $A2   | $A3"
write-host "                                        |     |"
write-host "                                  ---------------------"
write-host "                                        |     |"
write-host "                               B      $B1 | $B2   | $B3"
write-host "                                        |     |"
write-host "                                  ---------------------"
write-host "                                        |     |"     
write-host "                               C      $C1 | $C2   | $C3"
write-host "                                        |     | "
Write-host ""
$move = Read-Host "`n`n`n Player $player's $G turn"
$move #Return the Player's input to the calling statement
}

#this function determins if the players input is vaild
function Validate-Move {
if($move.length -eq 2) {
if($move -match "[A-C][1-3]") {
$result = "Valid"
}
else { $result = "Invalid"
}
}
else { $result = "invaild"
}


#move is invaild if it has already been assigned to a player during last turn
if(($move -eq "A1") -and ($A1 -ne " ")){$result = "Invalid"}
if(($move -eq "A2") -and ($A2 -ne " ")){$result = "Invalid"}
if(($move -eq "A3") -and ($A3 -ne " ")){$result = "Invalid"}
if(($move -eq "B1") -and ($B1 -ne " ")){$result = "Invalid"}
if(($move -eq "B2") -and ($B2 -ne " ")){$result = "Invalid"}
if(($move -eq "B3") -and ($B3 -ne " ")){$result = "Invalid"}
if(($move -eq "C1") -and ($C1 -ne " ")){$result = "Invalid"}
if(($move -eq "C2") -and ($C2 -ne " ")){$result = "Invalid"}
if(($move -eq "C3") -and ($C3 -ne " ")){$result = "Invaild"}

$result #Return this value to the statement that called the function
}

#this function checks the board to see if there is a winner
function check-Results {
$winner = " " #allways reset the value before checking
#look for a winner vertically
if(($A1 -eq $player) -and ($A2 -eq $player) -and ($A3 -eq $player)){
$winner = $player
}
if(($B1 -eq $player) -and ($B2 -eq $player) -and ($B3 -eq $player)){
$winner = $player
}
if(($C1 -eq $player) -and ($C2 -eq $player) -and ($C3 -eq $player)){
$winner = $player
}
#look for a winner horizontally
if(($A1 -eq $player) -and ($B1 -eq $player) -and ($C1 -eq $player)){
$winner = $player
}
if(($A2 -eq $player) -and ($B2 -eq $player) -and ($C2 -eq $player)){
$winner = $player
}
if(($A3 -eq $player) -and ($B3 -eq $player) -and ($C3 -eq $player)){
$winner = $player
}
#look for a winner diagonally
if(($A1 -eq $player) -and ($B2 -eq $player) -and ($C3 -eq $player)){
$winner = $player
}
if(($C1 -eq $player) -and ($B2 -eq $player) -and ($A3 -eq $player)){
$winner = $player
}
$winner
}

#this function displays the game board and the final results of a round of play
function Display-Results{
$G = name-switch $palyer
clear-host 
write-host "`n`n                                TIC -TAC -TOE`n`n`n"
write-host "                                        1     2     3`n"
write-host "                                        |     |"
write-host "                               A      $A1 | $A2   | $A3"
write-host "                                        |     |"
write-host "                                  ---------------------"
write-host "                                        |     |"
write-host "                               B      $B1 | $B2   | $B3"
write-host "                                        |     |"
write-host "                                  ---------------------"
write-host "                                        |     |"     
write-host "                               C      $C1 | $C2   | $C3"
write-host "                                        |     | "
Write-host ""
if($Tie -eq "true"){ read-host "`n`n The game has ended in a tie. Press Enter to continue"
}
else{ Read-host "`n`n Game Over. $player has won congratz $G Press Enter to continue"
}
 
}

#This next sec of code is the will drive the overall execution of the script.
Clear-Board
Get-Permission
While($terminate -ne "True"){ # main loop that drives the over all game logic

While($playGame -eq "True"){ #this loop will be used to control the logic for a single round

$G = Name

$move = Display-Board
#write-host "$move"  this is for debuging only 
#read-host this is for debuging only
$validMove = Validate-Move
#write-host "$ValidMove" this is for debuging only
#Read-host this is for debugging only


if($validMove -eq "Valid"){
$moves ++


if($move -eq "A1"){$A1 = $player}
if($move -eq "A2"){$A2 = $player}
if($move -eq "A3"){$A3 = $player}
if($move -eq "B1"){$B1 = $player}
if($move -eq "B2"){$B2 = $player}
if($move -eq "B3"){$B3 = $player}
if($move -eq "C1"){$C1 = $player}
if($move -eq "C2"){$C2 = $player}
if($move -eq "C3"){$C3 = $player}

}

else{
Clear-host
Read-host "`n`n`n`n`n`n`n Invalid Move. Press Enter to try again."
continue
}

$winner = Check-Results

if($winner -eq "X"){
Write-Host `a
Display-Results
$playGame = "False"
$script:Xwins++
continue
}

if($winner -eq "O"){
write-host `a
Display-Results
$playGame ="False"
$script:Owins++
continue 
}

if($moves -eq 9){
write-host `a
$tie = "True"
Display-Results
$PlayGame = "False"
$script:numofties++
continue
}
if($playGame -eq "True"){
 if($player -eq "X"){
   $player = "O"
   }
else{
   $player = "X"
   }
  }
}

 
$response = "False"

while($response -ne "True"){
clear-host
write-host "`t`t`t Game Stats"
Write-Host "`n`n Player X has won $Xwins"
Write-host "`n`n Player Y has won $Owins"
Write-host "`n`n Number of ties $numofties"
Write-host ""
$response = Read-Host "`n`n`n Play again?(Y/N)"
if($response -eq "Y"){
$response = "True"
$terminate = "False"
$playGame = "True"
Clear-board
$player = "X"
$moves = 0
$tie = "False"
}
elseif($response -eq "N"){
clear-host
Write-host "`n`n Please return and play again soon"
Read-Host
$response = "True"
$terminate = "True"
}
else{
clear-host
write-host "Invalid input. Please press enter and try again!"
read-host
}
}
}
