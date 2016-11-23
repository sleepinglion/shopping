// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.

//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets

$(document).ready(function(){
	$('#myModal').on('show.bs.modal', function (e) {
  		if (!data) return e.preventDefault(); // stops modal from being shown  
	
		if($(this).attr('title')) {
			$('#myModal .modal-header h3').text($(this).attr('title'));
		} else {
			$('#myModal .modal-header h3').text('사용자정보');
		}  
	});
	
	$('.btn-maximize').click(function(){
		$(this).parent().parent().parent().find('.box-content').slideDown();
		$(this).find('i').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');		
		return false;
	});
	
	$(".btn-close").click(function(){
		$(this).parent().parent().parent().remove();
		return false;
	});	
	
	$('.dropmenu').click(function(e){
		if(!$(this).parent().find('ul:first').hasClass('d_show')) {
			$(this).parent().parent().find('.d_show').removeClass('d_show').slideToggle();
			$(this).parent().find('ul').addClass('d_show').slideToggle(function(){
				$("#content").css("min-height",$('aside').height()+40);
			});

		}		
	});
	
	/* ---------- Uniform ---------- */
	//$("input:checkbox, input:radio, input:file").not('[data-no-uniform="true"],#uniform-is-ajax').uniform();
});

    
 function setDateInput(obj) {
  if (obj != undefined) {
   var datediff = -(parseInt(obj));
   var newDate = new Date();
   var now = new Date();
   newDate.setDate(now.getDate()+datediff);
   var newYear = newDate.getFullYear();
   var newMonth = newDate.getMonth()+1;
   if (newMonth.toString().length == 1) newMonth = "0" + newMonth;
   
   endMonth=now.getMonth() +1;
   if (endMonth.toString().length == 1) endMonth = "0" + endMonth;
   
   var newDay = newDate.getDate();
   if (newDay.toString().length == 1) newDay = "0" + newDay;
   var txtSDate = newMonth + "/" + newDay +'/'+newYear;
   endDay=now.getDate();
   if (endDay.length == 1) endDay = "0" + endDay;
   var txtEDate = endMonth + "/" + endDay + '/' + now.getFullYear();
   $('input[name="start_date"]').val(txtSDate);
   $('input[name="end_date"]').val(txtEDate);
  } else {alert("잠시 후 이용해 주시기 바랍니다."); return false;}
 }
