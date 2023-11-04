<%-- 
    Document   : paycheckout
    Created on : 2 Nov, 2022, 9:24:18 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        
       <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Form</title>
    <link href="paymentform.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
        integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script>  
    function preventBack() { window.history.forward(); }  
    setTimeout("preventBack()", 0);  
    window.onunload = function () { null };  
</script>

        
    </head>
    <body>
    <div class="wrapper">
        <h2>Payment Gateway</h2>
        <form name="form1" onsubmit="required()">
            <h4>Account</h4>
            <div class="input-group">
                <div class="input-box">
                    <input type="text" name="txtname" placeholder="Full Name" required class="name">
                    <i class="fa fa-user icon"></i>
                </div>
               
            </div>
            <div class="input-group">
                <div class="input-box">
                    <input type="email" placeholder="Email Adress" name="txtemail" required class="name">
                    <i class="fa fa-envelope icon"></i>
                </div>
            </div>
           
            <div class="input-group">
                <div class="input-box">
                    <h4>Payment Details</h4>
                    <input type="radio" name="pay" id="bc1" checked class="radio" >
                    <label for="bc1"><span><i class="fa fa-cc-visa"></i> Credit Card</span></label>
                    <input type="radio" name="pay" id="bc2" class="radio">
                    <label for="bc2"><span><i class="fa fa-cc-paypal"></i> Paypal</span></label>
                </div>
            </div>
            <div class="input-group">
                <div class="input-box">
                    <input type="tel" placeholder="Name on Card" maxlength="30" name="namecard" required class="name">
                    <i class="fa fa-user icon"></i>
                </div>
            </div>
            <div class="input-group">
                <div class="input-box">
                    <input type="tel" placeholder="Card Number" name="cardnumber" maxlength="16" required class="name">
                    <i class="fa fa-credit-card icon"></i>
                </div>
            </div>
            <div class="input-group">
                <div class="input-box">
                    <input type="tel" placeholder="Card CVC" maxlength="3" name="cvc" required class="name">
                    <i class="fa fa-user icon"></i>
                </div>
                <div class="input-box">
                    <input type="tel" placeholder="Card Exp dd/yy" maxlength="5" name="expdate" required class="name">
                    <i class="fa fa-calendar icon"></i>
                   
                </div>
            </div>
            <div class="input-group">
                <div class="input-box">
                    <button type="button" class="btn btn-primary btn-lg" id="btnFetch" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Processing Payment">PAY NOW</button>
                </div>
            </div>
        </form>
    </div>

<script type="text/javascript">
  
    $(document).ready(function() {
    $("#btnFetch").click(function() {
        var fname = document.forms["form1"]["txtname"].value;
        var email = document.forms["form1"]["txtemail"].value;
        var namecard = document.forms["form1"]["namecard"].value;
        var card = document.forms["form1"]["cardnumber"].value;
        var cvc = document.forms["form1"]["cvc"].value;
        var exp = document.forms["form1"]["expdate"].value;
        if (fname == "" || email == "" || namecard == "" || card == "" || cvc == "" || exp == "")
        {
            alert("Fields cannot be empty");
        }else{
      // disable button
      $(this).prop("disabled", true);
      // add spinner to button
      $(this).html(
        '<i class="fa fa-circle-o-notch fa-spin"></i> Payment processing...'
      );
       setTimeout(function(){
            window.location.href = '/RailwayTicketSys/Home.jsp/paysuccess.jsp';
         }, 2000);
        }
    });
});
    
    
    /*  
$('.btn').on('click', function() {
    var $this = $(this);
  $this.button('loading');
    setTimeout(function() {
       $this.button('reset');
   }, 5000);
});
*/
    
    </script>
    
        
        <style>
            *{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
body{
  background-color: #f5f5f5;
  font-family: Arial, Helvetica, sans-serif;
}
.wrapper{
  background-color: #fff;
  width: 420px;
  padding: 25px;
  margin: 70px auto 0;
  box-shadow: 0px 0px 20px rgba(0,0,0,0.5);
  border-radius: 3%;
}
.wrapper h2{
  background-color: #fcfcfc;
  color: black;
  font-size: 24px;
  padding: 10px;
  margin-bottom: 20px;
  text-align: center;
  border: 1px dotted #333;
}
h4{
  padding-bottom: 5px;
  color: #6666ff;
}
.input-group{
  margin-bottom: 8px;
  width: 100%;
  position: relative;
  display: flex;
  flex-direction: row;
  padding: 5px 0;
}
.input-box{
  width: 100%;
  margin-right: 12px;
  position: relative;
}
.input-box:last-child{
  margin-right: 0;
}
.name{
  padding: 14px 10px 14px 50px;
  width: 100%;
  background-color: #fcfcfc;
  border: 1px solid #00000033;
  outline: none;
  letter-spacing: 1px;
  transition: 0.3s;
  border-radius: 3px;
  color: #333;
}
.name:focus, .dob:focus{
  -webkit-box-shadow:0 0 2px 1px #7ed32180;
  -moz-box-shadow:0 0 2px 1px #7ed32180;
  box-shadow: 0 0 2px 1px #7ed32180;
  border: 1px solid #7ed321;
}
.input-box .icon{
  width: 48px;
  display: flex;
  justify-content: center;
  align-items: center;
  position: absolute;
  top: 0px;
  left: 0px;
  bottom: 0px;
  color: #333;
  background-color: #f1f1f1;
  border-radius: 2px 0 0 2px;
  transition: 0.3s;
  font-size: 20px;
  pointer-events: none;
  border: 1px solid #00000033;
  border-right: none;
}
.name:focus + .icon{
  background-color:#3300cc;
  color: #fff;
  border-right: 1px solid #6666ff;
  border: none;
  transition: 1s;
}
.dob{
  width: 30%;
  padding: 14px;
  text-align: center;
  background-color: #fcfcfc;
  transition: 0.3s;
  outline: none;
  border: 1px solid #c0bfbf;
  border-radius: 3px;
}
.radio{
  display: none;
}
.input-box label{
  width: 50%;
  padding: 13px;
  background-color: #fcfcfc;
  display: inline-block;
  float: left;
  text-align: center;
  border: 1px solid #c0bfbf;
}
.input-box label:first-of-type{
  border-top-left-radius: 3px;
  border-bottom-left-radius: 3px;
  border-right: none;
}
.input-box label:last-of-type{
  border-top-right-radius: 3px;
  border-bottom-right-radius: 3px;
}
.radio:checked + label{
  background-color: #3300cc;
  color: #fff;
  transition: 0.5s;
}
.input-box select{
  display: inline-block;
  width: 50%;
  padding: 12px;
  background-color: #fcfcfc;
  float: left;
  text-align: center;
  font-size: 16px;
  outline: none;
  border: 1px solid #c0bfbf;
  cursor: pointer;
  transition: all 0.2s ease;
}
.input-box select:focus{
    background-color: #3300cc;
  color: #fff;
  text-align: center;
}
button{
  width: 100%;
  background: transparent;
  border: none;
  background: #3300cc;
  color: #fff;
  padding: 15px;
  border-radius: 4px;
  font-size: 16px;
  transition: all 0.35s ease;
  border-radius: 20px;
}
button:hover{
  cursor: pointer;
  background: #5eb105;
}
            </style>
</body>
</html>
