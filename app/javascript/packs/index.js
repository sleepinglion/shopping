$(document).ready(function() {
    var csrf_token=$('meta[name="csrf-token"]').attr('content');

    $("a.simple_image").fancybox({
        'opacity'   : true,
        'overlayShow'        : true,
        'overlayColor': '#000000',
        'overlayOpacity'     : 0.9,
        'titleShow':true,
        'openEffect'  : 'elastic',
        'closeEffect' : 'elastic'
    });

    $("#show-product li a").click(function(){
        var img_src=$(this).find('img').attr('src');
        $("#product-image").attr('src',img_src.replace('small_thumb','medium_thumb'));

        return false;
    });

    $("#faqCategoryList a.title").click(getList);
    $("#faqList dt a.title").click(getContent);

    function getList() {
        var tt=$(this);
        var parent=$(this).parent();

        $.getJSON($(this).attr('href')+'.json',function(data){
            $("#faqList").empty();
            if(data.faqs.length) {
                $.each(data.faqs,function(index,value){
                    var a=$('<a class="title" href="/faqs/'+value.id+'">'+value.title+'</a>').click(getContent);
                    if(data.admin) {
                        var div=$('<div class="sl_faq_menu"><a>수정</a> &nbsp; | &nbsp; <a rel="nofollow" data-method="delete" data-confirm="정말로 삭제합니까?">삭제</a></div>');
                        div.find('a:first').attr('href','/faqs/'+value.id+'/edit');
                        div.find('a:eq(1)').attr('href','/faqs/'+value.id);
                        $('<dt>').appendTo("#faqList").append(a).append(div);
                    } else {
                        $('<dt>').appendTo("#faqList").append(a);
                    }
                });
            } else {
                $('<dt>글이 없습니다.</dt>').appendTo("#faqList");
            }

            $("#faqCategoryList li").removeClass('on');
            parent.addClass('on');

            var faqCategoryId=$.uri.setUri(tt.attr('href')).param("faq_category_id");

            if(data.admin) {
                $("#faqCategoryList li .sl_faq_category_menu").remove();
                var dd=$('<div class="sl_faq_category_menu"><a>수정</a><br /><a rel="nofollow" data-method="delete" data-confirm="정말로 삭제합니까?">삭제</a></div>');
                dd.find('a:first').attr('href','/faq_categories/'+faqCategoryId+'/edit');
                dd.find('a:eq(1)').attr('href','/faq_categories/'+faqCategoryId);
                parent.append(dd);
            }

            $('#sl_bottom_menu a:eq(1)').attr('href','/faqs/new?faq_category_id='+faqCategoryId);
        });
        return false;
    }

    function getContent(){
        var parent=$(this).parent();
        $.getJSON($(this).attr('href')+'.json',function(value){
            if(parent.next().get(0)) {
                if(parent.next().get(0).tagName!='DD') {
                    parent.after('<dd>');
                }
            } else {
                parent.after('<dd>');
            }
            $("#faqList dt").removeClass('on');
            $("#faqList dd").hide();
            parent.addClass('on');
            parent.next().html('<p>'+nl2br(value.content)+'</p>').slideDown();
            if (history && history.pushState) {
                history.pushState('','faq_'+value.id,'/faqs/'+value.id);
            }
        });

        return false;
    }

    function nl2br (str, is_xhtml) {
        var breakTag = (is_xhtml || typeof is_xhtml === 'undefined') ? '<br ' + '/>' : '<br>';
        return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1' + breakTag + '$2');
    }
});

