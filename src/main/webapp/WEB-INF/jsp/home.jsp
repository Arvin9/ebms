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
	                        <h1 class="page-header">仪表盘</h1>
	                    </div>
	                    <!-- /.col-lg-12 -->
	                </div>
	                
	                <div class="row">
	                	<div class="col-md-7">
		                    <div class="panel panel-default">
		                        <div class="panel-heading">
		                            <i class="fa fa-bar-chart-o fa-fw"></i> 每日登录用户数
		                        </div>
		                        <!-- /.panel-heading -->
		                        <div class="panel-body">
		                        
		                        	<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    								<div id="userLoginCountLine" style="width: 100%;"></div>
		                            
		                        </div>
                        		<!-- /.panel-body -->
                    		</div>
	                	</div>
	                	<div class="col-md-5">
		                    <div class="panel panel-default">
		                        <div class="panel-heading">
		                            <i class="fa fa-bar-chart-o fa-fw"></i> 用户访问页面量
		                        </div>
		                        <!-- /.panel-heading -->
		                        <div class="panel-body">
		                        
		                        	<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    								<div id="userVisitPagePie" style="width: 100%;"></div>
		                            
		                        </div>
                        		<!-- /.panel-body -->
                    		</div>
	                	</div>
	                </div>

					<div class="row">
						<div class="col-md-7">
							<div class="panel panel-default">
								<div class="panel-heading">
									<i class="fa fa-bar-chart-o fa-fw"></i> 总学习指标
								</div>
								<!-- /.panel-heading -->
								<div class="panel-body">

									<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
									<div id="radar" style="width: 100%;height:350px;"></div>

								</div>
								<!-- /.panel-body -->
							</div>
						</div>
					</div>
	            </div>
			</div>


		</div>
		<!-- /container -->
		<jsp:include page="include/footer.jsp"></jsp:include>
		
		<script type="text/javascript">

			function getHeight(){
				var height = window.innerHeight - 260;
				if(height < 400) height = 400
				return height;
			}
			
			$(function(){
				$('#userLoginCountLine').height(getHeight());
				$('#userVisitPagePie').height(getHeight());
				
				
				// 基于准备好的dom，初始化echarts实例
		        var userVisitPagePie = echarts.init(document.getElementById('userVisitPagePie'), 'infographic');
		     	// 使用刚指定的配置项和数据显示图表。
		        userVisitPagePie.setOption(userVisitPageOption);
		     	
		        var userLoginCountLine = echarts.init(document.getElementById('userLoginCountLine'), 'infographic');
		        userLoginCountLine.setOption(userLoginCountOption);

				// 基于准备好的dom，初始化echarts实例
				var radarChart = echarts.init(document.getElementById('radar'));
				// 使用刚指定的配置项和数据显示图表。
				radarChart.setOption(radarOption);

				$.get("queryUserLoginCount",function(result){
					if (result) {
						userLoginCountLine.setOption({
							xAxis: {
								data: result.date
							},series: [{
								data: result.data
							}]
						});
					}
				});
				$.get("queryUserVisitPage",function(result){
					if (result) {
						userVisitPagePie.setOption({
							series: [{
								data: result.seriesData
							}]
						});
					}
				});

				// 获取学习指标
				$.get("queryTotalStudyIndex",function(data){
					if (data) {
						var len = data.length;
						var value = new Array();
						for (var i = 0; i < len; i++){
							value[i] = data[i].amount;
						}
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
			});

	        // 指定图表的配置项和数据
	        var userVisitPageOption = {
				title : {
					text: '用户访问页面量',
				    subtext: 'PV',
				    x:'center'
				},
				tooltip : {
					trigger: 'item',
				   	formatter: "{a} <br/>{b} : {c}次 ({d}%)"
				},
				legend: {
					orient: 'vertical',
				    left: 'left',
				    data: []
				},
				series : [
					{
				    	name: '访问量',
				        type: 'pie',
				        radius : '55%',
				        center: ['50%', '60%'],
				        data: [],
				        itemStyle: {
				        	emphasis: {
				        		shadowBlur: 10,
				                shadowOffsetX: 0,
				                shadowColor: 'rgba(0, 0, 0, 0.5)'
				            }
				        }
				    }
				]
			};


			var userLoginCountOption = {
				title: {
					text: '每日登录用户数'
				},
				tooltip: {
					trigger: 'axis',
					position: function (pt) {
						return [pt[0], '10%'];
					}
				},
				legend: {
					top: 'bottom',
					data:['登陆用户数']
				},
				grid: {
					left: '3%',
					right: '3%',
					bottom: '10%',
					containLabel: true
				},
				toolbox: {
					feature: {
						dataZoom: {
							yAxisIndex: 'none'
						},
						restore: {},
						saveAsImage: {}
					}
				},
				xAxis: {
					type: 'category',
					boundaryGap: false,
					data: []
				},
				yAxis: {
					type: 'value',
					boundaryGap: [0, '100%']
				},
				dataZoom: [{
					type: 'inside',
					start: 80,
					end: 100
				}, {
					start: 80,
					end: 100,
					handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
					handleSize: '80%',
					handleStyle: {
						color: '#fff',
						shadowBlur: 3,
						shadowColor: 'rgba(0, 0, 0, 0.6)',
						shadowOffsetX: 2,
						shadowOffsetY: 2
					}
				}],
				series: [
					{
						name:'用户登录量',
						type:'line',
						stack: '总量',
						data: []
					}
				]
			};

			var radarOption = {
				title : {
					text: '总学习指标',
					subtext: '类别'
				},
				tooltip : {
					trigger: ''
				},
				legend: {
					x : 'right',
					bottom : '20px',
					data:['类别']
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
		</script>
		
	</body>
</html>
