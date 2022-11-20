#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

#check for argument
if [[ -z $1 ]]
then
  #print to provide argument
  echo -e "Please provide an element as an argument."
else
  #if a integer
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    #get atomic number for integer
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1")
  else
    #get atomic number for not integer
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$1' OR symbol = '$1'")
  fi 

  #if element not found
  if  [[ -z $ATOMIC_NUMBER ]]
  then 
    echo -e "I could not find that element in the database."
  else
    #get element info
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
    MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
    TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
    TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID")

    #format out put
    SYMBOL=$(echo $SYMBOL | sed 's/|[A-Z][a-z]*|[-.a-zA-Z0-9]*|[-.a-zA-Z0-9]*|[-.a-zA-Z0-9]*|[a-z]*//')
    NAME=$(echo $NAME | sed 's/|[-.a-zA-Z0-9]*|[-.a-zA-Z0-9]*|[-.a-zA-Z0-9]*|[a-z]*//')
    MELTING_POINT=$(echo $MELTING_POINT | sed 's/|[-.a-zA-Z0-9]*|[-.a-zA-Z0-9]*|[a-z]*//')
    BOILING_POINT=$(echo $BOILING_POINT | sed 's/|[-.a-zA-Z0-9]*|[a-z]*//')
    MASS=$(echo $MASS | sed 's/|[a-z]*//')
    TYPE=$(echo $TYPE |sed 's/[-.0-9]*|//')

    #print info
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi
fi