<#
 # Tools for testing for students
#>

# Is hostdd online?
test-connection -ComputerName localhost  

# Is online, but don't vomit red if not online
test-connection -ComputerName localhost -ErrorAction SilentlyContinue

# Is online, but just need one response
test-connection -ComputerName localhost -Count 1

# Is online return boolean (true/false)
$up=test-connection -ComputerName localhost -Quiet
$up

# Test of host is online and if so, do something
if (test-connection -ComputerName localhost -Count 1 -ErrorAction SilentlyContinue -Quiet) {
    write-output "Online"
}
else {
    write-output "Offline"
}

# Test multiple hosts
1..10 | foreach {
    if (test-connection -ComputerName "192.168.174.$_" -Count 1 -ErrorAction SilentlyContinue -Quiet) {
        write-output "192.168.174.$_ is Online"
    }
    else {
        write-output "192.168.174.$_ is Offline"
    }
}

# Test multiple hosts->log to a file for future use
1..10 | foreach {
    if (test-connection -ComputerName "192.168.174.$_" -Count 1 -ErrorAction SilentlyContinue -Quiet) {
        write-output "192.168.174.$_" | out-file C:\report\online.txt -Append
    }
    else {
        write-output "192.168.174.$_" | out-file C:\report\offline.txt -append
    }
}

# Test to see if path/item exists

test-path c:\report

# If statements evaluate the condition () if "true" do {scriptblock}. if "not true" either do nothing, or send it to else {scriptblock}
if (test-path C:\report2) {
    "Object exists"
}
else {
    "Object does not exist"
}

if (test-path C:\report) {
    "Object exists"
}
else {
    "Object does not exist"
}

# Test for a file/item
if (test-path C:\report\offline.txt) {
    "Object exists"
}
else {
    "Object does not exist"
}


