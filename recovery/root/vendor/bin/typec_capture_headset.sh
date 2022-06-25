# sample usage: playback_capture_headset.sh
VOCALTRACT=$1

echo "enabling headset mic"

tinymix 'AIF1_CAP Mixer SLIM TX7' 1
tinymix 'CDC_IF TX7 MUX' 'DEC7'
tinymix 'SLIM_0_TX Channels' 'One'
tinymix 'ADC MUX7' 'AMIC'
tinymix 'AMIC MUX7' 'ADC2'
tinymix 'DEC7 Volume' 84
tinymix "MultiMedia1 Mixer SLIM_0_TX"  1
tinymix 'SLIM_0_TX SampleRate' 'KHZ_48'

# start recording
tinycap /data/test1_$VOCALTRACT.wav -r 48000 -b 16 -T 2 &
sleep 2

echo "disabling headset mic"
tinymix 'SLIM_0_TX Channels' 'One'
tinymix 'AIF1_CAP Mixer SLIM TX7' 0
tinymix 'CDC_IF TX7 MUX' 'ZERO'
tinymix 'AMIC MUX7' 'ZERO'
tinymix 'DEC7 Volume' 84
tinymix 'MultiMedia1 Mixer SLIM_0_TX' 0
tinymix 'SLIM_0_TX SampleRate' 'KHZ_48'
