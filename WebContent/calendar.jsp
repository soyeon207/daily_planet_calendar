<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="calendarDAO.jsp"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset='utf-8' />

<style>
body{
	background-image: url('img/back.png');
	background-size: cover;
	background-repeat: no-repeat;
}
td.fc-event-container{
	background-color:#898999;
	border-radius: 25px;
	margin:20px;	
}
div>span{
	color:white;
}


</style>
  <link rel='stylesheet' href='css/calendar_core_main.css'/>
  <link rel='stylesheet' href='css/calendar_daygrid_main.css'/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"crossorigin="anonymous">
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
  
  <script src='js/calendar_core_main.js'></script>
  <script src='js/calendar_daygrid_main.js'></script>
  <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
  <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

  <script>
  
 	
    var cal_title = new Array();
    var cal_start = new Array();
    var cal_end = new Array();
    var cal_num = 0;

    var ToDay = new Date();
    var y = new Date(ToDay.getFullYear(), ToDay.getMonth(), ToDay.getDate())
    y.getFullYear() + "-" + (y.getMonth() + 1 < 10 ? "0" + (y.getMonth() + 1) : y.getMonth() + 1) + "-" + (y.getDate() < 10 ? "0" + y.getDate() : y.getDate())

    document.addEventListener('DOMContentLoaded', function () {
      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: ['interaction', 'dayGrid'],
        header: {
        	
          left: 'prevYear,prev,next,nextYear today',
          center: 'title',
          right: 'dayGridMonth,dayGridWeek,dayGridDay'
        },
        defaultDate: y,
        navLinks: true, // can click day/week names to navigate views
        editable: true,
        eventLimit: true, // allow "more" link when too many events
        events: [
          
        	  /* title:'Test',
				start: '2019-05-01',
				end: '2019-05-03' */
        	  <%
        	String c_t;
          	String select_title = "select * from calendar";
          	
          	try{
          		pstmt = conn.prepareStatement(select_title);
          		rs = pstmt.executeQuery();
          		while(rs.next()){
          			if(rs.getInt("cnt")!=1){
          			%>
          			,
          			<%
          			}
          			%>
          			{
          				title:'<%=rs.getString("cal_title")+", "+rs.getString("content")%>',
          				start: '<%=rs.getString("start_date")%>',
          				end:'<%=rs.getString("end_date")%>'
          			}
          			<%
          		}
          	}catch(Exception e) {
          		
          	}
          	%> 
          
        ]
      });

      calendar.render();
    });

    $(function () {
    	
    	
    	
    	
    	
    	$("#btn").click(function () {
        $("#dia_rs").dialog({
          title: "일정 추가하기",
          width: 800,
          modal: true,
        });
      });
    });

	function content_click(){
		
	}
  </script>
  <style>
  .fc-content{
	white-space:nowrap;
	overflow:hidden;
	text-overflow:ellipsis;
}

.fc-content:hover{
	overflow:visible;
	color:white;
}
    body {
      margin-top:90px;
      padding: 0;
      color:white;
      font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
      font-size: 14px;
    }

    #calendar {
      max-width: 900px;
      margin: 0 auto;
    }
  </style>
</head>

<body>
  <div id='calendar'></div>
  <input type="button" value="일정 추가" id="btn">
  <div id="dia_rs" style="display:none">
    <form style="display: hidden" action="calendarProc.jsp" method="post">
      start :
      <input type="date" name="start" >
      <br> end :
      <input type="date" name="end">
      <br> title :
      <input type="text" name="title">
      <br> content : 
      <input type="text" name="content">
      <br>
      <button type="submit">일정 등록하기</button>
    </form>
  </div>


  <nav class="navbar navbar-expand-lg navbar-light fixed-top bg-bright" id="navbar">
    <a class="navbar-brand" href="index.html">
      <img src="img/logo1.png" style="background: rgba(0, 0, 0, 0)">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
      aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <!-- <li class="nav-item active">
                <a class="nav-link" href="#">picture diary
                    <span class="sr-only">(current)</span>
                </a>
            </li> -->
        <li class="nav-item">
                <a class="nav-link" href="#explainstart">EXPLAIN</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="calnder.html">CALENDER</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">PICTURE DIARY</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">DIARY</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">NOTEPAD</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" class="login" href="login.html">LOGIN</a>
        </li>
      </ul>
    </div>
  </nav>
</body>
<script>
$(function () {
	$(".fc-left").css("background-color","orange");
	$("input").click(function() {
		alert('a');
	});
	
});
function content_click(t){
	alert($(t).text());
    
}
</script>
</html>