// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).on('page:load ready', function() {

    (function getAJAX(){
      $.ajax({
        dataType: 'text',
        url: '/show.json',
        success: function(data){
          $(".bathroom-tile").text("")
        $(".bathroom-tile").append(data)
          console.log("SUCCESS")
          console.log(data)
        },
        error: function(data){
          console.log("ERROR")
          console.log(data)
        },
        complete: function(){
          // remove the result of the test div
          setTimeout(getAJAX, 1222000)
        } 
      })
    })();

      // $.getJSON("/show", function(response){
      //   alert("This loading?")
      //   console.log("DONE!")
      // })


  $('.new_shoutout').on("submit", function(e) {
    e.preventDefault();
    var content = $('#shoutout_content').val();
    var formURL = $(this).attr('action');
    var userName = $('span.username').text();

    function shoutoutAjax() {

      $.ajax({
        dataType: "json",
        url: formURL,
        type: 'POST',
        data: {shoutout: {"content": content}},
        success: function(data) {

          $('#shoutout_container').prepend(
            "<li><strong>" + userName + ": </strong>" + content + " <span class='label label-success'>Saved</span></li>"
            );
            $("#shoutout_content").val("");
        },
        error: function(error) {
          console.log("ERROR", error);
          console.log('CONTENT', content);
        }
      });
    }
    shoutoutAjax();

  });
})