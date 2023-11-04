<%-- 
    Document   : adminhome
    Created on : 15-Oct-2023, 10:57:52 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../menu.jsp" />
<!DOCTYPE html>
<html lang="en">

 
<body>
   
    <!-- for header part -->
    
 
    <div class="main-container">
        <jsp:include page="navjsp.jsp" />
        
        <div class="main">
 
            <div class="searchbar2">
                <input type="text"
                       name=""
                       id=""
                       placeholder="Search">
                <div class="searchbtn">
                  <img src=
"https://media.geeksforgeeks.org/wp-content/uploads/20221210180758/Untitled-design-(28).png"
                        class="icn srchicn"
                        alt="search-button">
                  </div>
            </div>
 
            <div class="box-container">
 
                <div class="box box1">
                    <div class="text">
                        <h2 class="topic-heading">0</h2>
                        <h2 class="topic">Trains on hold</h2>
                    </div>
 
                    <img src=
"https://media.geeksforgeeks.org/wp-content/uploads/20221210184645/Untitled-design-(31).png"
                        alt="Views">
                </div>
 
                
 
                <div class="box box4">
                    <div class="text">
                        <h2 class="topic-heading">3</h2>
                        <h2 class="topic">Trains active</h2>
                    </div>
 
                    <img src=
"https://media.geeksforgeeks.org/wp-content/uploads/20221210185029/13.png" alt="published">
                </div>
            </div>
 
            <div class="report-container">
                <div class="report-header">
                    <h1 class="recent-Articles">Train Schedule</h1>
                    <button onclick="window.location.href = '/RailwayTicketSys/Home.jsp/admin/addtrain.jsp'" class="view">Update Train</button>
                </div>
 
                <div class="report-body">
                    <div class="report-topic-heading">
                        <h3 class="t-op">Train No</h3>
                        <h3 class="t-op">Train Name</h3>
                        <h3 class="t-op">Coaches</h3>
                        <h3 class="t-op">Status</h3>
                    </div>
 
                    <div class="items">
                        <div class="item1">
                            <h3 class="t-op-nextlvl">22953</h3>
                            <h3 class="t-op-nextlvl">GUJRAT SF EXP</h3>
                            <h3 class="t-op-nextlvl">3AC | 2AC | SS</h3>
                            <h3 class="t-op-nextlvl label-tag">Running</h3>
                        </div>
 
                        <div class="item1">
                            <h3 class="t-op-nextlvl">19033</h3>
                            <h3 class="t-op-nextlvl">GUJRAT QUEEN</h3>
                            <h3 class="t-op-nextlvl">3AC | 2AC | SS</h3>
                            <h3 class="t-op-nextlvl label-tag">Running</h3>
                        </div>
                        
                        
                        <div class="item1">
                            <h3 class="t-op-nextlvl">12009</h3>
                            <h3 class="t-op-nextlvl">GNC SHATABDI</h3>
                            <h3 class="t-op-nextlvl">3AC | 2AC | SS</h3>
                            <h3 class="t-op-nextlvl label-tag">On Hold</h3>
                        </div>
 
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
 
    <script src="./index.js"></script>
</body>
</html>