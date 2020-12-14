mergeXml='element-keyboard.xml'

echo "<keyboard>" > ${mergeXml}
cat my-keybind.xml default-keybind.xml >> ${mergeXml}
echo "</keyboard>" >> ${mergeXml}
