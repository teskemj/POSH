
########################################################
# Colors are specified in decimal form of RGB except
# the RGB hex code is reversed to BGR then take
# the conversion to decimal.
# ex.
# Blue = #0066FF RGB -> #FF6600 BGR -> 16737792 decimal
########################################################

$Yellow    = 65535
$Blue      = 16737792
$DrkOrange = 26316
$Purple    = 10498160
$LPurple   = 14336204
$LBlue     = 15261367

##file name and path varaibles
$path = 'C:\scripts\'
$filename = 'test.xlsx'

##add a file check


##Worksheet Color Order
$2split = @(    $Yellow,          #Change Log
                $Yellow,          #Phone Setup
                $Blue,            #Universal Sku Check
                $Blue,            #Activation
                $Blue,            #Sim Activation
                $Blue,            #International Roaming
                $DrkOrange,       #RF Registration
                $DrkOrange,       #Voice Service
                $DrkOrange,       #Audio Test
                $DrkOrange,       #Switch Specific
                $Blue,            #IMS
                $Blue,            #SMS
                $Blue,            #Wap Push
                $Blue,            #CMAS
                $Purple,          #WPS
                $DrkOrange,       #Voicemail
                $DrkOrange,       #Static IP Tests
                $DrkOrange,       #OTA Tests
                $DrkOrange,       #Browser
                $Blue,            #Android Market
                $Blue,            #App Tests
                $Blue,            #LBS
                $Blue,            #Android Messenger
                $Blue,            #MMS
                $DrkOrange,       #Data Roaming
                $DrkOrange,       #Tethering (DUN)
                $DrkOrange,       #Hotspot
                $DrkOrange,       #MTP USB Transfer
                $DrkOrange,       #Multimedia
                $Blue,            #Camera
                $Blue,            #External Memory
                $Blue,            #Contacts Application
                $Blue,            #Bluetooth Tests
                $DrkOrange,       #Debranding & Menu Tests
                $Blue,            #UE Capabilities
                $Blue,            #OMS Reselection
                $Blue,            #Thompson Rd.
                $DrkOrange,       #LTE BC 2
                $DrkOrange,       #LTE BC 4
                $DrkOrange,       #LTE BC 5
                $DrkOrange,       #LTE BC 13
                $DrkOrange,       #Outlook
                $DrkOrange,       #FDR
                $Yellow           #FutureUse
)

$3split = @(    $Yellow,          #Change Log
                $Yellow,          #Phone Setup
                $Blue,            #Universal Sku Check
                $Blue,            #Activation
                $DrkOrange,       #Sim Activation
                $DrkOrange,       #International Roaming
                $Yellow,          #RF Registration
                $Yellow,          #Voice Service
                $Yellow,          #Audio Test
                $Blue,            #Switch Specific
                $Blue,            #IMS
                $Blue,            #SMS
                $Yellow,          #Wap Push
                $Yellow,          #CMAS
                $Purple,          #WPS
                $DrkOrange,       #Voicemail
                $DrkOrange,       #Static IP Tests
                $Purple,          #OTA Tests
                $DrkOrange,       #Browser
                $Yellow,          #Android Market
                $Yellow,          #App Tests
                $Yellow,          #LBS
                $Blue,            #Android Messenger
                $Blue,            #MMS
                $Blue,            #Data Roaming
                $Blue,            #Tethering (DUN)
                $DrkOrange,       #Hotspot
                $DrkOrange,       #MTP USB Transfer
                $DrkOrange,       #Multimedia
                $DrkOrange,       #Camera
                $Yellow,          #External Memory
                $Yellow,          #Contacts Application
                $Yellow,          #Bluetooth Tests
                $DrkOrange,       #Debranding & Menu Tests
                $Yellow,          #UE Capabilities
                $Yellow,          #OMS Reselection
                $Yellow,          #Thompson Rd.
                $Blue,            #LTE BC 2
                $Blue,            #LTE BC 4
                $Blue,            #LTE BC 5
                $Blue,            #LTE BC 13
                $DrkOrange,       #Outlook
                $Yellow,          #FDR
                $Yellow           #FutureUse
)

$4split = @(    $Yellow,          #Change Log
                $Yellow,          #Phone Setup
                $Blue,            #Universal Sku Check
                $Blue,            #Activation
                $Blue,            #Sim Activation
                $Blue,            #International Roaming
                $DrkOrange,       #RF Registration
                $DrkOrange,       #Voice Service
                $DrkOrange,       #Audio Test
                $DrkOrange,       #Switch Specific
                $LPurple,         #IMS
                $LPurple,         #SMS
                $LPurple,         #Wap Push
                $LPurple,         #CMAS
                $Purple,          #WPS
                $LBlue,           #Voicemail
                $LBlue,           #Static IP Tests
                $LBlue,           #OTA Tests
                $LBlue,           #Browser
                $Blue,            #Android Market
                $Blue,            #App Tests
                $Blue,            #LBS
                $Blue,            #Android Messenger
                $Blue,            #MMS
                $LBlue,           #Data Roaming
                $DrkOrange,       #Tethering (DUN)
                $DrkOrange,       #Hotspot
                $DrkOrange,       #MTP USB Transfer
                $LPurple,         #Multimedia
                $LPurple,         #Camera
                $LPurple,         #External Memory
                $LPurple,         #Contacts Application
                $LPurple,         #Bluetooth Tests
                $LBlue,           #Debranding & Menu Tests
                $LBlue,           #UE Capabilities
                $LBlue,           #OMS Reselection
                $LBlue,           #Thompson Rd.
                $DrkOrange,       #LTE BC 2
                $DrkOrange,       #LTE BC 4
                $DrkOrange,       #LTE BC 5
                $DrkOrange,       #LTE BC 13
                $Blue,            #Outlook
                $Blue,            #FDR
                $Yellow           #FutureUse
)

$excel = New-Object -ComObject Excel.Application  ## open excel

$excel.Visible = $true

$wb = $excel.Workbooks.Open('c:\scripts\test.xlsx')
$worksheet=$wb.ActiveSheet
$worksheet.range('b2').Text
#https://blogs.technet.microsoft.com/heyscriptingguy/2014/09/14/weekend-scripter-manipulating-word-and-excel-with-powershell/

########################################################
## Build Array of Tab Names
########################################################
$wbNames = @()

for ($i = 1; $i -lt $wb.Worksheets.Count; $i++)
{ 
    $wbNames += $wb.Worksheets.Item($i).name
}
########################################################
$wb.Save()
$wb.close()

while([System.Runtime.Interopservices.Marshal]::ReleaseComObject($wb)){}

#-----------------------------------------------------------------------------

### Make the Three copies
for($i = 2; $i -lt 5; $i++)
{
   Copy-Item ($path+$filename) -Destination ($path+$i+' Way - '+$filename) 

}

#-----------------------------------------------------------------------------

### Set tab colors on 2 way split
$wb = $excel.Workbooks.Open('c:\scripts\test.xlsx')

for($i = 0; $i -lt $wbNames.Count ; $i++)
   {
     $wb.sheets($wbNames[$i]).Tab.Color = $2split[$i]
   }

$wb.Save()
$wb.close()
while([System.Runtime.Interopservices.Marshal]::ReleaseComObject($wb)){}

#-----------------------------------------------------------------------------

### Set tab colors on 3 way split
$wb = $excel.Workbooks.Open($path+'3'+' Way - '+$filename)

for($i = 0; $i -lt $wbNames.Count ; $i++)
   {
     $wb.sheets($wbNames[$i]).Tab.Color = $3split[$i]
   }

$wb.Save()
$wb.close()
while([System.Runtime.Interopservices.Marshal]::ReleaseComObject($wb)){}

#-----------------------------------------------------------------------------

### Set tab colors on 4 way split
$wb = $excel.Workbooks.Open($path+$filename)

for($i = 0; $i -lt $wbNames.Count ; $i++)
   {
     $wb.sheets($wbNames[$i]).Tab.Color = $4split[$i]
   }

$wb.Save()
$wb.close()
$wb.Sheets
$wb.
$sheet = $wb.ActiveSheet()
$sheet
while([System.Runtime.Interopservices.Marshal]::ReleaseComObject($wb)){}

$excel.Quit()
$excel.ActiveCell()
while([System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel)){}

Remove-Variable wb
Remove-Variable excel
