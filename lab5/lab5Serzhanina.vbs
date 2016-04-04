'********************************************
' Лабораторная работа №5 cscript (путь к vbs)
'********************************************

dim rootNode,subNode

set xmlParser = CreateObject("Msxml2.DOMDocument")
xmlParser.appendChild(xmlParser.createProcessingInstruction("xml", "version='1.0' encoding='utf-8'"))
set rootNode = xmlParser.appendChild(xmlParser.createElement("Processor"))
set subNode1 = rootNode.appendchild(xmlParser.createElement("Versioncaption"))
set subNode2 = rootNode.appendchild(xmlParser.createElement("DeviceID"))
set subNode3 = rootNode.appendchild(xmlParser.createElement("CpuStatus"))
set subNode4 = rootNode.appendchild(xmlParser.createElement("CurrentClockSpeeds"))
set subNode5 = rootNode.appendchild(xmlParser.createElement("MaxClockSpeeds"))
set subNode6 = rootNode.appendchild(xmlParser.createElement("L2CacheSizes"))
set subNode9 = rootNode.appendchild(xmlParser.createElement("ProcessorTypes"))
set subNode10 = rootNode.appendchild(xmlParser.createElement("SocketDesignations"))

Set objService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\CIMV2")
For Each objProc In objService.ExecQuery("SELECT * FROM Win32_Processor")
    subNode1.text = objProc.Version
    subNode2.text = objProc.DeviceID
    subNode3.text = objProc.CpuStatus
    subNode4.text = objProc.CurrentClockSpeed
    subNode5.text = objProc.MaxClockSpeed
    subNode6.text = objProc.L2CacheSize
    subNode9.text = objProc.ProcessorType
    subNode10.text = objProc.SocketDesignation
Next



xmlParser.save(".\lab5Serzhanina.xml")
WScript.Quit 1

