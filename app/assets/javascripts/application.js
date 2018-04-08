// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .



window.addEventListener('load', function(){

	// get the current user's email
	var user_email = $('#current_user_email').html();

	if (user_email){
		// establish a connection
		var socket = io.connect('http://10.0.0.101:8000');
		
		// detect connection confirmation
		socket.on('connect', function(){
			console.log('handshake completed, connected to node server!');

			// user requests to join chat room/chat to a specific user
			socket.emit('join_room', 
				{
					user_email: user_email, 
					chatroom: "iosroom"
				});

			// detect when another user joins
			socket.on('user_joined', function(data){
				console.log(data.user_email + ' joined ' + data.chatroom);
			});


			$('#send-message').click(function(){

				let msg = $('#chat-message-input').val();

				if (msg != ''){
					socket.emit('send_message', {
						message: msg,
						user_email: user_email,
						chatroom: 'iosroom'
					});
				}

			});

			socket.on('receive_message', function(data){
				console.log(data.user_email, data.message);
				var newMessage = $('<li>');

				var messageType = 'other-message';
				if (data.user_email == user_email){
					messageType = 'self-message';
				}
				newMessage.addClass(messageType)


				newMessage.append($('<span>', {
					'html': data.message
				}));
				newMessage.append($('<sub>', {
					'html': data.user_email
				}));



				$('#chat-messages-list').append(newMessage);

			});



		});

	}

});





















