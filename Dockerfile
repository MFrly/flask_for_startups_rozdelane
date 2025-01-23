# Základní image s Pythonem
FROM python:3.9-slim

# Nastavení pracovního adresáře v kontejneru
WORKDIR /app

# Kopírování požadavků (requirements.txt) a jejich instalace
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Kopírování zbytku aplikace do pracovního adresáře
COPY . .

# Nastavení proměnné prostředí pro Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Expozice portu (defaultní Flask port je 5000)
EXPOSE 5000

# Příkaz pro spuštění aplikace
CMD ["flask", "run"]
