#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guessing --tuples-only -c"



echo -e "Enter your username:"
read NAME

# finding user in database
NAME_RESULT=$($PSQL "SELECT name, number_of_games, min_guess FROM users WHERE name='$NAME'")

# if user is not in database
if [[ -z $NAME_RESULT ]]
 then

    echo -e "\nWelcome, $NAME! It looks like this is your first time here."
    # inserting in database
    INSERT_INTO_DATABASE=$($PSQL "INSERT INTO users(name,number_of_games) VALUES('$NAME',1)")

  else

# if user is already in database.
  echo $NAME_RESULT | while read DB_NAME BAR GAMES BAR MIN_GUESS
  do
      echo -e "\nWelcome back, $DB_NAME! You have played $GAMES games, and your best game took $MIN_GUESS guesses."

      # updating number of games playerd
      
      GAMES=$((GAMES+1))
      INSERT_INTO_DB=$($PSQL "UPDATE users SET number_of_games=$GAMES WHERE name='$DB_NAME'")
  done
   
fi

   # generating random number.
   RANDOM_NUMBER=$(($RANDOM%1000+1))
   echo -e "\nGuess the secret number between 1 and 1000:"
   read GUESS
#  counting the number of tries.
   NUMBER_OF_GUESS=1

   while [ $GUESS != $RANDOM_NUMBER ]
    do
     NUMBER_OF_GUESS=$((NUMBER_OF_GUESS+1))

     if [[ ! $GUESS =~ ^[0-9]+$ ]]
      then
# if input is not an integer.
      echo -e "\nThat is not an integer, guess again:"
      read GUESS
      

      else
#  if input is higher than guess
       if [[ $GUESS > $RANDOM_NUMBER ]]
        then
        echo -e "\nIt's lower than that, guess again:"
        read GUESS
      
        
        elif [[ $GUESS < $RANDOM_NUMBER ]]
        then
         echo -e "\nIt's higher than that, guess again:"
         read GUESS
    
      fi
        fi
    done
# conclusion of the game
    echo -e "\nYou guessed it in $NUMBER_OF_GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"

    DB_guess=$($PSQL "SELECT min_guess FROM users WHERE name='$NAME'")

    if [[ -z $DB_GUESS ]]
    then
     INSERT=$($PSQL "UPDATE users SET min_guess=$NUMBER_OF_GUESS WHERE name='$NAME'")

    elif [[ $DB_GUESS > $NUMBER_OF_GUESS ]]
     then
       INSERT=$($PSQL "UPDATE users SET min_guess=$NUMBER_OF_GUESS WHERE name='$NAME'")
    fi



    
 

