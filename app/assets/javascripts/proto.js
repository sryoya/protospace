$(function(){

for(var i = 0; i < 4; i++){
  $("#proto_proto_images_attributes_" + i + "_image").change(function(){
      var num = $(this).attr("id").split("_")[4];
      var uploaded_image = $("#uploaded-image-" + num);
      var file = $(this).prop('files')[0];
      var fr = new FileReader();
      fr.onload = function(){
      uploaded_image.attr('src', fr.result );
      uploaded_image.css({'height':'100%', 'width': '100%'});
      }
    fr.readAsDataURL(file);
  });
  };

});
