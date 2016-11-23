//= require application

$(document).ready(function(){
	
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
});