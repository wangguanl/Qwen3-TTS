# 运行命令

- 项目：Qwen3-TTS
- 生成时间：2026-09-09
- 运行方式：直接运行（`.venv` + `qwen-tts-demo` Gradio）
- 硬件评估：**满足**（1.7B bf16 约数 GB～8GB 量级，空卡约 15GB）

## 环境准备

```powershell
$env:Path = "E:\Programs\ffmpeg-master-latest-win64-gpl\bin;" + $env:Path
cd E:\AI\local-voice\Qwen3-TTS
$env:HF_ENDPOINT = "https://hf-mirror.com"
$env:HF_HUB_CACHE = "E:\huggingface_cache"

# 已有 .venv（Python 3.10 + torch 2.6.0+cu124 + qwen_tts）。若重建：
# uv venv --python 3.12
# uv pip install -e . -i https://pypi.tuna.tsinghua.edu.cn/simple
```

本机模型：`E:\models\Qwen3-TTS-12Hz-1.7B-Base`（另有 HF cache 中 0.6B/1.7B Base）。无本地 CustomVoice 目录。

## 启动

- 推荐：`pwsh -NoProfile -File .\start.ps1`
- 说明：单服务，跳过菜单，直接启 Gradio demo（端口起点 8000）。
- 等价手动：

```powershell
.\.venv\Scripts\qwen-tts-demo.exe E:\models\Qwen3-TTS-12Hz-1.7B-Base --ip 127.0.0.1 --port 8000 --no-flash-attn --dtype bfloat16
```

## 验证

1. `qwen-tts-demo --help` 与 `import qwen_tts` 已通过（有 SoX / flash-attn 警告，不阻断）。
2. 打开 `http://127.0.0.1:8000` 能出音频。
3. **未长时间启动 GPU WebUI**。

## 备注 / 发现问题

- **缺少系统 SoX**：导入时警告 `SoX could not be found`（音频 I/O 部分场景可能受影响；ffmpeg 已在 PATH）。
- **未装 flash-attn**：脚本使用 `--no-flash-attn` + `sdpa`/`bfloat16`（与旧 `start.bat` 一致）。
- 旧 `start.bat` 仍可用；日常请走 `start.ps1`。
- HF 慢用镜像；PyPI 用清华。
