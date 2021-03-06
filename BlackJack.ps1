# The Black Jack Power Shell Game
# By Brian Pedigo
# powershell 2.0
# to have some of this script work you have to run BJSetup.ps1 before you play this. This will inable the credits screen and called by the check-registry function
#
#
#initialization section
$startGame = "False" #var used to determine if the game is played
$playerBust  = "False" #Var used to track when a plary bustes
$playerHand = 0 # stores the current value of the player's hand
$randomNo = New-Object System.Random #this var is an object that creates random number using the .next method so that we can pick the range of the random numbers
$computerHand = 0 #Stores the current value of the computers hand
$playAgain = "True" # controls the logic of the inner loop
$script:count = 1
$playerWin = 0
$playerloss = 0
$compWin =
$comploss = 0
$ties = 0
$gamecount = 1
#
#
#Function section
#
#This 1st function get the player's permission to play
function get-permission {
while( $startGame -eq "False") {
clear-host
write-host "`n`n`n"
write-host "`t`t`tWelcome to the >>---->" -foregroundColor black -backgroundColor white
write-host "                 _________   _________"  
write-host "                /         \ /         \ "
write-host "                |A        | |J        |"
write-host "                |    ,    | |   _ _   | "
write-host "                |   / \   | |  / ^ \  | "
write-host "                |  (_ _)  | |  \   /  | "
write-host "                |   /_\   | |   \ /   | "
write-host "                |         | |    `     | "
write-host "                |        A| |        J| "
write-host "                \_________/ \_________/ "
write-host ""
write-host "`t`tP O W E R S H E L L  B L A C K J A C K  G A M E >>---->" -foregroundColor black -backgroundColor white
write-host "`n`n`t`tBy Brian Pedigo >>--->" -foregroundColor black -backgroundColor white
write-host "`n`n`n`n`n`n`n"
$response = read-host "Would you like to play? (Y/N) or (H) for help on how to play black jack"
#validate the players input
if($response -eq "Y"){ $startGame = "True" }
elseif($response -eq "N"){ Check-Registry
exit
}
elseif($response -eq "H"){ Help}
}
}
#
#THis function retrives the reg value that will tell it to display the splash screen
function Check-Registry {
clear-host
$currentlocation = Get-Location #keeping track were the user in the file system
set-location hkcu:\ #change to the HKEY_CURRENT_USER hive
$regKey = $(get-itemproperty hkcu:\PSBlackjack).Credits
if ( $regKey -eq "True") { 
Write-host " `n`n`n`n"
write-host "`t`t`t P O W E R S H E L L  B L A C K J A C K` >>--->`n`n`n" -foregroundColor black -backgroundColor white
Write-host " "
write-host "                                   .----------------. "
write-host "                                   |  _ _   MMMMM   | "
write-host "                                   | ( v ) | o o |  | "
write-host "                                   |  `.'   \ - /    | "
write-host "                                   |  |/  ---`W'--.  | "
write-host "                                   |  |\ |     .-') | "
write-host "                                   |     |  .-'   ) | "
write-host "                                   |     .-'      ) | "
write-host "                                   |  .-'      .-'  | "
write-host "                                   | (      .-'     | "
write-host "                                   | (   .-'  |     | "
write-host "                                   | (.-'     | \|  | "
write-host "                                   | '--.M.---  /|  | "
write-host "                                   |   / - \   .^.  | "
write-host "                                   |  | o o | ( . ) | "
write-host "                                   |   WWWWW   " "    | "
write-host "                                   `----------------' "
write-host " "
write-host "`t`t`t`t    By Brian Pedigo`n`n`n`n"
}
else{
Write-host "RegKey was not set up please run BJSetup.ps1"
}
set-location $currentlocation
}
#
# this function is for drawing the game
Function frist-deal {
Write-host "`n                  Computer-Dealer's Hand >>---->" -foreground black -background white
write-host "                     _________   _________  "
write-host "                    /         \ /         \  "
write-host "                     $computerHand            "
write-host "                    |    ,    | |@@@@@@@@@|  "
write-host "                    |   / \   | |@@@@@@@@@|  "
write-host "                    |  (_ _)  | |@@@@@@@@@|  "
write-host "                    |   /_\   | |@@@@@@@@@|  "
write-host "                    |         | |@@@@@@@@@|  "
write-host "                    |       $computerhand     "
write-host "                    \_________/ \_________/  "
write-host "                                           "
write-host "                    Your hand  >>-->" -foreground black -background white
write-host "                      _________   _________  "
write-host "                     /         \ /         \ "
write-host "                      $card1           $card2      "
write-host "                     |   _ _   | |    _    | "
write-host "                     |  / ^ \  | |   (_)   | "
write-host "                     |  \   /  | |  (_)_)  | "
write-host "                     |   \ /   | |   /_\   | "
write-host "                     |    *    | |         |"
write-host "                             $card1           $card2 "
write-host "                     \_________/ \_________/" 
Write-host "`n`n`t                 Card Total: $playerhand "
}
#
#This function is for drawing the game
function second-deal {
Write-host "`n                  Computer-Dealer's Hand >>---->" -foreground black -background white
write-host "                     _________   _________  "
write-host "                    /         \ /         \  "
write-host "                     $computerHand            "
write-host "                    |    ,    | |@@@@@@@@@|  "
write-host "                    |   / \   | |@@@@@@@@@|  "
write-host "                    |  (_ _)  | |@@@@@@@@@|  "
write-host "                    |   /_\   | |@@@@@@@@@|  "
write-host "                    |         | |@@@@@@@@@|  "
write-host "                    |       $computerhand     "
write-host "                    \_________/ \_________/  "
write-host "                                           "
write-host "                    Your hand  >>-->" -foreground black -background white
write-host "                _________   _________   _________  "
write-host "               /         \ /         \ /         \ "
write-host "                $card3           $card1           $card2                              "
write-host "               |    ,    | |   _ _   | |    _    | "
write-host "               |   / \   | |  / ^ \  | |   (_)   | "
write-host "               |  (_ _)  | |  \   /  | |  (_)_)  | "
write-host "               |   /_\   | |   \ /   | |   /_\   | "
write-host "               |         | |    *    | |         |"
write-host "                        $card3           $card1           $card2                                     "
write-host "               \_________/ \_________/ \_________/  "                                          
Write-host "`n`n`t                 Card Total: $playerhand "
}
#
#This function is for drawing the game
function fourth-deal {
Write-host "`n                  Computer-Dealer's Hand >>---->" -foreground black -background white
write-host "                     _________   _________  "
write-host "                    /         \ /         \  "
write-host "                     $computerHand            "
write-host "                    |    ,    | |@@@@@@@@@|  "
write-host "                    |   / \   | |@@@@@@@@@|  "
write-host "                    |  (_ _)  | |@@@@@@@@@|  "
write-host "                    |   /_\   | |@@@@@@@@@|  "
write-host "                    |         | |@@@@@@@@@|  "
write-host "                    |       $computerhand     "
write-host "                    \_________/ \_________/  "
write-host "                                           "
write-host "                    Your hand  >>-->" -foreground black -background white
write-host "          _________   _________   _________   __________   "
write-host "         /         \ /         \ /         \ /          \   "
write-host "          $card3            $card1          $card2           $card4                      "
write-host "         |    ,    | |   _ _   | |    _    | |          |   "
write-host "         |   / \   | |  / ^ \  | |   (_)   | |    /\    |   "
write-host "         |  (_ _)  | |  \   /  | |  (_)_)  | |   <  >   |   "
write-host "         |   /_\   | |   \ /   | |   /_\   | |    \/    |   "
write-host "         |         | |    *    | |         | |          |   "
write-host "                  $card3          $card1           $card2             $card4                "
write-host "         \_________/ \_________/ \_________/ \__________/   "
Write-host "`n`n`t                 Card Total: $playerhand "
}
#
# This function is for helping players who have nvr played black jack.
function help {
clear-host
write-host "The object of black jack is to get 21 or as close to it as possiable"
write-host "without going over 21. If either the player or the dealers cards total more then 21"
write-host "then that person busts which  means they loss on the spot. If neither the player or dealer"
write-host "bust, then the winner is decided by whos hand is closest to 21. It is possiable to"
write-host "tie in this game if both the player and dealers card total are the same. If you would at any" 
write-host "time like to see the stat of wins, losses or tie type (S) for stats."
read-host
}
#
# this function is for displaying player stat e.g wins losses ties
function stat {
Write-host "`n`n`t`t SCORE BOARD `n"
write-host "     Player          ||    Computer/Dealer     "
Write-host "==============================================="
Write-host "                     ||                        "
Write-host "Wins:      $playerwin         ||        $CompWin           "
write-host "Losses:    $Playerloss         ||        $CompLoss          "
Write-host "==============================================="
Write-host "`n`n`t`t OVER ALL STATS"
write-host "`nTotal number of games played $GameCount"
write-host "`nTotal number of ties $ties"
write-host "==============================================="
write-host "`n`n`t`t Current Hand Stats"
write-host ""
write-host "The number of cards the player had $pct`n" #for design only
write-host "Player Hand: $PlayerHand`n"
Write-host "Computer Hand: $computerHand`n`n"
read-host
clear-host
}
#This Function controls the execution of an individual round of play
function Play-Game {
$script:count = 0
Deal-Hand
$script:count = 1
Get-PlayerHand
if($script:playerBusted -eq "False"){
Get-computerHand
}
Analyze-Results
$script:gamecount++
}
#
#THis function deals the player and computers hands
function Deal-Hand { 
$script:card1 = Get-Card
$script:card2 = Get-card
$script:PlayerHand = $script:card1 + $script:card2
$script:computerHand = Get-CardC
#if(($scipt:card1 -eq 1) -or ($script:card2 -eq 1)){ace}
}
#
#This function deals with ACEs
function Ace{
$q1 = "True"
clear-host
while($q1 -eq "True"){
write-host "                  __________  "
write-host "                 /          \ "
write-host "                 |A         | "
write-host "                 |          | "
write-host "                 |    /\    | "
write-host "                 |   <  >   | "
write-host "                 |    \/    | "
write-host "                 |          | "
write-host "                 |         A| "
write-host "                 \__________/ "
write-host "`n`nYou have been dealt an ACE would you like it be 1 or 11?"
write-host "A) for 1"
write-host "B) for 11"
$q1 = read-host "enter your choice"
if($q1 -eq "A"){$number = 1
$q1 = "Flase"
}
if($q1 -eq "B"){$number = 11
$q1 = "Flase"
}
$number
}
}
#
#
function Get-CardC {
$number = 0
$number = $randomNo.Next(1,14)
#if($number -eq 1){$number = 11} # this is an ACE
if($number -gt 10){$number = 10} # this is a face card
if($number -eq 1){$number = 11 } # this is a ACE
$number #this returns the a number between 1 and 11 to the statment that called it
}
#
#This Function reteives a random number representing a card and returns it value to the calling statement
function Get-Card {
$number = 0
$number = $randomNo.Next(1,14)
#if($number -eq 1){$number = 11} # this is an ACE
if($number -gt 10){$number = 10} # this is a face card
if($number -eq 1){$number = Ace } # this is a ACE
$number #this returns the a number between 1 and 11 to the statment that called it
}
#
#This function is responsible for managing the computers hand
function Get-ComputerHand {
$tempCard = 0
While($computerHand -lt 17){
$tempCard = Get-CardC
$script:computerHand = $script:computerHand + $tempCard
}
}
#
#This Function Analyzes and displays the resutls of each game
function Analyze-Results{
clear-host
$pct = $script:count + 1
Write-host "`n`n`n`n`t`tResults of current hand:`n`n"
#write-host "The number of cards the player had $pct`n" #for design only
#write-host "Player Hand: $PlayerHand`n"
#Write-host "Computer Hand: $computerHand`n`n"
#Write-host "Total number of games played $gamecount`n"
if($playerBusted -eq "True"){
Write-host "`a`t`t You Have gone BUST!  >>--->" -foregroundColor black -backgroundColor White
$script:playerloss++
$script:CompWin++
}
else{
if($computerHand -gt "21"){
Write-host "`a`t THe computer has gone Bust!>>----->" -foregroundColor black -backgroundColor white
$Script:CompLoss++
$script:Playerwin++
}
else{
if($playerHand -gt $computerHand){
write-host "`a`t`t`t`t You Win!>>---->" -foregroundColor black -backgroundColor white
$script:playerwin++
$script:compLoss++
}
else{
if($playerHand -eq $computerHand){
write-host "`t`t`t Tie!!!  >---->>" -foregroundColor black -backgroundColor white
$script:ties++
}
if($playerHand -lt $computerHand){
Write-Host "`t`tYOU LOSE! >>---->" -foregroundColor black -backgroundColor white
$script:playerloss++
$script:CompWin++
}
}
}
}
stat
}
#
#This function displays the value of the both the player and the computers hand
#and prompts the player to take more cards or quit
#and creates the bust variable
function Get-PlayerHand {
$keepGoing = "True"
$response = " "
while( $keepGoing -eq "True"){
clear-host
switch($count){
1 { frist-deal }
2 { second-deal }
3 { fourth-deal}
4 { fourth-deal }
}
#write-host " the count is current set to $count" this line if for debuging
$response = Read-host "`n`n`nDo you want another card (y/n) or (S) to see your stats?"
if($response -eq "y"){
Get-NewCard
$script:count++
}
elseif($response -eq "S"){clear-host; stat}
elseif($response -eq "n"){
$KeepGoing = "Flase"
#$count = 0 might need this if the other clearing doesnt hold
clear-host
}
if($playerHand -gt 21){
$script:playerBusted = "True"
$KeepGoing = "Flase"
}
}
}
#
#This function is called whenever the player elects to get a new card
#and is responsible for updating the value of the var $playerHand
function Get-NewCard {
$tempCard = 0
$tempCard = Get-Card
$script:playerHand = $script:playerHand + $tempCard
if($script:count -eq 1){
$script:card3 = $tempCard
}
if($script:count -eq 2){
$script:card4 = $tempCard
}
}
#
#This is the Main Processing and Logic control section!
get-permission
while($playAgain -eq "true"){
Play-Game
$response = read-host "`n`n`n`n`n`n Press Enter to Play again or Q to quit"
if($response -eq "Q"){
$playAgain = "Flase"
Check-Registry
read-host
clear-host
}
else{
$playAgain = "true"
$playerBusted = "False"
}
}