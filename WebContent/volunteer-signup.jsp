<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/sb-admin.css" rel="stylesheet">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.11.1/jquery.validate.min.js"></script>
<style>
body {
	background-image: url('img/background-login.png');
}

.panel,.panel-body {
	background-color: white;
	border-radius: 10px;
}

.container {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-webkit-transform: translate(-50%, -50%);
}
</style>


</head>
<body>
	<form id="VSU" class="Volunteer_SignUp" method="post"
		action="VolunteerSignUpServlet">

		<div id="page-wrapper">
			<!-- forget password/sign up as volunteer/sign up as member -->
			<div class="container">
				<div class="col-lg-12">
					<div class="row">
						<div class="col-lg-offset-4 col-lg-4">
							<br> <br> <br> <br> <br> <br> <br>
							<br> <br> <br>
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="row">
										<div class="col-lg-12">
											<h1 style="text-align: center;">SignUp</h1>

											<hr />
											<div class="form-group">

												<!--------------------------------------NAME -------------------------------------------->

												<label for="Name">Name </label> <input type="text"
													class="form-control" placeholder="Name" name="Name"
													id="Name" required autofocus>

												<!--------------------------------------NRIC -------------------------------------------->

												<label for="NRIC">NRIC</label> <input type="text"
													class="form-control" placeholder="NRIC" name="NRIC"
													id="NRIC" required>


												<!--------------------------------------GENDER -------------------------------------------->

												<label for="Gender">Gender</label>
												<div class="radio-inline">
													<label> <input type="radio" name="Gender" id="Male"
														value="Male"> Male
													</label>
												</div>
												<div class="radio-inline">
													<label> <input type="radio" name="Gender"
														id="Female" value="Female">Female
													</label>
												</div>
											</div>

											<div class="form-group">
												<!--------------------------------------Contact Number -------------------------------------------->

												<label for="Contact_No">Contact No</label> <input
													type="text" class="form-control"
													placeholder="Contact Number" name="Tel" id="Tel" required
													>

												<!--------------------------------------EMAIL  -------------------------------------------->

												<label for="Email">Email</label> <input type="text"
													class="form-control" placeholder="Email" name="Email"
													id="Email" required >

												<!--------------------------------------Address  -------------------------------------------->


												<label for="Address">Address </label> <input type="text"
													class="form-control" placeholder="Mailing Address"
													name="Address" id="Address" required > <label
													for="PostalCode">Postal Code </label> <input type="text"
													class="form-control" placeholder="Postal Code"
													name="PostalCode" id="PostalCode" required >
											</div>



											<div class="form-group">
												<!--------------------------------------UserName -------------------------------------------->

												<label for="Username">Username</label> <input type="text"
													class="form-control" placeholder="Username" name="Username"
													id="Username" required >

												<!--------------------------------------Password -------------------------------------------->

												<label for="Password"> Password</label> <input
													type="password" class="form-control" placeholder="Password"
													name="Password" id="Password" required >

												<!--------------------------------------Confirm Password  -------------------------------------------->

												<label for="CfmPassword"> Re-enter Password</label> <input
													type="Password" class="form-control"
													placeholder="Confirm Password" name="CfmPassword"
													id="CfmPassword" required >

											</div>

											<button class="btn btn-default" type="submit">SIGN
												UP</button>
											<a class="btn btn-default" href="login.jsp">Cancel</a><br>
											<small>*We will never give your detail to ANYONE</small>

										</div>


										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>

</html>
<script type="text/javascript">
											$('#VSU').validate({
												rules : {
													Tel : {
														number : true,
														maxlength : 8,
														minlength : 8,

													},

													NRIC : {
														maxlength : 9,
														minlength : 9,
													},

													PostalCode : {
														maxlength : 6,
														minlength : 6,
													},
												}

											});
										</script>
