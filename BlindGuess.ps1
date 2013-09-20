#This is the Guess my Number program
#

Clear-host #Clear Screen
#Define variables used in the this script
$number = 0 #secert number
$noOfGuesses = 0 #tracks the number of guessess made
$random = New-Object System.Random #This creates a random object
$playGame = "yes" #controls when the game quits
$status = "Play" #controls the current round of play
$guess = 0 #Stores the player's guess
$reply = "" #stores the players response when asked again
$gametotals = 1 #tracks the total number of games played in a row
$low = 0 #number of guess to low
$high = 0 #number of guess to high
$pc = "" #players choice of range
$choice = "" #range

#Games Opening screen
Write-Host "`n`n`n`n`t  W E L C O M E  T O  T H E  G U E S S  M Y"
Write-Host "`n`n`n`t`t   N U M B E R  G A M E"
Write-Host "`n`n`n`t`t       By Brian Pedigo"
Write-Host "`n`n`n`n`n`n`n`n`n`n`n`n`n Press Enter to continue."
Read-Host #pauses the game
#Addtional instrutions
Clear-Host
Write-Host "In this game you are trying to guess the number picked by the computer"
Write-Host "For example, you guess 50 the and computer will tell you if it is to low or to high" 
Write-Host "form that response you'll know upper or lower limits. Also, you can choice the range"
Write-Host "form 1 to 10, 1 to 100 & 1 to 1000 press enter to start the fun!"
read-host
#loop until the player decide to quit the game
while($playGame -ne "No"){
clear-host
Write-Host "you can quit any time by typing Q. You have 3 choices for range of numbers"
write-host "A. 1 to 10"
write-host "B. 1 to 100"
Write-host "C. 1 to 1,000"
$pc = Read-Host "Type your choise and press Enter to start the game!" #pauses the game
if($pc -eq "a"){ $number = $random.Next(1, 11)
 $choice = "1 and 10" }
elseif($pc -eq "c"){ $number = $random.Next(1, 1001)
 $choice = "1 and 1000" }
else{ $number = $random.Next(1, 101)
 $choice = "1 and 100" }


clear-host #clear screen
    while($status -ne "Stop"){
        While($guess -eq ""){
        clear-host #clear screen
        Write-Host
        #this is for debuging Only make sure to coment this out!--> write-host $choice  
        #this is for debuging ONLY make sure to number sign out!---> write-host $number   
        $guess = Read-Host "Enter a number between $choice or q to quit"
        }
        $noOfGuesses++ #keeping track of the number guessess made so far
        #variable to h6igh ++
        #variable to low ++
        if($guess -eq "q"){ break break break }
        elseif($guess -lt $number){ # the Players guess was too low
        Clear-Host #Clear screen
        Write-Host "`n Sorry. Your guess was too low. Try a higher number. Press Enter to"`
        "guess again"
        $guess = "" #Rest the players games
        $low++
        Read-Host #pause the game
        }
        elseif($guess -gt $number){# The player guessed to high
        Clear-Host #clear screen
        Write-Host "`n Sorry. Your guess was too high.Try to a lower number Press Enter to"`
        "guess again."
        $guess ="" #Reset the players guess
        $high++
        Read-Host #pause the game 
        }
        else{ # the player has guessed the games secret number
        Clear-Host #clear screen
        Write-Host "`n Congratulations. You guessed my number! Press Enter"`
        "to continue"
        $status = "Stop" #Reset the Players guess
        Read-Host #pause the game
        }
    }
        Clear-Host #clear screen
        write-host "`n Game Statistics"
        Write-host "-----------------------------------------------------"
        write-host "`n The secert number was $number."
        write-host "`n You guessed it in $noOfGuesses."
        write-host "`n Number of guess that were too low $low."
        write-host "`n Number of guess that were too high $high."
        write-host "`n Total number of games played is $gametotals. `n" #number of games played
        write-host "-----------------------------------------------------"
        write-host "`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n Press Enter to continue"
        read-host #pause the game
        Clear-Host #clear screen
        $reply =""
        #ask the play if they want to play another round
        while($reply -eq ""){
        clear-host #clear screen
        Write-host 
        $reply = Read-host "Would you like to play again(Y/N)"
        if(($reply -ne "Y") -and ($reply -ne "N")){ $reply = ""
        }
        if($reply -eq "Y"){
        $number = 0
        $noOfGuesses =0
        $status = "Play"
        $guess = 0
        $low = 0
        $high = 0
        $choice = ""
        $gametotals++ #varibable collect total number of games played ++
        }
        else{ #Player has decided to quit playing
        $playGame = "No" #modify varible indicating that it is time to terminate gameplay
        }
        }
}        
        Clear-Host #clear screen
        