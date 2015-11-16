$(function(){
  $("#user_avatar").change(function(){
        var uploaded_avatar = $("#uploaded_avatar");
        var file = $(this).prop('files')[0];
        var fr = new FileReader();
        fr.onload = function(){
        uploaded_avatar.attr('src', fr.result );
        }
      fr.readAsDataURL(file);
    });
});
