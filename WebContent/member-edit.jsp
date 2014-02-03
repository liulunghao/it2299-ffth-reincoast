<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="/path/to/css1" name="css" />
	<jsp:param value="/path/to/css2" name="css" />

</jsp:include>
<!-- header.jsp -->
<style type="text/css">
.button {
	margin: .4em;
	padding: 1em;
	cursor: pointer;
	background: #000000;
	text-decoration: none;
	color: #666666;
}

/* Bubble Float Bottom */
.bubble-float-bottom {
	display: inline-block;
	position: relative;
	transition-duration: 0.3s;
	transition-property: transform;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	transform: translateZ(0);
	box-shadow: 0 0 1px rgba(0, 0, 0, 0);
}

.bubble-float-bottom:before {
	pointer-events: none;
	position: absolute;
	z-index: -1;
	content: '';
	left: calc(50% - 10px);
	bottom: 0;
	border-style: solid;
	border-width: 10px 10px 0 10px;
	border-color: #000 transparent transparent transparent;
	transition-duration: 0.3s;
	transition-property: bottom;
}

.bubble-float-bottom:hover {
	transform: translateY(-5px) translateZ(0);
}

.bubble-float-bottom:hover:before {
	bottom: -10px;
}
}
</style>

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp"></jsp:include>
<!-- sidebar.jsp -->

<!-- sample-content.jsp -->
<div id="page-wrapper">



	<div class="button bubble-float-bottom">Bubble Float Bottom</div>
	<br> <br>
	<div class="panel panel-default">
		<div class="panel-body">
			<form id="MEdit" class="Volunteer_SignUp" method="post" action="MemberEditProfileServlet">

				<div class="table-responsive">
					<table class="table">
						<thead>
						</thead>


						<tr>
							<th>Name</th>
							
							<th><input type="text" class="form-control" value="${member_datas.name}" name="name" id="name" required autofocus></th>


						</tr>

						<tr>
							<th>NRIC</th>
							<th><small> ${member_datas.nric}</small></th>
						</tr>

						<tr>
							<th>Gender</th>
							<th><small> ${member_datas.gender}</small></th>
						</tr>
						<tr>
							<th>Contact No</th>
							<th><input type="text" class="form-control" value="${member_datas.tel}" name="tel" id="tel" required autofocus></th>
						</tr>
						<tr>
							<th>Address</th>
							<th><input type="text" class="form-control" value="${member_datas.address}" name="address" id="address" required autofocus></th>
						</tr>
						<tr>
							<th>Postal Code</th>
							<th><input type="text" class="form-control" value="${member_datas.postalCode}" name=postalCode id="postalCode" required autofocus></th>
						</tr>

						<tr>
							<th>Email</th>
							<th><input type="text" class="form-control" value="${member_datas.email}" name="email" id="email" required></th>
						</tr>

						<tr>
							<th>UserName</th>
							<th><small>${member_datas.userName }</small></th>

						</tr>

						<!--------------------------------------Confirm Password  -------------------------------------------->
						<tr> 
							<th>Current Password</th>
							<th><input type="password" class="form-control" placeholder="Current Password" name="Current_password" id="Current_password" required autofocus></th>
							<th><h5><i>*For verification purpose</i></h5>
						</tr>



						<tr>
							<th><button class="btn btn-default" type="submit">Save Edit</button>
							<a class="btn btn-default" href="MemberDeactivateServlet">Delete My Account</a>
							<th>
						</tr>


					</table>

				</div>
			</form>

		</div>

	</div>
</div>

<!-- sample-content.jsp -->
<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="/path/to/js1" name="js" />
</jsp:include>
<!-- footer.jsp -->
