# Deb-Guard
Used to terminate processes by name and outgoing ip/domain in a loop. Used packages are base Debian/Ubuntu packages so the script can be run on skeleton systems without installing tools (kill, grep, ping OR dig, ps aux, tr, cut)

![G-2](https://github.com/Blk-S-Bellamy/Deb-Guard/assets/95153890/9f966913-397b-4d14-8c88-b0e633a61970)
## **--USAGE GUIDE--**
**RUNNING SCRIPT**:
Simply execute script after altering config and adding banned ip address, process names

**LOGGING**
1. _**"LOG_ENABLE"**_ Enable or disable the logging of terminated banned processes and banned outgoing ip. <sup>**OPTIONS:(0/1)**</sup>
2. _**"LOG_ALIAS"**_ The name of the log file. <sup>**OPTIONS:("filename")**</sup>
3. _**"LOG_PATH"**_ The path to the log file directory, must end in a "/". <sup>**OPTIONS:("pathway")**</sup>

**BAN LIST CONFIGURATION**
1. _**"BLOCK_PROC"**_ The list of process names to search for and destroy. (not case sensitive, partial matches enabled) <sup>**ARRAY, JUST ADD ITEMS**</sup>
2. _**"SEARCH_DOMAINS"**_ The list of domains to be resolved and compared to the outgoing ip. <sup>**ARRAY, JUST ADD ITEMS**</sup>
3. _**"HRD_IP"**_ The list of ip addresses to be compared to ougoing addresses. <sup>**ARRAY, JUST ADD ITEMS**</sup>

**FILTERS**
1. _**"PROTOCOL"**_ Used to filter to specific package type in outgoing ip connections. <sup>**OPTIONS:(http, https, any)**</sup>
2. _**"TPROTOCOL"**_ Used to filter to specific transfer protocol in outgoing ip connections. <sup>**OPTIONS:(tcp, udp, any)**</sup>

**OPTIMIZATION**
1. _**"SOC_RESOLVE_FREQ"**_ The number of loops/iterations between resolving banned domain list. <sup>**OPTIONS:(number)**</sup>
2. _**"LOOP_DELAY"**_ The delay between program loops in seconds. <sup>**OPTIONS:(number)**</sup>

**DEBUGGING/TESTING**
1. _**"DEBUG_MODE"**_ Print the loops/iterations of the program to the terminal and the found banned processes/banned outgoing ip. <sup>**OPTIONS:(0/1)**</sup>
2. _**"PRINT_CON"**_ Print the found banned processes/banned outgoing ip. <sup>**OPTIONS:(0/1)**</sup>

![G-6](https://github.com/Blk-S-Bellamy/Deb-Guard/assets/95153890/69eb5d3e-ef21-49aa-bfde-ba4e9204ee6f)

<sub> _an example of a program being terminated with debug mode enabled._ </sub>

## **--EXAMPLES--**

**BANNING PROCESSES BY NAME**

![G-3](https://github.com/Blk-S-Bellamy/Deb-Guard/assets/95153890/21f3eb5a-681a-42e2-91ef-c979959a0f3d)

<sub> _adding a process name will terminate it every iteration. matches aren't case sensitive and can be a partial match_ </sub>

**BANNING PROCESSES BY DOMAIN CONNECTION**

![G-5](https://github.com/Blk-S-Bellamy/Deb-Guard/assets/95153890/4e24df56-f2d9-40b5-93a6-d83364de0e4d)

<sub> _domains can include any tld and resolving is done doing either "dig" or "ping" depending on what is available_ </sub>

**BANNING PROCESSES BY STATIC IP CONNECTION**

![G-4](https://github.com/Blk-S-Bellamy/Deb-Guard/assets/95153890/8444c022-1527-4a79-bd71-f17ac6df7054)

<sub> _adding a public ip works but remember some servers change public ip, only use for static public ip and domains list for changing ip_ </sub>
