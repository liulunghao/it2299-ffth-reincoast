<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="/path/to/css1" name="css" />
	<jsp:param value="/path/to/css2" name="css" />
</jsp:include>
<!-- header.jsp -->

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp"></jsp:include>
<!-- sidebar.jsp -->

<!-- sample-content.jsp -->
<div id="page-wrapper">
	<div class="row">
		<form class="form-horizontal" role="form">
			<div class="form-group">
				<label class="col-lg-1 control-label">Receipt No:</label>
				<div class="col-lg-4">
					<input class="form-control" type="text" value="1234" readonly />
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-1 control-label">Donor:</label>
				<div class="col-lg-4">
					<input class="form-control" type="text" value="muhahaha" readonly />
				</div>
			</div>
		</form>

		<div class="col-lg-12">
			<table
				class="table table-hover table-striped tablesorter table-condensed">
				<thead>
					<tr>
						<th>Item Description</th>
						<th>Quantity</th>
						<th>Type</th>
						<th>Unit Price</th>
					</tr>
				</thead>
				<tbody id="item-list">

				</tbody>
				<tbody id="total-value">
				
				</tbody>
			</table>
		</div>

	</div>
</div>
<!-- /.row -->

<!-- sample-content.jsp -->
<script>
	
</script>
<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="/path/to/js1" name="js" />
</jsp:include>
<!-- footer.jsp -->