# ImageJ_Macro_for_Seed_Measurements
ImageJ Macro to Count Seeds and Measure Seed Characteristics
Developed using images of seeds from five individual barley spikes.

Directions for counting seeds from five spikes and measuring length, width, area, and perimeter of all seeds with macro in ImageJ

Notes about images:
•	Seeds should not be touching
•	If images contain labels, they need to be the same size and in the same location as the labels in the example image. If labels are not included, seeds should be kept out the region where the label is located in the example image.
•	Background should be dark compared to seeds.
•	Scale was set in the macro using an image of a ruler at the same resolution using the same scanner as the images – this line of the macro would need to be adjusted for specific scanner and resolution.
•	Length and width of seeds are measured by fitting an ellipse to each seed.

1.	Make sure all images to be measured are in a single directory
2.	Create a new directory for output images (images processed using macro)
3.	Open ImageJ and make a new macro by selecting Plugins -> New -> Macro and paste in macro text:
4.	Save new macro (e.g. Measure_Seeds_Macro.ijm)
5.	Batch process all images with new macro. Select Process -> Batch -> Macro
6.	Set input directory path (directory containing all images to be processed)
7.	Set output directory path (will contain images processed by macro)
8.	Select open and find new macro. Hit Process.
9.	The macro will make files with individual seed measurements for each line.
10.	Move individual measurement files to a new directory and use the R script Combine_and_analyze_stem_diameter.R to combine all files and generate summary statistics.
