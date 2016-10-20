# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  console.log("DOM is ready")
  $(".vote_link").on "click", (e) ->
    e.preventDefault()
    $.ajax this.href,
      type: 'POST'
      dataType: 'json'
      data: {vote: {article_id: $(this).attr("article_id")}}
      error: (jqXHR, textStatus, errorThrown) ->
        alert(jqXHR.responseJSON.error)
      success: (data, textStatus, jqXHR) ->
        if data['deleted'] == true
          $('.vote_link[article_id="' + data['article_id'] + '"]').find('span').removeClass('voted')
        else
          $('.vote_link[article_id="' + data['article_id'] + '"]').find('span').addClass('voted')
