<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<link rel="stylesheet"  type="text/css"  href="style.css"/>
<title>GoogleSearch</title>
<style> 
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
</head>
<body>
<h1>Mouse Engine</h1>
<div class='icon'><img alt="Mouse" src="icon.jpeg" width="120" height="120"></div>
<form action='TestProject' method='get'>
<div class='brand'><input type='text' name='Brand' placeholder = 'Brand'/></div>
<div class='keyword'><input type='text' name='keyword' placeholder = 'form:number of keyword keyword_name weight'/></div>
<input type='submit' value='Search' />
</form>
<div style="right:3px;position:absolute;">
<div class="container">
    <div class="card">
      <div class="imgBox">
        <img src="image1.jpg ">
      </div>
      <div class="details"> 
        <h2>使用說明</h2>
        <p>關鍵字:
        English:bluetooth,wireless,wired,
        optical,rechargeable,
        powerplay,alkaline,lightsync,laser
        中文:藍芽,無線,有線,光學,充電,強力播放,鹼性電池,光同步,雷射</p>
      </div>
    </div>
  </div>
  </div>
</body>
</html>