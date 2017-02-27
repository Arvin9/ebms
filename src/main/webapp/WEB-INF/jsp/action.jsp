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
	
	    <title>事件（用户动态）管理</title>
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
	                        <h1 class="page-header">事件（用户动态）管理</h1>
	                    </div>
	                    <!-- /.col-lg-12 -->
	                </div>
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
										<div class="form-group">
											<div class="input-group">
												<label class="input-group-addon">描述</label>
												<input type="text" class="form-control" id="description" name="description"  required="required" />
											</div>
										</div>
										<div class="form-group">
											<div class="input-group">
												<label class="input-group-addon">备注</label>
												<input type="text" class="form-control" id="remark" name="remark"  required="required" />
											</div>
										</div>
										<div class="form-group">
											<div class="input-group">
												<label class="input-group-addon">url</label>
												<input type="text" class="form-control" id="url" name="url"  required="required" readonly/>
											</div>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary" onclick="Action.save()">保存</button>
								</div>
							</div>
						</div>
					</div>
					<div id="toolbar">
						<button id="insert" class="btn btn-success" onclick="Action.insert()" disabled="disabled">
							<i class="glyphicon glyphicon-plus"></i> 添加
						</button>
						<button id="update" class="btn btn-warning" onclick="Action.update()">
							<i class="glyphicon glyphicon-pencil"></i> 修改
						</button>
						<button id="remove" class="btn btn-danger" onclick="Action.remove()" disabled="disabled">
							<i class="glyphicon glyphicon-remove"></i> 删除
						</button>
					</div>
					<table id="table"></table>

	            </div>
			</div>


		</div>
		<!-- /container -->
		<jsp:include page="include/footer.jsp"></jsp:include>
		
		<script type="text/javascript">
			$(function(){
				Action.init();
				$('#table').bootstrapTable({
					url: '${ctx}/actionQueryByParam',
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
						field: 'description',
						align: "center",
						valign: "middle",
						title: '描述'
					},{
						field: 'remark',
						align: "center",
						valign: "middle",
						title: '备注'
					},{
						field: 'url',
						align: "center",
						valign: "middle",
						title: 'url'
					},{
						field: 'createTime',
						align: "center",
						valign: "middle",
						title: '创建时间',
						sortable: true
					}]
				});
			});
			var Action = {
				commitUrl : "",

				init: function() {
					$('#Modal').modal('hide');
				},
				save: function(){
					if(!$('#description').val()){
						$('#warningContent').text("描述不能为空,请补充完整后重试!");
						$('#warningDiv').show();
						return;
					}
					$.ajax({
						type: "POST",
						url: Action.commitUrl,
						data: $('#modalForm').serialize(),
						success: function(msg){
							if("actionInsert" == Action.commitUrl){
								$.messager.alert("消息","新增成功!" + msg);
								$('#table').bootstrapTable('refresh');
							}
							if("actionUpdate" == Action.commitUrl){
								$.messager.alert("消息","修改成功!" + msg);
								$('#table').bootstrapTable('refresh');
							}
						}
					});
					$('#Modal').modal('hide');
				},
				insert: function() {
					$('#modalForm').form('clear');
					$('#ModalLabel').text("添加");
					$('#Modal').modal('show');
					Action.commitUrl = "actionInsert";
				},
				update: function(){
					var row = $('#table').bootstrapTable('getSelections');
					if ("" == row){
						$.messager.alert("提示","您还未选择");
						return;
					}
					row = row[0];

					Action.commitUrl = "actionUpdate";

					$('#modalForm').form('clear');
					$('#ModalLabel').text("修改");
					$('#modalForm').form('load',row);

					$('#Modal').modal('show');
				},
				remove: function(){
					Action.commitUrl = "";

					var row = $('#table').bootstrapTable('getSelections');
					if ("" == row){
						$.messager.alert("提示","您还未选择");
						return;
					}
					row = row[0];

					var t = $.messager.confirm('警告','您将删除ID为'+row.exercisesId+'的记录!!!', function(){
						$.post( Exercises.commitUrl, { exercisesId : row.exercisesId},function( data ) {
							$.messager.alert("消息","成功删除!");
							$('#table').bootstrapTable('refresh');
						});
					});
				}
			};
		
		</script>
		
	</body>
</html>
