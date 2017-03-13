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
	                        <h1 class="page-header">用户分析</h1>
	                    </div>
	                    <!-- /.col-lg-12 -->
	                </div>
					<!-- Modal -->
					<div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
									<h4 class="modal-title" id="ModalLabel">分析</h4>
								</div>
								<div class="modal-body">
									<div class="form-group" id="warningDiv" hidden>
										<div class="input-group" style="width:100%">
											<div class="alert alert-warning alert-dismissible" role="alert">
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

									<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
									<div id="finish_rate" style="width: 550px;height:350px;"></div>
									<div id="radar" style="width: 550px;height:350px;"></div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
			var radarChart;
			var rateChart;
			$(function(){
				$('#table').bootstrapTable({
					url: '${ctx}/queryUsersAnalyze',
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
						field: 'realName',
						align: "center",
						valign: "middle",
						title: '别名',
						visible: false
					},{
						field: 'answerCorrect',
						align: "center",
						valign: "middle",
						title: '回答正确数'
					},{
                        field: 'manage',
                        align: "center",
                        valign: "middle",
                        title: '操作',
                        events: operateEvents,
                        formatter: operateFormatter
                    }]
				});
				// 基于准备好的dom，初始化echarts实例
				radarChart = echarts.init(document.getElementById('radar'));
				// 使用刚指定的配置项和数据显示图表。
				radarChart.setOption(radarOption);
				// 基于准备好的dom，初始化echarts实例
				rateChart = echarts.init(document.getElementById('finish_rate'));
				// 使用刚指定的配置项和数据显示图表。
				rateChart.setOption(rateOption);

			});
			function operateFormatter(value, row, index) {
				return '<button type="button" id="completionDegree" class="btn btn-warning">完成度</button>&nbsp;&nbsp;'+
						'<button type="button" id="studyIndex" class="btn btn-info">学习指标</button>';
			}
			window.operateEvents = {
				'click #completionDegree': function (e, value, row, index) {
					$('#finish_rate').show();
					$('#radar').hide();
					$('#Modal').modal('show');
					// 获取完成率
					$.post("queryCompletionDegree",{id:row.id},function(result){
						if (result) {
							var data = ((result.answers / result.blankfills)*100).toFixed(2);
							rateChart.setOption({
								series: [{
									data: [{
										value: data,
										name: '完成率'
									}]
								}]
							});
						}
					});
				},
				'click #studyIndex': function (e, value, row, index) {
					$('#finish_rate').hide();
					$('#radar').show();
					$('#Modal').modal('show');
					// 获取学习指标
					$.post("queryStudyIndex",{id:row.id},function(data){
						if (data) {
							var len = data.length;
							var value = new Array();
							for (var i = 0; i < len; i++){
								value[i] = data[i].count;
							}
							console.log(data)
							radarChart.setOption({
								polar : [{
									indicator : data
								}],
								series : [{
									data : [{
										name : '类别',
										value : value
									}]
								}]
							});
						}
					});
				}
			};

			radarOption = {
				title : {
					text: '学习指标',
					subtext: '类别'
				},
				tooltip : {
					trigger: 'axis'
				},
				legend: {
					x : 'right',
					bottom : '20px',
					data:[]
				},
				toolbox: {
					show : true,
					feature : {
						mark : {show: true},
						dataView : {show: true, readOnly: false},
						restore : {show: true},
						saveAsImage : {show: true}
					}
				},
				calculable : true,
				polar : [{
					indicator : [{}],
					center : ['50%', '50%'],
					radius : '50%'
				}],
				series : [{
					type: 'radar',
					polarIndex : 0,
					itemStyle: {normal: {areaStyle: {type: 'default'}}},
					data : [{
						name : '类别',
						value : []
					}]
				}]
			};

			rateOption = {
				tooltip : {
					formatter: "{a} <br/>{b} : {c}%"
				},
				toolbox: {
					feature: {
						restore: {},
						saveAsImage: {}
					}
				},
				series: [
					{
						name: '业务指标',
						type: 'gauge',
						detail: {formatter:'{value}%'},
						data: [{
							value: 0,
							name: '完成率'
						}]
					}
				]
			};
		</script>
		
	</body>
</html>
