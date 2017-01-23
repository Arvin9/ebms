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
	                        <h1 class="page-header">文章</h1>
	                    </div>
	                    <!-- /.col-lg-12 -->
	                </div>
	                
	                <!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist" id="tabList">
						<li role="presentation" class="active">
							<a href="#mainTab" id="mainA" role="tab" data-toggle="tab" onclick="Article.goBack()">Home</a>
						</li>
					  <!-- 
					  <li role="presentation"><a href="#profile" role="tab" data-toggle="tab">Profile</a></li>
					  <li role="presentation"><a href="#messages" role="tab" data-toggle="tab">Messages</a></li>
					  <li role="presentation"><a href="#settings" role="tab" data-toggle="tab">Settings</a></li>
					   -->
					</ul>
					
					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="mainTab">
							<div id="toolbar">
			                	<button id="insert" class="btn btn-success" onclick="Article.insert()">
						            <i class="glyphicon glyphicon-plus"></i> 新增
						        </button>
						        <button id="update" class="btn btn-warning" onclick="Article.update()">
						            <i class="glyphicon glyphicon-pencil"></i> 修改
						        </button>
						        <%-- 
						        <button id="remove" class="btn btn-danger" onclick="Article.remove()">
						            <i class="glyphicon glyphicon-remove"></i> 删除
						        </button>
						        --%>
						    </div>
			                <table id="table"></table>
						</div>
						<div role="tabpanel" class="tab-pane" id="editTab" >
							<div class="row">
								<div class="col-md-offset-2 col-md-8">
								
									<form id="articleForm" role="form" method="post"  enctype="multipart/form-data">
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
										    	<input type="text" class="form-control" id="articleId" name="articleId">
										   	</div>
										</div>
										<div class="form-group">
						      				<div class="input-group" style="float:left;width:50%;">
												<label class="input-group-addon">标题</label>
										    	<input type="text" class="form-control" id="articleCaption" name="articleCaption"  required="required" />
										   	</div>
										   	<div class="input-group" style="width:50%;">
												<label class="input-group-addon">作者</label>
										    	<input type="text" class="form-control" id="articleAuthor" name="articleAuthor"  required="required" />
										   	</div>
										</div>
										<div class="form-group">
						      				<div class="input-group" id="articleDigestDiv">
												<label class="input-group-addon">摘要</label>
												<input type="text" class="form-control" id="articleDigest" name="articleDigest"  required="required" />
										   	</div>
										</div>
										<div class="form-group">
						      				<div class="input-group" id="articleEditorDiv">
						      					<!--style给定宽度可以影响编辑器的最终宽度-->
												<script type="text/plain" id="articleEditor"  style="height:250px;">
    												<p>请在此输入文章内容</p>
												</script>
										   	</div>
										</div>
										<div class="form-group">
						      				<div class="input-group">
												<label class="input-group-addon">备注</label>
										    	<input type="text" class="form-control" id="articleRemark" name="articleRemark" required>
										   	</div>
										</div>
										
					      			</form>
									<div id="btns" class="">
										<button class="btn btn-primary" onclick="Article.goBack()">返回</button>&nbsp;
										<button class="btn btn-primary" id="saveBtn" onclick="Article.save()">提交</button>&nbsp;
										<div id="checkBtns" hidden style="float:right">
											<button class="btn btn-success" onclick="Article.pass()">通过</button>&nbsp;
											<button class="btn btn-danger" onclick="Article.notPass()">未通过</button>&nbsp;
										</div>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>
						<div role="tabpanel" class="tab-pane" id="messages">...</div>
						<div role="tabpanel" class="tab-pane" id="settings">...</div>
					</div>
	                
	                
	                
	            </div>
			</div>


		</div>
		<!-- /container -->
		<jsp:include page="include/footer.jsp"></jsp:include>
		
		<script type="text/javascript">
		
			
			function getHeight(){
				var height = window.innerHeight - 210;
				if(height < 400) height = 400
				return height;
			}
			
			
			$(function(){
				
				Article.init();
				
				//实例化编辑器
			    var um = UM.getEditor('articleEditor',{
			    	/* 传入配置参数,可配参数列表看umeditor.config.js */
		            toolbar: [
						'source | undo redo | bold italic underline strikethrough | superscript subscript | forecolor backcolor | removeformat |',
						'insertorderedlist insertunorderedlist | selectall cleardoc paragraph | fontfamily fontsize' ,
						'| justifyleft justifycenter justifyright justifyjustify |',
						'link unlink ',
						'| horizontal print preview fullscreen',  'formula'
					]
			    });
				
				$('#table').bootstrapTable({
					url: '${ctx}/articleQueryByParam',
					toolbar: "#toolbar",
					height: getHeight(),
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
				        field: 'articleId',
				        title: 'ID',
				        align: "center",
				        valign: "middle",
				        sortable: true,
				        visible : false
				    },{
				        field: 'articleCaption',
				        align: "center",
				        valign: "middle",
				        title: '标题'
				    },{
				        field: 'articleDigest',
				        align: "center",
				        valign: "middle",
				        title: '摘要'
				    },{
				        field: 'articleContent',
				        align: "center",
				        valign: "middle",
				        title: '内容'
				    },{
				        field: 'articleRemark',
				        align: "center",
				        valign: "middle",
				        title: '备注'
				    },{
				        field: 'articleAuthor',
				        align: "center",
				        valign: "middle",
				        title: '作者'
				    },{
				        field: 'userAccount',
				        align: "center",
				        valign: "middle",
				        title: '编辑人',
				        visible : false
				    },{
				        field: 'articleCreateTime',
				        align: "center",
				        valign: "middle",
				        title: '创建时间',
				        visible : false
				    },{
				        field: 'articleUpdateTime',
				        align: "center",
				        valign: "middle",
				        title: '修改时间'
				    },{
				        field: 'articlePageView',
				        align: "center",
				        valign: "middle",
				        title: '浏览量'
				    },{
				        field: 'articleStates',
				        align: "center",
				        valign: "middle",
				        title: '操作',
				        events: operateEvents,
                        formatter: operateFormatter
				    },{
				        field: 'articleLike',
				        align: "center",
				        valign: "middle",
				        title: '点赞量',
				        visible : false
				    },{
				        field: 'articleDislike',
				        align: "center",
				        valign: "middle",
				        title: '不喜欢量',
				        visible : false
				    },{
				        field: 'articleStates',
				        align: "center",
				        valign: "middle",
				        title: '状态',
				        formatter: function(value){
				        	if(0 == value){
				        		return "未审核";
				        	}
				        	if(1 == value){
				        		return "审核通过";
				        	}
				        	if(2 == value){
				        		return "审核未通过";
				        	}
				        	if(3 == value){
				        		return "删除";
				        	}
				        	return value;
				        }
				    }]
				});		
			});
			function operateFormatter(value) {
				if(0 == value){
					return [
				        '<a class="btn btn-warning" id="check" style="margin-top:3px">审核</a><br>',
				        '<a class="btn btn-danger" id="remove" style="margin-top:3px">删除</a>'
				    ].join('');
				}
				if(1 == value || 2 == value){
					return [
						'<a class="btn btn-danger" id="remove" style="margin-top:3px">删除</a>'
				    ].join('');
				}
				if(3 == value){
					return [
				    	'<a class="btn btn-info" id="annulRemove">撤销删除</a><br>'
				    ].join('');
				}
				return ;
		    }
		    window.operateEvents = {
		        'click #check': function (e, value, row, index) {
		        	$('#articleId').val(row.articleId);
					$('#articleCaption').val(row.articleCaption);
					$('#articleAuthor').val(row.articleAuthor);
					$('#articleDigest').val(row.articleDigest);
					$('#articleRemark').val(row.articleRemark);
					UM.getEditor('articleEditor').setContent(row.articleContent,false);
					
					$("#tabList").append('<li role="presentation" id="tabLi"><a id="checkA" href="#editTab" role="tab" data-toggle="tab">审核</a></li>');
					$('#checkA').tab('show');
					//设定Um编辑器的宽度
					$('#articleEditor').width($("#articleDigestDiv").width());
					$('.edui-container').width($("#articleDigestDiv").width());
					
					$('#saveBtn').hide();
					$('#checkBtns').show();
					
		        },
		        'click #remove': function (e, value, row, index) {
		        	$.post("articleUpdateStatus",{
		        			articleId : row.articleId,
		        			articleStates : 3
		        		},function( data ) {
							$.messager.alert("消息","操作成功!");
							$('#table').bootstrapTable('refresh');
					});
		        },
		        'click #annulRemove': function (e, value, row, index) {
		        	$.post("articleUpdateStatus",{
		        			articleId : row.articleId,
		        			articleStates : 0
		        		},function( data ) {
							$.messager.alert("消息","操作成功!");
							$('#table').bootstrapTable('refresh');
					});
		        }
		    };
			
			var Article = {
				commitUrl : "",
				
				init: function() {
				},
				save: function(){
					var content = UM.getEditor('articleEditor').getContent();
					
				    if(!$('#articleCaption').val() || !$('#articleDigest').val() || !$('#articleAuthor').val() || !UM.getEditor('articleEditor').hasContents()){
				    	$('#warningContent').text("所有输入框为必填项目,请补充完整后重试!");
				    	$('#warningDiv').show();
				    	return;
				    }
				    
					$.ajax({
						type: "POST",
						url: Article.commitUrl,
						data: {
							articleId : $('#articleId').val(),
							articleCaption : $('#articleCaption').val(),
							articleAuthor : $('#articleDigest').val(),
							articleDigest : $('#articleAuthor').val(),
							articleContent : content,
							articleRemark : $('#articleRemark').val()
						},
						success: function(msg){
							if("articleInsert" == Article.commitUrl){
								$.messager.alert("消息","新增成功!" + msg);
								$('#table').bootstrapTable('refresh');
							}
							if("articleUpdate" == Article.commitUrl){
								$.messager.alert("消息","修改成功!" + msg);
								$('#table').bootstrapTable('refresh');
							}
						}
					});
					$('#mainA').tab('show');
					$("#tabLi").remove();
					$('#checkBtns').hide();
				},
				insert: function() {
					$("#tabList").append('<li role="presentation" id="tabLi"><a id="insertA" href="#editTab" role="tab" data-toggle="tab">新增</a></li>');
					$('#insertA').tab('show');
					//设定Um编辑器的宽度
					$('#articleEditor').width($("#articleDigestDiv").width());
					$('.edui-container').width($("#articleDigestDiv").width());
					
					Article.commitUrl = "articleInsert";
				},
				update: function(){
					var row = $('#table').bootstrapTable('getSelections');
					if ("" == row){
						$.messager.alert("提示","您还未选择");
						return;
					}
					row = row[0];
					
					$('#articleId').val(row.articleId);
					$('#articleCaption').val(row.articleCaption);
					$('#articleAuthor').val(row.articleAuthor);
					$('#articleDigest').val(row.articleDigest);
					$('#articleRemark').val(row.articleRemark);
					UM.getEditor('articleEditor').setContent(row.articleContent,false);
					
					$("#tabList").append('<li role="presentation" id="tabLi"><a id="updateA" href="#editTab" role="tab" data-toggle="tab">修改</a></li>');
					$('#updateA').tab('show');
					//设定Um编辑器的宽度
					$('#articleEditor').width($("#articleDigestDiv").width());
					$('.edui-container').width($("#articleDigestDiv").width());
					
					Article.commitUrl = "articleUpdate";
				},
				remove: function(){
					Article.commitUrl = "articleDelete";
					
					var row = $('#table').bootstrapTable('getSelections');
					if ("" == row){
						$.messager.alert("提示","您还未选择");
						return;
					}
					row = row[0];
					
					var t = $.messager.confirm('警告','您将删除ID为'+row.articleId+'的记录!!!', function(){
						$.post( Article.commitUrl, { articleId : row.articleId},function( data ) {
							$.messager.alert("消息","成功删除!");
							$('#table').bootstrapTable('refresh');
						});
					});
				},
				goBack: function(){
					$('#mainA').tab('show');
					$('#tabLi').remove();
					$('#checkBtns').hide();
					$('#saveBtn').show();
				},
				pass: function(){
					$.post("articleUpdateStatus",{
		        			articleId : $('#articleId').val(),
		        			articleStates : 1
		        		},function( data ) {
							$.messager.alert("消息","操作成功!");
							$('#table').bootstrapTable('refresh');
					});
					Article.goBack();
				},
				notPass: function(){
					$.post("articleUpdateStatus",{
		        			articleId : $('#articleId').val(),
		        			articleStates : 2
		        		},function( data ) {
							$.messager.alert("消息","操作成功!");
							$('#table').bootstrapTable('refresh');
					});
					Article.goBack();
				}
			};	

	        
		</script>
		
	</body>
</html>
