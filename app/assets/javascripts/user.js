$(function() {

  var user_search_list = $("#user-search-result");
  var user_add_result = $("#user-add-result");


function incremental_search(user){
      var html = `<div class="chat-group-user clearfix">
                    <div class="chat-group-form__field--left">
                      <div class="chat-group-form__label"></div>
                    </div>
                    <div class="chat-group-form__field--right">
                      <p class="chat-group-user__name">${ user.name }</p>
                      <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${ user.id }" data-user-name="${ user.name }">追加</a>
                    </div>
                  </div> `;

    user_search_list.append(html);
  }

function no_incremental_search(user){
    var html = `<div class="chat-group-user clearfix">
                  <div class="chat-group-form__field--left">
                  </div>
                  <div class="chat-group-form__field--right">
                    "${user}"
                  </div>
                </div> `;
    user_search_list.append(html);
  }

  function add_groups(id, name){
    var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
                  <div class="chat-group-form__field--right">
                    <input name='group[user_ids][]' type='hidden' value='${ id }'>
                    <p class='chat-group-user__name'>${ name }</p>
                    <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
                  </div>
                </div>`
    user_add_result.append(html);
  }

  $(".chat-group-form__search.clearfix").on("keyup", function() {
    var input = $(".chat-group-form__input.js").val();

    $.ajax({
      type: 'GET',
      url: ' /users',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(users) {
      user_search_list.empty();
      console.log(users);
      if (users !== 0) {
        users.forEach(function(user){
        incremental_search(user);
        });
      }
      else {
        no_incremental_search("一致するUserはいません");
      }
    })
    .fail(function() {
      alert('error');
    })
  })
   $(document).on('click','.chat-group-user__btn--add', function(){
      var id = $("a").attr("data-user-id");
      var name = $("a").attr("data-user-name");
      $(this).parent().empty();
      add_groups(id,name);
  })
   $(document).on('click','.chat-group-user__btn--remove', function(){
      $(this).parent().empty();
   })
});

