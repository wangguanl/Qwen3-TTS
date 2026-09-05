@echo off
REM ============================================================
REM  Qwen3-TTS Web UI launcher
REM  Model : E:\models\Qwen3-TTS-12Hz-1.7B-Base (voice clone)
REM  Attn  : sdpa (PyTorch built-in FlashAttention, no CUDA Toolkit)
REM  URL   : http://127.0.0.1:8000/
REM ============================================================
cd /d "%~dp0"

REM Hugging Face cache dir (reuse existing model cache)
set HF_HUB_CACHE=E:\huggingface_cache

REM Extend PATH (uv / Python executables)
set "PATH=%USERPROFILE%\.local\bin;%LOCALAPPDATA%\Programs\Python\Python310;%LOCALAPPDATA%\Programs\Python\Launcher;%PATH%"

echo.
echo  [Qwen3-TTS] Starting Web UI, please wait (model load ~5s)...
echo  [Qwen3-TTS] Open http://127.0.0.1:8000/ in your browser when ready.
echo  [Qwen3-TTS] Close this window to stop the server.
echo.

".venv\Scripts\qwen-tts-demo.exe" "E:\models\Qwen3-TTS-12Hz-1.7B-Base" --ip 127.0.0.1 --port 8000 --no-flash-attn --dtype bfloat16

echo.
echo  [Qwen3-TTS] Server stopped.
pause
