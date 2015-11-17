"use strict";
$(function(){

  for(let i = 0; i < 4; i++){
    $("#proto_proto_images_attributes_" + i + "_image").change(function(){
      let uploaded_image = $("#uploaded-image-" + i);
      let file = $(this).prop('files')[0];
      let fr = new FileReader();
      fr.onload = function(){
        uploaded_image.attr('src', fr.result );
        uploaded_image.css({'height':'100%', 'width': '100%'});
      };
      fr.readAsDataURL(file);
    });
  };

  $(".image-upload-plus").click(function(){
    $(this).hide();
    $("#another-form").removeAttr('id');
  });

});
