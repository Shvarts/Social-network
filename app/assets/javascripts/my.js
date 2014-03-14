/**
 * Created by vitalik on 14.03.14.
 */
$( document ).ready(function() {
    $('.friends').on('click',function(){
        $('.friends_list').slideDown();
        $('.requested_list').slideUp();
        $('.pending_list').slideUp();
    });
    $('.requested').on('click',function(){
        $('.requested_list').slideDown();
        $('.friends_list').slideUp();
        $('.pending_list').slideUp();
    });
    $('.pending').on('click',function(){
        $('.pending_list').slideDown();
        $('.friends_list').slideUp();
        $('.requested_list').slideUp();
    });
});