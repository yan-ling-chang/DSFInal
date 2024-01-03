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

@charset "UTF-8";
body
{
	font:'Montserrat', sans-serif;
	display: flex;
	flex-direction: column;
	background-image: url('https://doc-0o-48-docs.googleusercontent.com/docs/securesc/o3d912seb7rfrj32oh0fv1fsn3f5js2p/8qmdv2g2cql2vsqc947qholaagpmjnmj/1704256200000/11195070319157048878/16853060132303661973/1-2NoAT86UME820cSjM6eoUb44iwwXTkP?e=view&ax=AEqgLxk-fFnc73HEBjbdnde7yXUxGMiMZI5EQGez25l5rXxXfeUbvceeKYReyEShBHS8xQVc11dKynVtA2M9ma33g4z2bkoykHyz_sScXaLAjVJZC6CUJNcpQfn3oXWmi0R1-Sw8vWJA_s8Q_hAMwiMUveqtxraelAXgBgTgldmwK9v6chsXHnhM4H7ZdyEM46jzN6IwSitw6TRPksOkSN7d8Unb82Z3TwUtSNi6zGy6oCsZoOuRwvrrvHF92zmVBpdD6zgKOD1FkMV2-oTndX4DrKC_Nwxwx5wBi7gTAtEOiScdWVvSLY3B0qOz8eEg_LSOaXomaRHx7brxiIQ5hkOUYHMrVNQXi9OwfxOhGIzDrvuZQMLTyg4DiN8Vp7RSowbyrH5yyL5clAbeJwWnQT0X5BAU-J7JQn_DAZ7U4tlH40_VUd-vjcl3s2B59niaP15PLLh41M70SneYVxaeoVhgm5zVYsXYleHkp4gk8k4LlgIXtYKDkgRBI_DSvcWWqIZ0SVo4N1VgOVufPwc4da8V9EFRCWfiOtaMp9OyhM3LsFEBrA9s0dQ_lWGZcHh4xn2sFMC3XEXjavFJAdRxA2I8krGGPYESOvlpmFpBlChn_MufbjzCLSjuQaVKBgz1Qv6ueDkLBKmoYivjOmoHuHQhgVq1YFOuF6UiTepEV6Pczop1dOwsWT7KmX6wKTw9Azp5vjE3ljYTdEBPDqnZu_HviNmM62auWc1fCnoAP6ZcJVqnpeAm7CIzRw1DCCSKZU8hxlpFvh0k3n5n7cqGMfCdVEGMtfipJu412BJ4V8tYzbZkkwBc_0VcyM-fnccPfATcICGEqGv3PROT0sNLnJr5As17u4GWmwcLqtWlItIdCOU4en0iASm6xqvKqdhjC7GpvTX7uLF6hSfEC6A&uuid=f69f42cd-ee2f-4f9c-8633-f0bbf96203f4&authuser=1&nonce=d4pn6n52ptg2k&user=16853060132303661973&hash=id2jksaa03adn4cb3f97mabg1mrent0a');
	background-size: cover;
}
input[type=text]
{
  margin: 0 auto;
  width:500px;
  height:40px;
  transition: width 0.4s ease-in-out;
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
  margin-left:-50px;
}
.brand
{
  position:absolute;
  left:35%;
  top:50%;
  margin-top:-50px;
  margin-left:-50px;
}

h1
{
	display:block;
	color: white;
	font-size:96px;
    text-shadow: 1px 1px 2px black;
    position:absolute;
  	left:35%;
  	top:20%;
  	margin-top:80px;
}
.icon
{
	border-radius: 50%;
	position:absolute;
  	left:53%;
  	top:10%;
  	margin-top:40px;
  	margin-left:-90px;
}
.container
{
	
	max-width:1000px;
	margin:100px auto;
	display:flex;
	flex-wrap: wrap;
	justify-content: space-around;
}
.card
{
	position: relative;
	margin: 20px 0;
	width: 300px;
	height: 400px;
	background: #ffdead;
	transform-style: preserve-3d;
	transform: perspective(2000px);
	transition: 1s; 
	box-shadow: inset 300px 0 50px rgba(0,0,0,.5);
}
.card:hover
{
	z-index: 1000; 
	transform: perspective(2000px) rotate(-10deg); 
	box-shadow: inset 20px 0 50px rgba(0,0,0,.5);
}
.card .imgBox
{
	position: relative;
	width: 100%;
	height: 100%;
	border: 1px solid #000;
	box-sizing: border-box;
	transform-origin: left;
	z-index: 1;
	transition: 1s; 
}
.card:hover .imgBox
{
	transform: rotateY(-135deg);
}
.card .imgBox img
{
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
}
.card .details
{
	position:absolute;
	top:0;
	left:0;
	box-sizing:border-box;
	padding:20px;
	text-shadow: 0px 3px 0px #b2a98f,

                 0px 14px 10px rgba(0,0,0,0.15),

                 0px 24px 2px rgba(0,0,0,0.1),

                 0px 34px 30px rgba(0,0,0,0.1);
    -webkit-text-stroke: 1px #ccff00;
    -webkit-text-fill-color: transparent;
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
  left:45%;
  top:70%;
  margin-top:-50px;
}
</style>
</head>
<body>
<h1>Mouse Engine</h1>
<!-- <div class='icon'><img alt="Mouse" src="icon.jpeg" width="120" height="120"></div> -->
<form action='TestProject' method='get'>
<div class='brand'><input type='text' name='Brand' placeholder = 'Brand'/></div>
<div class='keyword'><input type='text' name='keyword' placeholder = 'form:number of keyword keyword_name weight'/></div>
<input type='submit' value='Search' />
</form>
<div style="right:3px;position:absolute;">
<!--  <div class="container">
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
    </div> -->
  </div>
  </div>
</body>
</html>