# Unattended Windows 10 Evaluation

Packer templates to install Windows 10 Evaluation using the qemu/kvm builder.

I've tried to keep the configuration files to the bare minimum, please let me
know if anything can be removed by submitting an issue or pull request.

## Requirements

- Packer - https://www.packer.io/
- Virtio drivers (see windows-10.json) - https://docs.fedoraproject.org/en-US/quick-docs/creating-windows-virtual-machines-using-virtio-drivers/index.html
- Qemu/kvm - I'm using Fedora 31

## Hard coded configuration

Name                  | Where            | Value
----------------------|------------------|-----------------------------------
InputLocale           | autounattend.xml | en-US
SystemLocale          | autounattend.xml | en-US
UILanguage            | autounattend.xml | en-US
UserLocale            | autounattend.xml | en-US
TimeZone              | autounattend.xml | UTC
Out of box experience | autounattend.xml | Express settings.
Username              | autounattend.xml | Administrator (keep in sync with windows-10.json)
Password              | autounattend.xml | packer (keep in sync with windows-10.json)
Logon                 | autounattend.xml | Auto logon (using above credentials)
DiskConfiguration     | autounattend.xml | One primary paritition (NTFS)
ProcessorArchitecture | autounattend.xml | amd64
Accelerator/Type      | windows-10.json  | qemu/kvm
Windows Edition       | windows-10.json  | Windows 10 Build 18362 Version 1909 Codename 19H2 Evaluation x64
Image size            | windows-10.json  | 50000 MB
Image format          | windows-10.json  | qcow2
Memory                | windows-10.json  | 8192 MB (you can lower this safely)
Network Device        | windows-10.json  | virtio-net
Disk Interface        | windows-10.json  | virtio
Supplied drivers      | windows-10.json  | viostor, vioscsi, netkvm
Communicator          | windows-10.json  | winrm
CPUs                  | windows-10.json  | 4
WinRM Username        | windows-10.json  | Administrator (keep in sync with autounattend.xml)
WinRM Password        | windows-10.json  | packer (keep in sync with autounattend.xml)
NetConnectionProfile  | configure.ps1    | Private
WinRM configuration   | configure.ps1    | Quick config
WinRM encryption      | configure.ps1    | Allow unencrypted true
WinRM authentication  | configure.ps1    | Basic

## Usage

```bash
packer build windows-10.json
```

You should add a packer provider to windows-10.json to set a secure password for Administrator.

It's also possible to use the generated image (windows-10/windows-10) in a new packer template
for incremental building. To do this, set `iso_url` to `windows-10/windows-10` and optionally
set `iso_checksum_type` to `none`.
