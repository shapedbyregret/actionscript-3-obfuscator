### AS3 obfuscator ###

import re

# Open file to change in read mode
fileToChange = open("Main.as", "r")

# Store fileToChange to memory in a list
listLines = fileToChange.readlines()
# Close file
fileToChange.close()

# Iterate over list and remove comments
for line in listLines:
	commentIndex = line.rfind("//")
	if commentIndex != -1:
		safeToDelete = True
		semicolonIndex = line.find(";")
		if semicolonIndex != -1: # Semi-colon found
			if commentIndex<semicolonIndex: # Before semi-colon, not safe to delete
				safeToDelete = False
		if safeToDelete:
			lineIndex = listLines.index(line)
			newLine = line.rsplit("//",1)
			newLine[0] += "\n"
			listLines.remove(line)
			listLines.insert(lineIndex,newLine[0])
		

# Write to file
fileToWrite = open("Main_obfs.as", "w")
for line in listLines:
	fileToWrite.write(line)

# Close file after writing
fileToWrite.close()
