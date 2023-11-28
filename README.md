# Deb-Guard
Used to terminate processes by name and outgoing ip/domain.

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
