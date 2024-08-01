# tik

Transactional Installation Kit - A toolkit for deploying Operating System images to UEFI hardware from a USB stick.

## General Premise

A simple, lightweight, extensible tool for deploying a premade OS images to UEFI hardware.

tik was originally inspired by the "SelfInstaller" functionality offered by [kiwi](https://github.com/OSInside/kiwi) OEM images, but is designed to be wholly independent of the toolchain used to create the OS images.

It's core functionality is very similar to kiwi's SelfInstaller, with the basic workflow for deploying an image being a very simple process:

- Identify storage devices on the system
- Offer the user a list of available devices
- Deploy image to that device

In addition to the above workflow, tik supports the following additional features

- Unattended automation of the deployment of the image
- Optional extensions to be run before or after the deployment of the image (eg to support functionality like checking the network for an updated image). This functionality is inspired by [jeos-firstboot](https://github.com/openSUSE/jeos-firstboot/)'s module support
- Support for multiple images provided on the same installation media (eg. openSUSE Aeon and openSUSE MicroOS)

## tik OS Images

tik is designed to deploy three types of images.

- systemd-repart "bundles"
- systemd-repart "self deployment"
- Block images

In all three cases tik should not care about the contents of the disk image, which potentially could be of any Operating System built using any toolset (eg kiwi, mkosi, etc)

Features like expanding the partitions to fill the disk are expected to be handled by tools like systemd-repart on the booting of the deployed OS, not by tik (though in theory optional extensions could be written to implement this)

### systemd-repart "bundles"

tik can also deploy images bundled with their own systemd-repart configurations. tik expects the following on disk layout for each systemd-repart "bundle":

- a Directory with a unique name to describe the OS/Version being deployed. Contained within that directory:
    - a `repart.d` Directory containing a complete [repart.d](https://www.freedesktop.org/software/systemd/man/latest/repart.d.html) partition layout for the OS being deployed
    - 1 (or more) Directories or Block images to be used by `CopyFiles=` or `CopyBlocks=` parameters in the `repart.d` configuration to populate the contents of the defined partitions

The `repart.d` configuration is then read and applied to the target storage device, being populated automatically based on the configuration.

By default these files should be located in `/usr/lib/tik/img` but can be relocated by redefining the `TIK_IMG_DIR` parameter in your tik config.
As `CopyBlocks=` and `CopyFiles=` parameters require absolute filesystem paths, any change to the `TIK_IMG_DIR` parameter will require altering your configuration to match that new location.

This feature was introduced in tik v1.2

### systemd-repart "self-deployment"

If tik is executed without any images in the defined `TIK_IMG_DIR` it will automatically attempt "self deployment", using the currently booted tik USB stick as its 'image' for writing to the target storage device.
This is primarily for using tik to deploy images from a functioning 'live/portable' USB installation.

For this to work, tik requires

- a `repart.d` configuration containing a complete [repart.d](https://www.freedesktop.org/software/systemd/man/latest/repart.d.html) partition layout for the OS being deployed. This must be located in the standard `repart.d` paths, eg `/etc/repart.d/` or `/usr/lib/repart.d`

The `repart.d` configuration is then read and applied to the target storage device, being populated automatically based on the configuration.
It is expected that the `repart.d` configuration will use `CopyBlocks=auto` to automatically map the contents from the booted tik USB stick to the equivalent new partitions on the target storage device.

This feature was introduced in tik v1.2

### Block images

tik can deploy a block-based disk images. These expected to be raw.xz files containing

- the full partition table
- a UEFI ESP/EFI partition
- 1 (or more) OS partitions

By default these files should be located in `/usr/lib/tik/img` but can be relocated by redefining the `TIK_IMG_DIR` parameter in your tik config

## tik Installation Media

tik is designed to be run on a different style of media than many traditional OS installers

Traditional tooling like YaST, Agama, Windows Installer, etc are all expected to be read-only Installation media that aren't modifiable by the user at all

tik Installtion Media are expected to be a variant of openSUSE MicroOS, designed to be run from portable media (eg a USB stick)

while the "Install OS" of the Installation Media will therefore be read-only when in use, the "Install OS" will be possible of being updated and configured to the users needs, directly on the USB stick after it's imaged

More importantly, this also means that the Installation Media will have various read-write locations, including /var/lib/tik/images, the location of tiks image files, allowing users to add their own custom variants of such images to be offered when the tik installer boots up

## tik + ignition + combustion

because tik installation media are built separately from the Operating System(s) which tik will offer to deploy, this means that tik installation images can also contain a separate 'ignition/combustion partition' which can have your ignition/combustion configurations stored within

These will then be automatically used by any OS image which uses ignition or combustion (eg openSUSE MicroOS) on their first boot after tik has deployed an image, assuming the tik Installation USB stick is still connected

This makes ignition and/or combustion the perfect tools for making any automated customisations to any OS image deployed via tik
