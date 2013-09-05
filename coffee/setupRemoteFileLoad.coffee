# setupRemoteFileLoad
# Takes a jQuery object of a file select input and binds it to the Javascript
# file loading functionality

define(['file/loadRemoteFile'], (loadRemoteFile) ->
    ($el) ->
        #checkSameDomain!!!
            $el.text("test")
            $el.bind('change', loadRemoteFile)
        # else
        #    # alert "Sorry, your browser is not supported"
        #    $msg.text 'Failure'
)