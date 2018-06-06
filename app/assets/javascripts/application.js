//= require rails-ujs
//= require bootstrap-datepicker
//= require_tree .
$('.datepicker').datepicker({
  format: 'yyyy-mm-dd',
  autoclose: true,
  todayHighlight: true,
  date: new Date(),
});
