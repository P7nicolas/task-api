# Utiliza uma imagem oficial do Python
FROM python:3.12-slim

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia o arquivo de dependências
COPY requirements.txt .

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia o código da aplicação
COPY app.py .

# Expõe a porta utilizada pela aplicação
EXPOSE 5000

# Inicia a aplicação
CMD ["python", "app.py"]