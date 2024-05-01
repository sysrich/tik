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

tik is designed to deploy a .raw/.img disk image, which is expected to contain

- the full partition table
- a UEFI ESP/EFI partition
- 1 (or more) OS partitions

tik should not care about the contents of the disk image, which potentially could be of any Operating System built using any toolset (eg kiwi, mkosi, etc)

Features like expanding the partitions to fill the disk are expected to be handled by tools like systemd-repart on the booting of the deployed OS, not by tik (though in theory optional extensions could be written to impliment this)

## tik Installation Media

tik is designed to be run on a different style of media than many traditional OS installers

Traditional tooling like YaST, Agama, Windows Installer, etc are all expected to be read-only Installation media that aren't modifiable by the user at all

tik Installtion Media are expected to be a variant of openSUSE MicroOS, designed to be run from portable media (eg a USB stick)

while the "Install OS" of the Installation Media will therefore be read-only when in use, the "Install OS" will be possible of being updated and configured to the users needs, directly on the USB stick after it's imaged

More importantly, this also means that the Installation Media will have various read-write locations, including /var/lib/tik/images, the location of tiks .raw/.img files, allowing users to add their own custom variants of such images to be offered when the tik installer boots up

## tik + ignition + combustion

because tik installation media are built separately from the Operating System(s) which tik will offer to deploy, this means that tik installation images can also contain a separate 'ignition/combustion partition' which can have your ignition/combustion configurations stored within

These will then be automatically used by any OS image which uses ignition or combustion (eg openSUSE MicroOS) on their first boot after tik has deployed an image, assuming the tik Installation USB stick is still connected

This makes ignition and/or combustion the perfect tools for making any automated customisations to any OS image deployed via tik
