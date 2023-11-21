<#
Program Name : rps.ps1
Date: 1/20/23
Author: Gabriel Caggiano
Corse: CIT361
I, Gabriel Caggiano, affirm that I wrote this script as original work completed by me.
#> 

<#
Write a rock paper scissors game
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


$i=0
$compy_wins=0
$user_wins=0
do {
    Write-Host "Let's play rock, paper, scissors.  Do you know how to play?" -ForegroundColor Blue
    $rules = Read-Host

    if ($rules -eq 'no' -or $rules -eq 'n') {
        Write-Host 'We each decide if we are going to pick rock, paper, scissors, lizard or spock secretly, then we reveal what we picked.' -ForegroundColor Blue
        Start-Sleep 1
        Write-Host 'Rock crushes scissors and lizard, scissors decapitates lizard and cuts paper, paper disproves Spock and covers rock, Spock smashes scissors and vaporizes rock, lizard eats paper and poisons Spock' -ForegroundColor Blue
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

    do {
        $compy_choice = 'rock','paper','scissors' | Get-Random
        Write-Host 'I am choosing' -ForegroundColor Blue
        Start-sleep 2
        switch ($compy_choice) {
            'rock'     {Write-host 'I have solidified my choice.' -ForegroundColor Blue}
            'paper'    {Write-host 'My choice is written.' -ForegroundColor Blue}
            'scissors' {Write-host 'The cheese is cut.' -ForegroundColor Blue}
            Default {'I cannot decide'}
        }
        Start-Sleep 1
        Write-Host 'What will you choose?  You can enter "r" for rock, "p" for paper, or "s" for scissors.' -ForegroundColor Blue
        $user_choice = Read-Host

        switch -Wildcard ($user_choice){
            {$_ -like 'r*'}{$user_choice='rock'}
            {$_ -like 'p*'}{$user_choice='paper'}
            {$_ -like 's*'}{$user_choice='scissors'}
            Default {$user_choice='invalid'}
        }
        <#I am not sure what I did wrong with my switch statement here.  It seemed to evaluate something like 'sr' as equal to anything with 's' in it, so it
        would print out multiple options, then it would not do the expression at the end to add 1 to wins for each player, maybe you can give me a pointer, I
        felt like a switch statement would be better looking than the really long if else statement I have going on.  But I am short on time this week so
        I did not want to lose too much time on it.#>


        #$compare = "$compy_choice$user_choice"

        <#switch ($compare) {
            {$_ -eq 'rr' -or $_ -eq 'rrock'}     {Write-Host "It is a tie!" "  I chose $compy_choice and you chose $user_choice." -ForegroundColor Blue}
            {$_ -eq 'rp' -or $_ -eq 'rpaper'}    {Write-Host "You win!" -ForegroundColor Green "  I chose $compy_choice and you chose $user_choice." }  {$user_wins+=1}
            {$_ -eq 'rs' -or $_ -eq 'rscissors'} {Write-Host "I win!"-ForegroundColor Red "  I chose $compy_choice and you chose $user_choice." }{$compy_wins   +=1}
            {$_ -eq 'pr' -or $_ -eq 'prock'}     {Write-Host "I win!"-ForegroundColor Red "  I chose $compy_choice and you chose $user_choice." }{$compy_wins   +=1}
            {$_ -eq 'pp' -or $_ -eq 'ppaper'}    {Write-Host "It is a tie!" "  I chose $compy_choice and you chose $user_choice." -ForegroundColor Blue}
            {$_ -eq 'ps' -or $_ -eq 'pscissors'} {Write-Host "You win!" -ForegroundColor Green "  I chose $compy_choice and you chose $user_choice." }  {$user_wins+=1}
            {$_ -eq 'sr' -or $_ -eq 'srock'}     {Write-Host "You win!" -ForegroundColor Green "  I chose $compy_choice and you chose $user_choice." }  {$user_wins+=1}        
            {$_ -eq 'sp' -or $_ -eq 'spaper'}    {Write-Host "I win!"-ForegroundColor Red "  I chose $compy_choice and you chose $user_choice." }{$compy_wins   +=1}
            {$_ -eq 'ss' -or $_ -eq 'sscissors'} {Write-Host "It is a tie!" "  I chose $compy_choice and you chose $user_choice." -ForegroundColor Blue}
            Default {}
        }#>

        Write-Host 'Ready?' -ForegroundColor Blue
        Start-Sleep 2
        Write-Host 'Rock, paper scissors, shoot!' -ForegroundColor Blue
        Start-Sleep 1
        if ($compy_choice -eq 'rock' -and $user_choice -eq 'rock') {
            Write-Host "It is a tie!" "  I chose $compy_choice and you chose $user_choice." 
        }
        elseif ($compy_choice -eq 'rock' -and $user_choice -eq 'paper' ) {
            Write-Host "You win!  I chose $compy_choice and you chose $user_choice." -ForegroundColor Green
            $user_game_wins+=1 
        }
        elseif ($compy_choice -eq 'rock' -and $user_choice -eq 'scissors') {
            Write-Host "I win!  I chose $compy_choice and you chose $user_choice." -ForegroundColor Red
            $compy_game_wins+=1
        }
        elseif ($compy_choice -eq 'paper' -and $user_choice -eq 'rock') {
            Write-Host "I win!  I chose $compy_choice and you chose $user_choice." -ForegroundColor Red
            $compy_game_wins+=1
        }
        elseif ($compy_choice -eq 'paper' -and $user_choice -eq 'paper') {
            Write-Host "It is a tie!" "  I chose $compy_choice and you chose $user_choice."
        }
        elseif ($compy_choice -eq 'paper' -and $user_choice -eq 'scissors' ) {
            Write-Host "You win!  I chose $compy_choice and you chose $user_choice." -ForegroundColor Green
            $user_game_wins+=1 
        }
        elseif ($compy_choice -eq 'scissors' -and $user_choice -eq 'rock' ) {
            Write-Host "You win!  I chose $compy_choice and you chose $user_choice." -ForegroundColor Green
            $user_game_wins+=1 
        }
        elseif ($compy_choice -eq 'scissors' -and $user_choice -eq 'paper') {
            Write-Host "I win!  I chose $compy_choice and you chose $user_choice." -ForegroundColor Red
            $compy_game_wins+=1
        }
        elseif ($compy_choice -eq 'scissors' -and $user_choice -eq 'scissors') {
            Write-Host "It is a tie!" "  I chose $compy_choice and you chose $user_choice."
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