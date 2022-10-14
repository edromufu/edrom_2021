#!/usr/bin/env python3
# coding=utf-8
import os
import cv2
import cProfile, pstats, io
from pstats import SortKey
pr = cProfile.Profile()
pr.enable()
# ... do something ...

####################################################################################
# Código para gravar vídeo a partir da câmera

# Parâmetros
videoInput = "/dev/video0" # É de onde vai pegar as imagens, "/dev/video2" é pegando por um dos usbs (o numero muda) e 0 é a webcam
width = 640 # Largura da imagem (conferir no vídeo)
height = 480 # Altura da imagem (Conferir no vídeo)
pasta = "videos" # Pasta para salvar os videos

####################################################################################

videoName = "film.avi"
# Seta o nome do video para não sobrescrever
os.chdir("videos")
lista_de_arquivo = os.listdir(os.getcwd())
for i in range(len(lista_de_arquivo)):
    if not lista_de_arquivo.__contains__("film"+str(i+1)+".avi"):
        videoName = "film"+str(i+1)+".avi"
        break
os.chdir("..")

# Seta parametros do OpenCV
fourcc = cv2.VideoWriter_fourcc(*'XVID')
escritor = cv2.VideoWriter(os.path.join(os.path.expanduser('~'), 'edrom/src/vision/compilado_treinamento/videos/') + videoName, fourcc, 5.0, (width, height))

cap = cv2.VideoCapture(videoInput)

while True:
    _ , frame = cap.read()
    cv2.imshow("Camera", frame)
    escritor.write(frame)
    if cv2.waitKey(1) == ord("q"):
        cap.release()
        cv2.destroyAllWindows()
        break


pr.disable()
s = io.StringIO()
sortby = SortKey.CUMULATIVE
ps = pstats.Stats(pr, stream=s).sort_stats(sortby)
ps.print_stats()
print(s.getvalue())