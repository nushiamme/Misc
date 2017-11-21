# Run this in the shell with Image Magick installed to remove certain colors 
# in this case black and 10% fuzz for similar colors

#convert BlueThroated_hummingbird_peeing_crop.jpg -channel rgba -alpha set -fuzz 10% -fill none -opaque black BLUH_Pee_crop_test.png

#convert SaveMyTime_sample_graph.jpeg -channel rgba -alpha set -fuzz 10% -fill none -opaque white SaveMyTime_sample_graph_transp.jpeg