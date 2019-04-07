<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">

<title>AJAX</title>

</head>
   

<body>
<h2>The XMLHttpRequest Object</h2>

<button type="button" onclick="loadDoc()">Request data</button>
<a href="/cFunction">콜백함수</a>
<a href="/responseXML">responseXML</a>
<p id="demo"></p>


<script>
/* 비동기식
function loadDoc() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("demo").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "/txt/demo_get.txt", true);
  xhttp.send();
} */

//동기식 : 추천하지 않는 방식
function loadDoc(){
	var xhttp = new XMLHttpRequest();
	xhttp.open("GET", "/txt/demo_get.txt", false);
	xhttp.send();
	document.getElementById("demo").innerHTML=xhttp.responseText;
}
</script>

 
</body>
</html>