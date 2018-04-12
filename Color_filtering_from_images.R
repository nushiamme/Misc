# Run this in the shell with Image Magick installed to remove certain colors 
# in this case black and 10% fuzz for similar colors

#convert respirometry_graph.jpg -channel rgba -alpha set -fuzz 10% -fill none -opaque cyan respir_test.png

#convert SaveMyTime_sample_graph.jpeg -channel rgba -alpha set -fuzz 10% -fill none -opaque white SaveMyTime_sample_graph_transp.jpeg

#To transform cyan to red and save into test folder
#mogrify .\Desktop\test -format png -fill red -fuzz 20% -opaque cyan *.png