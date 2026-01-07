## Big Data GPS coordinates processing

### Build the project

This ensures complete reproducibility across Windows, macOS, and Linux.
0. You need to create a folder called ```data``` and to add ```gps_cleaned.csv``` inside it

1. Build and start the container: ```docker-compose up --build```

2. Open your browser and go to: http://localhost:8888 (you may need to enter a token, the token is generated in docker logs)

3. Select the ```Python (gps-analytics)``` kernel in Jupyter Lab.

Your notebooks and source code are automatically synced thanks to mounted volumes.

Jupyter Lab is running inside the container, with PySpark and all dependencies pre-installed.


## Something has changed in environment.yaml?

Use ```docker-compose up --build``` in a terminal to rebuild the whole docker image.