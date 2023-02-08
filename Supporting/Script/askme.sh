#!/bin/bash

echo "Como posso ajudar ?"
read question
PROMPT='{"prompt":"'${question}'"}'
echo $PROMPT
RESULT=$(curl -X POST -H "Authorization: Bearer ${OPENAI_KEY}" -H "Content-Type: application/json" --data "$PROMPT" https://api.openai.com/v1/engines/davinci/jobs)
echo $RESULT
