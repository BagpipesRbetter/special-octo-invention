#!/bin/bash

current_week=$(date +\%V)  # Get the current week number
even_week=$((current_week % 2))

if [ $even_week -eq 0 ]; then
    # List of names
people=("Evan" "Jet" "Rockwell" "Andrew" "Mason" "Nathan" "Hudson")

# List of potential leaders
leaders=("Jensen" "Bishop" "Smith")

# Choose random people
chosen_people=()
for (( i=0; i<2; i++ )); do
    random_index=$(( RANDOM % ${#people[@]} ))
    chosen_people+=("${people[$random_index]}")
    unset "people[$random_index]"
    people=("${people[@]}")
done

# Choose a random leader
random_leader_index=$(( RANDOM % ${#leaders[@]} ))
chosen_leader="${leaders[$random_leader_index]}"

# Prepare the text message
text="Hello everyone the two people with the lesson this week are ${chosen_people[0]}, ${chosen_people[1]} along with backup from $chosen_leader."

# API URL
api_url="https://api.groupme.com/v3/bots/post"

# Bot ID
bot_id="cea30f1265f1a1daa7bfb04104"

# Send the message using curl
curl -d "{\"text\": \"$text\", \"bot_id\": \"$bot_id\"}" "$api_url"
    echo "Running script on even week."
else
    echo "Skipping script on odd week."
fi