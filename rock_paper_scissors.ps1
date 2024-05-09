<#
Program Name : rps.ps1
Date: 11/21/23
Author: Gabriel Caggiano
I, Gabriel Caggiano, affirm that I wrote this script as original work completed by me.
#> 

<#
Description
Rock paper scissors game
1.	A match consists of as many games as you would like to play
2.	A game consists of the best of three rounds of rock, paper, scissors. 
3.	Each round will flow as follows:
    3.1.	For each round, the script will pick a random item from rock, paper, and scissors, and keep it secret. 
    3.2.	The user will then be prompted to select rock, paper, or scissors. Allow the user to enter r for rock, p for paper, and s for scissors.
    3.3.	Scoring is as follows: rock beats scissors, paper beats rock, and scissors beats paper. If both choose the same item, the game is a tie and the round is played over. 
    3.4.	Rounds continue until either the computer or player wins two rounds.
4.	Keep track of games won for the computer and player.
5.	When a round is over, ask the user if they would like to play again. If so, play another game. 
6.	When the player is done, declare a winner. The winner is the one who won the most games. If they both win the same number of games, the match is declared a tie.
Hints
•	Read-Host
•	Write-Host
•	'rock','paper','sissors'|get-random
#>

#i variable tracks whether the program continues to run or not, while i is equal to 0 or less than 1, then the game will loop
$i=0

#the following variables track how many times the computer wins vs how times the user wins
$compy_wins=0
$user_wins=0

<#the whole game is a do while loop which starts here, it asks the user if they know how to play, if they enter n it explains the rules, if they answer y it goes right into the game and it makes its choice, then prompts the user to enter a choice.

We need to add in some coding that tracks the user input and remembers it for the 2nd and 3rd rounds of the game, and allows the computer to "remember" the last user guess and then have rules on how the computer has to choose based on the last user choice #>

#from the video in the resources, the correct strategy is, if you lose, play the thing that didnt come up, so if they played rock, play paper next, high chance of winners choosing the same thing twice.  If you win, then you should play the thing your oppenent just played or play the thing that would win against the thing you just played, example if they played rock, then you shold play rock next, or if you played paper, they will likely play scissors, so play rock.
#might need to add some code that has the computer evaluate whether they won or lost, and then choose accordingly, could add an if statement that still uses a switch, but now with two switches to determine computer choice based on whether the computer just won or lost

do {
    Write-Host "Let's play rock, paper, scissors, lizard, Spock.  Do you know how to play?" -ForegroundColor Blue
    $rules = Read-Host

    if ($rules -eq 'no' -or $rules -eq 'n') {
        Write-Host 'We each decide if we are going to pick rock, paper, scissors, lizard or spock secretly, then we reveal what we picked.' -ForegroundColor Blue
        Start-Sleep 1
        Write-Host 'Rock crushes scissors and lizard.' -ForegroundColor Blue
        Start-Sleep 1
        Write-Host 'Paper disproves Spock and covers rock.' -ForegroundColor Blue
        Start-Sleep 1
        Write-Host 'Scissors decapitates lizard and cuts paper.' -ForegroundColor Blue
        Start-Sleep 1
        Write-Host 'Lizard eats paper and poisons Spock.' -ForegroundColor Blue
        Start-Sleep 1
        Write-Host 'Spock smashes scissors and vaporizes rock.' -ForegroundColor Blue
        Start-Sleep 1
        Write-Host 'Best 2 out of 3 wins.' -ForegroundColor Blue
        Start-Sleep 1
    }
    elseif ($rules -eq 'yes' -or $rules -eq 'y') {
        Write-Host "Let's play!" -ForegroundColor Blue
    }
    else {
        $random = Get-Random -Minimum 0 -Maximum 9 
        $result = switch ($random) {
            0 {'A simple yes or no would have been fine'}
            1 {'Que?  No entiendes ingles?'}
            2 {'You have seen much, but do you understand?  Obviously not.'}
            3 {'You donut!'}
            4 {'per aspera ad astra'}
            5 {'mors mortem parit'}
            6 {'lux e tenebris'}
            7 {'6c6762'}
            8 {'死者を思い出す'}
            9 {'鬼滅の刃'}
            Default {'chi non fa, non falla'}
        }
        
        Write-Host $result
        Start-Sleep 2
        exit
        }

    $game_count = 0
    $compy_game_wins = 0
    $user_game_wins = 0
    #$last_user_choice = ''
    $last_compy_choice = ''

    do {
        $compy_choice = switch ($last_compy_choice) {
            'rock'     {'lizard','lizard','lizard','lizard','lizard','lizard','lizard','lizard','lizard','lizard','rock', 'paper', 'scissors', 'lizard', 'spock' | Get-Random}
            'paper'    {'rock','rock','rock','rock','rock','rock','rock','rock','rock','rock','rock', 'paper', 'scissors', 'lizard', 'spock' | Get-Random}
            'scissors' {'paper','paper','paper','paper','paper','paper','paper','paper','paper','paper','rock', 'paper', 'scissors', 'lizard', 'spock' | Get-Random}
            'lizard'   {'spock','spock','spock','spock','spock','spock','spock','spock','spock','spock','rock', 'paper', 'scissors', 'lizard', 'spock' | Get-Random}
            'spock'    {'scissors','scissors','scissors','scissors','scissors','scissors','scissors','scissors','scissors','scissors','rock', 'paper', 'scissors', 'lizard', 'spock' | Get-Random}                
            Default    {'rock', 'paper', 'paper', 'paper', 'paper', 'paper', 'scissors', 'lizard', 'spock' | Get-Random}
        }

        $last_compy_choice = $compy_choice
        
        Write-Host 'I am choosing' -ForegroundColor Blue
        Start-sleep 2
        Write-Host "I have my choice"
        Start-Sleep 1
        Write-Host 'What will you choose?  You can enter "r" for rock, "p" for paper, "sc" for scissors, "l" for lizard or "sp" for spock.' -ForegroundColor Blue
        $user_choice = Read-Host
        
        switch -Wildcard ($user_choice){
            {$_ -like 'r*'}{$user_choice='rock'}
            {$_ -like 'p*'}{$user_choice='paper'}
            {$_ -like 'sc*'}{$user_choice='scissors'}
            {$_ -like 'l*'}{$user_choice='lizard'}
            {$_ -like 'sp*'}{$user_choice='spock'}
            Default {$user_choice='invalid'}
        }

        #$last_user_choice = $user_choice

        Write-Host 'Ready?' -ForegroundColor Blue
        Start-Sleep 2
        Write-Host 'Rock, paper scissors, shoot!' -ForegroundColor Blue
        Start-Sleep 1
        if ($compy_choice -eq 'rock' -and $user_choice -eq 'rock') {
            Write-Host "It is a tie!  I chose $compy_choice and you chose $user_choice." 
        }
        elseif ($compy_choice -eq 'rock' -and $user_choice -eq 'paper') {
            Write-Host "You win!  I chose $compy_choice and you chose $user_choice." -ForegroundColor Green
            $user_game_wins+=1 
        }
        elseif ($compy_choice -eq 'rock' -and $user_choice -eq 'spock' ) {
            Write-Host "You win!  I chose $compy_choice and you chose $user_choice." -ForegroundColor Green
            $user_game_wins+=1 
        }
        elseif ($compy_choice -eq 'rock' -and $user_choice -eq 'lizard') {
            Write-Host "I win!  I chose $compy_choice and you chose $user_choice." -ForegroundColor Red
            $compy_game_wins+=1
        }
        elseif ($compy_choice -eq 'rock' -and $user_choice -eq 'scissors' ) {
            Write-Host "I win!  I chose $compy_choice and you chose $user_choice." -ForegroundColor Red
            $compy_game_wins+=1
        }
        elseif ($compy_choice -eq 'paper' -and $user_choice -eq 'paper') {
            Write-Host "It is a tie!  I chose $compy_choice and you chose $user_choice."
        }
        elseif ($compy_choice -eq 'paper' -and $user_choice -eq 'scissors') {
            Write-Host "You win!  I chose $compy_choice and you chose $user_choice." -ForegroundColor Green
            $user_game_wins+=1
        }
        elseif ($compy_choice -eq 'paper' -and $user_choice -eq 'lizard' ) {
            Write-Host "You win!  I chose $compy_choice and you chose $user_choice." -ForegroundColor Green
            $user_game_wins+=1
        }
        elseif ($compy_choice -eq 'paper' -and $user_choice -eq 'rock') {
            Write-Host "I win!  I chose $compy_choice and you chose $user_choice." -ForegroundColor Red
            $compy_game_wins+=1
        }
        elseif ($compy_choice -eq 'paper' -and $user_choice -eq 'spock') {
            Write-Host "I win!  I chose $compy_choice and you chose $user_choice." -ForegroundColor Red
            $compy_game_wins+=1
        }
        elseif ($compy_choice -eq 'scissors' -and $user_choice -eq 'scissors' ) {
            Write-Host "It is a tie!  I chose $compy_choice and you chose $user_choice."
        }
        elseif ($compy_choice -eq 'scissors' -and $user_choice -eq 'rock') {
            Write-Host "You win!  I chose $compy_choice and you chose $user_choice." -ForegroundColor Green
            $user_game_wins+=1 
        }
        elseif ($compy_choice -eq 'scissors' -and $user_choice -eq 'spock' ) {
            Write-Host "You win!  I chose $compy_choice and you chose $user_choice." -ForegroundColor Green
            $user_game_wins+=1 
        }
        elseif ($compy_choice -eq 'scissors' -and $user_choice -eq 'paper') {
            Write-Host "I win!  I chose $compy_choice and you chose $user_choice." -ForegroundColor Red
            $compy_game_wins+=1
        }
        elseif ($compy_choice -eq 'scissors' -and $user_choice -eq 'lizard') {
            Write-Host "I win!  I chose $compy_choice and you chose $user_choice." -ForegroundColor Red
            $compy_game_wins+=1
        }
        elseif ($compy_choice -eq 'lizard' -and $user_choice -eq 'lizard') {
            Write-Host "It is a tie!  I chose $compy_choice and you chose $user_choice."
        }
        elseif ($compy_choice -eq 'lizard' -and $user_choice -eq 'rock'){
            Write-Host "You win! I chose $compy_choice and you chose $user_choice." -ForegroundColor Green
            $user_game_wins+=1 
        }
        elseif ($compy_choice -eq 'lizard' -and $user_choice -eq 'scissors'){
            Write-Host "You win! I chose $compy_choice and you chose $user_choice." -ForegroundColor Green
            $user_game_wins+=1 
        }
        elseif ($compy_choice -eq 'lizard' -and $user_choice -eq 'paper') {
            Write-Host "I win!  I chose $compy_choice and you chose $user_choice." -ForegroundColor Red
            $compy_game_wins+=1
        }
        elseif ($compy_choice -eq 'lizard' -and $user_choice -eq 'spock') {
            Write-Host "I win!  I chose $compy_choice and you chose $user_choice." -ForegroundColor Red
            $compy_game_wins+=1
        }
        elseif ($compy_choice -eq 'spock' -and $user_choice -eq 'spock') {
            Write-Host "It is a tie!  I chose $compy_choice and you chose $user_choice."
        }
        elseif ($compy_choice -eq 'spock' -and $user_choice -eq 'paper') {
            Write-Host "You win! I chose $compy_choice and you chose $user_choice." -ForegroundColor Green
            $user_game_wins+=1
        }
        elseif ($compy_choice -eq 'spock' -and $user_choice -eq 'lizard') {
            Write-Host "You win! I chose $compy_choice and you chose $user_choice." -ForegroundColor Green
            $user_game_wins+=1
        }
        elseif ($compy_choice -eq 'spock' -and $user_choice -eq 'rock') {
            Write-Host "I win!  I chose $compy_choice and you chose $user_choice." -ForegroundColor Red
            $compy_game_wins+=1
        }
        elseif ($compy_choice -eq 'spock' -and $user_choice -eq 'scissors') {
            Write-Host "I win!  I chose $compy_choice and you chose $user_choice." -ForegroundColor Red
            $compy_game_wins+=1
        }
        else {
            Write-Host "You lose. Your entry was $user_choice"
            $compy_game_wins+=1
        }
       
        $game_count+=1

        if ($game_count -lt 3) {
            Write-Host 'Again!' -ForegroundColor Blue
        }

    }
    while (
        $game_count -lt 3
    )
    Write-Host 'Lets see who won...' -ForegroundColor Blue
    Start-Sleep 2
    Write-Host "You won $user_game_wins times, and I won $compy_game_wins times" -ForegroundColor Blue
    Start-Sleep 1 
    if ($compy_game_wins -gt $user_game_wins) {
        Write-Host 'I win!' -ForegroundColor Red
        $compy_wins+=1
    }
    elseif ($user_game_wins -gt $compy_game_wins) {
        Write-Host 'You win!' -ForegroundColor Green
        $user_wins+=1
    }
    else {
        Write-Host 'We tied.'
    }


    Start-Sleep 1
    Write-Host "I have won $compy_wins games."-ForegroundColor Blue
    Start-Sleep 1
    Write-Host "You have won $user_wins games" -ForegroundColor Blue
    Start-Sleep 1                   
    Write-Host 'Would you like to play again?' -ForegroundColor Blue
    $play_again = Read-Host

    if ($play_again -eq 'y' -or $play_again -eq 'yes') {
        Write-Host "Let's play again!" -ForegroundColor Blue
        Start-Sleep 1
    }
    elseif ($play_again -eq 'n' -or $play_again -eq 'no') {

        $i = 1
        if ($compy_wins -gt $user_wins) {
            Write-Host 'I win!' -ForegroundColor Red
            Start-Sleep 1
            Write-Host 'Goodbye!' -ForegroundColor Blue
        }
        elseif ($compy_wins -eq $user_wins) {
            Write-Host 'We tied for wins'
            Start-Sleep 1
            Write-Host 'Goodbye!' -ForegroundColor Blue
        }
        else {
            Write-Host 'You win!' -ForegroundColor Green
            Start-Sleep 1
            Write-Host 'Goodbye!' -ForegroundColor Blue
        }
    }
    else {
        exit
    }

} while (
    $i -lt 1
)