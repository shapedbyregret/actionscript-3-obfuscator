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
removeWhitespace = False
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

#========================================
# strip_white_space(String)
# First replaces each newline with an empty string, then splits at each
# tab, and then joins it all back together before returning.
def strip_white_space(someText):
    tmpLine = someText.replace("\n", "", 1)
    tmpList = tmpLine.split("\t")
    tmpLine = "".join(["%s" % k for k in tmpList])
    return tmpLine

#========================================
# string_to_hex(String)
# Iterates over each character in oldString and converts it first to an
# int, and then to a hex string. All "0" chars are replaced with "\"
# and added to newString.
def string_to_hex(oldString):
    newString = ""
    for char in oldString:
        tmpString = hex(ord(char))
        tmpString = tmpString.replace("0", "\\", 1)
        newString += tmpString
    return newString


#========================================
# Handle arguments
#
#========================================

# Check if arguments given
if len(sys.argv)>1:
    filePath = sys.argv[1]
    fullFileName = filePath.rsplit("/", 1)[1]
    fileName = fullFileName.rsplit(".", 1)[0]
    if len(sys.argv)>2:
        newFilePath = sys.argv[2]
        newFullFileName = newFilePath.rsplit("/", 1)[1]
        newFileName = newFullFileName.rsplit(".", 1)[0]
    else:
        # Create new file path
        tmpList = filePath.rsplit(".", 1)
        if len(tmpList)>1: # Check if there is a file extension
            newFilePath = tmpList[0] + "_Obfs." + tmpList[1]
        else:
            newFilePath = fileName + "_Obfs"

        # Create new file name
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
fileToChange = open(filePath, "r")
listLines = fileToChange.readlines() # Store fileToChange to memory in a list
fileToChange.close() # Close file


#========================================
# Iterate over file, one line at a time
#
#========================================
for line in listLines:

    newLine = line

    #========================================
    # Remove comments
    if removeComments:
	
        #========================================
        # Remove and delete all inline block comments
        # Replaces everything between "/*" and "*/" with an empty string.
        tmpLine = re.sub(r"(/\*).*?(\*/)", "", newLine)
        if tmpLine != "":
            newLine = tmpLine

        #========================================
        # Remove all other block comments.
        # Attempts to find beginning of block comment statement.
        if newLine.find("/*") != -1:
            blockCommentFound = True

        # If we find the end of the block comment, then we will store
        # everything past it, otherwise simply replace entire line with
        # a newline ("\n"), which helps to preserve code structure.
        if blockCommentFound:
            if newLine.find("*/") != -1:
                tmpLine = newLine.rsplit("*/", 1)
                newLine = tmpLine[1]
                blockCommentFound = False
            else:
                newLine = "\n"

        #========================================
        # Remove single line comments i.e. all text following "//"
        # Find last instance of "//" and determine if it is after semicolon.
        # If so then it is safe to delete. Which we do by splitting at the
        # last instance of found "//", appending a "\n" and storing it.
        # Note: The following relies on the assumption that the code being
        #       read uses semicolons to end statements.
        strippedLine = strip_white_space(newLine)
        commentIndex = strippedLine.rfind("//")
        if commentIndex != -1:
            safeToDelete = True
            semicolonIndex = strippedLine.find(";")
            if semicolonIndex != -1:
                if commentIndex<semicolonIndex and commentIndex !=0:
                    safeToDelete = False
            if safeToDelete:
                tmpLine = newLine.rsplit("//",1)
                tmpLine[0] += "\n"
                newLine = tmpLine[0]
    
    #========================================
    # Collect variable names
    if changeVarName:
        tmpList = []

        # Store indices of AS3 reserved words "var", "function", or "const"
        varIndex = newLine.find("var")
        functionIndex = newLine.find("function")
        constIndex = newLine.find("const")
        if varIndex != -1 or functionIndex != -1 or constIndex != -1:
            varDeclareFound = True

        # If "function" was found, then we make a list of all words preceding
        # a ":" or "(". Otherwise only store words preceding ":".
        # After we've found our words we add them to varsFound and create a
        # jumbled replacement name for each one.
        if varDeclareFound:
            if functionIndex != -1:
                tmpList = re.findall("\w+\s*(?=[\(|:])", newLine)
            else:
                tmpList = re.findall("\w+\s*(?=:)", newLine)

            for tmpLine in tmpList:
                varsFound.append(tmpLine)
				
                # Create new variable name.
                # Keep searching until find a unique name consisting of an
                # underscore preceding a random number from 1-5000.
                newVarName = ""
                foundNewName = False
                while not foundNewName:
                    newVarName = "_" + str(random.randrange(1,5000))
                    if newVarName not in varsNew:
                        foundNewName = True
                varsNew.append(newVarName)

            # Reached a semicolon or open bracket and presumably end of
            # var/function/const declaration.
            if newLine.find(";") != -1 or newLine.find("{") != -1:
                varDeclareFound = False

    #========================================
    # Encode strings
    # Iterates over each character in string until a single or double
    # quote is found. If quote has not been escaped, then convert
    # following chars to their hex string equivalent until another quote
    # is found.
    if encodeStrings:
        tmpLine = ""
        inSingleQuote = False
        inDoubleQuote = False
        for x in range(0, len(newLine)):
            if newLine[x]=="\"" and not inSingleQuote:
                if x>0 and newLine[x-1]!="\\":
                    if inDoubleQuote:
                        inDoubleQuote = False
                    else:
                        inDoubleQuote = True
                    tmpLine += newLine[x]
                else:
                    tmpLine += string_to_hex( newLine[x] )
            elif newLine[x]=="\'" and not inDoubleQuote:
                if x>0 and newLine[x-1]!="\\":
                    if inSingleQuote:
                        inSingleQuote = False
                    else:
                        inSingleQuote = True
                    tmpLine += newLine[x]
                else:
                    tmpLine += string_to_hex( newLine[x] )
            else:
                if inDoubleQuote or inSingleQuote:
                    tmpLine += string_to_hex( newLine[x] )
                else:
                    tmpLine += newLine[x]
			
        newLine = tmpLine

    #========================================
    # Remove newlines and tabs
    if removeWhitespace:
        newLine = strip_white_space(newLine)

    #========================================
    # Change constructor to match new file name
    if changeFileName:
        if newLine.find(fileName) != -1:
            newLine = newLine.replace(fileName, newFileName, 1)

    #========================================
    # Replace line
    lineIndex = listLines.index(line)
    listLines.remove(line)
    listLines.insert(lineIndex, newLine)


#========================================
# Change Variable names
# Iterates over file again and attempts to replace all instances of
# variables previously found.
# TODO: Find less expensive way to implement.
if changeVarName:
    for line in listLines:
        newLine = line	
        # Attempt to find import at beginning of line
        tmpLine = strip_white_space(newLine)
        tmpIndex = tmpLine.find("import")
        if( tmpIndex!=0 ):
            for j in range(0, len(varsFound)):
                newLine = re.sub(r"\b"+varsFound[j]+r"\b", varsNew[j], newLine)
            lineIndex = listLines.index(line)
            listLines.remove(line)
            listLines.insert(lineIndex, newLine)


#========================================
# Write to file
#
#========================================
if changeFileName:
    fileToWrite = open(newFilePath, "w")
else:
    fileToWrite = open(filePath, "w")
for line in listLines:
    fileToWrite.write(line)

# Close file after writing
fileToWrite.close()

