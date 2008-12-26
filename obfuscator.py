### AS3 obfuscator ###

import re

# Declare variables
removeComments = True
removeWhitespace = False
changeFileName = True
blockCommentFound = False
fileName = "Main"
newFileName = "Main_Obfs"

# Function declarations
def stripWhiteSpace(someText):
	tmpLine = someText.strip() # Remove whitespace
	tmpLine = tmpLine.rsplit("\n",1) # Remove carriage return
	tmpLine = tmpLine[0].split("\t") # Remove tabs
	tmpLine = "".join(["%s" % k for k in tmpLine]) # Iterate through tmpLine and joint it to ""
	return tmpLine

# Open file to change in read mode
fileToChange = open("Main.as", "r")
listLines = fileToChange.readlines() # Store fileToChange to memory in a list
fileToChange.close() # Close file

# Iterate over lists
for line in listLines:

	newLine = line

	# Remove comments
	if removeComments:
		
		# Remove and delete all inline block comments
		tmpLine = ""
		newLineCopy = newLine
		blockBeginCount = newLineCopy.count("/*")
		blockEndCount = newLineCopy.count("*/")
		while blockBeginCount>0 and blockEndCount>0:
			tmpList = newLineCopy.split("/*", 1)
			tmpLine += tmpList[0]
			tmpList = newLineCopy.split("*/",1)
			tmpLine += tmpList[1]
			newLineCopy = tmpLine
			blockBeginCount -= 1
			blockEndCount -= 1
		if tmpLine != "":
			newLine = tmpLine

		# Remove all other block comments
		if newLine.find("/*") != -1: # Beginning of a block comment has been found
			blockCommentFound = True

		if blockCommentFound:
			if newLine.find("*/") != -1: # Found end of block comment
				tmpLine = newLine.rsplit("*/", 1) # Get everything past block comment end
				newLine = tmpLine[1]
				blockCommentFound = False
			else:
				newLine = "\n" # Delete everything and replace with newline to preserve code structure

		# Remove single line comments
		strippedLine = stripWhiteSpace(newLine)
		commentIndex = strippedLine.rfind("//") # Finds last instance of "//" and returns the index
		if commentIndex != -1:
			safeToDelete = True
			semicolonIndex = strippedLine.find(";")
			if semicolonIndex != -1: # Semi-colon found
				if commentIndex<semicolonIndex and commentIndex !=0: # Before semi-colon and not beginning of line, not safe to delete
					safeToDelete = False
			if safeToDelete:
				tmpLine = newLine.rsplit("//",1) # Split at last instance of "//", stores desired output into tmpLine[0]
				tmpLine[0] += "\n" # Add a return carriage to preserve code structure
				newLine = tmpLine[0] # Store our temp line into newLine
	
	# Remove whitespace, newlines, and tabs
	if removeWhitespace:
		newLine = stripWhiteSpace(newLine)
	
	# Change constructor to match new file name
	if changeFileName:
		if newLine.find(fileName) != -1:
			newLine.replace(fileName, newFileName, 1)


	# Replace line
	lineIndex = listLines.index(line) # Get index of line we are currently working on
	listLines.remove(line) # Remove current line and...
	listLines.insert(lineIndex, newLine) # ... replace with newLine[0]


# Write to file
if changeFileName:
	newFileName += ".as"
	fileToWrite = open(newFileName, "w")
else
	fileName += ".as"
	fileToWrite = open(fileName, "w")
for line in listLines:
	fileToWrite.write(line)

# Close file after writing
fileToWrite.close()
