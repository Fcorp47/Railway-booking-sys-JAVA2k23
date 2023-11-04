<%-- 
    Document   : Bookingpage
    Created on : 15-Oct-2023, 7:22:01 am
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">


<title>Simple invoice page - Bootdey.com</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<div class="container bootstrap snippets bootdey">
<div class="panel panel-default">
<div class="panel-body">

<div class="table-responsive">
<table class="table table-condensed nomargin">
<thead>
<tr>
<th>Item Name</th>
<th></th>
<th>Age</th>
<th>Sex</th>
<th>berth</th>
</tr>
</thead>
<tbody>
<tr>
<td>
<div><strong><input type="text" name="txtpname" placeholder="Passenger Name" required="" id="" class="txtChk" required>&nbsp;&nbsp;
      </strong></div>
<small></small>
</td>
<td></td>
<td><input type="text" name="txtpname" placeholder="Passenger Name" required="" id="" class="txtChk" required></td>
<td><input type="text" name="txtpname" placeholder="Passenger Name" required="" id="" class="txtChk" required></td>
<td><input type="text" name="txtpname" placeholder="Passenger Name" required="" id="" class="txtChk" required></td>
</tr>

</tbody>
</table>
</div>
<hr class="nomargin-top">
<div class="row">
<div class="col-sm-6 text-left">
<h4><strong>Contact</strong> Details</h4>
<p class="nomargin nopadding">
<strong>Note:</strong>
Lid est laborum dolo rumes fugats.
</p><br>
<address>
PO Box 21132 <br>
Vivas 2355 Australia<br>
Phone: 1-800-565-2390 <br>
Fax: 1-800-565-2390 <br>
Email:<a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="45363035352a3731053c2a30372b2428206b262a28">[email&#160;protected]</a>
</address>
</div>
<div class="col-sm-6 text-right">
<ul class="list-unstyled">
<li><strong>Sub - Total Amount:</strong> $2162.00</li>
<li><strong>Discount:</strong> 10.0%</li>
<li><strong>VAT ($6):</strong> $12.0</li>
<li><strong>Grand Total:</strong> $1958.0</li>
</ul>
<a class="btn btn-default" href="#">MAKE A PAYMENT</a>
</div>
</div>
</div>
</div>
<div class="panel panel-default text-right">
<div class="panel-body">
<a class="btn btn-warning" href="#"><i class="fa fa-pencil-square-o"></i> EDIT</a>
<a class="btn btn-primary" href="#"><i class="fa fa-check"></i> SAVE</a>
<a class="btn btn-success" href="page-invoice-print.html" target="_blank"><i class="fa fa-print"></i> PRINT INVOICE</a>
</div>
</div>
</div>
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript">
	

</script>

<style type="text/css">
    	
body{margin-top:20px;
background:#eee;
}




/**    17. Panel
 *************************************************** **/
/* pannel */
.panel {
	position:relative;

	background:transparent;

	-webkit-border-radius: 0;
	   -moz-border-radius: 0;
			border-radius: 0;

	-webkit-box-shadow: none;
	   -moz-box-shadow: none;
			box-shadow: none;
}
.panel.fullscreen .accordion .panel-body,
.panel.fullscreen .panel-group .panel-body {
	position:relative !important;
	top:auto !important;
	left:auto !important;
	right:auto !important;
	bottom:auto !important;
}
	
.panel.fullscreen .panel-footer {
	position:absolute;
	bottom:0;
	left:0;
	right:0;
}


.panel>.panel-heading {
	text-transform: uppercase;

	-webkit-border-radius: 0;
	   -moz-border-radius: 0;
			border-radius: 0;
}
.panel>.panel-heading small {
	text-transform:none;
}
.panel>.panel-heading strong {
	font-family:Arial,Helvetica,Sans-Serif;
}
.panel>.panel-heading .buttons {
	display:inline-block;
	margin-top:-3px;
	margin-right:-8px;
}
.panel-default>.panel-heading {
	padding: 15px 15px;
	background:#fff;
}
.panel-default>.panel-heading small {
	color:#9E9E9E;
	font-size:12px;
	font-weight:300;
}
.panel-clean {
	border: 1px solid #ddd;
	border-bottom: 3px solid #ddd;

	-webkit-border-radius: 0;
	   -moz-border-radius: 0;
			border-radius: 0;
}
.panel-clean>.panel-heading {
	padding: 11px 15px;
	background:#fff !important;
	color:#000;	
	border-bottom: #eee 1px solid;
}
.panel>.panel-heading .btn {
	margin-bottom: 0 !important;
}

.panel>.panel-heading .progress {
	background-color:#ddd;
}

.panel>.panel-heading .pagination {
	margin:-5px;
}

.panel-default {
	border:0;
}

.panel-light {
	border:rgba(0,0,0,0.1) 1px solid;
}
.panel-light>.panel-heading {
	padding: 11px 15px;
	background:transaprent;
	border-bottom:rgba(0,0,0,0.1) 1px solid;
}

.panel-heading a.opt>.fa {
    display: inline-block;
    font-size: 14px;
    font-style: normal;
    font-weight: normal;
    margin-right: 2px;
    padding: 5px;
    position: relative;
    text-align: right;
    top: -1px;
}

.panel-heading>label>.form-control {
	display:inline-block;
	margin-top:-8px;
	margin-right:0;
	height:30px;
	padding:0 15px;
}
.panel-heading ul.options>li>a {
	color:#999;
}
.panel-heading ul.options>li>a:hover {
	color:#333;
}
.panel-title a {
	text-decoration:none;
	display:block;
	color:#333;
}

.panel-body {
	background-color:#fff;
	padding: 15px;

	-webkit-border-radius: 0;
	   -moz-border-radius: 0;
			border-radius: 0;
}
.panel-body.panel-row {
	padding:8px;
}

.panel-footer {
	font-size:12px;
	border-top:rgba(0,0,0,0.02) 1px solid;
	background-color:rgba(0255,255,255,1);

	-webkit-border-radius: 0;
	   -moz-border-radius: 0;
			border-radius: 0;
}

    </style>
</body>
</html>