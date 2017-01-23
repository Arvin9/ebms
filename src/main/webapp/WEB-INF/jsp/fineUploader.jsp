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
		
	<!-- Fine Uploader Thumbnails template w/ customization -->
    <script type="text/template" id="qq-template-validation">
        <div class="qq-uploader-selector qq-uploader" qq-drop-area-text="将上传文件拖拽至此">
            <div class="qq-total-progress-bar-container-selector qq-total-progress-bar-container">
                <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-total-progress-bar-selector qq-progress-bar qq-total-progress-bar"></div>
            </div>
            <div class="qq-upload-drop-area-selector qq-upload-drop-area" qq-hide-dropzone>
                <span class="qq-upload-drop-area-text-selector"></span>
            </div>
            <div class="qq-upload-button-selector qq-upload-button">
                <div>选择文件</div>
            </div>
            <span class="qq-drop-processing-selector qq-drop-processing">
                <span>Processing dropped files...</span>
                <span class="qq-drop-processing-spinner-selector qq-drop-processing-spinner"></span>
            </span>
            <ul class="qq-upload-list-selector qq-upload-list" aria-live="polite" aria-relevant="additions removals">
                <li>
                    <div class="qq-progress-bar-container-selector">
                        <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-progress-bar-selector qq-progress-bar"></div>
                    </div>
                    <span class="qq-upload-spinner-selector qq-upload-spinner"></span>
                    <img class="qq-thumbnail-selector" qq-max-size="100" qq-server-scale>
                    <span class="qq-upload-file-selector qq-upload-file"></span>
                    <span class="qq-upload-size-selector qq-upload-size"></span>
                    <button type="button" class="qq-btn qq-upload-cancel-selector qq-upload-cancel">Cancel</button>
                    <button type="button" class="qq-btn qq-upload-retry-selector qq-upload-retry">Retry</button>
                    <button type="button" class="qq-btn qq-upload-delete-selector qq-upload-delete">Delete</button>
                    <span role="status" class="qq-upload-status-text-selector qq-upload-status-text"></span>
                </li>
            </ul>

            <dialog class="qq-alert-dialog-selector">
                <div class="qq-dialog-message-selector"></div>
                <div class="qq-dialog-buttons">
                    <button type="button" class="qq-cancel-button-selector">Close</button>
                </div>
            </dialog>

            <dialog class="qq-confirm-dialog-selector">
                <div class="qq-dialog-message-selector"></div>
                <div class="qq-dialog-buttons">
                    <button type="button" class="qq-cancel-button-selector">No</button>
                    <button type="button" class="qq-ok-button-selector">Yes</button>
                </div>
            </dialog>

            <dialog class="qq-prompt-dialog-selector">
                <div class="qq-dialog-message-selector"></div>
                <input type="text">
                <div class="qq-dialog-buttons">
                    <button type="button" class="qq-cancel-button-selector">Cancel</button>
                    <button type="button" class="qq-ok-button-selector">Ok</button>
                </div>
            </dialog>
        </div>
    </script>

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
	                	<!-- Fine Uploader DOM Element -->
	    				<div id="fine-uploader-validation"></div>
	                
	                </div>
	            </div>
			</div>


		</div>
		<!-- /container -->
		<jsp:include page="include/footer.jsp"></jsp:include>
		
		<script type="text/javascript">
	    <!-- Your code to create an instance of Fine Uploader and bind to the DOM/template-->
	        var restrictedUploader = new qq.FineUploader({
	            element	: 	document.getElementById("fine-uploader-validation"),
	            template: 	'qq-template-validation',
	            messages:{
	            	onLeave :	'The files are being uploaded, if you leave now the upload will be canceled.',
	                sizeError:	'{file} 太大, 最大为 {sizeLimit}.',
	                typeError:	'{file} 文件类型暂不支持. 当前支持文件类型为: {extensions}'
	            }, 
	            request: {
	            	customHeaders:	{},
	            	inputName:	'qqfile',
	                endpoint: 'fineUploadFile' 
	            },
	            thumbnails: {
	                placeholders: {
	                    waitingPath: '${ctx}/resources/fineUploader/placeholders/waiting-generic.png',
	                    notAvailablePath: '${ctx}/resources/fineUploader/source/placeholders/not_available-generic.png'
	                }
	            },
	            params: {                
	            	                        	               
	           	},
	           	onComplete:  function(id,  fileName,  responseJSON)  {
	           		alert(responseJSON);
	           	},
	            validation: {
	                allowedExtensions: ['jpeg', 'jpg', 'txt','zip'],
	                itemLimit: 3,
	                sizeLimit: 51200*1000 // 50 kB = 50 * 1024 bytes
	            }
	        });
		</script>
		
	</body>
</html>
