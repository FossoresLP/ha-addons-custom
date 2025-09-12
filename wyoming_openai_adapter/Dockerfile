ARG BUILD_FROM
FROM $BUILD_FROM

# Install system dependencies
RUN apk add --no-cache \
    python3 \
    py3-pip \
    build-base \
    python3-dev \
    linux-headers

# Set working directory
WORKDIR /app

# Copy requirements
COPY requirements.txt .

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy source code
COPY src/ ./src/
COPY pyproject.toml .
COPY setup.py .

# Install the package
RUN pip3 install --no-cache-dir -e .

# Copy run script
COPY run.sh .
RUN chmod +x run.sh

CMD ["./run.sh"]