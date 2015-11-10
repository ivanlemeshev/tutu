$(document).ready(function () {
  $('a.edit_route').click(function (e) {
    e.preventDefault();

    var routeId = $(this).data('routeId');
    var form = $('#edit_route_' + routeId);
    var title = $('#route_title_' + routeId);
    var editTitle = $(this).data('editTitle');
    var cancelTitle = $(this).data('cancelTitle');

    if (!$(this).hasClass('cancel')) {
      $(this).html(cancelTitle);
      $(this).addClass('cancel');
    } else {
      $(this).html(editTitle);
      $(this).removeClass('cancel');
    }

    form.toggle();
    title.toggle();
  });
});
