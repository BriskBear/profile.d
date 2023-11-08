# Beep stuff with audio-drivers : 1699408440
alarm() {
  ( speaker-test --frequency $1 --test sine )&
  pid=$!
  sleep 0.${2}s
  kill -9 $pid
}

alias success='alarm 440 250 ; alarm 660 250 ; alarm 220 125 ; alarm 330 125 ; alarm 440 500'
