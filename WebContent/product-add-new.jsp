<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" name="css" />
</jsp:include>
<!-- header.jsp -->

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp"></jsp:include>
<!-- sidebar.jsp -->

<!-- sample-content.jsp -->
<div id="page-wrapper">
	<form method="post" action="/it2299-ffth-reincoast/ProductRegistrationServlet" role="form">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-header">
					<h1>
						Product <small>Add New</small>
					</h1>
				</div>
				<ol class="breadcrumb">
					<li><a href="#"><i class="icon-dashboard"></i> Home</a></li>
					<li class="active"><i class="icon-edit"></i> Register New Product</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<div class="row">
			<div class="col-lg-7">
				<div class="panel panel-default">
					<div class="panel-body">
						<h4>
							<label>Primary Details</label>
							<div class="form-group pull-right" style="padding: 0px 10px 0px 10px;">
								<div class="btn-group">
									<button id="p_import" type="button" class="btn btn-xs btn-default" data-content="<small><i class='glyphicon glyphicon-repeat'></i>&nbsp;Hacking NTUC database...<small>" data-toggle="modal" data-placement="left" data-html="true" data-container="body" data-trigger="manual" data-target="#myModal">
										<i class="glyphicon glyphicon-import"></i> Import
									</button>
									<button id="p_action" type="submit" class="btn btn-xs btn-default" name="p_action" value="Submit">
										<i class="glyphicon glyphicon-ok"></i> Submit
									</button>
								</div>
							</div>
						</h4>
						<div class="form-group">
							<label class="control-label">Name</label> 
							<input id="p_name" class="form-control input-sm" name="p_name">
							<p class="help-block">The display name of the item.</p>
						</div>

						<div class="form-group">
							<label>Description</label>
							<textarea class="form-control input-sm" rows="3" name="p_description"></textarea>
							<p class="help-block">The short description of the item.</p>
						</div>
						<div class="form-group">
							<label class="control-label">Code</label> 
							<input class="form-control input-sm" name="p_code">
							<p class="help-block">i.e. Barcode</p>
						</div>

						<div class="form-group">
							<label class="control-label">SKU</label> 
							<input class="form-control input-sm" name="p_sku">
							<p class="help-block">The stock keeping unit number.</p>
						</div>
						<div class="form-group">
							<label>Unit of Measure</label> 
							<input class="form-control input-sm" name="p_unit_of_measure">
						</div>

						<div class="form-group">
							<label>Price</label> 
							<input id="p_price" class="form-control input-sm" name="p_price">
							<p class="help-block">In Singapore Dollar (SGD).</p>
						</div>
						<div class="form-group">
							<label>Weight</label> 
							<input id="p_weight" class="form-control input-sm" name="p_weight">
							<p class="help-block">In grams (G)</p>
						</div>
						<div class="form-group">
							<label>Category</label> 
							<input class="form-control input-sm" name="p_category">
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-5">
				<div class="panel panel-default">
					<div class="panel-body">
						<h4>
							<label>Image</label>
							<div class="form-group pull-right" style="padding: 0px 10px 0px 10px;">
								<div class="btn-group">
									<button type="button" class="btn btn-xs btn-default">
										<i class="glyphicon glyphicon-hdd"></i> Browse
									</button>
								</div>
							</div>
						</h4>
						<div class="row">
							<div class="col-lg-7">
								<p>Upload an image of this product.</p>
								<small>
									<ul>
										<li>Recommend dimension is 160x160px.</li>
										<li>Bigger image will be cropped.</li>
										<li>You can also make use of import feature to import image from NTUC website, if available.</li>
									</ul>
								</small>
							</div>
							<div class="col-lg-5">
								<div style="width:160px;height:160px;">
									<a href="#" class="thumbnail">
								      <img id="p_image" src="http://placehold.it/160x160">
								    </a>
								</div>	
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-5">
				<div class="panel panel-default">
					<div class="panel-body">
						<h4>
							<label>Additional Data</label>
						</h4>
						<span>Customize your data by adding more fields to the form.</span>
					</div>
					<table class="table">
						<tbody>
							<tr>
								<td class="col-sm-3" style="padding-left: 14px;"><input class="form-control input-sm" placeholder="key" name="p_meta_key"></td>
								<td><input class="form-control input-sm" placeholder="value" name="p_meta_value"></td>
							</tr>
							<tr>
								<td class="col-sm-3" style="padding-left: 14px;"><input class="form-control input-sm" placeholder="key" name="p_meta_key"></td>
								<td><input class="form-control input-sm" placeholder="value" name="p_meta_value"></td>
							</tr>
							<tr>
								<td class="col-sm-3" style="padding-left: 14px;"><input class="form-control input-sm" placeholder="key" name="p_meta_key"></td>
								<td><input class="form-control input-sm" placeholder="value" name="p_meta_value"></td>
							</tr>
						</tbody>
					</table>
					<div class="panel-footer">
						<div class="form-group pull-right" style="padding: 0px 10px 0px 10px;">
							<div class="btn-group">
								<button type="button" class="btn btn-xs btn-default">
									<i class="icon-plus"></i> Add field
								</button>
							</div>
						</div>
						&nbsp;
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- Modal -->
	<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" id="myModalLabel">Import</h4>
	      </div>
	      <div class="modal-body">
	        <p>Copy the product URL from NTUC website:</p>
	        <input id="p_import_url" class="form-control input-sm" type="text"/>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button id="p_import_submit" type="button" class="btn btn-primary" data-dismiss="modal">Import</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
		
	<!-- sample-content.jsp -->

	<!-- footer.jsp -->
	<jsp:include page="footer.jsp">
		<jsp:param value="/path/to/js1" name="js" />
	</jsp:include>
	<!-- footer.jsp -->
	<script type="text/javascript">
	$(document).ready(function(){		
		$("#p_import_submit").on("click", function(e){
			$('#p_import').popover('show');
			$.ajax({
				type: "POST",
				url: "ProductImportServlet",
				data: {
					p_import_url: $('#p_import_url').val()
				}
			}).done(function(response){
				$('#p_import').popover('hide');
				var data = $.parseJSON(response);

				$('#p_name').val(data.name);
				$('#p_weight').val(data.weight);
				$('#p_price').val(data.price);
				$('#p_image').attr('src', data.image);
			});
		});
	});
	</script>