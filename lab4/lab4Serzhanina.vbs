'********************************************
' Лабораторная работа №4 cscript 
'********************************************

dim objDoc,i,j,elemNum
elemNum = 1

'ссылка на объект word.application
set objWord = CreateObject("Word.Application")

'ссылка на объект document
set objDoc = objWord.Documents.Add

'делаем видимым приложенине Word
objWord.visible = true

set xmlParser = CreateObject("Msxml2.DOMDocument")
xmlParser.async = false
xmlParser.load  Wscript.Arguments.Item(0) '".\lab4Serzhanina.xml"
set root = xmlParser.documentElement

set currnode = xmlParser.documentElement

Set objRange = objDoc.Range
objDoc.Tables.Add objRange, root.childNodes.length+1, root.firstChild.childNodes.length 
Set objTable = objDoc.Tables(1)
objTable.Borders.Enable = true

for i = 0 to root.firstChild.childNodes.length - 1
	objTable.Cell(1,i+1).Range.Text = root.firstChild.childNodes(i).baseName
next



set currnode = root.firstChild
for j = 1 to root.childNodes.length 
    for i = 0 to root.firstChild.childNodes.length - 1
    	objTable.Cell(j+1, i+1).Range.Text = currnode.childNodes(i).Text 
	next
	if elemNum <> root.childNodes.length Then 
		set currnode = currnode.nextSibling 
	end if
	elemNum = elemNum + 1
next


  objDoc.saveAs(".\lab4Serzhanina.docx")
  WScript.Quit 1
 'objDoc.SaveAs (Left(WScript.ScriptFullName,Instr(1,ScriptFullName,ScriptName)-1)) & "document.docx"


