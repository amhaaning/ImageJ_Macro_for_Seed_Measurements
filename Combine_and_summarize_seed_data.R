library(psych)

#Set working directory
setwd(".")

#Generate a list of results files from running macro
file_list <- list.files(path=".",pattern="*.csv")

IDs <- gsub(".csv","",file_list)

#Iterate through the folder, read in all files in the file list, merge them together, and assign them to a data frame.
for (i in 1:length(file_list)) assign (IDs[i],read.table(file_list[i],header=T,sep=","))

#Merge all individual data frames into one data frame
All_Results <- do.call(rbind, lapply(IDs, function(x){data.frame(Line_ID=x, eval(parse(text=x)))}))

# Get rid of unnecessary rows
All_Results$X <- NULL
All_Results$BX <- NULL
All_Results$BY <- NULL
All_Results$Height <- NULL

# Get summary stats for each line from all measurements and merge into a single data frame
Area_Summary <- describeBy(All_Results$Area,All_Results$Line_ID,mat=TRUE)
Area_Summary$Trait <- "Seed_Area"

Perimeter_Summary <- describeBy(All_Results$Perim.,All_Results$Line_ID,mat=TRUE)
Perimeter_Summary$Trait <- "Seed_Perimeter"

Ellipse_Length_Summary <- describeBy(All_Results$Major,All_Results$Line_ID,mat=TRUE)
Ellipse_Length_Summary$Trait <- "Length_of_Fit_Ellipse"

Ellipse_Width_Summary <- describeBy(All_Results$Minor,All_Results$Line_ID,mat=TRUE)
Ellipse_Width_Summary$Trait <- "Width_of_Fit_Ellipse"

All_Trait_Summary <- rbind(Area_Summary,Perimeter_Summary,Ellipse_Length_Summary,Ellipse_Width_Summary)
All_Trait_Summary$item <- NULL

# Write data frame with measurements for all lines to a file
write.table(All_Results, "./All_Seed_Measurements_Combined.txt", sep="\t", col.names=T,row.names=F)

# Write summary stats to a file
write.table(All_Trait_Summary, "./Seed_Stats_All_Lines.txt",sep="\t",col.names=T, row.names=F)



