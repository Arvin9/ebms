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
	
	    <title>密码修改</title>
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
	                        <h1 class="page-header">密码修改</h1>
	                    </div>
	                    <!-- /.col-lg-12 -->
	                </div>
					<div class="row">
						<div class="col-lg-4">
							<div class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-3 control-label">新密码：</label>
									<div class="col-sm-9">
										<input type="password" class="form-control" id="newPassword" placeholder="Password">
                                        <span class="text-danger" id="showRule" style="display: none">密码需为6-20位的字母或数字！</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">确认密码：</label>
									<div class="col-sm-9">
										<input type="password" class="form-control" id="confirmPassword" placeholder="Password" disabled>
                                        <span class="text-danger" id="showError" style="display: none">两次输入密码不一致，请确认后重试！</span>
									</div>

								</div>

								<div class="form-group">
									<div class="col-sm-offset-3 col-sm-9">
										<button id="confirmBotton" type="botton" class="btn btn-info" onclick="changePassword()" disabled>确认</button>
									</div>
								</div>
							</div>
						</div>
					</div>

	            </div>
			</div>


		</div>
		<!-- /container -->
		<jsp:include page="include/footer.jsp"></jsp:include>
		
		<script type="text/javascript">
            $(function(){

            });
            $('#newPassword').keyup(function(){
                var ret = /^([a-zA-Z0-9]|[._]){6,20}$/;
                var newPassword = $('#newPassword').val();
                if (ret.test(newPassword)) {
                    $('#showRule').hide();
                    $('#confirmPassword').removeAttr('disabled');
                } else {
                    $('#showRule').show();
                    $('#confirmPassword').attr('disabled','disabled');
                }
            });

            $('#confirmPassword').keyup(function(){
                var newPassword = $('#newPassword').val();
                var confirmPassword = $('#confirmPassword').val();
                if (newPassword != confirmPassword) {
                    $('#showError').show();
                    $('#confirmBotton').attr('disabled','disabled');
                } else {
                    $('#showError').hide();
                    $('#confirmBotton').removeAttr('disabled');
                }
            });
            function changePassword(){
                var newPassword = $('#newPassword').val();
                var confirmPassword = $('#confirmPassword').val();
                $.post("changePassword",{newPassword:hex_md5(newPassword)},function(result){
                    if (result) {
                        $.messager.alert('消息','修改成功！请重新登录！');
                        setTimeout(function () {
                            window.location.href = "${ctx}/logout";
                        }, 3000);
                    }
                });

            }
		
		</script>
		
	</body>
</html>
