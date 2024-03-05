#!/bin/bash
VERSION="DEB-GUARD_1.0"
#⣿¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤⣿
#|   PROGRAMMED BY:    |
#|         __          |
#|      -=(¤ '.        |
#|         '.-.\       |
#|         /|  \\      |
#|         '|  ||      |
#|__________▄\_):,_____|
#|<¤¤¤ßlk-S-Bellamy¤¤¤>|
#⣿¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤⣿
# FOR HELP: https://github.com/Blk-S-Bellamy/Deb-Guard

#⣿¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤⣿
#|    DEB-GUARD GLOBAL CONFIGURATION
#⣿▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄⣿
#⣿¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤ MODES ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤⣿
# ENABLE DEBUG MODE FOR THE FUSION FUNCTIONS
# (WILL DISABLE ANY PRINTING FUNCTIONS ALREADY ENABLED)
# PRESS CTRL+C TO PAUSE THE PROGRAM IN DEBUG MODE
DEBUG_MODE=0

#⣿¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤ CONFIG ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤⣿
LOG_ENABLE=0

# MUST PASS A PATHWAY AND A FILE NAME TO ENABLE LOGGING FUNCTIONALITY
# AFTER INCLUDING FILENAME AND PATH SET "LOG_ENABLE TO 1 TO START LOGGING"
LOG_PATH=""
LOG_ALIAS="Deb-Guard.log"
# DATE AND TIME STAMP FOR LOGGING
TIMESTAMP=$(date +%s)

#⣿¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤⣿
#|    PROC_DEB-GUARD SETUP VARIABLES
#⣿▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄⣿
#⣿¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤ CONFIG ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤⣿
# IF SET TO 1, THE SEARCHES WILL PRINT TO THE CONSOLE RUNNING THE SCRIPT
PRINT_CON=0
# SET TO 0 SCRIPT WILL RUN ONCE, SET TO 1 SCRIPT WILL RUN INDEFINITE
# SETS THE DELAY BETWEEN SEARCHES
LOOP_DELAY=0

#⣿¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤⣿
#|    SOC_DEB-GUARD SETUP VARIABLES
#⣿▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄⣿
#⣿¤¤¤¤¤¤¤¤¤¤¤¤¤¤ CONFIGURATION ¤¤¤¤¤¤¤¤¤¤¤¤¤⣿
# RESOLVE DOMAIN NAMES IN LIST EVERY <N> NUMBER OF RUNS (0 FOR ONLY WHEN THE PROGRAM STARTS TIME)
SOC_RESOLVE_FREQ=10
# KILL PROCESS CONNECTING TO BANNED IP (0 NO 1 YES)
SOC_TERMINATE=1

#⣿¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤ FILTERS ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤⣿
# ENABLE DIFFERENT FILTERS IN ORDER TO OPTIMIZE THE PROGRAM
# OPTIONS: http, https, any
PROTOCOL="any"
# OPTIONS: tcp, udp, any 
TPROTOCOL="any"

#⣿¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤ EXIT CODES ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤⣿
CYAN='\033[0;36m'
RED='\033[0;31m'
N_BLUE="\e[1;34m"
D_RED='\033[1;31m' # RED
RESET='\033[0m' # RESET COLOR

#⣿¤¤¤¤¤¤¤¤¤¤¤¤¤¤ BLOCK LIST ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤⣿
# ADDING PROCESS NAMES WILL TERMINATE ANY PROCESS MATCHING
# (NOT CASE SENSITIVE, PARTIAL MATCHES ENABLED)
BLOCK_PROC=("discord_fake" # example with discord (inert)
)

#⣿¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤ SOC LISTS ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤⣿
			 
# BLACKLIST OF OUTGOING IP DOMAINS, ADD ANY YOU WANT TO ALWAYS BLOCK (PUBLIC IP))
SEARCH_DOMAINS=("github.com_fake" # example with github.com (inert)
)

# BLACKLIST OF IP ADDRESSES THAT ARE STATIC, ADD ANY YOU WANT TO ALWAYS BLOCK (PUBLIC IP)
HRD_IP=(162.159.137.232.0000000) # Discord.com as an example (inert)

# FILLED WITH THE IP ADDRESSES OF THE DOMAINS AFTER BEING RESOLVED, ANY ADDED BEFORE RUN ARE DELETED
RES_IP=()


#⣿¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤⣿
#⣿                              START UNIVERSAL FUNCTION DEB-GUARD MODULE 
#⣿▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄⣿
#⣿¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤ DEBUG ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤⣿
# USED TO PRINT DEBUG MESSAGES WHEN ENABLED
print_debug () {
	if [[ $DEBUG_MODE -eq 1 ]]
	then
		echo -e "$1"
	fi
	return
}


#⣿¤¤¤¤¤¤¤¤¤¤ DNS LOOKUP SELECTION ¤¤¤¤¤¤¤¤¤¤⣿
# IF A "dig" CALL FAILS THEN USE "ping" INSTEAD
DG=$(dig google.com)
clear

if [[ ${#DG} -gt 1 ]]
then
	print_debug "${D_RED}⣿¤| DEPENDENCY |¤⣿ USING '${CYAN}dig${D_RED}' DNS LOOKUP${RESET}"
	DNS_LU_CALL=0
else
	print_debug "${D_RED}⣿¤| DEPENDENCY |¤⣿ '${CYAN}dig${D_RED}' DNS LOOKUP (dnsutils) ${CYAN}MISSING${D_RED}, USING '${CYAN}ping${D_RED}' INSTEAD${RESET}"
	DNS_LU_CALL=1
fi

#⣿¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤ OTHER ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤⣿

# WRITE AN EVENT TO A LOG IF LOGGING IS ENABLED
# NEEDS AN EVENT TO LOG PASSED IN TO BE CALLED
writelog () {
	if [[ $LOG_ENABLE -eq 1 ]]
	then
		echo "|:${TIMESTAMP}:| ${1} " >> "${LOG_PATH}${LOG_ALIAS}"
	fi
	return
}


# USED TO PRINT TO CONSOLE WHEN IT IS ENABLED
print_con () {
	if [[ $PRINT_CON -eq 1 ]]
	then
		echo -e "$1"
	fi
	return
}


# USED TO PAUSE THE PROGRAM WHEN "CTRL+C" INTERRUPT IS INPUT OR EXIT IF NOT IN DEBUG MODE
interr () {
		# EXIT THE PROGRAM WITH "CTRL+C" IF THE DEBUG MODE IS DISABLED
        if [[ $DEBUG_MODE -eq 0 ]]
        then
        	exit
        fi

        echo -e "\033[33;5;7m¤⣿${RESET}${D_RED}PROGRAM PAUSED PRESS ENTER TO CONTINUE, ENTER 'q' TO QUIT\033[33;5;7m¤⣿${RESET}"
        read TRASH
        
        # EXIT THE PROGRAM IF THE USER ENTERS "q" WHILE IN DEBUG MODE
        if [ $TRASH = "q" ]
        then
        	exit
        fi
        
        echo -e "\e[2A${CYAN}PROGRAM CONTINUED...${RESET}                                          "
}


# ENABLES DEBUG DEPENDENCIES
if [[ $DEBUG_MODE -eq 1 ]]
then
	PRINT_CON=1
fi


trap interr SIGINT

#⣿¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤⣿
#⣿                              START BLACKLIST PROCESS TERMINATION DEB-GUARD MODULE 
#⣿▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄⣿


# PASSING A LINE FROM A "ps aux" COMMAND WILL RETURN THE FULL NAME OF THE PID FOR USE WITH KILLALL
get_pname () {
	# FIND NAME IN THE STRING 
	P_NAME=$(basename "${PROC_LINE}")

	echo $P_NAME
	return
}


# PASSING A LINE FROM "ps aux" WILL RETURN THE PID OF THE PROCESS OR 0 FOR NOTHING FOUND
get_pid () {
		# GET THE PID OF THE PROCESS PASSED IN
		P_ID=$(echo "${1}" | tr -s ' ' | cut -d ' ' -f 2)
		echo "$P_ID"
		return
}


# returns the process pathway when given a "ps aux" line
get_plocation () {
	C=$(echo "${1}" | tr -s ' ' | cut -d ' ' -f 8)
	echo "$C"
	return
}


# pass a process to kill it and log the killing
kill_proc () {
	kill ${1}
	writelog "${D_RED}⣿¤|KILLED PROCESS|¤⣿ ID: \"$1\" || NAME: \"$2\""
	print_con "${D_RED}⣿¤|KILLED PROCESS|¤⣿${RESET} ${RED}ID:${RESET} ${CYAN}\"$1\"${RESET} ${RED}||${RESET} ${RED}NAME:${RESET} ${CYAN}\"$2\"${RESET}"
	return
}


# PASS A NAME TO SEARCH, KILL, AND DELETE THE FILE
seek_kill () {
	COMP=0
	# ensure the variables are reset
	P_ID=0
	P_NAME=""
	
	# repeat deleting found pid until there are none of that name left
	# FINDS THE PROCESS ID OF ANYTHING FOUND IN A GREP STATEMENT
	# WILL FIND PROC IN A NON CASE SENSITIVE WAY
	PROC_LINE=$(ps aux | grep -i -m 1 "${1}" | grep -v "grep")
	while [[ ${#PROC_LINE} -gt 5 ]]
	do
		PROC_LINE=$(ps aux | grep -i -m 1 "${1}" | grep -v "grep")
		if [[ ${#PROC_LINE} -gt 1 ]]
		then
			# PARSE THE PROCESS ID AND THE PROCESS NAME
			P_NAME=$(get_pname "${PROC_LINE}")
			P_ID=$(get_pid "${PROC_LINE}")
			P_LOC=$()
			
			# PRINT TO THE INFORMATIsON REGARDING THE PROCESS THAT IS BEING KILLED
			SEARCHED="${RED}⣿¤|FOUND PROCESS|¤⣿\nPROC SEARCHED: ${CYAN}${1}\n"
			FOUND="${RED}PROC FOUND: ${CYAN}${PROC_LINE}\n"
			LOCATION="${RED}PROC LOCATION: ${CYAN}${RESET}"
			NAME="${RED}PROC NAME: ${CYAN}${P_NAME}\n"
			ID="${RED}PROC ID: ${CYAN}${P_ID}${RESET}"
			
			print_con "$SEARCHED$FOUND$NAME$ID"
			# PASS="[PROCESS]-$P_NAME"
			kill_proc $P_ID "[PROCESS]-$P_NAME"
		else
			COMP=1
		fi
	done
	
	P_ID=0
	P_NAME=""

	return 
}


#⣿¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤⣿
#⣿                              START SOCKET PROCESS TERMINATION DEB-GUARD MODULE 
#⣿▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄⣿


# WILL PASS BACK THE QUERY SELECTED THROUGH FILTER SETTINGS
resolve_query () {
	ADDITION=""
	# ADD IN THE RIGHT TPROT FILTER
	case "$TPROTOCOL" in
	"any")
		:;;
	"tcp")
		ADDITION="${ADDITION}t";;
	"udp")
		ADDITION="${ADDITION}u";;
	*)
		:;;
	esac
	
	# ADDS THE SEARCH FOR PROCESS WITH THE SOCKET INFO
	ADDITION="${ADDITION}p"
	
	case "$PROTOCOL" in
	"any")
		ADDITION="${ADDITION} | grep -E 'https|http'";;
	"http")
		ADDITION="${ADDITION} | grep http";;
	"https")
		ADDITION="${ADDITION} | grep https";;
	*)
		ADDITION="${ADDITION} | grep -E 'https|http'";;
	esac
	
	# RETURN THE COMPLETED QUERY
	echo "ss -la${ADDITION}"
	return 
}


# PASS A SINGLE ADDRESS AND THE RETURN IS 1 FOR RAW IP AND 0 FOR DOMAIN, 2 FOR ERROR
ver_web_addr () {
	# THE LAST SECTION OF THE STING DIRECTLY 
	S_PER=${1##*'.'}
	C_CHAR=${S_PER:0:1}
	re='^[0-9]+$'
	
	# VERIFY WHAT IT IS BY CHECKING THE FIRST CHAR AFTER THE LAST PERIOD
	if [ "$C_CHAR" = "" ]
	then
		echo 0
	# IF THE FIRST CHARACTER IS A NUMBER, THE STRING IS AN IP NOT A DOMAIN
	elif ! [[ $C_CHAR =~ $re ]]
	then
		echo 0
		return
	else
		echo 1
		return
	fi
}


# RETURN THE DESTINATION IP FROM AN "SS" RETURN LINE
soc_ip () {
	D1=${1%':'*}
	D2=${D1%':'*}
	D3=${D2##*' '}
	echo "$D3"
}


# RETURN THE PROCESS ID FROM AN "SS" RETURN LINE
soc_pid () {
	# FINDS THE IP USING DELIMITERS
	T1=${1#*','}
	T2=${T1%%','*}
	SOCIP=${T2:4}
	echo "${SOCIP}"
	return
}


soc_data () {
	# FINDS THE SOCKET PROCESS DATA USING DELIMITERS 
	T1=${1#*'('}
	T2=${T1%')'*}
	echo "${T2}"
	return
}


# RESOLVE AN DOMAIN NAME IP
# PASS THE DOMAIN NAME ONLY
# EXCLUDES CNAME RECORDS!!
dig_resolve () {
	SRC=$(dig "$1" +short)
	
	unset IFS
	for LINE in $SRC
	do
		IP_ADDR=${LINE}
		TLD_CHECK=$(ver_web_addr "$LINE")
		
		if [[ $TLD_CHECK -eq 1 ]]
		then
			DRAFT_LIST="${DRAFT_LIST}\n${IP_ADDR}"
		else
			:
		fi
		
	done
	FINAL_LIST="${DRAFT_LIST:2}"
	echo "$FINAL_LIST"
	return
}


# RESOLVE AN DOMAIN NAME IP
# PASS THE DOMAIN NAME ONLY
# EXCLUDES CNAME RECORDS!!
ping_resolve () {
	SRC=$(ping -c1 "$1")
	
	# DELIMITER SELECTION OF THE IP IN THE RETURN LINE
	T1=${SRC#*'('}
	T2=${T1%%')'*}

	FINAL_LIST="${DRAFT_LIST:2}"
	echo "$T2"
	return
}


# RESOLVE ALL DOMAIN NAMES PROVIDED AND REFRESH THE LIST CONTAINING DOMAIN SEARCH IP
resolve_domains () {
	RES_IP=()
	# ITERATE THROUGH DOMAINS TO FIND IF THERE ARE ANY MATCHES
	ALT_IND=0
	for IND in "${!SEARCH_DOMAINS[@]}"
	do
		# ENABLE THE "dig" DNS LOOKUP
		if [[ $DNS_LU_CALL -eq 0 ]]
		then
			CHK_IP=$(dig_resolve "${SEARCH_DOMAINS[IND]}")
		elif [[ $DNS_LU_CALL -eq 1 ]]
		then
			CHK_IP=$(ping_resolve "${SEARCH_DOMAINS[IND]}")
		fi
		
		IFS=$"\n"
		for thing in ${CHK_IP}
		do
			if [ "${thing[0]}" = "" ]
			then
				:
			else
				RES_IP+=("$thing")
				# echo "|$thing|"
			fi
		done
		
	done
}


# USED TO SEARCH THE SOCKETS AND ADD THE NEW SOCKETS TO AN ARRAY
load_sockets () {
	QUERY=$(resolve_query)
	SOCS=$(eval "$QUERY")
	echo -e "$SOCS"
	return
}


# WHEN GIVEN AN IP WILL SEARCH AND KILL ANY CONNECTIONS TO THAT IP IN THE SOCKETS LAYER
# $1=<ip to search>
kill_ip () {
	# RETURNS THE SOCKETS LIST CONTAINING RELEVANT OUTGOING CONNECTIONS
	SOCS=$(load_sockets)
	
	# RESET IFS TO ITERATE OVER NEWLINES IN A STRING 
	IFS=$'\n'
	for thing in $SOCS
	do
		# PARSE EACH LINE TO FIND OUTGOING IP
		PR_IP=$(soc_ip "$thing")
		
		# IF THE OUTGOING IP MATCHES THE PROVIDED IP, THE PROCESS IS KILLED
		if [ "$PR_IP" = "$1" ]
		then
			K_ID=$(soc_pid "$thing")
			
			# WILL TERMINATE THE PROCESS IF IT IS ENABLED IN THE CONFIG
			if [[ $SOC_TERMINATE -eq 1 ]]
			then
				NAME=$(soc_data "${thing}")
				kill_proc $K_ID "${RED}[NETWORK]-${CYAN}$NAME ${RED}[OUTGOING IP]${CYAN}-$PR_IP${RESET}"
			fi
		fi
	done
}



# WILL FIND ANY PROCESS THAT ARE COMMUNICATING WITH BLACKLISTED IP AND TERMINATE IF CONFIGURED
soc_kill_blacklisted () {
	# THE RETURNED SOCKET INFORMATION TO SEARCH THROUGH
	SOC_RES=$(resolve_query)
	
	for IND in ${!RES_IP[@]}
	do
		# echo "|${RES_IP[$IND]}|"
		kill_ip "${RES_IP[$IND]}"
	done
	
	# KILLS ALL HARD-CODED IP IN THE 
	for IND in ${!HRD_IP[@]}
	do
		# echo "|${HRD_IP[$IND]}|"
		kill_ip "${HRD_IP[$IND]}"
	done
}


#⣿¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤⣿
#⣿                              START MAIN FUNCTION DEB-GUARD MODULE 
#⣿▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄⣿


proc_init () {
	# THE MAIN FUNCTION TO CALL AND DESTROY PROCESSES WITH BLACKLISTED NAMES
	for index in "${!BLOCK_PROC[@]}"
	do
		seek_kill "${BLOCK_PROC[$index]}"
	done
}


soc_init () {
	# search_sockets
	soc_kill_blacklisted
}


MAIN_LOOP=0
main_ () {
	while [[ 0 -eq 0 ]]
	do
		print_debug "${N_BLUE}⣿¤|STARTED LOOP|¤⣿${RESET}"
		proc_init
		soc_init
		
		# WILL RESOLVE THE DOMAIN NAMES EVERY <n> ITERATION 
		if [[ $MAIN_LOOP -eq $SOC_RESOLVE_FREQ ]]
		then
			print_debug "${D_RED}⣿¤|RESOLVED ${#SEARCH_DOMAINS} DOMAINS|¤⣿${RESET}"
			resolve_domains
			MAIN_LOOP=0
		fi
		MAIN_LOOP=$(($MAIN_LOOP+1))
		sleep $LOOP_DELAY
	done
}

# RESOLVE THE DOMAINS INITIALLY (THIS CALL ONLY RUNS ONCE)
print_debug "${D_RED}⣿¤|RESOLVED ${#SEARCH_DOMAINS} DOMAINS|¤⣿${RESET}"
resolve_domains

# INITIALIZE THE MAIN FUNCTION LOOP
main_

