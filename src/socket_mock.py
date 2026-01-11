import socket
import sys
import time

#####################################################
#|                                                  |
#|       DO NOT MODIFY THIS SCRIPT!!!               |
#|                                                  |
#|###################################################

FILE_PATH = '/workspace/data/gps_cleaned.csv'
HOST = '0.0.0.0'
PORT = 9999
SPEED = 0.1

def start_server():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    # Clear out the port after stopping
    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

    try:
        s.bind((HOST, PORT))
        s.listen(1)
        print(f"Server started. Listening on {HOST}:{PORT}...")
        print(f"Streaming file: {FILE_PATH}")
    except socket.error as msg:
        print(f"Socket error: {msg}")
        sys.exit(1)
    while True:
        print("Waiting for client connection...")
        conn, addr = s.accept()
        print(f"Client connected from: {addr}")
        try:
            while True:
                with open(FILE_PATH, 'r', encoding='utf-8') as f:
                    header = next(f)

                    for line in f:
                        conn.send(line.encode('utf-8'))

                        time.sleep(SPEED)
                    print("EOF")
        except BrokenPipeError:
            print("Client (Spark) disconnected. Returning to listen mode.")
        except ConnectionResetError:
            print("Connection reset by peer.")
        except Exception as e:
            print(f"Unexpected error: {e}")
        finally:
            conn.close()



if __name__=='__main__':
    start_server()