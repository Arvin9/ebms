<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="">
	    <meta name="author" content="">
	
	    <title>题目分析</title>
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
	                        <h1 class="page-header">题目分析</h1>
	                    </div>
	                    <!-- /.col-lg-12 -->
	                </div>
	                <!-- /.row -->
	                <!-- Modal -->
					<div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
					      		<div class="modal-header">
					        		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					        		<h4 class="modal-title" id="ModalLabel">添加</h4>
					      		</div>
					      		<div class="modal-body">
					      			<form id="modalForm" role="form" method="post"  enctype="multipart/form-data">
					      				<div class="form-group" id="warningDiv" hidden>
					      					<div class="input-group" style="width:100%">
							      				<div class="alert alert-warning alert-dismissible" role="alert">
													<button type="button" class="close" data-dismiss="alert">
														<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
													</button>
												  	<strong>Warning!</strong> <span id="warningContent"></span>
												</div>
						      				</div>
						      			</div>
						      			<div class="form-group" hidden>
						      				<div class="input-group">
												<label class="input-group-addon">id</label>
										    	<input type="text" class="form-control" id="id" name="id" placeholder="id">
										   	</div>
										</div>

					      			</form>
					      		</div>
					      		<div class="modal-footer">
						        	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						        	<button type="button" class="btn btn-primary" onclick="Exercises.save()">保存</button>
						      	</div>
					    	</div>
					  	</div>
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
				url: '${ctx}/queryBlankfillAnalyze',
				height: $(window).height() - 200,
				cache: false,
				pagination: true,
                pageSize: 7,
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
			        sortable: true
			    },{
					field: 'categoryName',
					align: "center",
					valign: "middle",
					title: '题目类别',
					sortable: true
				},{
			        field: 'caption',
			        align: "center",
			        valign: "middle",
			        title: '题目标题'
			    },{
			        field: 'subject',
			        halign: "center",
			        align: "left",
			        title: '题目',
					visible : false
			    },{
			        field: 'solution',
			        align: "center",
			        valign: "middle",
			        title: '答案',
					visible : false
			    },{
			        field: 'correct',
			        align: "center",
			        valign: "middle",
			        title: '回答正确数',
					sortable: true
			    }]
			});		
		});
		</script>
		
	</body>
</html>
