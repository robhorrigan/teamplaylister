$(document).ready(function(){
  $('#tableSelect ul').on('click', function() {
    $(this).find('div.radio_btn').children('input.song_to_add').prop('checked', true);
  });
});