<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>cFunction</title>
</head>
<body>
<h1>콜백함수페이지</h1>
<div>
	<button type="button" onclick="loadDoc('txt/ajax_info1.txt',myFunction)">Change Content1</button>
	<button type="button" onclick="loadDoc('txt/ajax_info2.txt',myFunction)">Change Content2</button>
</div>
<div id="demo">

</div>
<script>
	function loadDoc(url, cFunction){
		var xhttp;
		xhttp=new XMLHttpRequest();
		xhttp.onreadystatechange=function(){
			if(this.readyState==4 && this.status==200){
				cFunction(this);
			}
		};
		xhttp.open("GET", url, true);
		xhttp.send();
	}
	function myFunction(xhttp){
		document.getElementById("demo").innerHTML = xhttp.responseText;
	}
</script>
</body>
</html>