import cv2
import argparse
import os

"""
This script gets all the frames from a video and save in a folder.
"""

root_dir = os.path.expanduser('~') + '/edrom/'


def get_frames(video, image_folder):
	"""
	@brief      Save each frame in the desired image_folder.
	
	@param      <video>  { The video }
	@param 		<image_folder> { Save directory. }
	"""
	print video
	cap = cv2.VideoCapture(video)
	if(cap.isOpened() is False):
		print 'The video file is invalid.'

	frame_count = cap.get(cv2.CAP_PROP_FRAME_COUNT)
	while(cap.isOpened()):
		ret, frame = cap.read()
		if ret is True:
			files = os.listdir(image_folder)
			files = [os.path.splitext(file)[0] for file in files]
			files = [int(file) for file in files]
			files = sorted(files)
			
			if not files:
				last = 0
			else:
				last = files[-1]
			cv2.imwrite(image_folder + str(last+1) + '.png', frame)
			cv2.waitKey(1)
		if cap.get(cv2.CAP_PROP_POS_FRAMES) is frame_count:
			break
	cap.release()



def main(args):
	assert args.video is not None, 'You must set a source video.'

	video = root_dir + 'videos/' + args.video + '.avi'
	image_folder = root_dir + 'training_images/'
	
	if args.path is not None:
		image_folder = args.path

	get_frames(video, image_folder)

if __name__ == '__main__':
	parser = argparse.ArgumentParser(description='This script gets all the frames in a video.')
	parser.add_argument('-v', '--video', help='Source video.', required=True)
	parser.add_argument('-p', '--path', help='Output path.', required=False)

	args = parser.parse_args()
	main(args)