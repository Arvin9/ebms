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
	
	    <title>时间轴</title>
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
	                        <h1 class="page-header">时间轴</h1>
	                    </div>
	                    <!-- /.col-lg-12 -->
	                </div>
	                <div class="row">
		                <div class="col-md-8">
			                <div class="panel panel-default">
		                        <div class="panel-heading">
		                            <i class="fa fa-clock-o fa-fw"></i> 时间轴
		                        </div>
		                        <!-- /.panel-heading -->
		                        <div class="panel-body">
		                            <ul class="timeline" id="timeline">
		                            
		                            </ul>
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
		var icon = new Array("fa-check","fa-credit-card","fa-bomb","fa-save","fa-graduation-cap");
		
		var badgeColor = new Array("warning","danger","info","success");
		
		$(function(){
			$.post("timelineQueryByParam",function(data){
				console.log(data);
				$.each(data,function(index,obj){
					if(index % 2 == 0)
						timelineLeftPrint(obj);
					else 
						timelineRightPrint(obj);
				});
			});
		});
		
		
		function timelineLeftPrint(obj){
			var content = 	'<li>' +
					          	'<div class="timeline-badge">' +
									'<span class="glyphicon glyphicon-pencil"></span>' +
					        	'</div>' +
					        	'<div class="timeline-panel">' +
					            	'<div class="timeline-heading">' +
					                	'<h4 class="timeline-title">'+ obj.timelineCaption +'</h4>' +
					                	'<p>' +
					                		'<small class="text-muted">' +
					                			'<i class="fa fa-clock-o"></i>&nbsp;&nbsp;' +
					                			obj.timelineAddTime +
					                		'</small>' +
					                	'</p>' +
					            	'</div>' +
						            '<div class="timeline-body">' +
						                '<p>'+ obj.timelineContent +'</p>' +
						            '</div>' +
					        	'</div>' +
					    	'</li>';
			$('#timeline').append(content);
		}
		
		function timelineRightPrint(obj){
			var content = 	'<li class="timeline-inverted">' +
                				'<div class="timeline-badge info">' +
									'<span class="glyphicon glyphicon-pencil"></span>' +
                				'</div>' +
                				'<div class="timeline-panel">' +
                    				'<div class="timeline-heading">' +
                        				'<h4 class="timeline-title">'+ obj.timelineCaption +'</h4>' +
                        				'<p>' +
				                		'<small class="text-muted">' +
				                			'<i class="fa fa-clock-o"></i>&nbsp;&nbsp;' +
				                			obj.timelineAddTime +
				                		'</small>' +
				                	'</p>' +
                    				'</div>' +
                    				'<div class="timeline-body">' +
                        				'<p>'+ obj.timelineContent +'</p>' +
                   					'</div>' +
                				'</div>' +
            				'</li>';
			$('#timeline').append(content);
		}
		</script>
		
	</body>
</html>
