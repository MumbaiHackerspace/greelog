<!DOCTYPE html>
<html ng-app="appUser">

<head>
<title>GreeLog</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="text/html;charset=utf-8" http-equiv="Content-Type">
<meta content="utf-8" http-equiv="encoding">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">


<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.23/angular.min.js"></script>

<style>

.input_text{

	width: 80%;
	margin: auto
}
</style>



</head>


<body  onload="onloadFunction()">

<div id='content' ng-controller="home_controller">

 <div class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="display:block">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">GreeLog</a>
        </div>
        <div class="navbar-collapse collapse">

    <a target="_blank" href="http://greelog.pythonanywhere.com/greelog-android.apk" style="margin-left:50px;padding:10px;">
       <img src="img/play-store.png" alt="Play Store" style="width:45px;height:45px;margin-top:2px;"></img>
    </a>
          <form name="loginForm" method="POST" action="~/../_login" class="navbar-form navbar-right" role="form">
	     <div class="form-group">

	    <span></span>

            <div class="form-group">
              <input type="text" placeholder="Username" required name="username" ng-model="user_credentials.email" class="form-control">
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" required  name="password" ng-model="user_credentials.password" class="form-control">
            </div>
            <button type="submit" class="btn btn-success">Sign in</button>
          </form>
        </div><!--/.navbar-collapse -->
      </div>
 </div>
</div>

<div class="container-fluid"  style="display:block;margin-top:50px;background-image : url('~/../img/The_Way_To_GreenLog.jpg'); background-size: contain">
	<div class="row">
	<div class="col-md-8">


	</div>
	<div class="col-md-4">
          <div class="panel" style="background: rgba(255,255,255,0.2) !important">
		  	<div class="panel-heading">
			            <div class="panel-title" style="color:#FFFFFF;font-style:oblique;font-size:2.5em;text-align:center">Join GreeLog</div>
		  	</div>
		  	<div class="panel-heading" style="color: red; font-weight: bold; text-align: center;">{{msg}}</div>
        <div class="panel-body" >
			<form name="sign_up_form" id="sign_up_form" action="_register"  method="POST" onsubmit="return :match_password()" class="form-horizontal" novalidate role="form">

                        <div id="signupalert" style="display:none" class="alert alert-danger">
                            Error: <span id="validation" >Passwords do not match</span>
                        </div>

		          <div class="form-group">
				<input type="text" placeholder="First name" required name="fname" ng-model="user.fname" class="form-control input_text">
			 </div>

			 <div class="form-group">
				<input type="text" placeholder="Last name" required name= "lname" ng-model="user.lname" class="form-control input_text ">
			 </div>

			<div class="form-group">
				<input type="text" placeholder="Username" required name="iname"  ng-model="user.iname" class="form-control input_text">
			</div>

			<div class="form-group">
				<input type="text" placeholder="Email" required name="email"  ng-model="user.email" class="form-control input_text">
			</div>

			<div class="form-group">
				<input type="password" placeholder="Password" required id="password" name="password" ng-model="user.password" class="form-control input_text">
			</div>

			<div class="form-group">
				<input type="password" placeholder="Re-type password" id="repassword" data-match="user.password" required name="repassword" ng-model="user.repassword" class="form-control input_text">
			</div>

			<div class="form-group" style="display:none">
				<input type="text"  id="rand" name="rand"   class="form-control">
			</div>



			<div class="form-group" >
				<img  id="captchaimg" style="display:block;width:150px;height:100px;margin: auto" />
			</div>
			<div class="form-group">

				<input type="text" placeholder="Are You Human?" id="captcha" name="captcha" class="form-control input_text">
			</div>


			<div class="form-group" style="margin: auto; text-align: center">
				<input  id="btn-signup" stle="float:none;margin:auto" value="Sign Up"  type="submit"   class="btn btn-info">
			</div>

		</div>

 	   <div>
	</div>

	</div>


 </div>



</div>

</body>
<script>

	function onloadFunction	() {
		 var rand, cimage;
		 rand = 'greelog_' + String(Math.random()).slice(2);
		 cimage = document.getElementById('captchaimg');
		 document.getElementById('rand').value = rand;
		 cimage.src = "http://www.opencaptcha.com/img/"+ rand + ".jpgx";
	}

</script>


<script>


    function match_password(){

    	document.getElementById('signupalert').style.display = 'none';

    	var pass = document.getElementById('password');
    	var repass = document.getElementById('repassword');

    	alert(pass.value +" -- " + repass.value);

    	if(pass.value == repass.value){
    		alert(true);
    		return true;
    	}

    	///var v = document.getElementById('validation');
    	//v.append("Passwords do not match";
    	document.getElementById('signupalert').style.display = 'block';

    	return false;

    }


</script>
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-54194d9d28af811d"></script>
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-54194d9d28af811d"></script>

</html>



