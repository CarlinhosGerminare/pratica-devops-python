# Dockerfile

# 1. Usar uma imagem base oficial do Python.
# A tag 'slim' é uma versão mais leve, ideal para produção.
FROM python:3.9-slim

# 2. Definir o diretório de trabalho dentro do container.
WORKDIR /app

# 3. Copiar o arquivo de dependências primeiro.
# Isso aproveita o cache do Docker: se o requirements.txt não mudar,
# o passo de instalação não será executado novamente.
COPY requirements.txt .

# 4. Instalar as dependências.
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copiar o restante do código da aplicação para o diretório de trabalho.
COPY . .

# 6. Comando que será executado quando o container iniciar.
CMD ["python", "app.py"]