FROM continuumio/miniconda3:main

USER root

# Set working directory
WORKDIR /workspace

# Copy environment.yml
COPY environment.yml .

# IMPORTANT: Ensure your environment.yml includes "openjdk=17" in the dependencies section!
RUN conda env create -f environment.yml

# Make sure environment is activated
SHELL ["conda", "run", "-n", "gps-analytics", "/bin/bash", "-c"]

ENV JAVA_HOME=/opt/conda/envs/gps-analytics
ENV PATH=$JAVA_HOME/bin:$PATH

# Install ipykernel
RUN python -m ipykernel install --user --name gps-analytics --display-name "Python (gps-analytics)"

COPY . /workspace

EXPOSE 8888

CMD ["conda", "run", "--no-capture-output", "-n", "gps-analytics", "jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]