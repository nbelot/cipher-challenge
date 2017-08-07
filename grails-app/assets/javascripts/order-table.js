$(document).ready(function() {

    $("#plain-letter-list").swappable({
        items:'.letter', // Mandatory option, class only.
        cursorAt: {top:-10},
        start : function(event, ui) {
            $(ui.item[0]).index();
        },
        stop : function(event, ui) {
            var encypted = $('#encrypted-letter-list li').map(function (index, element) {
                return $(element).html()
            }).toArray();
            var plain = $('#plain-letter-list li').map(function (index, element) {
                return $(element).html()
            }).toArray();

            $.ajax({
                method: 'POST',
                data: {
                    encrypted: encypted,
                    plain: plain
                },
                url: "/decrypter/order",
                success: function (data) {
                    $("#decryption-container").empty();
                    $("#decryption-container").append(data);
                }
            });
        }
    });
    $("#plain-letter-list").disableSelection();
});