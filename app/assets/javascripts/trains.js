$(document).ready(function () {
  $('a.edit_train').click(function (e) {
    e.preventDefault();

    var trainId = $(this).data('trainId');
    var form = $('#edit_train_' + trainId);
    var title = $('#train_title_' + trainId);
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
