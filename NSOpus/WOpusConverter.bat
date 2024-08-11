@echo off
setlocal

:: Check if input files are provided
if "%~1"=="" (
    echo No input files provided. Please drag-and-drop .wav, .mp4, or .mp3 files onto this script.
    pause
    exit /b 1
)

echo Handburger's .wav/mp4/mp3/flac to s16le PCM to Nintendo Switch OPUS converter!
echo Credits to ffmpeg and masagrator for the MHGU opus encoder.

:: Loop through input files
:loop
if "%~1"=="" goto endloop

:: Extract filename without extension and path
for %%f in ("%~1") do (
    set "input_file=%%~nf"
    set "input_path=%%~dpf"
)

:: Define file names
set "wav_file=%input_path%%input_file%.wav"
set "resampled_file=%input_path%%input_file%_48kHz.wav"
set "raw_file=%input_path%%input_file%.raw"
set "opus_file=%input_path%%input_file%.opus"

:: Convert mp4 or mp3 to wav if needed
if /i "%~x1"==".mp4" (
    echo Converting "%~1" to WAV...
    ffmpeg.exe -i "%~1" -hide_banner -loglevel error "%wav_file%" || goto error_wav
) else if /i "%~x1"==".mp3" (
    echo Converting "%~1" to WAV...
    ffmpeg.exe -i "%~1" -hide_banner -loglevel error "%wav_file%" || goto error_wav
) else if /i "%~x1"==".flac" (
    echo Converting "%~1" to WAV...
    ffmpeg.exe -i "%~1" -hide_banner -loglevel error "%wav_file%" || goto error_wav
) else if /i "%~x1"==".wav" (
    set "wav_file=%~1"
) else (
    echo Unsupported file type: %~1
    shift
    goto loop
)

:: Resample to 48kHz and convert to raw PCM
ffmpeg.exe -i "%wav_file%" -ar 48000 -ac 2 -hide_banner -loglevel error "%resampled_file%" || goto error_resample
ffmpeg.exe -i "%resampled_file%" -f s16le -acodec pcm_s16le -hide_banner -loglevel error "%raw_file%" || goto error_pcm

:: Convert to .opus
NXAenc -i "%raw_file%" -o "%opus_file%" || goto error_opus

echo Conversion for "%~1" into "%opus_file%" successfully completed.

:: Clean up temporary files
del "%resampled_file%" "%raw_file%" "%wav_file%"
echo Temporary files deleted.

:: Display completion
cls
echo [##############################] 100%% completed.

:: Open the folder containing the .opus file
start "" "%input_path%"

:: Shift to the next file
shift
goto loop

:endloop
echo All conversions completed.
pause
exit /b

:: Error handling
:error_wav
echo Failed to convert "%~1" to WAV
pause
exit /b

:error_resample
echo Failed to resample "%wav_file%" to 48kHz
pause
exit /b

:error_pcm
echo Failed to convert "%resampled_file%" to raw PCM
pause
exit /b

:error_opus
echo Failed to convert "%raw_file%" to "%opus_file%"
pause
exit /b
