/*
 * This is a manifest file that'll be compiled into application.css, which will include all the files
 * listed below.
 *
 * Any CSS and SCSS file within this directory, lib/assets/stylesheets, or any plugin's
 * vendor/assets/stylesheets directory can be referenced here using a relative path.
 *
 * You're free to add application-wide styles to this file and they'll appear at the bottom of the
 * compiled file so the styles you add here take precedence over styles defined in any other CSS/SCSS
 * files in this directory. Styles in this file should be added after the last require_* statement.
 * It is generally better to create a new file per style scope.
 *
//= require jquery3
//= require jquery-ui
//= require popper
//= require bootstrap
//= require jquery_ujs
//= require i18n.js
 */

I18n.translations || (I18n.translations = {});
I18n.translations["ko"] = I18n.extend((I18n.translations["ko"] || {}), {"display":"보임","hidden":"숨김"});
I18n.translations["en"] = I18n.extend((I18n.translations["en"] || {}), {"display":"보임","hidden":"숨김"});
I18n.translations["zh-CN"] = I18n.extend((I18n.translations["zh-CN"] || {}), {"display":"보임","hidden":"숨김"});

$(document).ready(function() {
    $(document).on('change', '.custom-control-input', function (e) {
        let c_checked = e.target.checked;

        if(window.location.port!=80) {
            var port=':' + window.location.port;
        } else {
            var port='';
        }

        if(c_checked) {
            $(this).parent().find('.custom-control-label').text(I18n.t('display')).closest('tr').effect('highlight');
        } else {
            $(this).parent().find('.custom-control-label').text(I18n.t('hidden')).closest('tr').effect('highlight');
        }

        var param={_method: 'put', authenticity_token:$('meta[name="csrf-token"]').attr('content')}
        var path=window.location.pathname.split('/')[2];
        var url=window.location.protocol+'//'+window.location.hostname+port+'/admin/'+path+'/'+$(this).val()+'.json';
        var aa={products:'product',product_categories:'product_category',users:'user',notices:'notice',boards:'board',faqs:'faq',faq_categories:'faq_category',contact:'contact',sliders:'slider'}

        param[aa[path]]={enable:c_checked};
        $.post(url,param,function(data){

        },'json');
    });
});