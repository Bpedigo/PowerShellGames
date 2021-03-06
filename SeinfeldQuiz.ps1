#This is the Seinfeld Trivia Quiz
#setting all the variable in the script to empty to avoid pitfalls
$question1 = ""
$question2 = ""
$question3 = ""
$question4 = "" 
$question5 = ""
$question6 = ""
$question7 = ""
$question8 = ""
$question9 = ""

#Define a variable to keep track the number of correctly answered
#quiz quesitons
$noCorrect = 0
#Clear screen
clear-host
#Display the game's opening screen
Write-Host "`n`n`n`n`t`t W E L C O M E  T O  T H E  S E I N F E L D"
Write-Host "`n`n`n`t`t`t T R I V I A   Q U I Z"
Write-Host "`n`n`n`t`t`t By Brian Pedigo"
#Pause the script excution and wait for the player to press the Enter Key
Read-Host

#clear the windows command console screen
Clear-Host

#Provide the player with instructions
Write-Host "`n`n The Seinfeld Trivia Quiz tests your knowledge of Seinfeld`n"
Write-Host "trivia. The quiz consists of nine questoins`n."
Write-Host "At the end of the quiz your answers will be assigned a skill level`n"
Write-Host "useing the follow scale.`n`n"
Write-Host "`t Score 9 correct = Jerry (Expert)"
Write-Host "`t`t 8 correct = Krammer"
Write-Host "`t`t 7 correct = Elanie"
Write-Host "`t`t 6 correct = George"
Write-Host "`t`t 5 correct = Newman"
Write-Host "`t`t 0-4 correct = Babo (Clueless)"
Write-Host "`n`n`n`n Press Enter to continue"
#Pause script execution and wait for the player to press to Enter key
Read-Host

#Ask the player the frist question
while(($question1 -ne "a") -and ($question1 -ne "b")`
-and ($question1 -ne "c") -and ($question1 -ne "d" )){
Clear-Host #clear screen
Write-Host "`n What is Kramer's frist name? `n"
Write-Host "A. Peterman"
Write-Host "B. Cosmo"
Write-Host "C. Puddy"
Write-Host "D. Peck"
Write-Host
$question1 = Read-Host "Type the letter of the correct answer and press enter"
}

#Ask the player the second question
while(($question2 -ne "a") -and ($question2 -ne "b")`
-and ($question2 -ne "c") -and ($question2 -ne "d" )){
Clear-Host #clear screen
Write-Host "`n What was George's Fravorite pretend career? `n"
Write-Host "A. Bra salesman"
Write-Host "B. Real estate agent"
Write-Host "C. City planner"
Write-Host "D. Architect"
Write-Host
$question2 = Read-Host "Type the letter of the correct answer and press enter"
}

#Ask the player the three question
while(($question3 -ne "a") -and ($question3 -ne "b")`
-and ($question3 -ne "c") -and ($question3 -ne "d" )){
Clear-Host #clear screen
Write-Host "`n Who created Festivus? `n"
Write-Host "A. Peterman's father"
Write-Host "B. Jerry's father"
Write-Host "C. George's father"
Write-Host "D. Elanie's father"
Write-Host
$question3 = Read-Host "Type the letter of the correct answer and press enter"
}
 
 #Ask the player the four question
while(($question4 -ne "a") -and ($question4 -ne "b")`
-and ($question4 -ne "c") -and ($question4 -ne "d" )){
Clear-Host #clear screen
Write-Host "`n Who said Who told you to put the blam on? `n"
Write-Host "A. Peterman"
Write-Host "B. Jerry"
Write-Host "C. Jackie Chiles"
Write-Host "D. The soup Nazi"
Write-Host
$question4 = Read-Host "Type the letter of the correct answer and press enter"
}

#Ask the player the five question
while(($question5 -ne "a") -and ($question5 -ne "b")`
-and ($question5 -ne "c") -and ($question5 -ne "d" )){
Clear-Host #clear screen
Write-Host "`n How much money did Larry David secure form the Seinfeld show? `n"
Write-Host "A. 1 million"
Write-Host "B. 100 million"
Write-Host "C. 1.7 billion"
Write-Host "D. 560 milion"
Write-Host
$question5 = Read-Host "Type the letter of the correct answer and press enter"
}

#Ask the player the six question
while(($question6 -ne "a") -and ($question6 -ne "b")`
-and ($question6 -ne "c") -and ($question6 -ne "d" )){
Clear-Host #clear screen
Write-Host "`n What was the name of Karmers business that he got a intern form NYC to work for him? `n"
Write-Host "A. NYC Cuba Ciguars INC"
Write-Host "B. Karmer Movie times INC"
Write-Host "C. Kramerica Industries"
Write-Host "D. Mad Men INC"
Write-Host
$question6 = Read-Host "Type the letter of the correct answer and press enter"
}

#Ask the player the seventh question
while (($question7 -ne "a") -and ($question7 -ne "b") `
  -and ($question7 -ne "c") -and ($question7 -ne "d" )) {
Clear-Host  #clear screen
Write-Host "`n For whom did Elaine buy white socks? `n"
Write-Host " A. Mr. Lippman"
Write-Host " B. Mr. Peterman"
Write-Host " C. Mr. Pitt"
Write-Host " D. Puddy"
Write-Host
$question7 = Read-Host " Type the letter of the correct answer and press enter"
}

#Ask the player the eight question
while (($question8 -ne "a") -and ($question8 -ne "b") `
  -and ($question8 -ne "c") -and ($question8 -ne "d" )) {
Clear-Host  #Clear screen
Write-Host "`n What is Kramer scared of? `n"
Write-Host " A. Swimming"
Write-Host " B. Fried Chicken"
Write-Host " C. Clowns"
Write-Host " D. The dentist"
Write-Host
$question8 = Read-Host " Type the letter of the correct answer and press enter"
}

#Ask the player the nine question
while (($question9 -ne "a") -and ($question9 -ne "b") `
  -and ($question9 -ne "c") -and ($question9 -ne "d" )) {
Clear-Host  #Clear screen
Write-Host "`n Where do Jerry's parents live? `n"
Write-Host " A. Kansas"
Write-Host " B. New York"
Write-Host " C. California"
Write-Host " D. Florida"
Write-Host
$question9 = Read-Host " Type the letter of the correct answer and press enter"

}



Clear-host #clear screen
Write-host " `n OK, now press the Enter key to see how you did."
read-host #pause the script
clear-host #clear screen
#Grade the answer for each quiz question
if($question1 -eq "b") { $noCorrect++ }#q1 is b
if($question2 -eq "c") { $noCorrect++ }#q2 is c
if($question3 -eq "c") { $noCorrect++ }#q3 is c
if($question4 -eq "c") { $noCorrect++ }#q4 is c
if($question5 -eq "c") { $noCorrect++ }#q5 is c
if($question6 -eq "c") { $noCorrect++ }#q6 is c
if($question7 -eq "c") { $noCorrect++ }#q7 is c
if($question8 -eq "c") { $noCorrect++ }#q8 is c
if($question9 -eq "d") { $noCorrect++ }#q9 is d

#Assign a ranking based on quiz score
if($noCorrect -le 4){
Write-Host "`n $noCorrect correct"
write-host
write-host "Your knowledge of Seinfeld trivia is no better than Babo's."
}

#Assign a ranking based on quiz score
if($noCorrect -eq 5){
Write-Host "`n $noCorrect correct."
write-host
write-host "Your knowledge of Seinfeld trivia is Newman's."
}

#Assign a ranking based on quiz score
if($noCorrect -eq 6){
Write-Host "`n 6 correct."
write-host
write-host "Your knowledge of Seinfeld George's."
}

#Assign a ranking based on quiz score
if($noCorrect -eq 7){
Write-Host "`n 7 correct."
write-host
write-host "Your knowledge of Seinfeld Elaine's."
}

#Assign a ranking based on quiz score
if($noCorrect -eq 8){
Write-Host "`n 8 correct."
write-host
write-host "Your knowledge of Seinfeld Kramer's."
}

#Assign a ranking based on quiz score
if($noCorrect -eq 9){
Write-host "`n 9 correct."
write-host
write-host "Your knowledge of Seinfeld Jerry"
}

Read-host #pause
Clear-host  #clear screen
Write-host "`n Thanks for taking the Seinfeld Trivia Quiz!"
Write-host "`n`n`n`n Report Card"
Write-host " question 1 answer should have been B your answer $question1 `n"
Write-host " question 2 answer should have been C your answer $question2 `n"
Write-host " question 3 answer should have been C your answer $question3 `n"
Write-host " question 4 answer should have been C your answer $question4 `n"
Write-host " question 5 answer should have been C your answer $question5 `n"
Write-host " question 6 answer should have been C your answer $question6 `n"
Write-host " question 7 answer should have been C your answer $question7 `n"
Write-host " question 8 answer should have been C your answer $question8 `n"
Write-host " question 9 answer should have been D your answer $question9 `n"
Read-Host #pause
Clear-Host #clear screen
