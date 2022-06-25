# $1: wave file to write
# $2: audio source
#     0: default
#     1: main mic
#     2: top mic
#     3: back mic
#     4: front mic
# $3: sample rate(Hz)
# $4: sample bit
# $5: channel number
# $6: capture duration(s)
# tinycap file.wav [-D card] [-d device] [-c channels] [-r rate] [-b bits] [-p period_size] [-n n_periods] [-t duration]
# sample usage: capture_audio.sh /data/test1.wav 1 48000 16 2 10

sleep 10
rate=KHZ_48


function enable_headset_mic
{
	echo "enabling main mic"
	tinymix 'AIF1_CAP Mixer SLIM TX7' 1
	tinymix 'CDC_IF TX7 MUX' 'DEC7'
	tinymix 'SLIM_0_TX Channels' 'One'
	tinymix 'ADC MUX7' 'AMIC'
	tinymix 'AMIC MUX7' 'ADC2'
	tinymix 'DEC7 Volume' 84
}

function disable_headset_mic
{
	echo "disabling main mic"
	tinymix 'SLIM_0_TX Channels' 'One'
	tinymix 'AIF1_CAP Mixer SLIM TX7' 0
	tinymix 'CDC_IF TX7 MUX' 'ZERO'
	tinymix 'AMIC MUX7' 'ZERO'
	tinymix 'DEC7 Volume' 84
}
echo test > /sys/power/wake_lock
# setup
tinymix 'MultiMedia1 Mixer SLIM_0_TX' 1
tinymix 'SLIM_0_TX SampleRate' $rate

enable_headset_mic

# start recording
tinycap /data/test1.wav -r 48000 -b 16 -t 10

disable_headset_mic

tinymix 'MultiMedia1 Mixer SLIM_0_TX' 0
tinymix 'SLIM_0_TX SampleRate' 'KHZ_48'
echo test > /sys/power/wake_unlock
