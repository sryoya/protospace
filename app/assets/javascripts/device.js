$(function(){
  $("#user_avatar").change(function(){
    let uploaded_avatar = $("#uploaded_avatar");
    let file = $(this).prop('files')[0];
    let fr = new FileReader();
    fr.onload = function(){
      uploaded_avatar.removeAttr('src')
      uploaded_avatar.attr('src', fr.result );
    };
    fr.readAsDataURL(file);
  });
});
