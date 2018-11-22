	///////////////////////////viewChatRoom.jsp 에서 사용/////////////////////////////////////
	function viewRoomFunction(userID) {				// 참여자들의 DB에 있는 메시지를 웹브라우저로 출력하는 역할
			
		$.ajax({
			type: "POST",
			url: "./viewRoomServlet",
			data: {
				
				userID: encodeURIComponent(userID),
				
			},
			success: function(data){
				if(data == "") return;
				var parsed = JSON.parse(data);	// json 문자열인 data를 개체로 변환
				var result = parsed.result;		// data의 result 부분이 배열임
				for(var i=0; i<result.length; i++){
					
					addChatList(result[i][0].value, result[i][1].value, result[i][2].value);
				}
			}
		});
	}
		
	function addChatList(chatName, chatContent, chatTime){
		$('#chatList').append('<div class="row"  >'+
				'<div class="col-lg-12">' +
				'<div class="media" style="cursor: pointer; background-color:#FFFF00;" onclick="window.location.href=\'chat.jsp?talkers='+encodeURIComponent(chatName) +'\'">' +
				'<a class="pull-left" href="#">' +
				'<img class="media-object img-circle" style="width: 30px; height: 30px;" src="images/icon.png" alt="">'+
				'</a>' +
				'<div class="media-body">'+
				'<h4 class="media-heading">'+
				chatName+
				'<span class="small pull-right">'+
				chatTime+
				'</span>'+
				'</h4>'+
				'<p>'+
				chatContent+
				'</p>'+				
				'</div>'+
				'</div>'+
				'</div>'+
				'</div>'+
				'<hr>'
				
		);
				
		
		$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
	}
	
///////////////////////////////////////makeChatRoom1,3.jsp 에서 사용////////////////////////////////////////////////////////
	
	

	function makeRoomFunction3(talkers,userID) {				// 참여자들의 DB에 있는 메시지를 웹브라우저로 출력하는 역할
		
		$.ajax({
			type: "POST",
			url: "./makeRoomServlet",
			data: {
				
				talkers: encodeURIComponent(talkers),
				userID : encodeURIComponent(userID),
			},
			success: function(data){
				if(data == "") {
					
					alert("해당하는 방이 이미 존재하므로 이동합니다");
				}
	
					window.location.href = "chat.jsp?talkers="+talkers;
			}
		});
	}
	
		//////////////////////////////////chat.jsp 에서 사용///////////////////////////////////////////////
		
		function chatListFunction(listType) {				// 참여자들의 DB에 있는 메시지를 웹브라우저로 출력하는 역할
			
			$.ajax({
				type: "POST",
				url: "./chatListServlet",
				data: {
					
					listType: listType,
					talkers: encodeURIComponent(talkers),
					userID : encodeURIComponent(userID),
	
				},
				success: function(data){
					if(data == "") return;
					var parsed = JSON.parse(data);	// json 문자열인 data를 개체로 변환
					var result = parsed.result;		// data의 result 부분이 배열임
					for(var i=0; i<result.length; i++){
						if(result[i][0].value == userID){	
							result[i][0].value    = 'USER';
							addChat1(result[i][0].value, result[i][1].value, result[i][2].value);			
	
						}
						else
						addChat2(result[i][0].value, result[i][1].value, result[i][2].value);			
					}
					lastTime = Number(parsed.last);	// 마지막 메시지의 시간
				}
			});
		}
	
	function addChat1(chatName, chatContent, chatTime){
		$('#chatList').append('<div class="row">'+
				'<div class="col-lg-12">' +
				'<div class="media">' +
				'<a class="pull-left" href="#">' +
				'</a>' +
				'<div class="media-body" style="background-color:#FAED7D; border-bottom-left-radius:30px" align="right">'+
				'<h4 class="media-heading">'+
				chatName+
				'<span class="small pull-left">'+
				'<i align="right">'+
				chatTime+
				'</i>'+
				'</span>'+
				'</h4>'+
				'<p>'+
				chatContent+
				'</p>'+
				'</div>'+
				'</div>'+
				'</div>'+
				'</div>'+
				'<br>'+
				'<br>'
		);
		

		$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
	}
	
	function addChat2(chatName, chatContent, chatTime){
		$('#chatList').append('<div class="row">'+
				'<div class="col-lg-12">' +
				'<div class="media">' +
				'<a class="pull-left" href="#">' +
				'<img class="media-object img-circle" style="width: 30px; height: 30px;" src="images/icon.png" alt="">'+
				'</a>' +
				'<div class="media-body" style="background-color:#B7F0B1; border-bottom-right-radius:30px">'+
				'<h4 class="media-heading">'+
				chatName+
				'<span class="small pull-right">'+
				chatTime+
				'</span>'+
				'</h4>'+
				'<p>'+
				chatContent+
				'</p>'+
				'</div>'+
				'</div>'+
				'</div>'+
				'</div>'+
				'<br>'+
				'<br>'
		);

		$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
	}
	
	function getInfiniteChat() {			// 최신 메시지 불러옴
		setInterval(function(){			// 일정 시간 간격 반복 실행
			chatListFunction(lastTime);	
		}, 1000);
	}
	
	function submitFunction(){				// 자신이 보낸 메시지를 자신의 메시지 DB에 저장하는 역할
		
 		var chatContent = $('#chatContent').val();
			$.ajax({
					type: "POST",
					url: "./chatSubmitServlet",
					data: {
						userID : encodeURIComponent(userID),
						talkers: encodeURIComponent(talkers),
						chatContent: encodeURIComponent(chatContent),
					},
					success: function(result) {
						if(result == 1){
							//autoClosingAlert('#successMessage', 2000);
						}else if(result == 0){
							autoClosingAlert('#dangerMessage', 2000);
							
						}else{
							autoClosingAlert('#warningMessage', 2000);

						}
					}
			});
			$('#chatContent').val('');
		}
		
	
	var data2;
	function allFriendViewChat(){
						
		$.ajax({
			type:"POST",
			url:'./friendViewServlet',
			data:{userID:userID},
			success: function(data){
			
				if(data == "") return;
				
				if (data == data2){
					return;
				}
				data2 = data;
				var parsed = JSON.parse(data);
				var result = parsed.result;
	
				for(var i=0;i<result.length;i++){
					addFriendChat(result[i][0].value);
					
				}
			}

		});
		
	}
	
	function addFriendChat(friend){

		$('#allFriend').append('<tr class="row" height="50">' +
				'<td class="col-lg-12">' +
				'<div class="media" style="cursor: pointer;" onclick="window.location.href=\'makeChatRoom3.jsp?talkers='+encodeURIComponent(talkers+","+friend) +'\'">' +
				'<a class="pull-left" href="#">' +
				'<img class="media-object img-circle" style="width: 30px; height: 30px;" src="images/icon.png" alt="">' +
				'</a>' +
				'<div class="media-body">' +
				'<h4 class="media-heading">' +

				friend +
				'</h4>' +
				'</div>' +
				'</div>' +
				'</td>' +
				'</tr>'
				);

			$('#allFriend').scrollTop($('#allFriend')[0].scrollHeight);
		
	}

	//////////////////////////////////////index.jsp에서 사용///////////////////////////////
	var data1;
	function allFriendViewIndex(userID){
		$.ajax({
			type:"POST",
			url:'./friendViewServlet',
			data:{userID:userID},
			success: function(data){
			
				if(data == "") return;
				if(data == data1){
					return;
				}
				data1 = data;
				var parsed = JSON.parse(data);
				var result = parsed.result;
	
				for(var i=0;i<result.length;i++){
					addFriendIndex(result[i][0].value);
					
				}
			}

		});
		
	}
	
	function addFriendIndex(friend){
		$('#allFriend').append('<tr class="row" height="50">' +
				'<td class="col-lg-12">' +
				'<div class="media" style="cursor: pointer;" href="#" onClick="javascript:openWindow(\'makeChatRoom.jsp?newID='+ encodeURIComponent(friend) +'\');">' +
				'<a class="pull-left" href="#">' +
				'<img class="media-object img-circle" style="width: 30px; height: 30px;" src="images/icon.png" alt="">' +
				'</a>' +
				'<div class="media-body">' +
				'<h4 class="media-heading">' +

				friend +
				'</h4>' +
				'</div>' +
				'</div>' +
				'</td>' +
				'</tr>'
				);

			$('#allFriend').scrollTop($('#allFriend')[0].scrollHeight);
		
	}
///////////////////////////////////////////////////////////////////
	
	