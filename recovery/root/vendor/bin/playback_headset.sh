# $1: wave file to read
# $2: device for output
#     0: current
#     1: speaker
#     2: receiver

# tinyplay file.wav [-D card] [-d device] [-p period_size] [-n n_periods]
# sample usage: playback.sh 2000.wav  1
sleep 1
echo test > /sys/power/wake_lock
tinymix 'SLIM RX0 MUX' 'AIF1_PB'
tinymix 'SLIM RX1 MUX' 'AIF1_PB'
tinymix 'SLIM_0_RX Channels' 'Two'
tinymix 'RX INT1_1 MIX1 INP0' 'RX0'
tinymix 'RX INT2_1 MIX1 INP0' 'RX1'
tinymix 'SLIMBUS_0_RX Audio Mixer MultiMedia1' 1
tinymix 'RX INT1 DEM MUX' 'CLSH_DSM_OUT'
tinymix 'RX INT2 DEM MUX' 'CLSH_DSM_OUT'
tinymix 'COMP1 Switch' 1
tinymix 'COMP2 Switch' 1
tinyplay /vendor/etc/test.wav
sleep 1

tinymix 'SLIM RX0 MUX' 'ZERO'
tinymix 'SLIM RX1 MUX' 'ZERO'
tinymix 'SLIM_0_RX Channels' 'One'
tinymix 'RX INT1_1 MIX1 INP0' 'ZERO'
tinymix 'RX INT2_1 MIX1 INP0' 'ZERO'
tinymix 'SLIMBUS_0_RX Audio Mixer MultiMedia1' 0
echo test > /sys/power/wake_unlock
