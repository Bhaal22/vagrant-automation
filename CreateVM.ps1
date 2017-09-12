Import-Module Hyper-V
 
# Take a look at the virtual switches you have available to provide networking
# to the new VM. I have one for my home network already, if you don't you'll
# need to create one with New-VMSwitch.
Get-VMSwitch | Format-Table
 
# The configuration of our new VM.
$newVmArgs = @{
  "Name" = "server2016";
  "MemoryStartupBytes" = 4GB;
  "BootDevice" = "VHD";
  "Path" = ".";
  "NewVHDSizeBytes" = 100GB;
  "NewVHDPath" = "server2016\Virtual Hard Disks\server2016.vhdx"
  "Generation" = 1;
  "Switch" = "private_switch";
}
 
# Create the VM.
$vm = New-VM @newVmArgs
 
# Mount our installation media (.iso) on the VM.
Add-VMDvdDrive -VMName server2016 -Path "E:\down\soft\Microsoft\fr_windows_server_2016_x64_dvd_9327754.iso"
 
# Start VM
$vm | Start-VM