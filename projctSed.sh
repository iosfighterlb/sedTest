#!/bin/bash

terminalPath="NETSDK"
cd ./${terminalPath}

dir="$(pwd)/"

pbxproj_LibTest_dir="$(pwd)/LibTest/LibTest.xcodeproj"
pbxproj_Framework_dir="$(pwd)/NETGame/NETGame.xcodeproj"


echo $pbxproj_LibTest_dir
echo $pbxproj_Framework_dir


# 类前缀
class_prefix="MENGYOU_"
# 类后缀
class_suffix="NEWXLS_"


# grep MENGYOU_ -rl ./ | xargs sed -i 's/MENGYOU_/NEWXLS_/g'


# sed -i '{
#             s/'"${class_prefix}"'/'"${class_suffix}"'/g
#         }' `grep ${class_prefix} -rl ${dir}`



        sed -i '{
            s/'"${class_prefix}"'/'"${class_suffix}"'/g
        }' `grep ${class_prefix} -rl ${pbxproj_LibTest_dir}`



        sed -i '{
            s/'"${class_prefix}"'/'"${class_suffix}"'/g
        }' `grep ${class_prefix} -rl ${pbxproj_Framework_dir}`




# http://www.jb51.net/article/124047.htm

function changeName(){
    
    echo "- - - - - - - - - - -"
     
    newfile=`echo $1 | sed 's/'"${class_prefix}"'/'"${class_suffix}"'/g'`

    mv $1 $newfile
}


function travFolder(){ 
    # echo "travFolder"
    flist=`ls $1`
    cd $1
    #echo $flist
    for f in $flist
    do
        if test -d $f
        then

            travFolder $f
        else
            echo "file:$f"
            changeName $f
        fi

    done
    cd ../ 
}




function recurFolder() { 

    flist=`ls $1`
    cd $1

    for f in $flist
    do
        if test -d $f
        then

            newdir=`echo $f | sed 's/'"${class_prefix}"'/'"${class_suffix}"'/g'`
            mv $f $newdir

            recurFolder $newdir
        fi
    done
    cd ../ 
}



# travFolder $dir

# recurFolder $dir


