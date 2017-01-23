<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

   

    <!-- Fine Uploader Thumbnails template w/ customization
    ====================================================================== -->
    <script type="text/template" id="qq-template-validation">
        <div class="qq-uploader-selector qq-uploader" qq-drop-area-text="将上传文件拖拽至此">
            <div class="qq-total-progress-bar-container-selector qq-total-progress-bar-container">
                <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-total-progress-bar-selector qq-progress-bar qq-total-progress-bar"></div>
            </div>
            <div class="qq-upload-drop-area-selector qq-upload-drop-area" qq-hide-dropzone>
                <span class="qq-upload-drop-area-text-selector"></span>
            </div>
            <div class="qq-upload-button-selector qq-upload-button">
                <div>选择上传文件</div>
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

    <title>Fine Uploader Validation Demo</title>
</head>
<body>
    <!-- Fine Uploader DOM Element
    ====================================================================== -->
    <div id="fine-uploader-validation"></div>

    <!-- Your code to create an instance of Fine Uploader and bind to the DOM/template
    ====================================================================== -->
    <script>
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
                    waitingPath: '<%=path%>/resources/fineUploader/placeholders/waiting-generic.png',
                    notAvailablePath: '<%=path%>/resources/fineUploader/source/placeholders/not_available-generic.png'
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