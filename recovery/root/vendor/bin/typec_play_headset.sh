echo "enabling headphone"
tinymix "SLIM RX2 MUX" "AIF4_PB"
tinymix "SLIM RX3 MUX" "AIF4_PB"
tinymix "SLIM_6_RX Channels" "Two"
tinymix "RX INT1_2 MUX" "RX2"
tinymix "RX INT2_2 MUX" "RX3"
tinymix "COMP1 Switch" "0"
tinymix "COMP2 Switch" "0"
tinymix "HPHL Volume" "19"
tinymix "HPHR Volume" "19"
tinymix 'SLIMBUS_6_RX Audio Mixer MultiMedia1' 1

tinyplay /vendor/etc/RES1K.wav


echo "disabling headphone"
tinymix "SLIM RX2 MUX" "ZERO"
tinymix "SLIM RX3 MUX" "ZERO"
tinymix "SLIM_6_RX Channels" "Two"
tinymix "RX INT1_2 MUX" "ZERO"
tinymix "RX INT2_2 MUX" "ZERO"
tinymix "COMP1 Switch" "0"
tinymix "COMP2 Switch" "0"
tinymix "HPHL Volume" "19"
tinymix "HPHR Volume" "19"
tinymix 'SLIMBUS_6_RX Audio Mixer MultiMedia1' 0


