### AS3 obfuscator ###

import re

# Declare variables
removeComments = True;
removeWhitespace = True;

# Open file to change in read mode
fileToChange = open("Main.as", "r")
listLines = fileToChange.readlines() # Store fileToChange to memory in a list
fileToChange.close() # Close file

# Iterate over lists
for line in listLines:

	newLine = line

	# Remove comments
	if removeComments:
		commentIndex = line.rfind("//") # Finds last instance of "//" and returns the index
		if commentIndex != -1:
			safeToDelete = True
			semicolonIndex = line.find(";")
			if semicolonIndex != -1: # Semi-colon found
				if commentIndex<semicolonIndex: # Before semi-colon, not safe to delete
					safeToDelete = False
			if safeToDelete:
				tmpLine = newLine.rsplit("//",1) # Split at last instance of "//", stores desired output into tmpLine[0]
				tmpLine[0] += "\n" # Add a return carriage to preserve code structure
				newLine = tmpLine[0] # Store our temp line into newLine
	
	# Remove whitespace and newlines
	if removeWhitespace:
		newLine.strip() # Remove whitespace
		tmpLine = newLine.rsplit("\n",1) # Remove carriage return
		tmpLine2 = tmpLine[0].split("\t") # Remove tabs
		newLine = "".join(["%s" % k for k in tmpLine2]) # Iterate over tmpLine2 and join it to ""
	
	# Replace line
	lineIndex = listLines.index(line) # Get index of line we are currently working on
	listLines.remove(line) # Remove current line and...
	listLines.insert(lineIndex, newLine) # ... replace with newLine[0]


# Write to file
fileToWrite = open("Main_obfs.as", "w")
for line in listLines:
	fileToWrite.write(line)

# Close file after writing
fileToWrite.close()
