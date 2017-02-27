<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ page isELIgnored ="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="">
	    <meta name="author" content="">

		<title>用户动态查询</title>
		<jsp:include page="include/header.jsp"></jsp:include>
		

	</head>

	<body>
		<div class="wrapper">
			<!-- 导航栏 -->
			<jsp:include page="include/nav.jsp"></jsp:include>

			<div id="page-wrapper">
				<div class="container-fluid">
	                <div class="row">
	                    <div class="col-lg-12">
	                        <h1 class="page-header">用户动态查询</h1>
	                    </div>
	                    <!-- /.col-lg-12 -->
	                </div>


					<table id="table"></table>

	            </div>
			</div>


		</div>
		<!-- /container -->
		<jsp:include page="include/footer.jsp"></jsp:include>
		
		<script type="text/javascript">
			$(function(){
				$('#table').bootstrapTable({
					url: '${ctx}/dynamicQueryByParam',
					toolbar: "#toolbar",
					height: $(window).height() - 200,
					cache: false,
					pagination: true,
					pageSize: 10,
					pageList: [5,10,25,50,100,200],
					showRefresh : true,
					showExport : true,
					showColumns : true,
					singleSelect : true,
					striped : true,
					search : true,
					searchOnEnterKey :true,
					columns: [{
						checkbox : true,
						align: "center"
					},{
						field: 'id',
						title: 'ID',
						align: "center",
						valign: "middle",
						sortable: true,
						visible: false
					},{
						field: 'userAccount',
						align: "center",
						valign: "middle",
						title: '用户'
					},{
						field: 'actionDescription',
						align: "center",
						valign: "middle",
						title: '动态描述'
					},{
						field: 'createTime',
						align: "center",
						valign: "middle",
						title: '创建时间',
						sortable: true
					}]
				});
			});
		</script>
	</body>
</html>
