
# Brain Tumour Detection from MRI images using Signal

```
Pratyush Pandey
Dept of EE, IIT Delhi
```

## How to run
Clone this repository in your PC and run the file 'check.m'. You might want to change the path in the code to point towards the brain MRI you are interested in analysing first.

For More information on how this project was made read "report.pdf".

For a quick runthrough of the code open "presentation.ppt".




Abstract

Medical image processing is the most challenging and emerging field now a
days. Processing of MRI images becomes an integral part because of the fact
that it is easy to analyze them compared to CT Scan etc as morphological,
segmentation, contrast enhancement etc can be easily applied to them. This
paper describes the proposed strategy to detect extraction of brain tumour
from patients MRI scan images of the brain. This method incorporates with
some noise removal functions, segmentation and morphological operations
which are the basic concepts of image processing. Detection and extraction
of tumour from MRI scan images of the brain is done by using MATLAB
software.

Keywords: MRI, segmentation, morphology, MATLAB

1. Introduction

Tumour is defined as the abnormal growth of the tissues. Brain tumor
is an abnormal mass of tissue in which cells grow and multiply uncontrol-
lably, seemingly unchecked by the mechanisms that control normal cells.
Brain tumors can be primary or metastatic, and either malignant or benign.
A metastatic brain tumor is a cancer that has spread from elsewhere in the
body to the brain Epilepsy is a brain disorder in which clusters of nerve cells,
or neurons, in the brain sometimes signal abnormally. Neurons normally gen-
erate electrochemical impulses that act on other neurons, glands, and muscles
to produce human thoughts, feelings, and actions. In epilepsy, the normal
pattern of neuronal activity becomes disturbed, causing strange sensations,
emotions, and behavior or sometimes convulsions, muscle spasms, and loss
of consciousness [3]. Magnetic Resonance Imaging (MRI) is an advanced

Preprint submitted to Journal Name November 26, 2018


medical imaging technique used to produce high quality images of the parts
contained in the human body MRI imaging is often used when treating brain
tumours, ankle, and foot. From these high-resolution images, we can derive
detailed anatomical information to examine human brain development and
discover abnormalities. Nowadays there are several methodology for classi-
fying MR images, which are fuzzy methods, neural networks, atlas methods,
knowledge based techniques, shape methods, variation segmentation. MRI
consists of T1 weighted, T2 weighted and PD (proton density) weighted im-
ages and are processed by a system which integrates fuzzy based technique
with multispectral analysis [2]. Pre-processing of MRI images is the primary
step in image analysis which perform image enhancement and noisereduc-
tion techniques which are used to enhance the image quality, then some
morphological operations are applied to detect the tumor in the image. The
morphological operations are basically applied on some assumptions about
the size and shape of the tumour and in the end the tumour is mapped onto
the original gray scale image with 255 intensity to make visible the tumour
in the image. The algorithm has been tried on a number of patients MRI
data of brain tumour images in.

2. Methodology

The algorithm has two stages, first is pre-processing of given MRI im-
age and after that segmentation and then perform morphological operations.
Steps of algorithm are as following:-

1. Give MRI image of brain as input.
2. Convert it to gray scale image.
3. Apply high pass filter for noise removal.
4. Apply median filter to enhance the quality of image.
5. Compute threshold segmentation.
6. Compute morphological operation.
7. Finally output will be a tumour region.

```
All above steps are explained here in detail.
```
2.1. Grayscale Imaging

MRI images are magnetic resonance images which can be acquired on
computer when a patient is scanned by MRI machine. We can acquire MRI


images of the part of the body which is under test or desired. Generally when
we see MRI images on computer they looks like black and white images. In
analog practice, gray scale imaging is sometimes called ”black and white,”
but technically this is a misnomer. In true black and white, also known
as halftone, the only possible shades are pure black and pure white. The
illusion of gray shading in a halftone image is obtained by rendering the
image as a grid of black dots on a white background (or viceversa), with
the sizes of the individual dots determining the apparent lightness of the
gray in their vicinity. The halftone technique is commonly used for printing
photographs in newspapers and as MRI image is taken on computer then In
the case of transmitted light (for example, the image on a computer display),
the brightness levels of the red (R), green (G) and blue (B) components are
each represented as a number from decimal 0 to 255, or binary 00000000
to 11111111. For every pixel in a red-green-blue ( RGB ) grayscale image,
R=G=B. The lightness of the gray is directly proportional to the number
representing the brightness levels of the primary colors. Black is represented
byR=G=B= 0 orR=G=B= 00000000, and white is represented by
R=G=B= 255 orR=G=B= 11111111. Because there are 8 bit s
in the binary representation of the gray level, this imaging method is called
8-bit grayscale.
Grayscale is a range of shades of gray without apparent color. The darkest
possible shade is black, which is the total absence of transmitted or reflected
light. The lightest possible shade is white, the total transmission or reflection
of light at all visible wavelengths. So because of the above reasons first we
convert our MRI image to be pre-processed in grayscale image.

2.2. High Pass Filter

After that image is given as an input to high pass filter. A high pass filter
is the basis for most sharpening methods. An image is sharpened when con-
trast is enhanced between adjoining areas with little variation in brightness
or darkness.
A high pass filter tends to retain the high frequency information within an
image while reducing the low frequency information. The kernel of the high
pass filter is designed to increase the brightness of the center pixel relative to
neighboring pixels. The kernel array usually contains a single positive value
at its center, which is completely surrounded by negative values.


2.3. Median Filter

In signal processing, it is often desirable to be able to perform some kind
of noise reduction on an image or signal. The median filter is a nonlinear
digital filtering technique, often used to remove noise. Such noise reduction
is a typical pre-processing step to improve the results of later processing (for
example, edge detection on an image). Median filtering is very widely used
in digital image processing because, under certain conditions, it preserves
edges while removing noise. The main idea of the median filter is to run
through the signal entry by entry, replacing each entry with the median of
neighboring entries. The pattern of neighbors is called the ”window”, which
slides, entry by entry, over the entire signal. For 1D signals, the most obvious
window is just the first few preceding and following entries, whereas for 2D (or
higherdimensional) signals such as images, more complex window patterns
are possible (such as ”box” or ”cross” patterns). Note that if the window
has an odd number of entries, then the median is simple to define: it is just
the middle value after all the entries in the window are sorted numerically.
For an even number of entries, there is more than one possible median. This
filter enhance the quality of the MRI image.

3. Threshold Segmentation

The simplest method of image segmentation is called the thresholding
method. This method is based on a clip-level (or a threshold value) to turn a
gray-scale image into a binary image. The key of this method is to select the
threshold value (or values when multiple-levels are selected). Several popu-
lar methods are used in industry including the maximum entropy method,
Otsu’s method (maximum variance), and et all. k-means clustering can also
be used. In computer vision, Segmentation is the process of partitioning a
digital image into multiple segments (sets of pixels, also known as superpix-
els). The goal of segmentation is to simplify and/or change the representation
of an image into something that is more meaningful and easier to analyze.[1]
Image segmentation is typically used to locate objects and boundaries (lines,
curves, etc.) in images. More precisely, image segmentation is the process of
assigning a label to every pixel in an image such that pixels with the same
label share certain visual characteristics. The result of image segmentation is
a set of segments that collectively cover the entire image, or a set of contours
extracted from the image (see edge detection). Each of the pixels in a region
are similar with respect to some characteristic or computed property, such as


color, intensity, or texture. Adjacent regions are significantly different with
respect to the same characteristic(s).[1] When applied to a stack of images,
typical in Medical imaging, the resulting contours after image segmentation
can be used to create 3D reconstructions with the help of interpolation algo-
rithms like Marching cubes.

1. A set of markers, pixels where the flooding shall start, are chosen. Each
    is given a different label.
2. The neighboring pixels of each marked area are inserted into a priority
    queue with a priority level corresponding to the gray level of the pixel.
3. The pixel with the highest priority level is extracted from the priority
    queue. If the neighbors of the extracted pixel that have already been
    labeled all have the same label, then the pixel is labeled with their
    label. All non-marked neighbors that are not yet in the priority queue
    are put into the priority queue.
4. Redo step 3 until the priority queue is empty. The non-labeled pixels
    are the watershed lines.

3.1. Morphological Operations

Morphological image processing is a collection of nonlinear operations
related to the shape or morphology of features in an image. According
to Wikipedia, morphological operations rely only on the relative ordering
of pixel values, not on their numerical values, and therefore are especially
suited to the processing of binary images. Morphological operations can also
be applied to greyscale images such that their light transfer functions are un-
known and therefore their absolute pixel values are of no or minor interest.
Morphological techniques probe an image with a small shape or template
called a structuring element. The structuring element is positioned at all
possible locations in the image and it is compared with the corresponding
neighbourhood of pixels. Some operations test whether the element ”fits”
within the neighbourhood, while others test whether it ”hits” or intersects
the neighbourhood: A morphological operation on a binary image creates a
new binary image in which the pixel has a non-zero value only if the test is
successful at that location in the input image. The structuring element is a
small binary image, i.e. a small matrix of pixels, each with a value of zero
or one:

- The matrix dimensions specify the size of the structuring element.


- The pattern of ones and zeros specifies the shape of the structuring
    element.
- An origin of the structuring element is usually one of its pixels, although
    generally the origin can be outside the structuring element.
4. Result and Discussion

Next figures show the images as an output. i.e grayscale image, high pass
filtered image , threshold image, watershed segmented image, Finally input
image and extracted tumour from MRI image. For this purpose real time
patient data is taken for analysis.As tumour in MRI image have an intensity
more than that of its background so it become very easy locate it and extract
it from a MRI image. Following is the first MRI image which the input to
this programme.

5. Future Work

In future this programme can be done more advanced so that tumour
can be classified according to its type. Also tumour growth can be analysed
by plotting graph which can be obtained by studying sequential images of
tumour affected patient.



