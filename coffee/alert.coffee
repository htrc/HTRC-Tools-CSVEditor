# alert
#
# Make a Bootstrap alert message
#

define(['jquery'], ($) ->
    ($el, msg, type='info', dismissible=true) ->
        # Possible types are 'success', 'info', 'warning', 'danger'
        
        $el.addClass("alert-#{type}")
           .html(msg)
        if dismissible
            $button = $("<button type='button' class='close'>&times;</button>")
                        .click(()-> $el.hide())
            $el.addClass("alert-dismissable")
                .prepend($button)
        $el.show()
        $el
)