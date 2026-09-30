FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN python -m pip install --no-cache-dir -r requirements.txt

COPY serve.py .
COPY model ./model

EXPOSE 8080

CMD ["python", "-m", "uvicorn", "serve:app", "--host", "0.0.0.0", "--port", "8080"]