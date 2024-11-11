#!/bin/sh

. ./d_function_test

RESULT=0

#######################################
asserted_output="$(echo -e '--INFO------  ----------------

\033[1mTest Succeeded:\033[0m

Have a nice day!

	Press key to continue
[cenity][][] --timeout 5 --info --no-wrap --text=<b>Test Succeeded:</b>\\n\\nHave a nice day!')"
output="$(c_test --timeout 5 --info --no-wrap --text="<b>Test Succeeded:</b>\n\nHave a nice day!" <<< "\n" 2>&1)"
compare "$output" "$asserted_output"


#######################################
asserted_output="$(echo -e '--INFO------ Installation Complete! ----------------

TIK_OS_NAME has been installed.

\033[1mSystem is rebooting\033[0m

	Press key to continue
[cenity][][] --timeout 5 --info --no-wrap --title=Installation Complete! --text=TIK_OS_NAME has been installed.\\n\\n<b>System is rebooting</b>')"
output="$(c_test --timeout 5 --info --no-wrap --title="Installation Complete!" --text="TIK_OS_NAME has been installed.\n\n<b>System is rebooting</b>" <<< "\n" 2>&1)"
compare "$output" "$asserted_output"


#######################################
asserted_output="$(echo -e '--WARNING--- Encryption Recovery Key -------------security-high--

You may optionally scan the recovery key off screen:
                             
                             
    █▀▀▀▀▀█   ▀ █ █▀▀▀▀▀█    
    █ ███ █ ▀ ▀ ▄ █ ███ █    
    █ ▀▀▀ █  █▄█▀ █ ▀▀▀ █    
    ▀▀▀▀▀▀▀ █ █ ▀ ▀▀▀▀▀▀▀    
    ▀█▀▄█▀▀▀▀ █▄▀█▀▄  ▀▄▄    
    ▄ █ ▄▄▀▄▄▄ █▄█▀█▄▀▀█▀    
     ▀ ▀  ▀ █▄▄▀ ▀█▀ █ ▀█    
    █▀▀▀▀▀█ █▄▀ ▀ ▄ ▀▀ █▀    
    █ ███ █ ▀▀▄▄▀▄▀▄▀▀ █▀    
    █ ▀▀▀ █ █▀▄█▄█▀█▄▄▀▄▀    
    ▀▀▀▀▀▀▀ ▀▀ ▀ ▀▀▀  ▀▀▀    
                             
                             
For more information please visit \033[1mhttps://aeondesktop.org/encrypt\033[0m

	Press key to continue
[cenity][][] --width=500 --height=500 --no-wrap --warning --icon=security-high-symbolic --title=Encryption Recovery Key --text=You may optionally scan the recovery key off screen:\\n<span face='\''monospace'\''>                             
                             
    █▀▀▀▀▀█   ▀ █ █▀▀▀▀▀█    
    █ ███ █ ▀ ▀ ▄ █ ███ █    
    █ ▀▀▀ █  █▄█▀ █ ▀▀▀ █    
    ▀▀▀▀▀▀▀ █ █ ▀ ▀▀▀▀▀▀▀    
    ▀█▀▄█▀▀▀▀ █▄▀█▀▄  ▀▄▄    
    ▄ █ ▄▄▀▄▄▄ █▄█▀█▄▀▀█▀    
     ▀ ▀  ▀ █▄▄▀ ▀█▀ █ ▀█    
    █▀▀▀▀▀█ █▄▀ ▀ ▄ ▀▀ █▀    
    █ ███ █ ▀▀▄▄▀▄▀▄▀▀ █▀    
    █ ▀▀▀ █ █▀▄█▄█▀█▄▄▀▄▀    
    ▀▀▀▀▀▀▀ ▀▀ ▀ ▀▀▀  ▀▀▀    
                             
                             </span>\\nFor more information please visit <tt>https://aeondesktop.org/encrypt</tt>')"
output="$(c_test --width=500 --height=500 --no-wrap --warning --icon=security-high-symbolic --title="Encryption Recovery Key" --text="${message}You may optionally scan the recovery key off screen:\n<span face='monospace'>$(qrencode test -t UTF8i)</span>\nFor more information please visit <tt>https://aeondesktop.org/encrypt</tt>" <<< "\n" 2>&1)"
compare "$output" "$asserted_output"


#######################################
asserted_output="$(echo -e '--WARNING--- Set Encryption Passphrase -------------security-high--

This  system is encrypted and will require a Passphrase on every boot

You will be prompted to set the Passphrase on the next screen

For more information please visit \033[1mhttps://aeondesktop.org/encrypt\033[0m

	Press key to continue
[cenity][][] --width=500 --height=300 --no-wrap --warning --icon=security-high-symbolic --title=Set Encryption Passphrase --text=This  system is encrypted and will require a Passphrase on every boot\\n\\nYou will be prompted to set the Passphrase on the next screen\\n\\nFor more information please visit <tt>https://aeondesktop.org/encrypt</tt>')"
output="$(c_test --width=500 --height=300 --no-wrap --warning --icon=security-high-symbolic --title="Set Encryption Passphrase" --text="This ${TIK_OS_NAME} system is encrypted and will require a Passphrase on every boot\n\nYou will be prompted to set the Passphrase on the next screen\n\nFor more information please visit <tt>https://aeondesktop.org/encrypt</tt>" <<< "\n" 2>&1)"
compare "$output" "$asserted_output"


#######################################
asserted_output="$(echo -e '--INFO------ Message from the Aeon Team ----------------

We'\''d like to thank you for adopting openSUSE Aeon so early in it'\''s development,
before we fully understood what we were building or how we wanted it to look

We are sorry that you need to reinstall your system

Thank you so much for your support.
We hope you enjoy the new look openSUSE Aeon

	Press key to continue
[cenity][][] --info --width=300 --height=300 --icon=distributor-logo-Aeon-symbolic --no-wrap --title=Message from the Aeon Team --text=We'\''d like to thank you for adopting openSUSE Aeon so early in it'\''s development,\\nbefore we fully understood what we were building or how we wanted it to look\\n\\nWe are sorry that you need to reinstall your system\\n\\nThank you so much for your support.\\nWe hope you enjoy the new look openSUSE Aeon')"
output="$(c_test --info --width=300 --height=300 --icon=distributor-logo-Aeon-symbolic  --no-wrap --title="Message from the Aeon Team" --text="We'd like to thank you for adopting openSUSE Aeon so early in it's development,\nbefore we fully understood what we were building or how we wanted it to look\n\nWe are sorry that you need to reinstall your system\n\nThank you so much for your support.\nWe hope you enjoy the new look openSUSE Aeon" <<< "\n" 2>&1)"
compare "$output" "$asserted_output"


# TODO: handle ok label
#output=$(c_test --info --ok-label="Install Now" --no-wrap --width=300 --height=300 --icon=distributor-logo-Aeon-symbolic --title="" --text="<big>Welcome to ${TIK_OS_NAME}</big>\n\nPlease press <b>Install Now</b> to continue")

tput sgr0
check_result
