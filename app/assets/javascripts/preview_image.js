function previewImage(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      $('input').closest('.js-preview-image').find('.js-image').attr('src', e.target.result);
    }

    reader.readAsDataURL(input.files[0]);
  }
}
