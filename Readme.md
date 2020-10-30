# RedM Clear Cache

Use this script to clear the RedM cache without the manual hassle.
The 'game' subfolder remains unaffected.

The RedM folder is automatically detected, so there's not much to do beforehand.
The script checks for the RedM folder structure to avoid the risk of accidentally deleting files anywhere else, should you edit REDMPATH (don't).

## Options
Edit the batch file to set these options
1. Start RedM Launcher:

    Set RUNREDM=true and the RedM launcher will start after the cache has been cleared. Set it to anything else to not use that option.
2. Confirm every item before deletion:

    If you don't trust what it's deleting at first, set CONFIRM=true and it'll prompt you for every item before deleting them. This defeats the purpose of automating the process though, so set it to false once you're satisfied.

