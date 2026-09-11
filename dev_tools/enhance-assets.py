#Creates upscaled copies of all png files in 1x (will replace anything already in 2x)

from PIL import Image
import os

os.chdir(os.path.dirname(os.path.abspath(__file__)).replace("dev_tools","assets"))

try:
    os.listdir("2x")
except:
    os.mkdir("2x")

files=os.listdir("1x")
for i in files:
    if ".png" in i:
        image=Image.open("1x/"+i)
        size=image.size
        enhanced = Image.new( 'RGBA', (size[0]*2,size[1]*2), (0,0,0,0))
        pixels=enhanced.load()
        image=image.load()
        for x in range(size[0]):
            for y in range(size[1]):
                for a in range(2):
                    for b in range(2):
                        pixels[x*2+a,y*2+b]=image[x,y]
        enhanced.save("2x/"+i)
