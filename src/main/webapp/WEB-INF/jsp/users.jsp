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
	
	    <title>用户管理</title>
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
	                        <h1 class="page-header">用户管理</h1>
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
													<!--
													<button type="button" class="close" data-dismiss="alert">
														<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
													</button>
													-->
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
												<label class="input-group-addon">用户名</label>
												<input type="text" class="form-control" id="account" name="account"  required="required" />
											</div>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary" id="saveButton" onclick="Users.save()" disabled="disabled">保存</button>
								</div>
							</div>
						</div>
					</div>
					<div id="toolbar">
						<button id="insert" class="btn btn-success" onclick="Users.insert()">
							<i class="glyphicon glyphicon-plus"></i> 添加
						</button>
						<button id="update" class="btn btn-warning" onclick="Users.update()" disabled="disabled">
							<i class="glyphicon glyphicon-pencil"></i> 修改
						</button>
						<button id="remove" class="btn btn-danger" onclick="Users.remove()" disabled="disabled">
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
				Users.init();
				$('#table').bootstrapTable({
					url: '${ctx}/usersQueryByParam',
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
						field: 'account',
						align: "center",
						valign: "middle",
						title: '用户名'
					},{
						field: 'mailbox',
						align: "center",
						valign: "middle",
						title: '邮箱'
					},{
						field: 'password',
						align: "center",
						valign: "middle",
						title: '密码',
						visible: false
					},{
						field: 'salt',
						align: "center",
						valign: "middle",
						title: '盐',
						visible: false
					},{
						field: 'realName',
						align: "center",
						valign: "middle",
						title: '别名'
					},{
						field: 'addMan',
						align: "center",
						valign: "middle",
						title: '添加人'
					},{
						field: 'isLock',
						align: "center",
						valign: "middle",
						title: '是否锁定',
                        formatter: function(value){
                            if (0 == value) {
                                value = "否";
                            }else {
                                value = "是";
                            }
                            return value;
                        }
					},{
						field: 'addTime',
						align: "center",
						valign: "middle",
						title: '创建时间',
						sortable: true
					},{
                        field: 'manage',
                        align: "center",
                        valign: "middle",
                        title: '操作',
                        events: operateEvents,
                        formatter: operateFormatter
                    }]
				});
				// 输入用户名是动态验证用户名是否有效
				$("#account").keyup(isValidityOfUserName);
			});

            function operateFormatter(value, row, index) {
                if (1 == row.isLock) {
                    value = '<button type="button" id="unlock" class="btn btn-info">解锁</button>';
                    value += '&nbsp;&nbsp;<button type="button" id="resetPassword" class="btn btn-primary">重置密码</button>';
                } else if (0 == row.isLock){
                    value = '<button type="button" id="lock" class="btn btn-warning">锁定</button>';
                    value += '&nbsp;&nbsp;<button type="button" id="resetPassword" class="btn btn-primary">重置密码</button>';
                }
                return value;
            }
            window.operateEvents = {
                'click #lock': function (e, value, row, index) {
                    $.post("lockUser",{id:row.id},function(result){
                        row.isLock = 1;
                        $('#table').bootstrapTable('updateRow', {
                            index: index,
                            row:row
                        });
                    });
                },
                'click #resetPassword': function (e, value, row, index) {
                    $.messager.confirm("重置密码",'即将重置 <span class="text-danger">'+ row.account +'</span> 的密码，请确认后执行！',function(){
                        $.post("resetPassword",{id:row.id,account:row.account},function(result){
                            $.messager.alert("重置成功!");
                        });
                    });
                },
                'click #unlock': function (e, value, row, index) {
                    $.post("unlockUser",{id:row.id},function(result){
                        row.isLock = 0;
                        $('#table').bootstrapTable('updateRow', {
                            index: index,
                            row:row
                        });
                    });
                }
            };

			var Users = {
				commitUrl : "",

				init: function() {
					$('#Modal').modal('hide');
				},
				save: function(){
					if(!$('#account').val()){
						$('#warningContent').text("用户名不能为空,请补充完整后重试!");
						$('#warningDiv').show();
						return;
					}
					$.ajax({
						type: "POST",
						url: Users.commitUrl,
						data: $('#modalForm').serialize(),
						success: function(msg){
							if("registerUser" == Users.commitUrl){
								$.messager.alert("消息","新增成功!");
								$('#table').bootstrapTable('refresh');
							}
							if("usersUpdate" == Users.commitUrl){
								$.messager.alert("消息","修改成功!");
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
					Users.commitUrl = "registerUser";
				},
				update: function(){
					var row = $('#table').bootstrapTable('getSelections');
					if ("" == row){
						$.messager.alert("提示","您还未选择");
						return;
					}
					row = row[0];

					Users.commitUrl = "usersUpdate";

					$('#modalForm').form('clear');
					$('#ModalLabel').text("修改");
					$('#modalForm').form('load',row);

					$('#Modal').modal('show');
				},
				remove: function(){
					Users.commitUrl = "";

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

			function isValidityOfUserName(){
				var account = $('#account').val();
				if ("" == account) {
					return;
				}
				$.post('isValidityOfUserName',{account:account},function(result){
					console.log(result);
					if (0 == result.ret) {
						$('#warningContent').text("用户名已被占用,请重试!");
						$('#warningDiv').show();
						$('#saveButton').attr('disabled','disabled');
						return;
					}
					$('#warningDiv').hide();
					$('#saveButton').removeAttr('disabled');
				});
			}
		</script>
		
	</body>
</html>
