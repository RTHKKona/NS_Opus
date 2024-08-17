# Audio/Video to OPUS Converter

## Refer to Hand_Modkit for updates and improvements!

This project provides a batch script for converting `.wav, .mp3, and .mp4` audio files to `.opus` format, specifically designed for compatibility with Nintendo Switch audio. The script utilizes `ffmpeg` for audio processing and a custom OPUS encoder for Monster Hunter Generations Ultimate (written by masagrator!).

## Features

- **Supports Multiple File Formats**: Convert `.mp3`, `.wav`, and  `.mp4` files to `.opus`.
- **Batch Processing**: Drag-and-drop multiple files to convert them in a single operation.
- **Temporary File Management**: Automatically deletes temporary files created during conversion.
- **Progress Indication**: Displays a progress bar during conversion.
- **Error Handling**: Provides informative error messages for failed conversions.
- **Folder Opening**: Automatically opens the output folder after conversion for easy access.

## Prerequisites

Before using the script, ensure that you have the following dependencies in the same directory:

- **ffmpeg**: A powerful multimedia framework for handling audio and video.
- **NXAenc**: A custom OPUS encoder used for creating `.opus` files.

You can download `ffmpeg` from the official site: [FFmpeg](https://ffmpeg.org/download.html).

## Usage

1. **Download the Script**: Clone or download this repository to your local machine.
   
   ```bash
   git clone https://github.com/yourusername/repository.git
   cd repository
2. **Place Dependencies**: Put ffmpeg.exe and NXAenc.exe in the same directory as the .bat file.
3. **Drag-and-Drop .wav or .mp4 files** onto the `converter.bat`
4. **Get your .opus files** xdd

## Important
- The bat file assumes you have read and write permissions to the output directory. Ensure this is the case.

#### Contributing
Contributions are welcome! If you have suggestions for improvements or additional features, feel free to open an issue or submit a pull request.

#### License
Check license section for more details.

## Acknowledgements
- Special thanks to FFmpeg for providing the multimedia framework.
- Thanks to masagrator for the OPUS encoder.
