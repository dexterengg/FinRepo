<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="FinAdmin_index" %>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Fincart Admin login screen</title>
  
   <link href="css/bootstap.min.css" rel="stylesheet" />
    <link href="css/loginstyle.css" rel="stylesheet" />
   
</head>

<body>
      <header> 
      <center>   <img src="images/fincart.png" class="logo img-responsive" />  </center> 
     </header>
  <div class="wrapper">
      
  
	<div class="container">
        <div>        <img src="images/business-woman-icon-24_ver_0.png" class=" img-responsive img-thumbnail img-circle"/> </div>

		<h1>Welcome</h1>
		
		<form class="form">
			<input type="text" placeholder="Username">
			<input type="password" placeholder="Password">
			<button type="submit" id="login-button">Login</button>
		</form>
	</div>
	
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
</div>
 
    <script src="js/jquery/jquery-2.1.3.min.js"></script>
    <script src="js/adminlogin.js"></script>

</body>
</html>

