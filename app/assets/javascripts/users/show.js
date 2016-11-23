//= require application

$(document).ready(function(){
	$('#user_referral_recommend_user_id').attr('id','read_only_user_id').attr('readonly','readonly').focus(function(){
    $('#user_id_select').click();
	});
});