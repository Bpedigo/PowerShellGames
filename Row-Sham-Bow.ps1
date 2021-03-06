#This the Rock, Paper, Sissors game

Clear-Host #clear the screen

#Define the varibles
$playGame = "ture"
$number = 0
$randomNo = New-Object System.Random #this variable is for random numbers
$guess = "" #this is for the numeric verzion of the players rock, paper or sissors
$playerMove = "" #this for the string version of the players rock, paper or sissors
$computerMove = "" #this if for the computer string verion of the computers rock, paper or sissors 
$noPlayed = 0
$noWon = 0
$nolost = 0
$noTied = 0
#end of the varibles

#Display the games opening scree
Write-Host "`n`n`n`n`t`t`t W E L C O M E  T O  T H E"
Write-Host "`n`n`n`t R O C K, P A P E R, S C I S S O R S  G A M E"
Write-Host "`n`n`n`t`t`t By Brian Pedigo"
Write-Host "`n`n`n`n`n`n`n Press Enter to continue"
Read-Host #Pause game

#Main Loop
While( $playGame -ne "False"){
#Computer picks rock, paper, scissors by randomly picking between 1 to 3
$number = $randomNo.Next(1, 4)
#turn the random number into a rock, paper or scissors
if ($number -eq "1"){$computerMove = "Rock"}
if ($number -eq "2"){$computerMove = "Paper"}
if ($number -eq "3"){$computerMove = "Scissors"}

#Explane the game options


#prompt the player to pick rock, paper, scissors
    
    While( $guess -eq "" ){
    Clear-host #clear the screen
    Write-host "`n`n"
    Write-host " Enter one of the following options: `n"
    Write-host "------------------------------- `n"
    Write-host "R = Rock"
    Write-host "P = Paper"
    Write-host "S = Scissors"
    Write-host "H = Help"
    Write-host "D = Detialed Statistics"
    Write-host "Q = Quit"
    Write-host "------------------------------- `n`n`n`n`n`n`n`n`n"
    $guess = Read-Host "Make your Move!"
    }
    
    #validating the players move
    if($guess -eq "q"){
    Clear-host
    Write-host "`n`n"
    Write-host "Game over. Thanks for Playing Rock, Paper, Scissors."
    Write-host "`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n"
    Write-host "Press Enter to view game stats and quit the game"
    Read-host #pauses the game
    $playGame = "False" #this shuts down the main loop
    continue #Skip the remainder of the loop
    }
    elseif($guess -eq "H"){
    clear-host
    write-host "Rock, Paper, Scissors game is a easy game were two players duel."
    Write-host "both players blindly pick a item  either Rock, Paper or Scissors."
    Write-Host "The scoring of the game is as follows: rock beats scissors, scissors"
    Write-Host "beats paper, and paper beats rock. If both players pick the same item."
    Write-Host "The game is a tie."
    Write-Host "`n`n`n`n`n`n`n  Press Enter to continue."
    Read-host #pause the game
    $guess = ""
    continue
    }
    elseif($guess -eq "D"){
    Clear-Host #clear screen
    Write-Host "`n`n`n GAME STATS `n"
    write-host "----------------------------`n"
    Write-host "`n Number of games played: $noplayed"
    Write-host "`n Number of games won: $noWon"
    Write-host "`n Number of games lost: $nolost"
    write-host "`n Number of games tied: $notied `n"
    Write-host "-----------------------------"
    write-host "`n`n`n`n`n`n`n Press enter to continue."
    read-host #pause game
    $guess = ""
    continue
    }
    elseif(($guess -ne "R") -and ($guess -ne "P") -and ($guess -ne "S")){
    Clear-Host #clear screen
    Write-Host "`n`n`n Invalid input. Please try again."
    Read-Host #pause the game
    $guess = "" #clear out the invaild response
    continue #skip the remainder for the loop
    }
    #Truning the Players moves into rock, paper, scissors
    if($guess -eq "R"){$playerMove = "Rock"}
    if($guess -eq "P"){$playerMove = "Paper"}
    if($guess -eq "S"){$playerMove = "Sissors"}
    Clear-Host #clear screen
    Write-Host "`n`n`n`t`t`t`t RESULTS:`n"
    Write-Host "-------------------------------- `n"
    Write-Host "The computer picked: $computerMove `n"
    Write-host "You Picked: $PlayerMove `n"
    Write-host "-------------------------------- `n"
    $noPlayed +=1 #increment count by 1 could use ++
    #Analying the results of gameplay using the Switch keyWord!!!!!!
    switch($computerMove){
    "Rock" { if($playerMove -eq "Rock") {$noTied +=1
    Write-Host "You Tied with the computer!"}
    if($playerMove -eq "Paper"){$noWin +=1
    Write-Host "You won!! Great Job"}
    if($playerMove -eq "Sissors"){$Nolost +=1
    Write-Host "You have Lost"}
    }
    "Paper" { if($PlayerMove -eq "Rock") {$Nolost +=1
    Write-Host "You Lose!"}
    if($playerMove -eq "Paper"){$noTied +=1
    Write-Host "You tied the computer"}
    if($playerMove -eq "Sissors"){$NoWon +=1
    Write-host "You Won!!"}}
    "Scissors"{ if($playerMove -eq "Rock"){$NoWon +=1
    Write-host "You Win!"}
    if($playerMove -eq "Paper"){$nolost +=1
    Write-Host "you Lose!"}
    if($playerMove -eq "Sissors"){$noTied +=1
    Write-Host "you tied with the computer"}
    }
    }
    Read-host #pause the game
    #rest the variables to prepare fo the next round of play
    $number = 0
    $guess = 0
    $playerMove = ""
    $computerMove = ""
}#main loop closes here    
    #Displaying Game Statistics
    Clear-Host #clear screen
    Write-Host "`n`n`n GAME STATS `n"
    write-host "----------------------------`n"
    Write-host "`n Number of games played: $noplayed"
    Write-host "`n Number of games won: $noWon"
    Write-host "`n Number of games lost: $nolost"
    write-host "`n Number of games tied: $notied `n"
    Write-host "-----------------------------"
    write-host "`n`n`n`n`n`n`n Press enter to continue."
    read-host #pause game
    clear-host
    
    
    
    
    
    
    
    
     
    
    
    
    









