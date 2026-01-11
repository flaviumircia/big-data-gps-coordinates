## Big Data GPS coordinates processing

### Build the project

This ensures complete reproducibility across Windows, macOS, and Linux.

1. You need to create a folder called ```data``` and to add ```gps_cleaned.csv``` inside it

2. Build and start the container: ```docker-compose up --build```

3. Open your browser and go to: http://localhost:8888 (you may need to enter a token, the token is generated in docker logs)

4. Select the ```Python (gps-analytics)``` kernel in Jupyter Lab to create a new notebook.

Your notebooks and source code are automatically synced thanks to mounted volumes.

Jupyter Lab is running inside the container, with PySpark and all dependencies pre-installed.


## Something has changed in environment.yaml?

Use ```docker-compose up --build``` in a terminal to rebuild the whole docker image.