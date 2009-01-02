### AS3 obfuscator ###

import re
import random

# Declare variables
removeComments = True
removeWhitespace = False
changeFileName = True
changeVarName = True

blockCommentFound = False
varDeclareFound = False
fileName = "Main"
newFileName = "Main_Obfs"
varsFound = []
varsNew = []

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
	
	# Collect variable names
	if changeVarName:
		
		tmpList = [] # Declare empty list

		varIndex = newLine.find("var") # See if "var" is declared on this line
		functionIndex = newLine.find("function") # See if "function" found on this line
		

		if varIndex != -1 or functionIndex != -1: # If "var" or "function" found, set varDeclareFound to True
			varDeclareFound = True

		if varDeclareFound:

			if varIndex == -1 and functionIndex != -1: # If function found but not var found
				tmpList = re.findall("\w+(?=[\(|:])", newLine) # Make list of all words ending with ":" or "("
			else: # Otherwise
				tmpList = re.findall("\w+(?=:)", newLine) # Make list of all words ending with just ":"
				
			for tmpLine in tmpList: # Sort through list of variable names
				varsFound.append(tmpLine) # and append to varsFound list

				# Create new variable name
				foundNewName = False
				newVarName = ""
				while not foundNewName: # Keep searching until find unique name
					newVarName = "_" + str(random.randrange(1,5000)) # Create new name that is an underscore plus a random number up to 5000
					if newVarName not in varsNew: # Make sure new name is unique
						foundNewName = True
				varsNew.append(newVarName)

			# Reached a semicolon or open bracket and presumably end of var/function declaration
			if newLine.find(";") != -1 or newLine.find("{") != -1:
				varDeclareFound = False


	# Remove whitespace, newlines, and tabs
	if removeWhitespace:
		newLine = stripWhiteSpace(newLine)
	
	# Change constructor to match new file name
	if changeFileName:
		if newLine.find(fileName) != -1:
			newLine = newLine.replace(fileName, newFileName, 1)

	# Replace line
	lineIndex = listLines.index(line) # Get index of line we are currently working on
	listLines.remove(line) # Remove current line and...
	listLines.insert(lineIndex, newLine) # ... replace with newLine[0]

# Change Variable names
if changeVarName:
	for line in listLines:
		newLine = line
		# Iterate over varsFound and replace with varsNew
		for j in range(0, len(varsFound)):
			newLine = re.sub(r"\b"+varsFound[j]+r"\b", varsNew[j], newLine)
		# Replace line
		lineIndex = listLines.index(line) # Get index of line we are currently working on
		listLines.remove(line) # Remove current line and...
		listLines.insert(lineIndex, newLine) # ... replace with newLine[0]



# Write to file
if changeFileName:
	newFileName += ".as" # Concatenate ".as" to the new file name
	fileToWrite = open(newFileName, "w") # Then open it for writing
else:
	fileName += ".as"
	fileToWrite = open(fileName, "w")
for line in listLines: # Go through our modified listLines one line at a time
	fileToWrite.write(line) # Write each line to the file

# Close file after writing
fileToWrite.close()
