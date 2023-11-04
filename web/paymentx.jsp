










<%-- 
    Document   : payment
    Created on : 31 Oct, 2022, 11:00:41 PM
    Author     : Asus
--%>
<%@page import="com.paytm.pg.merchant.CheckSumServiceHelper" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        

<%!
public class PaytmConstants{

	public static final String MID="TYmwCE61492093834199"; //enter your MID--go to paytm and Generate one.
	public static final String MERCHANT_KEY="rKFy9v9vGjp7ajt5";
	public static final String INDUSTRY_TYPE_ID="Retail";
	public static final String CHANNEL_ID="WEB";
	public static final String WEBSITE="WEBSTAGING";

	public static final String PAYTM_URL="https://securegw-stage.paytm.in/order/process";
}

%>


<%
    HttpSession s = request.getSession();
 String orderid=(String)request.getParameter("phone");
    int ii=(int)(Math.random()*((1000-1)+1))+1;
    String foid="ALGO-2020"+orderid+"-"+ii;
    session.setAttribute("oid",foid);
String email= s.getAttribute("email").toString();
String location=request.getParameter("arjunnnsdjflksdjf");

session.setAttribute("email",email);
session.setAttribute("location",location);

/* initialize a TreeMap object */
TreeMap<String, String> paytmParams = new TreeMap<String, String>();

paytmParams.put("MID", PaytmConstants.MID);
System.out.println(PaytmConstants.MID);

paytmParams.put("WEBSITE", PaytmConstants.WEBSITE);
System.out.println(PaytmConstants.WEBSITE);

paytmParams.put("INDUSTRY_TYPE_ID", PaytmConstants.INDUSTRY_TYPE_ID);
System.out.println(PaytmConstants.INDUSTRY_TYPE_ID);

paytmParams.put("CHANNEL_ID", PaytmConstants.CHANNEL_ID);
System.out.println(PaytmConstants.CHANNEL_ID);

paytmParams.put("ORDER_ID",(String)session.getAttribute("oid"));
System.out.println((String)session.getAttribute("oid"));

paytmParams.put("CUST_ID", "sdf234234asd");
System.out.println((String)session.getAttribute("UID"));

paytmParams.put("MOBILE_NO",(String)session.getAttribute("phone"));
System.out.println((String)session.getAttribute("phone"));

paytmParams.put("EMAIL", (String)session.getAttribute("email")); 
System.out.println((String)session.getAttribute("email"));
/**
* Amount in INR that is payble by customer
* this should be numeric with optionally having two decimal points
*/
String price=(String)s.getAttribute("totalamt");
		String p="";
		char[] arr=price.toCharArray();
		for(int i=0;i<arr.length;i++){
			
			if(arr[i]!=',')
				p=p+arr[i];
		}
		
		int pp=Integer.parseInt(p);
		String finPrice=pp+"";

paytmParams.put("TXN_AMOUNT", finPrice);
System.out.println(finPrice);
/* on completion of transaction, we will send you the response on this URL */
paytmParams.put("CALLBACK_URL", "http://localhost:7001/RailwayTicketSys/Home.jsp/paymentRes.jsp");

/**
* Generate checksum for parameters we have
* You can get Checksum JAR from https://developer.paytm.com/docs/checksum/
* Find your Merchant Key in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys 
*/
System.out.println("checksummmmmm");
String checksum = CheckSumServiceHelper.getCheckSumServiceHelper().genrateCheckSum(PaytmConstants.MERCHANT_KEY, paytmParams);

System.out.println("checksummmmmm doneeeee:"+checksum);
/* for Staging */
String url = "https://securegw-stage.paytm.in/order/process";

/* for Production */
// String url = "https://securegw.paytm.in/order/process";

/* Prepare HTML Form and Submit to Paytm */
%>
<%
StringBuilder outputHtml = new StringBuilder();
outputHtml.append("<html>");
outputHtml.append("<head>");
outputHtml.append("<title>Merchant Checkout Page</title>");
outputHtml.append("</head>");
outputHtml.append("<body>");
outputHtml.append("<center><h1>Please do not refresh this page...</h1></center>");
outputHtml.append("<form method='post' action='" + url + "' name='paytm_form'>");

for(Map.Entry<String,String> entry : paytmParams.entrySet()) {
    outputHtml.append("<input type='hidden' name='" + entry.getKey() + "' value='" + entry.getValue() + "'>");
}

outputHtml.append("<input type='hidden' name='CHECKSUMHASH' value='" + checksum + "'>");
outputHtml.append("</form>");
outputHtml.append("<script type='text/javascript'>");
outputHtml.append("document.paytm_form.submit();");
outputHtml.append("</script>");
outputHtml.append("</body>");
outputHtml.append("</html>");
out.println(outputHtml);
%>
    </body>
</html>
