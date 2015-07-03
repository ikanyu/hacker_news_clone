$(document).ready(function() {

  $('.posts').click(function(event){
//    debugger

    var postID = $(this).data("post-id");
    	 $.ajax({
    		type: "post",
    		url: "/votes/post/" + postID,
    		})
       .done(function( msg ) {
          $('button#button' + postID).remove()
        })

  });

    $('.comments').click(function(event){
      //debugger
    var commentID = $(this).data("comment-id");
    //debugger
       $.ajax({
        type: "post",
        url: "/votes/comment/" + commentID,
        })
       .done(function( msg ) {
          $('button#buttons' + commentID).remove()
        })

  });

});
