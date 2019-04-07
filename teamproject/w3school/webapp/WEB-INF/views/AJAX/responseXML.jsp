<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>XMLHttpRequest Object</title>
</head>
<body>
	<p id="demo"></p>
	<script>
		var xhttp, xmlDoc, txt, x, i;
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				xmlDoc = this.responseXML;
				txt = "";
				x = xmlDoc.getElementsByTagName("ARTIST");
				for(i=0; i<x.length; i++)
					{
						txt = txt + x[i].childNodes[0].nodeValue + "<br>";
					}
				document.getElementById("demo").innerHTML = txt;
			}
		};
		xhttp.open("GET", "xml/cd_catalog.xml", true);
		xhttp.send();
	</script>
</body>
</html>