#!/bin/sh
# vim:tw=0:et:sw=4:ts=4

#echo "the repository bootstrap is down for maintainance. Please check back in 1 hour."
#[ -n "$DEBUG" ] || exit 1

# The purpose of this script is to set up the Dell yum repositories on your 
# system. This script will also install the Dell GPG keys used to sign 
# Dell RPMS.

# these two variables are replaced by the perl script 
# with the actual server name and directory.
SERVER="https://linux.dell.com"
# mind the trailing slash here...
REPO_URL="/repo/hardware/dsu/"
REPO_NAME="dell-system-update"
GPG_KEY_REPO="/repo/pgp_pubkeys/"
# these are 'eval'-ed to do var replacement later.
GPG_KEY_LOCATION=${SERVER}${GPG_KEY_REPO}
#DSU_INSTALL_PATH='/usr/libexec/dell_dup/'

GPG_KEY_NAME[${#GPG_KEY_NAME[*]}]='0x756ba70b1019ced6.asc'
GPG_KEY_NAME[${#GPG_KEY_NAME[*]}]='0x1285491434D8786F.asc'
GPG_KEY_NAME[${#GPG_KEY_NAME[*]}]='0xca77951d23b66a9d.asc'
GPG_KEY_NAME[${#GPG_KEY_NAME[*]}]='0x3CA66B4946770C59.asc'

GPG_KEY_ID[${#GPG_KEY_ID[*]}]='1019CED6'
GPG_KEY_ID[${#GPG_KEY_ID[*]}]='34D8786F'
GPG_KEY_ID[${#GPG_KEY_ID[*]}]='23B66A9D'
GPG_KEY_ID[${#GPG_KEY_ID[*]}]='46770C59'

IMPORT_GPG_CONFIRMATION="na"

##############################################################################
#  Should not need to edit anything below this point
##############################################################################

set -e
[ -z "$DEBUG" ] || set -x

get_dist_version(){
    local REL_RPM rpmq
    # let user override... unwise but necessary for testing
    ([ -z "$dist_base" ] && [ -z "$dist_ver" ] && [ -z "$dist" ]) || return 0
    dist_base=unknown
    dist_ver=
    rpmq='rpm --qf %{name}-%{version}-%{release}\n -q'
    if $rpmq --whatprovides redhat-release >/dev/null 2>&1; then
        REL_RPM=$($rpmq --whatprovides redhat-release 2>/dev/null | tail -n1)
        VER=$(rpm -q --qf "%{version}\n" $REL_RPM)
        REDHAT_RELEASE=$VER

        # RedHat: format is 3AS, 4AS, 5Desktop... strip off al alpha chars
        # Centos/SL: format is 4.1, 5.1, 5.2, ... strip off .X chars
        dist_base=el
        dist_ver=${VER%%[.a-zA-Z]*}

        if echo $REL_RPM | grep -q centos-release; then
            CENTOS_RELEASE=$VER
        elif echo $REL_RPM | grep -q sl-release; then
            # Scientific Linux (RHEL recompile)
            SCIENTIFIC_RELEASE=$VER
        elif echo $REL_RPM | grep -q fedora-release; then
            FEDORA_RELEASE=$(rpm --eval "%{fedora}")
            dist_base=f
        	dist_ver=${FEDORA_RELEASE}
        elif echo $REL_RPM | grep -q enterprise-linux; then
            # this is for Oracle Enterprise Linux (probably 4.x)
            ORACLE_RELEASE=$VER
        elif echo $REL_RPM | grep -q enterprise-release; then
            # this is for Oracle Enterprise Linux 5+
            ORACLE_RELEASE=$VER
        fi

    elif $rpmq --whatprovides sles-release >/dev/null 2>&1; then
        REL_RPM=$($rpmq --whatprovides sles-release 2>/dev/null | tail -n1)
        SLES_RELEASE=$(rpm -q --qf "%{version}\n" $REL_RPM)
		dist_base=sles
        # SLES 11 is 11.1, strip off .X chars
        dist_ver=${SLES_RELEASE%%[.a-zA-Z]*}

    elif $rpmq --whatprovides sled-release >/dev/null 2>&1; then
        REL_RPM=$($rpmq --whatprovides sled-release 2>/dev/null | tail -n1)
        SLES_RELEASE=$(rpm -q --qf "%{version}\n" $REL_RPM)
		dist_base=sles
        dist_ver=${SLES_RELEASE}

    # This comes after sles-release because sles also defines suse-release
    elif $rpmq --whatprovides suse-release >/dev/null 2>&1; then
        REL_RPM=$($rpmq --whatprovides suse-release 2>/dev/null | tail -n1)
        SUSE_RELEASE=$(rpm -q --qf "%{version}\n" $REL_RPM)
		dist_base=suse
        # SLES 11 is 11.1, strip off .X chars
        dist_ver=${SUSE_RELEASE%%[.a-zA-Z]*}

    elif $rpmq --whatprovides distribution-release >/dev/null 2>&1; then
        REL_RPM=$($rpmq --whatprovides distribution-release 2>/dev/null | tail -n1)
        lowercase_name=$(echo $REL_RPM | tr '[:upper:]' '[:lower:]')
        case $lowercase_name in
            sles*|suse*)
                SUSE_RELEASE=$(rpm -q --qf "%{version}\n" $REL_RPM)
                dist_base=suse
                dist_ver=${SUSE_RELEASE%%[.a-zA-Z]*}
        esac
    fi

    dist=$dist_base$dist_ver
}

get_user_confirmation() {
	read -p "Do you want to import Dell GPG keys (y/n)?" yn
	case $yn in
		[Yy]* ) IMPORT_GPG_CONFIRMATION="yes";;
		[Nn]* ) IMPORT_GPG_CONFIRMATION="no"; echo "Continuing without importing keys";;
		* ) IMPORT_GPG_CONFIRMATION="no";  echo "Incorrect option. Continuing without importing keys";;
	esac
}

install_gpg_key() {
    eval GPG_KEY_URL=${GPG_KEY_LOCATION}$1
    GPG_FN=$(mktemp /tmp/GPG-KEY-$$-XXXXXX)
    trap "rm -f $GPG_FN" EXIT HUP QUIT TERM
    curl -s -o ${GPG_FN} ${GPG_KEY_URL}
    email=$(gpg -v ${GPG_FN} 2>/dev/null | grep -i @dell.com | sed 's/.*<\(.*\)>.*/\1/')
	
	set +e
	rpm -qa | grep gpg-pubkey | grep ${2,,} 2>/dev/null 1>/dev/null
	if [ $? -ne 0 ]; then
		if [ "${IMPORT_GPG_CONFIRMATION}" = "na" ]; then
			get_user_confirmation
		fi
		if [ "${IMPORT_GPG_CONFIRMATION}" = "yes" ]; then
			echo "    $1: Importing key into RPM."
			rpm --import ${GPG_FN} 2>/dev/null 1>/dev/null
			if [ $? -ne 0 ]; then
				echo "GPG-KEY import failed."
				echo "   Downloading the key failed or insufficient permissions to import the key."
				rm -f $GPG_FN
				exit 1
			fi
		else
			set -e
			rm -f $GPG_FN
			trap - EXIT HUP QUIT TERM
			return
		fi
	else
		echo "    $1: Key already exists in RPM, skipping"
	fi
	
	
	gpg --list-keys $2 2>/dev/null 1>/dev/null
	if [ $? -ne 0 ]; then
		if [ "${IMPORT_GPG_CONFIRMATION}" = "na" ]; then
			get_user_confirmation
		fi
		if [ "${IMPORT_GPG_CONFIRMATION}" = "yes" ]; then
			echo "                            Importing key into GPG."
			gpg --import ${GPG_FN} 2>/dev/null 1>/dev/null
			if [ $? -ne 0 ]; then
				echo "GPG-KEY import failed."
				echo "   Downloading the key failed or insufficient permissions to import the key."
				rm -f $GPG_FN
				exit 1
			fi
		fi
	else
		echo "                            Key already exists in GPG, skipping"
	fi
	
	
	set -e
    rm -f $GPG_FN
    trap - EXIT HUP QUIT TERM
}


write_repo() {
    cat > $1 <<-EOF
		[${REPO_NAME}_independent]
		name=${REPO_NAME}_independent
		baseurl=${SERVER}${REPO_URL}os_independent/
		gpgcheck=1
		gpgkey=${GPG_KEY_LOCATION}${GPG_KEY_NAME[0]}
		      ${GPG_KEY_LOCATION}${GPG_KEY_NAME[1]}
		     ${GPG_KEY_LOCATION}${GPG_KEY_NAME[2]}
                    ${GPG_KEY_LOCATION}${GPG_KEY_NAME[3]} 
		enabled=1	
		exclude=dell-system-update*.$exclude_arch

		[${REPO_NAME}_dependent]
		name=${REPO_NAME}_dependent
		mirrorlist=${SERVER}${REPO_URL}mirrors.cgi?osname=${replace_dist}&basearch=$replace_basearch&native=1
		gpgcheck=1
		gpgkey=${GPG_KEY_LOCATION}${GPG_KEY_NAME[0]}
		      ${GPG_KEY_LOCATION}${GPG_KEY_NAME[1]}
		     ${GPG_KEY_LOCATION}${GPG_KEY_NAME[2]}
                    ${GPG_KEY_LOCATION}${GPG_KEY_NAME[3]} 
		enabled=1	
EOF
}

install_all_gpg_keys() {
	echo "Checking for Dell GPG keys..."
    local i=0
    while [ $i -lt ${#GPG_KEY_NAME[*]} ]; do
		if [ "${IMPORT_GPG_CONFIRMATION}" = "no" ]; then
			return
		fi
        install_gpg_key ${GPG_KEY_NAME[$i]} ${GPG_KEY_ID[$i]}
        i=$(( $i + 1 ))
    done
}


# sets $dist
get_dist_version

if [ "${dist}" = "unknown" ]; then
    echo "Unable to determine that you are running an OS I know about."
    echo "Handled OSs include Red Hat Enterprise Linux and CentOS,"
    echo "Fedora Core and Novell SuSE Linux Enterprise Server and OpenSUSE"
    exit 1
fi

basearch=$(uname -i)

REPO_FULL_URL=${SERVER}${REPO_URL}mirrors.cgi/osname=${dist}\&basearch=$basearch\&native=1
replace_basearch=$basearch
replace_dist=$dist

install_all_gpg_keys

case $dist in
    sles*|suse*)
        if [ -e /usr/bin/rug ]; then
            # rug deadlocks if called recursively
            rug sd $REPO_NAME ||:
            yes | rug sa -t ZYPP $REPO_FULL_URL $REPO_NAME
            rug subscribe $REPO_NAME
        elif [ -e /usr/bin/zypp ]; then
            zypp sa -t YUM $REPO_FULL_URL $REPO_NAME
	elif [ -e /usr/bin/zypper ]; then
            zypper removerepo ${REPO_NAME}_independent 1>/dev/null 2>/dev/null
            zypper removerepo ${REPO_NAME}_dependent 1>/dev/null 2>/dev/null
            echo "Write repository configuration"
            zypper addrepo -f ${SERVER}${REPO_URL}os_independent ${REPO_NAME}_independent 1>/dev/null
            zypper addrepo -f ${REPO_FULL_URL}\&redirpath=/ ${REPO_NAME}_dependent 1>/dev/null 
        fi
        ;;
    el[5-9]*|f[0-9]*)
        replace_basearch=\$basearch
        replace_dist=$dist_base\$releasever
    	if [ "$basearch" == "x86_64" ]; then
		exclude_arch=i386
	else
		exclude_arch=x86_64
	fi
        echo "Write repository configuration"
        mkdir -p /etc/yum.repos.d ||:
        write_repo /etc/yum.repos.d/$REPO_NAME.repo
        ;;
esac

echo "Done!"
exit 0

