
set xmlParser = CreateObject("Msxml2.DOMDocument") 
xmlParser.appendChild(xmlParser.createProcessingInstruction("xml", "version='1.0' encoding='utf-8'")) 
set rootNode = xmlParser.appendChild(xmlParser.createElement("Processes")) 

Set objService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\CIMV2") 
Set objProcesses = objService.InstancesOf("Win32_Process") 

For Each objProc in objProcesses 
    set curProcessNode = rootNode.appendChild(xmlParser.createElement("Process")) 
    curProcessNode.setAttribute "ID", objProc.ProcessId
    set nameNode = curProcessNode.appendChild(xmlParser.createElement("Name")) 
    nameNode.text = objProc.Name
    set virtualSizeNode = curProcessNode.appendChild(xmlParser.createElement("VirtualSize")) 
    virtualSizeNode.text = objProc.VirtualSize 
Next 

xmlParser.save("E:\Google Drive\university\informatics\lab5\lab5Serzhanina2.xml") 
WScript.Quit 1

