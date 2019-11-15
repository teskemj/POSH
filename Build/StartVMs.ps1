# Get the VM objects.
$VMs = Get-VM -VMName win81,win12

# Get the name of the local host.
$Hostname = Hostname

# Make sure each VM is started and connect to it.
ForEach ($VM in $VMs)
{
    If ($VM.State -ne "Running")
    {
        Start-VM -VMName $VM.Name
        Invoke-Expression -Command "VMConnect $($HostName) $($VM.Name)"
    }
    Else
    {
        Invoke-Expression -Command "VMConnect $($HostName) $($VM.Name)"
    }
}