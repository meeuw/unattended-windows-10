
source "qemu" "windows-10" {
  accelerator       = "kvm"
  communicator      = "winrm"
  cpus              = 4
  disable_vnc       = true
  disk_interface    = "virtio"
  disk_size         = 50000
  floppy_files      = ["./autounattend.xml", "./configure.ps1", "/usr/share/virtio-win/drivers/amd64/Win10/viostor.cat", "/usr/share/virtio-win/drivers/amd64/Win10/viostor.inf", "/usr/share/virtio-win/drivers/amd64/Win10/viostor.sys", "/usr/share/virtio-win/drivers/amd64/Win10/vioscsi.cat", "/usr/share/virtio-win/drivers/amd64/Win10/vioscsi.inf", "/usr/share/virtio-win/drivers/amd64/Win10/vioscsi.sys", "/usr/share/virtio-win/drivers/amd64/Win10/netkvm.cat", "/usr/share/virtio-win/drivers/amd64/Win10/netkvm.inf", "/usr/share/virtio-win/drivers/amd64/Win10/netkvm.sys"]
  format            = "qcow2"
  iso_checksum      = "md5:059eabb2dc0886515808e98910e49d13"
  iso_url           = "https://software-download.microsoft.com/download/sg/19043.928.210409-1212.21h1_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
  memory            = "8192"
  net_device        = "virtio-net"
  output_directory  = "windows-10"
  shutdown_command  = "shutdown /s /t 10 /f /d p:4:1 /c \"Packer Shutdown\""
  shutdown_timeout  = "30m"
  vm_name           = "windows-10"
  winrm_password    = "packer"
  winrm_username    = "Administrator"
}

build {
  sources = ["source.qemu.windows-10"]

}
