$(function(){

  function body_and_image(message){
    var html = `
                <p class="chat-main__message-name"> ${message.user_name} </p>
                <p class="chat-main__message-time"> ${message.created_at} </p>
                <p class="chat-main__message-body"> ${message.body} </p>
                <img class="hat-main__message-image" src="${message.image.url}"</p>
                `;
    return html;
  }
  function body_only(message){
    var html = `
                <p class="chat-main__message-name"> ${message.user_name} </p>
                <p class="chat-main__message-time"> ${message.created_at.strftime("%Y/%m/%d %H:%M:%S")} </p>
                <p class="chat-main__message-body"> ${message.body} </p>
                `;
    return html;
  }

  $('.chat-main__form').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var href = window.lacation.href;

    $.ajax({
      url: href,
      type: "POST",
      data: formData;
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      if(data.image.url === null){
        var html = text(data);
        $('.chat-main__body--messages-list').prepend(html);
        $('.chat-main__form').val('');
      }else{
        var html = text_and_image(data);
        $('.chat-main__body--messages-list').prepend(html);
        $('.chat-main__form').val('');
      }
    })
    .fail(function(){
      alert('error');
    })
  })
});
