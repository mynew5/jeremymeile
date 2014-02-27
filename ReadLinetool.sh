#!/bin/bash
# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"
COL_GRAY=$ESC_SEQ"30;01m"
COL_WHITE=$ESC_SEQ"37;01m"
READLINE_VER='6.3'
get_path(){
echo -e 'Welcome to '$COL_BLUE'[Readlinetool] '$COL_RESET'currently supported version ('${READLINE_VER}') ...'
while true
do
	echo -ne $COL_GREEN'Enter install path: '$COL_RESET
	read -p '' prefix
		if sudo test -d $prefix; then
			prefix=$prefix'/readline'
			if [ `(echo $prefix)` = "/readline" ]; then
				continue
			else
				echo -e 'Installing GNU Readline in: '$prefix
				break
			fi
		else
			echo -e 'Path does not exists'
			continue
		fi
done
}
echo
printf '%b\n' " ______"
printf '%b\n' "/\\____ \\    ___   _ __    ___     ___  __   __  __"
printf '%b\n' "\\/___/\\ \\ /' <>\`\\/\\\`'__\\/' <>\`\\ /' _ \`' _\`\\/\\ \\/\\ \\ "
printf '%b\n' "    _\\ \\ \\/\\  ___\\ \\ \\/ /\\  ___\\/\\ \\/\\ \\/\\ \\ \\ \\_\\ \\ "
printf '%b\n' "   /\\ \\_\\ \\ \\ \\__/\\ \\_\\ \\ \\ \\__/\\ \\_\\ \\_\\ \\_\\/\`____ \\ "
printf '%b\n' "   \\ \\_____\\/\`____/\\ \\_\\ \\/\`____/\\ \\_\\ \\_\\ \\_\\/___/> \\ "
printf '%b\n' "    \`/____/ \`/___/  \\/_/  \`/___/  \\/_/\\/_/\\/_/  /\\___/ "
printf '%b\n' "  http://jeremymeile.ch             M E I L E   \\/__/ "
echo
echo -e  'GNU Readline installer Script '$COL_BLUE'[Readlinetool]'$COL_RESET''
echo
echo -ne $COL_BLUE'[Readlinetool] '$COL_RESET'Looking for headers ...'
if [[ -d /usr/include ]]
then
	echo -e $COL_GREEN' OK'$COL_RESET
else
	echo -e $COL_RED' Not found, running "xcode-select --install"'$COL_RESET
	xcode-select --install
	exit 1
fi
if
	sudo -v
then
	echo
else
	exit
fi
cd /usr/local
echo -ne $COL_BLUE'[Readlinetool] '$COL_RESET'Checking source ...'
if
	test -f ~/Downloads/readline-${READLINE_VER}.tar.gz > /dev/null 2>/tmp/Readlinetool_errorMSG
then
	if [ `echo $(md5 -q ~/Downloads/readline-${READLINE_VER}.tar.gz)` != "67948acb2ca081f23359d0256e9a271c" ]
	then
		echo -e $COL_RED' Not found'$COL_RESET
		echo -ne $COL_BLUE'[Readlinetool] '$COL_RESET'Getting source ...'
		cd ~/Downloads
		sudo rm -d -f -r readline-${READLINE_VER}.tar.gz > /dev/null 2>/tmp/Readlinetool_errorMSG
		if
			curl -O -s ftp://ftp.cwru.edu/pub/bash/readline-${READLINE_VER}.tar.gz > /dev/null 2>/tmp/Readlinetool_errorMSG
		then
			echo -e $COL_GREEN' OK'$COL_RESET
		else
			echo -e $COL_RED' error'$COL_RESET
			echo -e $COL_RED'    error '$COL_WHITE$(/bin/cat /tmp/Readlinetool_errorMSG)$COL_RESET
			exit 1
		fi
	else
		echo -e $COL_GREEN' OK'$COL_RESET
	fi
else
	echo -e $COL_RED' Not found'$COL_RESET
	echo -ne $COL_BLUE'[Readlinetool] '$COL_RESET'Getting source ...'
	cd ~/Downloads
	rm -d -f -r readline-${READLINE_VER}.tar.gz
		if
			curl -O -s ftp://ftp.cwru.edu/pub/bash/readline-${READLINE_VER}.tar.gz > /dev/null 2>/tmp/Readlinetool_errorMSG
		then
			echo -e $COL_GREEN' OK'$COL_RESET
		else
			echo -e $COL_RED' error'$COL_RESET
			echo -e $COL_RED'    error '$COL_WHITE$(/bin/cat /tmp/Readlinetool_errorMSG)$COL_RESET
			exit 1
		fi
fi
get_path
echo -ne $COL_BLUE'[Readlinetool] '$COL_RESET'Preparing source ...'
if
	cd ~/Downloads
	sudo rm -d -f -r ~/Downloads/readline-${READLINE_VER} > /dev/null 2>/tmp/Readlinetool_errorMSG
	gzcat ~/Downloads/readline-${READLINE_VER}.tar.gz | tar -xpf -
	cd readline-${READLINE_VER}
	mkdir build
	cd build
then
	echo -e $COL_GREEN' OK'$COL_RESET
else
	echo -e $COL_RED' error'$COL_RESET
	echo -e $COL_RED'    error '$COL_WHITE$(/bin/cat /tmp/Readlinetool_errorMSG)$COL_RESET
	exit 1
fi

	if [ $(sw_vers -productVersion | cut -c 1-4) = "10.9" ]
	then
		osx="mavericks"
	fi
	if [ $(sw_vers -productVersion | cut -c 1-4) = "10.8" ]
	then
		osx="mountainlion"
	fi
	if [ $(sw_vers -productVersion | cut -c 1-4) = "10.7" ]
	then
		osx="lion"
	fi
	if [ $(sw_vers -productVersion | cut -c 1-4) = "10.6" ]
	then
		osx="snowleopard"
	fi
	if [ $(sw_vers -productVersion | cut -c 1-4) = "10.5" ]
	then
		osx="leopard"
	fi

if f=$(xcode-select --print-path)
then
echo
	echo -e $COL_GREEN'Building GNU Readline with one of the following parameters:'$COL_RESET
		if test -d $f'/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.6.sdk'
		then
			echo -e ' - Use MacOSX10.6.sdk, Universal [6]'
		fi
		if test -d $f'/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.7.sdk'
		then
			echo -e ' - Use MacOSX10.7.sdk, Universal [7]'
		fi
		if test -d $f'/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk'
		then
			echo -e ' - Use MacOSX10.8.sdk, Universal [8]'
		fi
		if test -d $f'/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk'
		then
			echo -e ' - Use MacOSX10.9.sdk, Universal [9]'
		fi
		echo -e ' - Default ('$osx'), Universal [0]'
		echo -ne $COL_GREEN'To continue chose and press Enter. '$COL_RESET
else
	echo -e 'Install and initialize XCode first!'
	exit 1
fi

	while true; do
		read -p '' yn
		case $yn in
		[6]* )	export MACOSX_DEPLOYMENT_TARGET=10.6
				export OSX_SDK="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.6.sdk"
				export OSX_SYSROOT="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.6.sdk"
				export MACOSX_SYSROOT="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.6.sdk"
				export CFLAGS="-mmacosx-version-min=10.6 -isysroot $f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.6.sdk -arch i386 -arch x86_64"
				export CCFLAGS="-arch i386 -arch x86_64"
				export CXXFLAGS="-mmacosx-version-min=10.6 -isysroot $f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.6.sdk -arch i386 -arch x86_64"
				export LDFLAGS="-arch i386 -arch x86_64"
				break ;;
		[7]* )	export MACOSX_DEPLOYMENT_TARGET=10.7
				export OSX_SDK="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.7.sdk"
				export OSX_SYSROOT="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.7.sdk"
				export MACOSX_SYSROOT="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.7.sdk"
				export CFLAGS="-mmacosx-version-min=10.7 -isysroot $f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.7.sdk -arch i386 -arch x86_64"
				export CCFLAGS="-arch i386 -arch x86_64"
				export CXXFLAGS="-mmacosx-version-min=10.7 -isysroot $f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.7.sdk -arch i386 -arch x86_64"
				export LDFLAGS="-arch i386 -arch x86_64"
				break ;;
		[8]* )	export MACOSX_DEPLOYMENT_TARGET=10.8
				export OSX_SDK="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk"
				export OSX_SYSROOT="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk"
				export MACOSX_SYSROOT="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk"
				export CFLAGS="-mmacosx-version-min=10.8 -isysroot $f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk -arch i386 -arch x86_64"
				export CCFLAGS="-arch i386 -arch x86_64"
				export CXXFLAGS="-mmacosx-version-min=10.8 -isysroot $f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk -arch i386 -arch x86_64"
				export LDFLAGS="-arch i386 -arch x86_64"
				break ;;
		[9]* )	export MACOSX_DEPLOYMENT_TARGET=10.9
				export OSX_SDK="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk"
				export OSX_SYSROOT="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk"
				export MACOSX_SYSROOT="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk"
				export CFLAGS="-mmacosx-version-min=10.9 -isysroot $f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -arch i386 -arch x86_64"
				export CCFLAGS="-arch i386 -arch x86_64"
				export CXXFLAGS="-mmacosx-version-min=10.9 -isysroot $f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -arch i386 -arch x86_64"
				export LDFLAGS="-arch i386 -arch x86_64"
				break ;;
		[0]* )	#archi=$(sysctl -n hw.machine)
				export CFLAGS="-arch i386 -arch x86_64"
				export CCFLAGS="-arch i386 -arch x86_64"
				export CXXFLAGS="-arch i386 -arch x86_64"
				export LDFLAGS="-arch i386 -arch x86_64"
				break ;;
		[Qq]* ) echo "OK. Bye!"
				exit ;;
		* ) ;;
		esac
	done

echo
echo -ne $COL_BLUE'[Readlinetool] '$COL_RESET'Configurating Readline ...'
	if
		../configure --prefix=$prefix --enable-multibyte --enable-static --enable-shared > /dev/null 2>/tmp/Readlinetool_errorMSG
	then
		echo -e $COL_GREEN' OK'$COL_RESET
		echo -ne $COL_BLUE'[Readlinetool] '$COL_RESET'Building Readline ...'
		if
		make -j $(sysctl -n hw.ncpu) > /dev/null 2>/tmp/Readlinetool_errorMSG
		then
			echo -e $COL_GREEN' OK'$COL_RESET
			sudo -v
			echo -ne $COL_BLUE'[Readlinetool] '$COL_RESET'Installing Readline ...'
				if
					sudo make install > /dev/null 2>/tmp/Readlinetool_errorMSG
				then
					echo -e $COL_GREEN' OK'$COL_RESET
				else
					echo -e $COL_RED' error'$COL_RESET
					echo -e $COL_RED'    error '$COL_WHITE$(/bin/cat /tmp/Readlinetool_errorMSG)$COL_RESET
					exit 1
				fi
		else
			echo -e $COL_RED' error'$COL_RESET
			echo -e $COL_RED'    error '$COL_WHITE$(/bin/cat /tmp/Readlinetool_errorMSG)$COL_RESET
			exit 1
		fi
	else
		echo -e $COL_RED' error'$COL_RESET
		echo -e $COL_RED'    error '$COL_WHITE$(/bin/cat /tmp/Readlinetool_errorMSG)$COL_RESET
		exit 1
	fi
		
