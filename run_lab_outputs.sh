#!/bin/bash
# Run this inside the IBM Skills Network lab terminal.
# It saves the terminal outputs for tasks 2b, 3b, 4b and 5b in the outputs folder.
cd "$(dirname "$0")"
python3 -m pip install -q requests flask > /dev/null 2>&1
mkdir -p outputs

repl() {
  printf '%s\nexit()\n' "$2" | script -q -c python3 /dev/null | tr -d '\r' > "outputs/$1"
  echo "===== $1"; cat "outputs/$1"; echo
}

repl 2b_application_creation 'from EmotionDetection.emotion_detection import emotion_detector
emotion_detector("I love this new technology.")'

repl 3b_formatted_output_test 'from EmotionDetection.emotion_detection import emotion_detector
emotion_detector("I am so happy I am doing this")'

repl 4b_packaging_test 'from EmotionDetection.emotion_detection import emotion_detector
emotion_detector("I hate working long hours")'

{ echo "\$ python3 test_emotion_detection.py"; python3 test_emotion_detection.py; } > outputs/5b_unit_testing_result 2>&1
echo "===== 5b_unit_testing_result"; cat outputs/5b_unit_testing_result
