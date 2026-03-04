#!/bin/sh

find ./src/ -type f |awk -F/ '{print $NF}' | while read f; 
	do
		cat "./src/$f" "./default/$f" > ./$f
		sed -i -e 's/^/  /' \
				-e '1i <'${f%.*}'>' \
				-e '$a </'${f%.*}'>' ./$f
	done

#ln -fs $PWD/lubuntu-rc.xml ~/.config/openbox/lubuntu-rc.xml

ls *.xml | xargs -I{} ln -sf $PWD/{} ~/.config/openbox/{}

#customFiles=
#
#mergedKbXml="rc_keyboard.xml"
#mergedApXml="rc_applications.xml"
#
#echo "<keyboard>" > ${mergedKbXml}
#cat my-keybind.xml default-keybind.xml >> ${mergedKbXml}
#echo "</keyboard>" >> ${mergedKbXml}
#
#echo "<applications>" > ${mergedApXml}
#cat my-application.xml default-application.xml >> ${mergedApXml}
#echo "</applications>" >> ${mergedApXml}
