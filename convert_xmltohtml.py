import os
#import subprocess


# To find result file of xml type through nmap execution for chekcing open port at a current path 
# , make it to a list and then convert it as html type to share through e-mail.  
path = "./"
fileList = os.listdir(path)
xmlFileList = [file for file in fileList if file.endswith(".xml")]

#print("list length is " + str(len(xmlFileList)))


# (Method)
# To find a system path of keyword file(e.g. nmap.exe). It is only available on Windows OS.
def getSystemTargetPath(keyword):
    _targetPath = ""
    _sysPaths = os.environ['PATH']
    #print(_sysPaths)
    _eachPathList = _sysPaths.split(';')
    for _eachPath in _eachPathList:
        #print(_eachPath)
        _splitPathList = _eachPath.split('\\')
        if (keyword in _splitPathList):
            print(_eachPath)
            _targetPath = _eachPath
            return _targetPath

    return False

# (Method)
# To check a target file existance in a target path or not.
def checkTargetFileVaild(path, filename):
    _fileName = ''
    fileList = os.listdir(path)

    for _file in fileList:
        if _file.find(filename) is not -1:
            print(_file)
            _fileName = _file
            return _fileName

    return False


# (Iteration)
# To get a xml result file and convert it from a xml to a html type.
for xmlFile in xmlFileList:
    print(xmlFile)
    strFilename = xmlFile    
    splitFilenameList = strFilename.split('.')
    if (len(splitFilenameList) == 2) and (splitFilenameList[1] == 'xml'):
        print("One more xml files is(are) exsited.")
        #print(splitFilenameList[1])

        # Getting a nmap result file with xml type.
        original_result_xml = strFilename

        nmap_sys_path = getSystemTargetPath('Nmap')
        # Getting a nmap.xsl file path information for converting from a xml type to a html.
        # It shoudl be a absoulte path. 
        xsl_path_n_file = "\""+nmap_sys_path + '\\' + checkTargetFileVaild(nmap_sys_path, 'nmap.xsl')+"\""

        # A target result file name with html type.
        converted_result_html = splitFilenameList[0] + '.html'

        # CMD command for converting from a xml to a html file.
        cmd_xmltohtml = "xsltproc "+xsl_path_n_file+" "+original_result_xml+" > "+converted_result_html

        # Execute a command through CMD.
        os.system(cmd_xmltohtml)
        print ("Converting from xml to html is finised.")
    else:
        print("File extension is not a xml type!")





