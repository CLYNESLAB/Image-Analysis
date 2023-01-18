//ImageJ macro written by Dominic Waithe for David Clynes. (c) 2017.
//To be used on three channel Deltavision wide-field images.
// Adapted by Tom Kent to only z-project .dv files


//Folders with .dv files in, to be analyzed.

path = newArray(1);

path[0] = getDirectory("Choose a folder to analyse:"); //dir_path+"Test/";//"/Hela SNAP UVC BrdU test repeat 041116/";
//path[1] = "path to folder";

//out_path, create a folder for the output images.
out_path = path[0]+"/projected/";

//make sur ehte output directory exists
File.makeDirectory(out_path);

//Start of coding region
for (zt = 0; zt < path.length; zt++){
//Opens the path and imports a list of files from it.
list = getFileList(path[zt]);
//The files from the folder.
for (z = 0; z < list.length; z++){


//Checks the files have the correct file extension.
if(endsWith(list[z], "dv")){
//Opens the file.
run("Bio-Formats Windowless Importer", "open=["+path[zt]+list[z]+"] ");
run("8-bit");
//Z-projects the file.
run("Z Project...", "projection=[Max Intensity]");

title = getTitle();
saveAs("Tiff", out_path+title+"_zproj_max.tif");
run("Close All");
}}}

