// ToDo List
$(function() {
  // Global variables
  $input = $('input');
  $ul = $('ul');

  $input.select();

  $input.on('keyup', function(e) {
    if (e.keyCode === 13) {
      e.cancelBubble = true;
      if (e.stopPropagation) e.stopPropagation();
      if ($input.val() !== '') {
        $ul.prepend('<li>' + $input.val() + '</li>');
      }
      $input.val('').select();
    }
  });

  $ul.on('click', 'li', function() {
    $(this).remove();
    $input.select();
  });
});
