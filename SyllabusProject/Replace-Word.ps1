$word = new-object -ComObject Word.Application
$syllabus = $word.Documents.Open('c:\scripts\syllabunk\syllabus.docx')
$word.Documents.Open('C:\Users\11568034\OneDrive\NWTC\Courses\PowerShell\ClassDocs\Syllabus\F2017\10150192-81143-MTeske.docx') | gm
$word.Documents.Open('C:\Users\11568034\OneDrive\NWTC\Courses\PowerShell\ClassDocs\Syllabus\F2017\10150192-81143-MTeske.docx') | select writepassword
$word.Visible = $true
$word.NewDocument | gm
$word.NewDocument.add.('c:\scripts\test.docx')
dir C:\Scripts

Function SaveAsWordDoc($Document,$FileName)
{
    $Syllabus.Saveas([REF]$Filename)
    $Syllabus.close()
}
$syllabus.ActiveWindow.Selection.Find | Get-Member
Function Replace-Text {
#This function will process the a CSV file with the course information and search and replace 
#template based keywords with the terms information
    param (
            [string]$document,
            [string]$findtext,
            [string]$replacewithtext
    )

    #The following properties are found in the object of 
    #$syllabus.ActiveWindow.Selection.Find | gm

    $FindReplace=$Document.ActiveWindow.Selection.Find
    $matchCase = $false;
    $matchWholeWord = $true;
    $matchWildCards = $false;
    $matchSoundsLike = $false;
    $matchAllWordForms = $false;
    $forward = $true;
    $format = $false;
    $matchKashida = $false;
    $matchDiacritics = $false;
    $matchAlefHamza = $false;
    $matchControl = $false;
    $read_only = $false;
    $visible = $true;
    $replace = 2;
    $wrap = 1;
    $FindReplace.Execute($findText, $matchCase, $matchWholeWord, $matchWildCards, $matchSoundsLike, $matchAllWordForms, $forward, $wrap, $format, $replaceWithText, $replace, $matchKashida ,$matchDiacritics, $matchAlefHamza, $matchControl)
}

#https://gallery.technet.microsoft.com/7c463ad7-0eed-4792-8236-38434f891e0e/view/Discussions#content