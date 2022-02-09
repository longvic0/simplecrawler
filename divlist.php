<?php
$alink=$_POST['link'];
$html = file_get_contents($alink);

$document = new DOMDocument;
$document ->loadHTML($html);
$xPath = new DOMXPath($document );

$anchorTags = $xPath->evaluate("//div[@id=\"prevtable\"]//a/@href");
$iconlist = $xPath->evaluate("//div[@id=\"prevtable\"]//img/@src");
$namelist = $xPath->evaluate("//div[@id=\"prevtable\"]//a/@title");

for ( $i=0;$i < $anchorTags->length; $i++)
{
$anchorTag=$anchorTags->item($i);
$icon=$iconlist->item($i);
$alink=$anchorTag->nodeValue;
$anicon=$icon->nodeValue;
$name=$namelist->item($i);
$aname=$name->nodeValue;
echo $alink."|".$aname."|".$anicon."\r\n";
}

?>
