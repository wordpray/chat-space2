$(function(){

  function body_and_image(message){
    var html = `<li class= "chat-main__message clearfix">
                  <p class="chat-main__message-name"> ${message.user_name} </p>
                  <p class="chat-main__message-time"> ${message.created_at} </p>
                  <p class="chat-main__message-body"> ${message.body} </p>
                  <img class="hat-main__message-image" src="${message.image.url}"</p>
                </li>
                `;
    return html;
  }
  function body_only(message){
    var html = `<li class= "chat-main__message clearfix">
                  <p class="chat-main__message-name"> ${message.name} </p>
                  <p class="chat-main__message-time"> ${message.time} </p>
                  <p class="chat-main__message-body"> ${message.body} </p>
                </li>
                `;
    return html;
  }

  function autoScroll() {
      $('.chat-main__body').scrollTop( $('.chat-main__body--messages-list').height());
    }

  $('.chat-main__form').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var href = window.location.href;

    $.ajax({
      url: href,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      console.log();
      if(data.image.url === null){
        var html = body_only(data);
        $('.chat-main__body--messages-list').append(html);
        $('.chat-main__form').val('');
        autoScroll();
      }else{
        var html = body_and_image(data);
        $('.chat-main__body--messages-list').append(html);
        $('.chat-main__form').val('');
        autoScroll();
      }
    })
    .fail(function(){
      alert('error');
    })
  })

  setInterval(reload, 1000)
  function reload(){
    var current_url = document.location.pathname;
    $.ajax({
      type: 'GET',
      url: current_url,
      dataType: 'json'
    })
    .done(function(messages){
      var message_size = $('ul.chat-main__body--messages-list li').length;
      console.log(message_size);

      if (message_size !== messages.length){
        messages.forEach(function(message){
        html = body_only(message);
        // console.log(html);
      });
      $('.chat-main__body--messages-list').append(html)
      autoScroll();
      }
    })
  }
});
