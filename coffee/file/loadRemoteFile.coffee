# LoadRemoteFile
# Load a csv from the given URI

define([], () ->
    (evt, callback) ->
        url = 'data/test2.csv' #Hardcoded for debugging

        $.ajax(url)
            .done(callback)
            .fail(() -> (console.log "Ahh"))
)