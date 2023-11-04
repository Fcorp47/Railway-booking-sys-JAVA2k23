<%-- 
    Document   : Home
    Created on : 2 Oct, 2022, 10:56:51 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="menu.jsp" />
<!DOCTYPE html>

<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="menucss/bootstrap.min.css" />

	 <script>  
var request=new XMLHttpRequest();  
function searchInfo(){  
var name=document.myform.txtfrom.value;  
var url="index.jsp?val="+name;  
  
try{  
request.onreadystatechange=function(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('mylocation').innerHTML=val;  

}  
}
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  

function selectstation(val)
{
   
  //  alert(val);
    $("#fromtxt").val(val);
    $("#mylocation").hide();
   
    
}

function searchstat(){  
var name=document.myform.txtto.value;  
var url="tojsp.jsp?val="+name;  
  
try{  
request.onreadystatechange=function(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('tolocation').innerHTML=val;  

}  
}
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  


function selectstations(val)
{
   
  //  alert(val);
    $("#totxt").val(val);
    $("#tolocation").hide();
   
    
}


$(function(){
    var dtToday = new Date();

    var month = dtToday.getMonth() + 1;
    var day = dtToday.getDate();
    var year = dtToday.getFullYear();
    if(month < 10)
        month = '0' + month.toString();
    if(day < 10)
        day = '0' + day.toString();

    var minDate= year + '-' + month + '-' + day;

    $('#txtDate').attr('min', minDate);
});


//no spaces and symbols in from and to
            $('#fromtxt').on('keypress', function (event) {
                var regex = new RegExp("^[a-zA-Z]+$");
                var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
                if (!regex.test(key)) {
                    event.preventDefault();
                    return false;
                }
            });
            
            $('#totxt').on('keypress', function (event) {
                var regex = new RegExp("^[a-zA-Z]+$");
                var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
                if (!regex.test(key)) {
                    event.preventDefault();
                    return false;
                }
            });

</script>  
        
        
        
    </head>
    <body>
        
        <form action="Trainlist.jsp" name="myform" method="post">
       	<div id="booking" class="section">
		<div class="section-center">
			<div class="container">
				<div class="row">
					<div class="col-md-7 col-md-push-5">
						<div class="booking-cta">
                                                    <h1 style="color:white">I - RAIL</h1>
                                                    <h2 style="color:white">Book Ticket</h2>
                                                    <p style="color:white"><B><% if(session.getAttribute("User")!= null) out.print("WELCOME "+session.getAttribute("User")+" "+session.getAttribute("Lname") ); else out.print(""); %> 
                                                            </b></p>
						</div>
					</div>
                                                        
					<div class="col-md-4 col-md-pull-7">
						<div class="booking-form">
                                                    
							<form>
                                                  
								<div class="form-group">
									<span class="form-label">FROM</span>
                                                                        <input class="form-control" name="txtfrom" id="fromtxt" onkeyup="searchInfo()" type="text" placeholder="FROM" required>                                                                       
                                                                        <div id="mylocation"> </div>
                                                                        
                                                                </div>  
                                                                <div class="form-group">
                                                                            <span class="form-label">TO </span>
                                                                            <input class="form-control" name="txtto" onkeyup="searchstat()" id="totxt" type="text" placeholder="TO" required>
                                                                              <div id="tolocation"> </div>

                                                                </div>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<span class="form-label">Choose Date</span>
                                                                                        <input class="form-control" id="txtDate" name="txtdate" type="date" required>
										</div>
									</div>
									
								</div>
								<div class="row">
									
									
								</div>
								<div class="form-btn">
                                                                    <button type="submit" id="buttonsearch" name="btn" value="searchtrain" onclick="checkstation()" class="submit-btn">Search Trains</button>
								</div><br><br>
                                                            <font size="4" ><a href="lastbookticket.jsp"><% if(session.getAttribute("User")!= null){out.print("Booked ticket history");}%> </a></font>
							
                                                        
                                                          
                                                            
                                                        
                                                        </form>
                                                        
                                                        
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
                                                        
    </form>

     <script>
         function checkstation(){
             const fromtxt = document.getElementById('fromtxt');
             const totxt = document.getElementById('totxt');
             
             if(fromtxt === totxt){
                 alert("Origin and Destination Can't be same");
                 document.getElementById('buttonsearch').disabled = true;
         }
         
         
         
         //no spaces and symbols in from and to
            $('#fromtxt').on('keypress', function (event) {
                var regex = new RegExp("^[a-zA-Z]+$");
                var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
                if (!regex.test(key)) {
                    event.preventDefault();
                    return false;
                }
            });
            
            $('#totxt').on('keypress', function (event) {
                var regex = new RegExp("^[a-zA-Z]+$");
                var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
                if (!regex.test(key)) {
                    event.preventDefault();
                    return false;
                }
            });
         
 </script>
                                                            <style>
                  
                        body {
  background-image: url('rail2.jpg');
  background-repeat: no-repeat;
}
.section {
	position: relative;
	height: 90vh;
        
}
.hhh{
    margin-top: 20px;
}
.booking-cta{
    margin-left: 100px;
    margin-top: 40px;
}

.section .section-center {
	position: absolute;
	top: 50%;
	left: 0;
	right: 0;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%);
        
}

#booking {
	font-family: 'Montserrat', sans-serif;
	
	background-size: cover;
	background-position: center;
}

.booking-form {
    background-color: whitesmoke;
	padding: 50px 20px;
	-webkit-box-shadow: 0px 5px 20px -5px rgba(0, 0, 0, 0.3);
	box-shadow: 0px 5px 20px -5px rgba(0, 0, 0, 0.3);
	border-radius: 7px;
}

.booking-form .form-group {
	position: relative;
	margin-bottom: 30px;
}

.booking-form .form-control {
	background-color: #ebecee;
	border-radius: 4px;
	border: 1px;
	height: 40px;
	-webkit-box-shadow: none;
	box-shadow: none;
	color: #3e485c;
	font-size: 14px;
}

.booking-form .form-control::-webkit-input-placeholder {
	color: rgba(62, 72, 92, 0.3);
}

.booking-form .form-control:-ms-input-placeholder {
	color: rgba(62, 72, 92, 0.3);
}

.booking-form .form-control::placeholder {
	color: rgba(62, 72, 92, 0.3);
}

.booking-form input[type="date"].form-control:invalid {
	color: rgba(62, 72, 92, 0.3);
}

.booking-form select.form-control {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

.booking-form select.form-control+.select-arrow {
	position: absolute;
	right: 0px;
	bottom: 4px;
	width: 32px;
	line-height: 32px;
	height: 32px;
	text-align: center;
	pointer-events: none;
	color: rgba(62, 72, 92, 0.3);
	font-size: 14px;
}

.booking-form select.form-control+.select-arrow:after {
	content: '\279C';
	display: block;
	-webkit-transform: rotate(90deg);
	transform: rotate(90deg);
}

.booking-form .form-label {
	display: inline-block;
	color: #3e485c;
	font-weight: 700;
	margin-bottom: 6px;
	margin-left: 7px;
}

.booking-form .submit-btn {
	display: inline-block;
	color: #fff;
	background-color: #1e62d8;
	font-weight: 700;
	padding: 14px 30px;
	border-radius: 4px;
	border: none;
	-webkit-transition: 0.2s all;
	transition: 0.2s all;
}

.booking-form .submit-btn:hover,
.booking-form .submit-btn:focus {
	opacity: 0.9;
}

.booking-cta {
	margin-top: 80px;
	margin-bottom: 30px;
}

.booking-cta h1 {
	font-size: 52px;
	text-transform: uppercase;
	color: #fff;
	font-weight: 700;
}

.booking-cta p {
	font-size: 16px;
	color: rgba(255, 255, 255, 0.8);
}

            </style>                                    
    </body>
</html>
