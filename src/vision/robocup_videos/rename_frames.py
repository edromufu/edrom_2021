import os

os.chdir("frames_larc_2021/film5_12")
lista_de_frames = os.listdir(os.getcwd())
id_letters = "bf"

for frame in lista_de_frames:
    os.rename(frame, id_letters + frame)