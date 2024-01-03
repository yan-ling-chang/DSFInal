<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="org.jsoup.Jsoup"%>
<%@ page import="org.jsoup.nodes.Document"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="java.util.*" %>
<%
HashMap<String,Double> unsort_map=(HashMap<String,Double>) request.getAttribute("unsort_map");
HashMap<String,Double> sort_map=(HashMap<String,Double>) request.getAttribute("sort_map");%>
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 for (String key : sort_map.keySet()) {%>
<%if(unsort_map.get(key) > 0){ %>
<% 
map = new HashMap<Object,Object>(); map.put("label", getTitle(key.toString())); map.put("y", unsort_map.get(key)); list.add(map);
%>
	<%}%>
<%
}
%>
<% 
String dataPoints = gsonObj.toJson(list);
System.out.println(dataPoints);
%>
<!DOCTYPE html>
<html>
<head>
<style>

body
{
	font:'Montserrat', sans-serif;
	display: flex;
	flex-direction: column;
	background-color:  #888c91;
}
h2
{
    
    text-align: center;
}
img
{
	border-radius: 50%;
	position:absolute;
	display: block;
    display:  flex;
    align-items: center;
    justify-content:  center;
}
h1
{
  color: white;
  font-size: 10vw;
  text-shadow: 4px 4px 0px #3F7FBF;
  mix-blend-mode: screen;
  animation: fadeIn 2.5s linear forwards;
  text-align: center;
}
.container
{
  background-color: white;
  display: flex;
  height: 100%;
  width: 100%;
  padding: 1rem;
  justify-content: center;
  align-items: center;
  text-align: center;
}
@keyframes fadeIn {
    0% {
        opacity: 0;
    }
    100% {
        opacity: 1;
    }
}
input[type=text]
{
  width:500px;
  height:40px;
  /* transition: width 0.4s ease-in-out; */
  padding:5px 15px; background:#ccc; border:0 none;
  cursor:pointer;
  -webkit-border-radius: 5px;
  border-radius: 30px; 
}
.keyword
{
  position:absolute;
  left:35%;
  top:60%;
  margin-top:-50px;
}
.brand
{
  position:absolute;
  left:35%;
  top:50%;
  margin-top:-50px;
}
input[type=text]:focus {
  width: 60%;
}


a {
    color:white;
    font-weight:600;
    text-decoration: none;
}
input[type=button], input[type=submit]{
  background-color: #96a9e3;
  border: none;
  color: white;
  padding: 16px 32px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
  -webkit-border-radius: 5px;
  border-radius: 5px;
  position:absolute;
  left:50%;
  top:70%;
  margin-top:-50px;
  margin-left:-50px;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<link rel="stylesheet"  type="text/css"  href="style2.css"/>
<title>GoogleSearch</title>
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	title: {
		text: "Website Distribution"
	},
	axisX: {
		title: "Website Name"
	},
	axisY: {
		title: "Socre",
		includeZero: true
	},
	data: [{
		type: "column",
		yValueFormatString: "#,##0.0# score",
		dataPoints: <%out.print(dataPoints);%>
	}]
});
chart.render();
 
}
</script>
</head>
<body style="background-color:style=background-color:powderblue;">
<!-- <img alt="Mouse" src="icon.jpeg" width="120" height="120"> -->
<div class="container"></div><h1>Mouse Engine</h1>
<form action='TestProject' method='get'>
<div class='brand'><input type='text' name='Brand' placeholder = 'Brand'/></div>
<div class='keyword'><input type='text' name='keyword' placeholder = 'form:number of keyword keyword_name weight'/></div>
<div class='btn'><input type='submit' value='Search' /></div>
</form><br><br><br><br>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<%for (String key : sort_map.keySet()) {%>
<%if(unsort_map.get(key) > 0){ %>
<h2 align="center">
	<h2 > <a href='<%=key.toString()%>'><%out.println(getTitle(key.toString())); %></a></h2>
	<%}%>
<%
}
%>
<%!public String getTitle(String url) {
	String title = "";
	try {
		Document doc = Jsoup.connect(url).get();
		title = doc.title();
	} catch (Exception e) {
		// e.printStackTrace();
		return url;
	}
	return title;
} %>
</h2>
</body>
</html>