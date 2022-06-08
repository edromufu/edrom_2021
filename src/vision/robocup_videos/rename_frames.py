import os

os.chdir("paulo/Paulo")
lista_de_frames = os.listdir(os.getcwd())
id_letters = "ball_0"

count = 3271

for frame in lista_de_frames:
    os.rename(frame, id_letters + str(count))
    count = count + 1