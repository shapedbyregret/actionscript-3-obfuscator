# Actionscript 3.0 Obfuscator
#
# Copyright (c) 2008 Erik Johnson (shapedbyregret@gmail.com)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.




#========================================
# Import modules
#
#========================================
import re
import random
import sys

#========================================
# Options
#
#========================================
removeComments = True
changeVarName = True
encodeStrings = True

# Following options should not be changed.
# They are either incomplete or incorrectly implemented.
removeWhiteSpace = False
changeFileName = True

#========================================
# Declare Variables
#
#========================================
blockCommentFound = False
varDeclareFound = False
varsFound = []
varsNew = []

#========================================
# Function declarations
#
#========================================

# Strip the white space from a string
def stripWhiteSpace(someText):
	#tmpLine = someText.strip() # Remove whitespace
	tmpLine = someText.replace("\n", "", 1) # Remove newlines
	tmpLine = tmpLine.split("\t") # Remove tabs
	tmpLine = "".join(["%s" % k for k in tmpLine]) # Iterate through tmpLine and join it to ""
	return tmpLine

# Convert a string variable into its hex equivalent
def stringToHex(oldString):
	newString = ""
	for char in oldString: # Iterate over each char in given string
		tmpString = hex(ord(char)) # Convert each char to unicode int, then convert int to hex string
		tmpString = tmpString.replace("0", "\\", 1) # Replace first 0 in hex string with backslash
		newString += tmpString # Append modified hex string to our newString
	return newString

#========================================
# Handle arguments
#
#========================================

# Check if arguments given
if len(sys.argv)>1:
	fullFileName = sys.argv[1]
	fileName = fullFileName.rsplit(".", 1)[0]
	if len(sys.argv)>2:
		newFullFileName = sys.argv[2]
		newFileName = newFullFileName.rsplit(".", 1)[0]
	else:
		tmpList = fullFileName.rsplit(".", 1)
		if len(tmpList)>1:
			newFullFileName = tmpList[0] + "_Obfs." + tmpList[1]
		else:
			newFullFileName = fileName + "_Obfs"
		newFileName = fileName + "_Obfs"
else:
	print "Filename not provided."
	exit()

#========================================
# Open File
#
#========================================
fileToChange = open(fullFileName, "r")
listLines = fileToChange.readlines() # Store fileToChange to memory in a list
fileToChange.close() # Close file


#========================================
# Iterate over file, one line at a time
#
#========================================
for line in listLines:

	newLine = line

	# Remove comments
	if removeComments:
		
		# Remove and delete all inline block comments
		tmpLine = re.sub(r"(/\*).*?(\*/)", "", newLine) # Matches everything between "/*" and "*/" and replaces with a newline
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
		constIndex = newLine.find("const")

		if varIndex != -1 or functionIndex != -1 or constIndex != -1: # If "var", "const", or "function" found, set varDeclareFound to True
			varDeclareFound = True

		if varDeclareFound:
			if functionIndex != -1: # If function found
				tmpList = re.findall("\w+\s*(?=[\(|:])", newLine) # Make list of all words ending with ":" or "("
			else:
				tmpList = re.findall("\w+\s*(?=:)", newLine) # Make list of all words ending with just ":"
			for tmpLine in tmpList: # Sort through list of variable names
				varsFound.append(tmpLine) # and append to varsFound list
				
				# Create new variable name
				newVarName = ""
				foundNewName = False
				while not foundNewName: # Keep searching until find unique name
					newVarName = "_" + str(random.randrange(1,5000)) # Create new name that is an underscore plus a random number up to 5000
					if newVarName not in varsNew: # Make sure new name is unique
						foundNewName = True
				varsNew.append(newVarName)
				#print tmpLine + " - " + newVarName

			# Reached a semicolon or open bracket and presumably end of var/function declaration
			if newLine.find(";") != -1 or newLine.find("{") != -1:
				varDeclareFound = False

	# Encode strings
	if encodeStrings:
		tmpLine = ""
		inSingleQuote = False
		inDoubleQuote = False
		for x in range(0, len(newLine)): # Iterate over each character
				
			if newLine[x]=="\"":
				if x>0 and newLine[x-1]!="\\": # Ensure previous character not an escape character
					if inDoubleQuote:
						inDoubleQuote = False
					else:
						inDoubleQuote = True
					tmpLine += newLine[x]
				else:
					tmpLine += stringToHex( newLine[x] )
			else:
				if inDoubleQuote:
					tmpLine += stringToHex( newLine[x] )
				else:
					tmpLine += newLine[x]
			
		newLine = tmpLine

		# Previous attempt to find quotes using regular expression module.
		# Correctly finds quotes, but need a method to replace multiple strings all at once
		#tmpList = re.findall(r"\".*?(?<!\\)\"", newLine) # Search for all double quotes
		#for literal in tmpList:
		#	literal = literal.strip("\"")
		#	newLine = newLine.replace(literal, stringToHex(literal))

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


#========================================
# Change Variable names
#
#========================================
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


#========================================
# Write to file
#
#========================================
if changeFileName:
	fileToWrite = open(newFullFileName, "w") # Then open it for writing
else:
	fileToWrite = open(fullFileName, "w")
for line in listLines: # Go through our modified listLines one line at a time
	fileToWrite.write(line) # Write each line to the file

fileToWrite.close() # Close file after writing

