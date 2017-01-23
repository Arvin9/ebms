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
	
	    <title>Home</title>
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
	                        <h1 class="page-header">习题</h1>
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
					        		<h4 class="modal-title" id="ModalLabel">Modal title</h4>
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
										    	<input type="text" class="form-control" id="exercisesId" name="exercisesId" placeholder="id">
										   	</div>
										</div>
										<div class="form-group">
						      				<div class="input-group">
												<label class="input-group-addon">标题</label>
										    	<input type="text" class="form-control" id="exercisesTitle" name="exercisesTitle"  required="required" />
										   	</div>
										</div>
										<div class="form-group">
						      				<div class="input-group">
												<label class="input-group-addon">内容</label>
										    	<textarea type="text" class="form-control" rows="10" style="width:100%" id="exercisesContent" name="exercisesContent" required="required"></textarea>
										   	</div>
										</div>
										<div class="form-group">
						      				<div class="input-group">
												<label class="input-group-addon">提示</label>
										    	<input type="text" class="form-control" id="exercisesHint" name="exercisesHint" required="required" />
										   	</div>
										</div>
										<div class="form-group">
						      				<div class="input-group">
												<label class="input-group-addon">答案</label>
										    	<input type="text" class="form-control" id="exercisesAnswer" name="exercisesAnswer" required>
										   	</div>
										</div>
										<div class="form-group">
						      				<div class="input-group">
												<label class="input-group-addon">困难度</label>
										    	<select class="form-control" id="exercisesDifficultyLevel" name="exercisesDifficultyLevel" required>
													<option value ="1">简单</option>
													<option value ="2">中等</option>
													<option value ="3">困难</option>
												</select>
										   	</div>
										</div>
										<div class="form-group">
						      				<div class="input-group">
												<label class="input-group-addon">积分值</label>
										    	<input type="text" class="form-control" id="exercisesIntegral" name="exercisesIntegral" required>
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
	                
	                
	                <div id="toolbar">
	                	<button id="insert" class="btn btn-success" onclick="Exercises.insert()">
				            <i class="glyphicon glyphicon-plus"></i> 增加
				        </button>
				        <button id="update" class="btn btn-warning" onclick="Exercises.update()">
				            <i class="glyphicon glyphicon-pencil"></i> 修改
				        </button>
				        <button id="remove" class="btn btn-danger" onclick="Exercises.remove()">
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
			Exercises.init();
			$('#table').bootstrapTable({
				url: '${ctx}/exercisesQueryByParam',
				toolbar: "#toolbar",
				height: $(window).height() - 200,
				cache: false,
				pagination: true,
                pageSize: 5,
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
			        field: 'exercisesId',
			        title: 'ID',
			        align: "center",
			        valign: "middle",
			        sortable: true
			    },{
			        field: 'exercisesTitle',
			        align: "center",
			        valign: "middle",
			        title: '标题'
			    },{
			        field: 'exercisesContent',
			        halign: "center",
			        align: "left",
			        title: '内容'
			    },{
			        field: 'exercisesHint',
			        align: "center",
			        valign: "middle",
			        title: '提示'
			    },{
			        field: 'exercisesAnswer',
			        align: "center",
			        valign: "middle",
			        title: '答案'
			    },{
			        field: 'exercisesDifficultyLevel',
			        align: "center",
			        valign: "middle",
			        title: '困难度',
			        formatter: function(value){
			        	if(1 == value){
			        		return "简单";
			        	}
			        	if(2 == value){
			        		return "中等";
			        	}
			        	if(3 == value){
			        		return "困难";
			        	}
			        	return value;
			        }
			    },{
			        field: 'exercisesIntegral',
			        align: "center",
			        valign: "middle",
			        title: '积分值'
			    },{
			        field: 'answerCount',
			        align: "center",
			        valign: "middle",
			        title: '回答数',
			        visible : false
			    },{
			        field: 'answerCorrectCount',
			        align: "center",
			        valign: "middle",
			        title: '回答正确数',
			        visible : false
			    }]
			});		
		});
		var Exercises = {
			commitUrl : "",
			
			init: function() {
				$('#Modal').modal('hide');
			},
			save: function(){
			    if(!$('#exercisesTitle').val() || !$('#exercisesContent').val() || !$('#exercisesHint').val()
			    		|| !$('#exercisesAnswer').val() || !$('#exercisesDifficultyLevel').val() || !$('#exercisesIntegral').val()){
			    	$('#warningContent').text("所有输入框为必填项目,请补充完整后重试!");
			    	$('#warningDiv').show();
			    	return;
			    }
				$.ajax({
					type: "POST",
					url: Exercises.commitUrl,
					data: $('#modalForm').serialize(),
					success: function(msg){
						if("exercisesInsert" == Exercises.commitUrl){
							$.messager.alert("消息","新增成功!" + msg);
							$('#table').bootstrapTable('refresh');
						}
						if("exercisesUpdate" == Exercises.commitUrl){
							$.messager.alert("消息","修改成功!" + msg);
							$('#table').bootstrapTable('refresh');
						}
					}
				});
				alert("save");
				$('#Modal').modal('hide');
			},
			insert: function() {
				$('#modalForm').form('clear');
				$('#Modal').modal('show');
				Exercises.commitUrl = "exercisesInsert";
			},
			update: function(){
				var row = $('#table').bootstrapTable('getSelections');
				if ("" == row){
					$.messager.alert("提示","您还未选择");
					return;
				}
				row = row[0];
				
				Exercises.commitUrl = "exercisesUpdate";
				
				$('#modalForm').form('clear');
				$('#modalForm').form('load',row);
				$('#Modal').modal('show');
				//alert('getSelections: ' + ;JSON.stringify(
			},
			remove: function(){
				Exercises.commitUrl = "exercisesDelete";
				
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
