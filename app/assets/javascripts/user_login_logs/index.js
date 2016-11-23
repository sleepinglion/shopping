//= require application
//= require jquery-ui
//= require jquery-ui/datepicker

$(document).ready(function(){
	$('.datepicker').datepicker();
	
	$(".btn-minimize").click(function(){
		var i=$(this).parent().find('i:first');
		if(i.hasClass('icon-chevron-down')) {
			i.removeAttr('class').addClass('icon-chevron-up');
			$(this).parent().parent().parent().find('.box-content').slideDown();
		} else {
			i.removeAttr('class').addClass('icon-chevron-down');
			$(this).parent().parent().parent().find('.box-content').slideUp();
		}
		return false;
	});
	
	$(".btn-close").click(function(){
		$(this).parent().parent().parent().remove();
		return false;
	});	
	
	$('.sl_toolbar .select_all').click(function(){
		$('.table tbody td input:checkbox').attr('checked','checked').parent().addClass('checked');
		return false;
	});
	
	$('.sl_toolbar .deselect_all').click(function(){
		$('.table tbody td input:checkbox').removeAttr('checked').parent().removeClass('checked');
		return false;
	});
	
	$('.sl_toolbar a:first').click(function(){
		var qstring='';
		$('.table tbody td input:checked').each(function(index,value) {
			qstring+='idx[]='+$(this).val();
			qstring+='&';
		});
		
		location.href='excel.php?'+qstring;
		return false;
	});
	
	$('input[name="date_p"]').change(function(){
		if($(this).val()=='false') {
   			$('input[name="start_date"]').val('');
   			$('input[name="end_date"]').val('');
		} else {
			setDateInput($(this).val());
		}
	});
});