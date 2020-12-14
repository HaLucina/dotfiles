mergeXml="element-keyboard.xml"

echo "<keyboard>" > mergeXml
cat hoge.xml keyboard.xml >> mergeXml
echo "</keyboard>" >> mergeXml
