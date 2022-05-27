# Last update @27/05/2022 github.com/unknowncowman
# 
# This script sends webrequests to a list of websites and writes an 
# info of text into a result file if the request runs into an error

# imports
import requests as reqs
from datetime import date

# creates list for output
outputList = []

#gets current date and writes to list
dateToday = date.today()
outputList.append(dateToday + "\n")

# adds a link to the Sophos-Test website
addedInfo = "Aufschlüsselung unter http://sophostest.com/ \n"
outputList.append(addedInfo)

# iterates a file that contains links, outputs into outputList after formatting it
__location__ = os.path.realpath(
    os.path.join(os.getcwd(), os.path.dirname(__file__)))
with open(__location__, "r") as inputFile:
    for line in inputFile:
        inputLine = line.strip() 
        response = reqs.get(inputLine)                  # To execute get request 
        responseStatusCode = response.status_code       # To print http response code
        if responseStatusCode != 200:
            outputList.Append("NICHT ERREICHBAR - " + inputLine + "\n")


# outputs outputList into textfile 

textfile = open("Blockierte_Webseiten.txt", "w")
for element in outputList:
    textfile.write(element + "\n")
textfile.close()