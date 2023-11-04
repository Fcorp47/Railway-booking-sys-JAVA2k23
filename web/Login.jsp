<%-- 
    Document   : Login
    Created on : 2 Oct, 2022, 10:34:54 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="menu.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AP | LOGIN</title>
        <script>  
    function preventBack(){ window.history.forward(); }  
    setTimeout("preventBack()", 0);  
    window.onunload = function () { null };  
</script>
    </head>
    <body>
    <h2>Login Form</h2>

<form action="Controller" method="post">
  <div class="imgcontainer">
    <img src="loginimg.jpg" alt="Avatar" class="avatar">
  </div>

  <div class="container">
      <center>
      <label for="uname"><b>Username</b></label><br>
    <input type="text" placeholder="Enter Username" name="txtusername" required><br>

    <label for="psw"><b>Password</b></label><br>
    <input type="password" placeholder="Enter Password" name="txtpassword" required><br>
 
    <input type="submit" name="btn" value="Login">
         </center>
        <span class="psw">Forgot <a href="#">password?</a></span>
  </div>

  <div class="container" style="background-color:#f1f1f1">
   

  </div>
</form>
    <style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 9px solid #f1f1f1;}

input[type=text], input[type=password] {
  width: 30%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 20%;
  border-radius: 10px;
}

input[type=submit]:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.imgcontainer {
  text-align: center;
  margin: 12px 0 12px 0;
}

img.avatar {
  width: 20%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
    </body>
</html>
