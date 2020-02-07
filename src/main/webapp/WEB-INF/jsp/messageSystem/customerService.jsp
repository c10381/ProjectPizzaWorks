<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 這個套件的css -->
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/messageSystem/smart_tab_vertical.css'>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/messageSystem/customerServiceMain.css'>
</head>

<body>
	<div id="cS_container">
		<div id="tabs">
			<ul class="cs_MessageContent">
				<!-- <li><a href="#cs_aaablock" id="aaa">Tab 1</a></li>
				<li><a href="#tabs-2">Tab 1</a></li> -->
			</ul>
			<!-- <div id="cs_aaablock">
				<div class="cs_comeMessage"><p>111111111</p></div>
				<div class="cs_myMessage"><p>111111111</p></div>
			</div>
			<div id="tabs-2"></div> -->

		</div>
		<div style="width: 900px; display: flex;">
			<div style="width: 160px; height: 1px; flex-direction: row"></div>
			<div id="customerService_inputArea">
				<textarea class='customerService_input' placeholder='Type a message...' onKeyup="CsputEnter()"></textarea>
				<button onclick="sendToCustomerMessage(this)"id="customerService_send" style="margin: 0 5px;" class="btn btn-dark">送出</button>
			</div>
		</div>
	</div>
		<script type="text/javascript">
			$(document).ready(function() {
				// Smart Tab
				$('#tabs').smartTab({
					autoProgress : false,
					stopOnFocus : true,
					transitionEffect : 'vslide',
					transitionSpeed:'5',
				});
			});
		</script>
		<script
			src='${pageContext.request.contextPath}/js/messageSystem/jquery.smartTab.min.js'></script>
		<script
			src='${pageContext.request.contextPath}/js/messageSystem/customerServiceMain.js'></script>
</body>
</html>