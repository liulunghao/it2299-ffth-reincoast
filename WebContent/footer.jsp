<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="footer">
	<div class="container">
		<p>Designed and built with all the love in the world by Kang Fei, Fuh Chang, Zi Min, Xin Shen.</p>
		<p>
			Code licensed under <a href="http://opensource.org/licenses/MIT">MIT License</a>.
		</p>
	</div>
</div>
</div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="http://cdn.oesmith.co.uk/morris-0.4.3.min.js"></script>
<script src="js/morris/chart-data-morris.js"></script>
<script src="js/tablesorter/jquery.tablesorter.js"></script>
<script src="js/tablesorter/tables.js"></script>
<%
String[] js = request.getParameterValues("js");
for (String jss : js) {
%>
<script src="<%=jss%>"></script>
<%
}
%>
</body>
</html>