# Use Miniconda base image
FROM continuumio/miniconda3:main

# 1. Install System Dependencies (Java)
# PySpark requires Java. Installing via apt is more robust than conda for system paths.
USER root
RUN apt-get update && \
    apt-get install -y openjdk-17-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 2. Set JAVA_HOME environment variable
# This ensures PySpark knows exactly where Java is located
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Set working directory
WORKDIR /workspace

# Copy environment.yml first (for caching)
COPY environment.yml .

# Create conda environment
RUN conda env create -f environment.yml

# Make sure environment is activated
SHELL ["conda", "run", "-n", "gps-analytics", "/bin/bash", "-c"]

# Install ipykernel in the environment
RUN python -m ipykernel install --user --name gps-analytics --display-name "Python (gps-analytics)"

# Copy project files
COPY . /workspace

# Expose Jupyter Lab port
EXPOSE 8888

# Start Jupyter Lab
CMD ["conda", "run", "--no-capture-output", "-n", "gps-analytics", "jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]