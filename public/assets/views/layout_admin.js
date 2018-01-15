$(document).ready(function () {
    var url = document.location.toString();
    if (url.match('#')) {
        $('.nav-tabs .nav-item a[href="#' + url.split('#')[1] + '"]').click();
//      $('.nav-tabs a[href=#' + url.split('#')[1] + ']').tab('show');
    }
    $('a[data-toggle="tab"]').click(function () {
        var url = document.location.toString();
        history.replaceState(null, '', url.split('#')[0] + $(this).attr("href"));
    });
});
