<%-- 
    Document   : Register
    Created on : 4 Oct, 2022, 9:50:23 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="menu.jsp" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="jquery-3.6.0.min.js"></script>
   
    </head>
    <body>
    <CENTER><label for="uname"><b><H2>User Registration</h2></b></label></center>
        <form action="Controller" method="post">
 

  <div class="container">
    <label for="uname"><b>Username</b></label>
    <input type="text" placeholder="Enter Username" id="firstnamesymbol" name="txtusername" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" maxlength="8" name="txtpassword" required>
    
    <label for="uname"><b>First Name</b></label>
    <input type="text" placeholder="Enter First Name" id="fnameid" name="txtfname" required>
  
    <label for="uname"><b>Last Name</b></label>
    <input type="text" placeholder="Enter Last Name" id="lnameid" name="txtlname" required>
  
    <label for="uname"><b>Occupation:</b></label>
    <select name="txtoccupation">
        <option>Government</option>
        <option>Public</option>
        <option>Private</option>
        <option>Self-employed</option>
        <option>Student</option>
    </select> <br><br>
    
    <label for="uname"><b>DOB</b></label>
    <input type="date" name="txtdob" required><br><br>
    
    <label for="uname"><b>GENDER</b></label><br>
    <input type="radio" name="txtgender" value="male"  required>Male
    <input type="radio"  name="txtgender" value="female"  required>Female
    <input type="radio"  name="txtgender" value="transgender"  required>Transgender
  
    <br><br>
    
     <label for="uname"><b>Email</b></label>
     <input type="email" placeholder="Enter Email" name="txtemail" required>
  
     <label for="uname"><b>mobile no</b></label>
     <input type="number" placeholder="Enter Mobile no" id="phoneid" maxlength="10" name="txtmobile" required>
  
     <label for="uname"><b>Address</b></label>
    <input type="text" placeholder="Enter Address" name="txtaddress" required>
  
     <label for="uname"><b>Pin code</b></label>
     <input type="number" placeholder="Enter Pincode" name="txtpincode" maxlength="6" required>
  
     <label for="uname"><b>State</b></label>
    <input type="text" placeholder="Enter State" name="txtstate" required>
  
     <label for="uname"><b>City</b></label>
    <input type="text" placeholder="Enter City" name="txtcity" required>
  
    
     <label>
      <input type="checkbox" name="txtcheck"> I have read and agree with terms and conditions
    </label>
    
    
    
    <input type="submit" name="btn" value="Register">
   
  </div>

 
</form>
        <script>
            $('#firstnamesymbol').on('keypress', function (event) {
                var regex = new RegExp("^[a-zA-Z0-9]+$");
                var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
                if (!regex.test(key)) {
                    event.preventDefault();
                    return false;
                }
            });
           
            
            //no spaces and symbols in firstname and lastname
            $('#fnameid').on('keypress', function (event) {
                var regex = new RegExp("^[a-zA-Z]+$");
                var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
                if (!regex.test(key)) {
                    event.preventDefault();
                    return false;
                }
            });
            
            $('#lnameid').on('keypress', function (event) {
                var regex = new RegExp("^[a-zA-Z]+$");
                var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
                if (!regex.test(key)) {
                    event.preventDefault();
                    return false;
                }
            });
           
           //capitalize first letter (firstname)
           $('#fnameid').keyup(function(evt){
            var txt = $(this).val();
            $(this).val(txt.replace(/^(.)|\s(.)/g, function($1){ return $1.toUpperCase( ); }));
        });
           //captitalize first letter (lastname)
           $('#lnameid').keyup(function(evt){
            var txt = $(this).val();
            $(this).val(txt.replace(/^(.)|\s(.)/g, function($1){ return $1.toUpperCase( ); }));
        });
        
        
        //phonenumber (only number allowed script)
        $('#phoneid').on('keypress', function (event) {
                var regex = new RegExp("^[0-9]+$");
                var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
                if (!regex.test(key)) {
                    event.preventDefault();
                    return false;
                }
            });
        
        
        
        </script>
        
        
    <style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password], input[type=email],input[type=number] {
  width: 100%;
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
  width: 100%;
}

button:hover {
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
