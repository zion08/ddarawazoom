<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layout/header.jsp"%>


<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>웹소켓 채팅</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
	
	<link href="../../resources/css/chat/chat.css" rel="stylesheet">
	
</head>
	<body>

   		<div class="container p-0">
			<div class="row g-0">
				<hr class="d-block d-lg-none mt-1 mb-0">
			</div>
			<div class="col-12 col-lg-7 col-xl-9">
				<div class="py-2 px-4 border-bottom d-none d-lg-block">
					<div class="d-flex align-items-center py-1">
						<div class="position-relative">
							<img src="../../resources/image/upload/logo.png" class="rounded-circle mr-1" alt="Sharon Lessman" width="50" height="50">
						</div>
						<div class="flex-grow-1 pl-3">
							<strong>DDarawaZoom 파티룸</strong>
							<div class="text-muted small"><em>DDarawaZoom 멤버들과 즐거운 대화 나누세요~</em></div>
						</div>
					</div>
				</div>

				<div class="position-relative">
					<div class="chat-messages p-4">
						
						<div class="chat-message-left pb-4">
							<div>
								<img src="../../resources/image/upload/logo.png" class="rounded-circle mr-1" alt="memberImage" width="40" height="40">
							</div>
							<div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3">
								<div id="divChatData" class="font-weight-bold mb-1"></div>
							</div>
						</div>
						
						<div class="chat-message-right pb-4">
							<div>
								<img src="../../resources/image/upload/logo.png" class="rounded-circle mr-1" alt="memberImage" width="40" height="40">
							</div>
							<div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
								<div id="divChatData" class="font-weight-bold mb-1"></div>
							</div>
						</div>
						<div class="flex-grow-0 py-3 px-4 border-top">
							<div class="input-group">
								<input type="text" id="message" size="110" onkeypress="if(event.keyCode==13){webSocket.sendChat();}" class="form-control" placeholder="메세지를 자유롭게 작성하세요." />
								<input type="button" id="btnSend" value="채팅 전송" onclick="webSocket.sendChat()" class="btn btn-light" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<script type="text/javascript">
			var webSocket = {
				init: function(param) {
					this._url = param.url;
					this._initSocket();
				},
				sendChat: function() {
					this._sendMessage('${param.bang_id}', 'CMD_MSG_SEND', $('#message').val());
					$('#message').val('');
				},
				sendEnter: function() {
					this._sendMessage('${param.bang_id}', 'CMD_ENTER', $('#message').val());
					$('#message').val('');
				},
				receiveMessage: function(msgData) {
	
					// 정의된 CMD 코드에 따라서 분기 처리
					if(msgData.cmd == 'CMD_MSG_SEND') {					
						$('#divChatData').append('<div>' + msgData.msg + '</div>');
					}
					// 입장
					else if(msgData.cmd == 'CMD_ENTER') {
						$('#divChatData').append('<div>' + msgData.msg + '</div>');
					}
					// 퇴장
					else if(msgData.cmd == 'CMD_EXIT') {					
						$('#divChatData').append('<div>' + msgData.msg + '</div>');
					}
				},
				closeMessage: function(str) {
					$('#divChatData').append('<div>' + '연결 끊김 : ' + str + '</div>');
				},
				disconnect: function() {
					this._socket.close();
				},
				_initSocket: function() {
					this._socket = new SockJS(this._url);
					this._socket.onopen = function(evt) {
						webSocket.sendEnter();
					};
					this._socket.onmessage = function(evt) {
						webSocket.receiveMessage(JSON.parse(evt.data));
					};
					this._socket.onclose = function(evt) {
						webSocket.closeMessage(JSON.parse(evt.data));
					}
				},
				_sendMessage: function(bang_id, cmd, msg) {
					var msgData = {
							bang_id : bang_id,
							cmd : cmd,
							msg : msg
					};
					var jsonData = JSON.stringify(msgData);
					this._socket.send(jsonData);
				}
			};
		</script>
			
		<script type="text/javascript">
	        $(window).on('load', function () {
				webSocket.init({ url: '<c:url value="/chat" />' });	
			});
		</script>
		
	</body>
</html>

<%@ include file="../layout/footer.jsp"%>