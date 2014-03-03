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
ACE_VER='6.2.4'
get_path(){
echo -e 'Welcome to '$COL_BLUE'[ACEtool] '$COL_RESET'currently supported version ('${ACE_VER}') ...'
while true
do
    echo -ne $COL_GREEN'Enter install path: '$COL_RESET
    read -p '' prefix
        if sudo test -d $prefix; then
            prefix=$prefix'/ace'
            if [ `(echo $prefix)` = "/ace" ]; then
                continue
            else
                echo -e 'Installing ACE in: '$prefix
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
echo -e  'ADAPTIVE Communication Environment installer Script '$COL_BLUE'[ACEtool]'$COL_RESET''
echo
echo -ne $COL_BLUE'[ACEtool] '$COL_RESET'Looking for headers ...'
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
echo -ne $COL_BLUE'[ACEtool] '$COL_RESET'Checking source ...'
if
    test -f ~/Downloads/ACE-${ACE_VER}.tar.gz > /dev/null 2>/tmp/Acetool_errorMSG
then
    if [ `echo $(md5 -q ~/Downloads/ACE-${ACE_VER}.tar.gz)` != "f6508cd01ebd2cbd84d22012ab438855" ]
    then
        echo -e $COL_RED' Not found'$COL_RESET
        echo -ne $COL_BLUE'[ACEtool] '$COL_RESET'Getting source ...'
        cd ~/Downloads
        sudo rm -d -f -r ACE-${ACE_VER}.tar.gz > /dev/null 2>/tmp/Acetool_errorMSG
        if
            curl -O -s http://download.dre.vanderbilt.edu/previous_versions/ACE-${ACE_VER}.tar.gz > /dev/null 2>/tmp/Acetool_errorMSG
        then
            echo -e $COL_GREEN' OK'$COL_RESET
        else
            echo -e $COL_RED' error'$COL_RESET
            echo -e $COL_RED'    error '$COL_WHITE$(/bin/cat /tmp/Acetool_errorMSG)$COL_RESET
            rm -d -f -r /tmp/Acetool_errorMSG
            exit 1
        fi
    else
        echo -e $COL_GREEN' OK'$COL_RESET
    fi
else
    echo -e $COL_RED' Not found'$COL_RESET
    echo -ne $COL_BLUE'[ACEtool] '$COL_RESET'Getting source ...'
    cd ~/Downloads
    rm -d -f -r ACE-${ACE_VER}.tar.gz
        if
            curl -O -s http://download.dre.vanderbilt.edu/previous_versions/ACE-${ACE_VER}.tar.gz > /dev/null 2>/tmp/Acetool_errorMSG
        then
            echo -e $COL_GREEN' OK'$COL_RESET
        else
            echo -e $COL_RED' error'$COL_RESET
            echo -e $COL_RED'    error '$COL_WHITE$(/bin/cat /tmp/Acetool_errorMSG)$COL_RESET
            rm -d -f -r /tmp/Acetool_errorMSG
            exit 1
        fi
fi
get_path
echo -ne $COL_BLUE'[ACEtool] '$COL_RESET'Preparing source ...'
if
    cd ~/Downloads
    sudo rm -d -f -r ~/Downloads/ACE_wrappers > /dev/null 2>/tmp/Acetool_errorMSG
    gzcat ~/Downloads/ACE-${ACE_VER}.tar.gz | tar -xpf -
    cd ~/Downloads/ACE_wrappers
    echo 'export ACE_ROOT=$(pwd)' > bash_profile
    echo 'export ACE_ROOT=$ACE_ROOT' >> bash_profile
    echo 'export PATH=$ACE_ROOT/bin:$PATH' >> bash_profile
    echo 'export DYLD_LIBRARY_PATH=$ACE_ROOT/lib' >> bash_profile
    source bash_profile
then
    echo -e $COL_GREEN' OK'$COL_RESET
else
    echo -e $COL_RED' error'$COL_RESET
    echo -e $COL_RED'    error '$COL_WHITE$(/bin/cat /tmp/Acetool_errorMSG)$COL_RESET
    rm -d -f -r /tmp/Acetool_errorMSG
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
    echo -e $COL_GREEN'Building ACE libs with one of the following parameters:'$COL_RESET
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
        [6]* )  export MACOSX_DEPLOYMENT_TARGET=10.6
            export DEPLOYMENT_TARGET=10.6
            export OSX_SDK="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.6.sdk"
            export OSX_SYSROOT="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.6.sdk"
            export MACOSX_SYSROOT="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.6.sdk"
            export CFLAGS="-mmacosx-version-min=10.6 -isysroot $f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.6.sdk -arch i386 -arch x86_64"
            export CCFLAGS="-arch i386 -arch x86_64"
            export CXXFLAGS="-mmacosx-version-min=10.6 -isysroot $f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.6.sdk -arch i386 -arch x86_64"
            export LDFLAGS="-arch i386 -arch x86_64"
            echo '#include "ace/config-macosx-snowleopard.h"' > ./ace/config.h
            echo 'debug = 0' > ./include/makeinclude/platform_macros.GNU
            echo 'shared_libs = 1' >> ./include/makeinclude/platform_macros.GNU
            echo 'static_libs = 1' >> ./include/makeinclude/platform_macros.GNU
            echo 'install_rpath = 0' >> ./include/makeinclude/platform_macros.GNU
            echo 'include ${ACE_ROOT}/include/makeinclude/platform_macosx_snowleopard.GNU' >> ./include/makeinclude/platform_macros.GNU
            echo 'INSTALL_PREFIX = '$prefix >> ./include/makeinclude/platform_macros.GNU
            break ;;
        [7]* ) 
            export MACOSX_DEPLOYMENT_TARGET=10.7
            export DEPLOYMENT_TARGET=10.7
            export OSX_SDK="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.7.sdk"
            export OSX_SYSROOT="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.7.sdk"
            export MACOSX_SYSROOT="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.7.sdk"
            export CFLAGS="-mmacosx-version-min=10.7 -isysroot $f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.7.sdk -arch i386 -arch x86_64"
            export CCFLAGS="-arch i386 -arch x86_64"
            export CXXFLAGS="-mmacosx-version-min=10.7 -isysroot $f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.7.sdk -arch i386 -arch x86_64"
            export LDFLAGS="-arch i386 -arch x86_64"
            echo '#include "ace/config-macosx-lion.h"' > ./ace/config.h
            echo 'debug = 0' > ./include/makeinclude/platform_macros.GNU
            echo 'shared_libs = 1' >> ./include/makeinclude/platform_macros.GNU
            echo 'static_libs = 1' >> ./include/makeinclude/platform_macros.GNU
            echo 'install_rpath = 0' >> ./include/makeinclude/platform_macros.GNU
            echo 'include ${ACE_ROOT}/include/makeinclude/platform_macosx_lion.GNU' >> ./include/makeinclude/platform_macros.GNU
            echo 'INSTALL_PREFIX = '$prefix >> ./include/makeinclude/platform_macros.GNU
            break ;;
        [8]* ) 
            export MACOSX_DEPLOYMENT_TARGET=10.8
            export DEPLOYMENT_TARGET=10.8
            export OSX_SDK="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk"
            export OSX_SYSROOT="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk"
            export MACOSX_SYSROOT="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk"
            export CFLAGS="-mmacosx-version-min=10.8 -isysroot $f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk -arch i386 -arch x86_64"
            export CCFLAGS="-arch i386 -arch x86_64"
            export CXXFLAGS="-mmacosx-version-min=10.8 -isysroot $f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk -arch i386 -arch x86_64"
            export LDFLAGS="-arch i386 -arch x86_64"
            echo '#include "ace/config-macosx-mountainlion.h"' > ./ace/config.h
            echo 'debug = 0' > ./include/makeinclude/platform_macros.GNU
            echo 'shared_libs = 1' >> ./include/makeinclude/platform_macros.GNU
            echo 'static_libs = 1' >> ./include/makeinclude/platform_macros.GNU
            echo 'install_rpath = 0' >> ./include/makeinclude/platform_macros.GNU
            echo 'include ${ACE_ROOT}/include/makeinclude/platform_macosx_mountainlion.GNU' >> ./include/makeinclude/platform_macros.GNU
            echo 'INSTALL_PREFIX = '$prefix >> ./include/makeinclude/platform_macros.GNU
            break ;;
        [9]* )
            export MACOSX_DEPLOYMENT_TARGET=10.9
            export DEPLOYMENT_TARGET=10.9
            export OSX_SDK="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk"
            export OSX_SYSROOT="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk"
            export MACOSX_SYSROOT="$f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk"
            export CFLAGS="-mmacosx-version-min=10.9 -isysroot $f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -arch i386 -arch x86_64"
            export CCFLAGS="-arch i386 -arch x86_64"
            export CXXFLAGS="-mmacosx-version-min=10.9 -isysroot $f/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -arch i386 -arch x86_64"
            export LDFLAGS="-arch i386 -arch x86_64"
            echo '#include "ace/config-macosx-mavericks.h"' > ./ace/config.h
            echo 'debug = 0' > ./include/makeinclude/platform_macros.GNU
            echo 'shared_libs = 1' >> ./include/makeinclude/platform_macros.GNU
            echo 'static_libs = 1' >> ./include/makeinclude/platform_macros.GNU
            echo 'install_rpath = 0' >> ./include/makeinclude/platform_macros.GNU
            echo 'include ${ACE_ROOT}/include/makeinclude/platform_macosx_mavericks.GNU' >> ./include/makeinclude/platform_macros.GNU
            echo 'INSTALL_PREFIX = '$prefix >> ./include/makeinclude/platform_macros.GNU
            break ;;
        [0]* )
            export CFLAGS="-arch i386 -arch x86_64"
            export CCFLAGS="-arch i386 -arch x86_64"
            export CXXFLAGS="-arch i386 -arch x86_64"
            export LDFLAGS="-arch i386 -arch x86_64"
            echo '#include "ace/config-macosx-'$osx'.h"' > ./ace/config.h
            echo 'debug = 0' > ./include/makeinclude/platform_macros.GNU
            echo 'shared_libs = 1' >> ./include/makeinclude/platform_macros.GNU
            echo 'static_libs = 1' >> ./include/makeinclude/platform_macros.GNU
            echo 'install_rpath = 0' >> ./include/makeinclude/platform_macros.GNU
            echo 'include ${ACE_ROOT}/include/makeinclude/platform_macosx_'$osx'.GNU' >> ./include/makeinclude/platform_macros.GNU
            echo 'INSTALL_PREFIX = '$prefix >> ./include/makeinclude/platform_macros.GNU
            break ;;
        [Qq]* ) echo "OK. Bye!"
                exit ;;
        * ) ;;
        esac
    done
echo
echo -ne $COL_BLUE'[ACEtool] '$COL_RESET'Building ACE ...'
    if
        cd ace
        patch -s -f -p0 < <(curl -s https://raw.github.com/jeremymeile/jeremymeile/master/ace_ACE.patch) 2>/tmp/Acetool_errorMSG
        make -j $(sysctl -n hw.ncpu) > /dev/null 2>/tmp/Acetool_errorMSG
    then
        echo -e $COL_GREEN' OK'$COL_RESET
        
        if
        ! sudo () { ( unset LD_LIBRARY_PATH DYLD_LIBRARY_PATH; exec command sudo $* ) }
        then
            exit 1
        fi
        
        echo -ne $COL_BLUE'[ACEtool] '$COL_RESET'Installing ACE ...'
        if
            sudo ACE_ROOT=$ACE_ROOT make install > /dev/null 2>/tmp/Acetool_errorMSG
            sudo install_name_tool -id $prefix/lib/libACE_Compression.dylib $prefix/lib/libACE_Compression.dylib > /dev/null 2>/tmp/Acetool_errorMSG
            sudo install_name_tool -id $prefix/lib/libACE_ETCL_Parser.dylib $prefix/lib/libACE_ETCL_Parser.dylib > /dev/null 2>/tmp/Acetool_errorMSG
            sudo install_name_tool -id $prefix/lib/libACE_ETCL.dylib $prefix/lib/libACE_ETCL.dylib > /dev/null 2>/tmp/Acetool_errorMSG
            sudo install_name_tool -id $prefix/lib/libACE_Monitor_Control.dylib $prefix/lib/libACE_Monitor_Control.dylib > /dev/null 2>/tmp/Acetool_errorMSG
            sudo install_name_tool -id $prefix/lib/libACE_RLECompression.dylib $prefix/lib/libACE_RLECompression.dylib > /dev/null 2>/tmp/Acetool_errorMSG
            sudo install_name_tool -id $prefix/lib/libACE_SSL.dylib $prefix/lib/libACE_SSL.dylib > /dev/null 2>/tmp/Acetool_errorMSG
            sudo install_name_tool -id $prefix/lib/libACE.dylib $prefix/lib/libACE.dylib > /dev/null 2>/tmp/Acetool_errorMSG
        then
            echo -e $COL_GREEN' OK'$COL_RESET
                    echo -ne $COL_BLUE'[ACEtool] '$COL_RESET'Patching ACE ...'
                    if
                        cat $prefix/include/ace/config-macosx-leopard.h | sed -n '/if defined(__APPLE_CC__) && (__APPLE_CC__ < 1173)/!p' | sed -n '/Compiler must be upgraded/!p' | sed -n '/ __APPLE_CC__ /!p' > /tmp/config-macosx-leopard.h
                        sudo cp /tmp/config-macosx-leopard.h $prefix/include/ace/config-macosx-leopard.h
                    then
                        echo -e $COL_GREEN' OK'$COL_RESET
                    else
                        echo -e $COL_RED' error'$COL_RESET
                        echo -e $COL_RED'    error '$COL_WHITE$(/bin/cat /tmp/Acetool_errorMSG)$COL_RESET
                        rm -d -f -r /tmp/Acetool_errorMSG
                    fi
        else
            echo -e $COL_RED' error'$COL_RESET
            echo -e $COL_RED'    error '$COL_WHITE$(/bin/cat /tmp/Acetool_errorMSG)$COL_RESET
            rm -d -f -r /tmp/Acetool_errorMSG
        fi
    else
        echo -e $COL_RED' error'$COL_RESET
        echo -e $COL_RED'    error '$COL_WHITE$(/bin/cat /tmp/Acetool_errorMSG)$COL_RESET
        rm -d -f -r /tmp/Acetool_errorMSG
    fi