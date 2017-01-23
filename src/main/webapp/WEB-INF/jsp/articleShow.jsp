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
	
	    <title>JSP模板</title>
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
	                        <h1 class="page-header">模板页面</h1>
	                    </div>
	                    <!-- /.col-lg-12 -->
	                </div>
	                
	                
	                <div class="row">
	                	<div class="col-md-8" id="showArticle">
	                	</div>
	                </div>
	            </div>
			</div>


		</div>
		<!-- /container -->
		<jsp:include page="include/footer.jsp"></jsp:include>
		
		<script type="text/javascript">
		
		$(function(){
			$.get( "articleQueryForShow", function(data) {
				
				console.log(data);
				articlePrint(data);
			});
		});
		
		function articlePrint(data){
			$.each(data,function(index,obj){
				var content = '<div class="panel panel-default">' +
							  	'<div class="panel-body">' +
							  		'<div class="row">' +
								  		'<div class="col-md-8">' +
								  			'<span class="badge">'+ obj.articlePageView +'</span> &nbsp; <a href="javascript:void(0);" style="font-size:22px;" onclick="articleDetail('+ obj.articleId +')">'+obj.articleCaption+'</a> ' +
								  		'</div>' +
								  		'<div class="col-md-4">' +
								  			'<span class="label label-default">'+ obj.articleUpdateTime +'</span>' +
								  		'</div>' +
								  	'</div>' +
								  	'<div class="row">' +
							  			'<div class="col-md-8">' +
							  				'<blockquote><p >'+obj.articleDigest+'</p></blockquote>' +
							  			'</div>' +
							  		'</div>' +
							  	'</div>' +
							  '</div>';
				console.log(obj.articleId);
				$('#showArticle').append(content);
			});
		}
		function articleDetail(articleId){
			var url = "${ctx}/articleDetail?articleId=";
			url += articleId;
			window.open(url);
		}
		</script>
		
	</body>
</html>
