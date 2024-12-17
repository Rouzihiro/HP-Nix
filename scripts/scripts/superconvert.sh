#!/bin/sh

# Create the output folder if it doesn't exist
mkdir -p converted

# Function to convert video
convert_video() {
    local input_file="$1"
    local output_file="$2"
    local video_codec="$3"
    local audio_codec="$4"
    local preset="$5"

    # If video codec is "passthrough", use copy (for video stream)
    if [ "$video_codec" = "Passthrough" ]; then
        video_codec="copy"
    fi

    # If audio codec is "Passthrough", use copy (for audio stream)
    if [ "$audio_codec" = "Passthrough" ]; then
        audio_codec="copy"
    fi

    # Convert the video with the selected options
    ffmpeg -i "$input_file" -c:v "$video_codec" -preset "$preset" -c:a "$audio_codec" "$output_file"
}

# Function to handle file selection (multiple files)
select_files() {
    local selected_files
    selected_files=$(find . -type f \( -iname \*.avi -o -iname \*.mp4 -o -iname \*.mkv -o -iname \*.flv -o -iname \*.webm \) | wofi --dmenu --multiple --prompt "Select video files")
    echo "$selected_files"
}

# Function to select video codec
select_video_codec() {
    local selected_video_codec
    selected_video_codec=$(echo -e "Passthrough\nlibx264\nlibx265" | wofi --dmenu --prompt "Select video codec")
    echo "$selected_video_codec"
}

# Function to select audio codec
select_audio_codec() {
    local selected_audio_codec
    selected_audio_codec=$(echo -e "Passthrough\naac\nmp3" | wofi --dmenu --prompt "Select audio codec")
    echo "$selected_audio_codec"
}

# Function to select preset (encoding speed)
select_preset() {
    local selected_preset
    selected_preset=$(echo -e "fast\nnormal\nslow" | wofi --dmenu --prompt "Select encoding preset")
    echo "$selected_preset"
}

# Get files to convert
files_to_convert=$(select_files)

# Check if any files were selected
if [ -z "$files_to_convert" ]; then
    notify-send "Video Conversion" "No files selected. Exiting."
    exit 1
fi

# Get video codec choice
video_codec_choice=$(select_video_codec)

# Check if a valid video codec is selected
if [ -z "$video_codec_choice" ]; then
    notify-send "Video Conversion" "No video codec selected. Exiting."
    exit 1
fi

# Get audio codec choice
audio_codec_choice=$(select_audio_codec)

# Check if a valid audio codec is selected
if [ -z "$audio_codec_choice" ]; then
    notify-send "Video Conversion" "No audio codec selected. Exiting."
    exit 1
fi

# Get encoding preset choice
preset_choice=$(select_preset)

# Check if a valid preset is selected
if [ -z "$preset_choice" ]; then
    notify-send "Video Conversion" "No preset selected. Exiting."
    exit 1
fi

# Process each selected file
for file_to_convert in $files_to_convert; do
    # Extract filename without extension
    output_file="converted/$(basename "$file_to_convert" .${file_to_convert##*.}).mkv"

    # Convert video
    convert_video "$file_to_convert" "$output_file" "$video_codec_choice" "$audio_codec_choice" "$preset_choice"
    notify-send "Video Conversion" "Conversion complete: $output_file"
done

