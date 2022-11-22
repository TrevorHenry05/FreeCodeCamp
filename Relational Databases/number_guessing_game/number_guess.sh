#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=numberguessinggame -t --no-align -c"

NUM=$(( RANDOM % 1000 ))

GET_USER() {
  echo -e "Enter your username:"
  read USERNAME

  USERID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

  if [[ -z $USERID ]]
  then
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username,games_played,best_game) VALUES('$USERNAME',0,0)")
    USERID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id=$USERID")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id=$USERID")
    
    echo -e "Welcome, $USERNAME! It looks like this is your first time here."
  else
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id=$USERID")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id=$USERID")

    echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi

  NUM_GUESSES=0
  GUESS

}

GUESS () {
  if [[ $1 ]]
  then
    echo -e "$1"
  else
    echo -e "Guess the secret number between 1 and 1000:"
  fi
  read GUESS
  
  if  ! [[ $GUESS =~ ^[0-9]+$ ]]
  then 
    GUESS "That is not an integer, guess again:"
  else
    if [[ $GUESS -eq $NUM ]]
    then
      (( NUM_GUESSES++ ))
      echo -e "You guessed it in $NUM_GUESSES tries. The secret number was $NUM. Nice job!"
      (( GAMES_PLAYED++ ))
      UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE user_id=$USERID")

      if [[ $BEST_GAME -eq 0 ]]
      then
        UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game=$NUM_GUESSES WHERE user_id=$USERID")
      else
        if [[ $BEST_GAME -gt $NUM_GUESSES ]]
        then
          UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game=$NUM_GUESSES WHERE user_id=$USERID")
        fi
      fi
    else
      if [[ $GUESS -lt $NUM ]]
      then
        (( NUM_GUESSES++ ))
        GUESS "It's higher than that, guess again:"
      else
        (( NUM_GUESSES++ ))
        GUESS "It's lower than that, guess again:"
      fi
    fi
  fi
}

GET_USER