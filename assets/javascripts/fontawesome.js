$(document).ready(function() {
  $('.contextual a.icon').addClass('icon-only');
  $('.contextual a.icon.icon-only').each(function() {
    //console.log($(this).text())
    $(this).attr('title', $(this).text()).text('');
  });
});
