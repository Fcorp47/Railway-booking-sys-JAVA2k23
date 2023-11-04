<%-- 
    Document   : addtrain
    Created on : 15-Oct-2023, 11:52:16 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../menu.jsp" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <div class="main-container">
        <jsp:include page="navjsp.jsp" />
            <div class="main">
                <div class="report-container">
                <div class="report-header">
                    <h1 class="recent-Articles">Train Schedules</h1>
                 </div>
 
                <div class="report-body">
                    <div class="report-topic-heading">
                        <h3 class="t-op">Train No</h3>                        
                        <h3 class="t-op">Coach type</h3>
                        <h3 class="t-op">No.of coaches</h3>
                        <h3 class="t-op">Status</h3>
                    </div>
  <form action="../UpdateStack" method="POST">
                    <div class="items">
                        <div class="item1">
                            <h2 class="t-op-nextlvl"><input type="number" name="trainno" ></h2>
                            <h3 class="t-op-nextlvl"> <select name="stacktype">           
                                                            <option value="AC 2 TIER">2AC</option>
                                                            <option value="AC 3 TIER">3AC</option>
                                                            <option value="Second Seating(2S)">SS</option>
                                                       </select> </h3>
                            <h3 class="t-op-nextlvl"><input type="number" name="txtstack"></h3>
                            <h3 class="t-op-nextlvl"><input type="submit" name="btnupdate" class="view" value="Update">
             </h3>
                        </div>
 
                        
                    </div>
      
  </form>
                </div>
            </div>
            </div>
         </div>
   
            <style>
                
select {
  appearance: none;
  /* safari */
  -webkit-appearance: none;
  /* other styles for aesthetics */
  width: 100%;
  font-size: 1.15rem;
  padding: 0.675em 6em 0.675em 1em;
  background-color: #fff;
  border: 1px solid #caced1;
  border-radius: 0.25rem;
  color: #000;
  cursor: pointer;
}
            </style>
            
            
    </body>
</html>
