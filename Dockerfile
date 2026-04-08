FROM python:3.11-slim

WORKDIR /app

# 安装系统依赖 (curl/wget 用于 file_cache 图片/视频下载)
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

# 安装 Python 依赖
COPY requirements.txt .
RUN pip install --no-cache-dir --root-user-action=ignore -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["python", "main.py"]
