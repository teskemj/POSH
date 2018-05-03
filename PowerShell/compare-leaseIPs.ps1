$pre = get-content C:\scripts\prehp.txt

get-dhcpserverv4lease -ScopeId 10.0.0.0 | select IPAddress | out-file c:\scripts\prehp.txt
get-dhcpserverv4lease -ScopeId 10.0.0.0 | Select IPAddress| out-file c:\scripts\prehp1.txt

$post = get-content C:\scripts\prehp1.txt
Compare-Object -ReferenceObject $pre -DifferenceObject $post