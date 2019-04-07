$(function () {
  $('.date').datetimepicker({
    format : 'YYYY-MM-DD HH:mm'
  });
  
  
  $(".dateonly").datetimepicker({
    format : 'YYYY-MM-DD'
  });
});