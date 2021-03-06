<!doctype html>
<html><head>
    <meta charset="utf-8">
    <title>Cardia - Contacts</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/css/main.css" rel="stylesheet">
    <!-- DATA TABLE CSS -->
    <link href="/resources/css/table.css" rel="stylesheet">



    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

    <style type="text/css">
      body {
        padding-top: 60px;
      }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    
  </head>
  <body>
  
  	<!-- NAVIGATION MENU -->

    <div class="navbar-nav navbar-inverse navbar-fixed-top">
        <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand"><img src="/resources/img/logo30.png" alt=""> Cardia</a>
        </div> 
          <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="/groups"><i class="icon-folder-open icon-white"></i> Groups</a></li>
              <li><a href="/contacts"><i class="icon-home icon-white"></i> Contacts</a></li>
              <li><a href="/compose"><i class="icon-calendar icon-white"></i> Compose</a></li>

            </ul>
          </div><!--/.nav-collapse -->
        </div>
    </div>

    <div class="container">

      <!-- CONTENT -->
	<div class="row">
		<div class="col-sm-8">
			<h4><strong>Contacts List</strong></h4>
			  <table class="display">
	          <thead>
	            <tr>
	              <th>Id</th>
	              <th>Contact Name</th>
	              <th>Phone Number</th>
	              <th>Email</th>
	              <th>Group</th>
	            </tr>
	          </thead>
	          <tbody id="contacts-table">
	          </tbody>
	         </table><!--/END First Table -->
			 <br>
			 <!--SECOND Table -->
		</div><!--/span12 -->
		
			<div class="col-sm-4">
				<div class="dash-unit">
	      		<dtitle>New Contact</dtitle>
	      		<hr>
	      		<div class="cont">
                	<form action="/contacts?${_csrf.parameterName}=${_csrf.token}" method="POST" id="contact">
                    	<input type="text" name="name" placeholder="Name">
                    	<input type="text" name="email" placeholder="Email">
                    	<input type="text" name="phoneNumber" placeholder="Phone Number">
                    	<div class="form-group">
						 <select class="form-control" id="group-select" name="groupName">
						    <option>Select Group</option>
						  </select>
						</div>
						<input type="submit" id="submit" name="submit" value="Submit">
                    </form>
				</div>
				</div>
			</div>
      </div><!-- /row -->
     </div> <!-- /container -->
    
    


    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="assets/js/bootstrap.js"></script>
    <script type="text/javascript" src="assets/js/admin.js"></script>
    

<script >
    
    function getGroups() {
    	console.log ("getting groups...");
        var xmlhttp = new XMLHttpRequest();
        var url = "http://localhost:8080/api/groups";
        xmlhttp.open('GET',url,true);
        xmlhttp.send(null);
        
        xmlhttp.onreadystatechange = function() {
               if (xmlhttp.readyState == 4) {
                  if ( xmlhttp.status == 200) {
                       var response = eval( "(" +  xmlhttp.responseText + ")");
                       for (var index in response){
                    	   var name = response[index].name;
                    	   document.getElementById("group-select").innerHTML += "<option onclick=\"showList(\""+name+"\")\" value=\""+name+"\">"+name+"</option>";
                	   	   
                       }
                 }
                 else
                       alert("Error ->" + xmlhttp.responseText);
              }
        };
    }
    
    getGroups();
  </script>    
    
   <script >
    var xmlhttp = new XMLHttpRequest();
    
    function getdetails() {
        var url = "http://localhost:8080/api/contacts";
        xmlhttp.open('GET',url,true);
        xmlhttp.send(null);
        
        xmlhttp.onreadystatechange = function() {
               if (xmlhttp.readyState == 4) {
                  if ( xmlhttp.status == 200) {
                       var response = eval( "(" +  xmlhttp.responseText + ")");
                       var state = 1;
                       var table = "";
                       for (var index in response){
                    	   table += "<tr ";
                    	   if (state == 1){
                    		   table += "class=\"odd\"";
                    		   state = 0;
                    	   }
                    	   else {
                    		   table += "class=\"even\"";
                    		   state = 1;
                    	   }

                		   table += ">"+
                    	   "<td>"+response[index].id+"</td>"+
                    	   "<td>"+response[index].name+"</td>"+
                    	   "<td>"+response[index].phoneNumber+"</td>"+
                    	   "<td>"+response[index].email+"</td>"+
                    	   "<td>"+response[index].groupName+"</tr>\n";
                    	   
                		   document.getElementById("contacts-table").innerHTML = table;
                       }
                 }
                 else
                       alert("Error ->" + xmlhttp.responseText);
              }
        };
    }
    
    getdetails();
  </script>
    

  
</body></html>
