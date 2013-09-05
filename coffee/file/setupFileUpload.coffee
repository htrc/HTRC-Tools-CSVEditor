# setupFileUpload
# Takes a jQuery object of a file select input and binds it to the Javascript
# file loading functionality

define(['file/checkForFileAPI', 'file/loadLocalFile', 'alert', 'csv/csv2table', 'csv/table2csv'],
   (checkAPI, loadLocalFile, alert, csv2table, table2csv) ->
    ($el, $fileSelector, $tablediv, append=false) ->
        if checkAPI()
            if append
                callback = (data) ->
                    console.log "Appending data:\n #{data}"
                    oldData = table2csv($tablediv)
                    if oldData
                        # Join old data with new data, ignoring first column
                        data = data.split(/\r\n|\n|\r/gm)[1..]
                        data = data.join('\n')
                        data = "#{oldData}\n#{data}"
                        console.log data
                    csv2table(data)
            else
                callback = (data) ->
                    console.log "Loading new data:\n #{data}"
                    csv2table(data)
            
            $el.bind('click', (e) -> loadLocalFile($fileSelector, callback))
        else
            alert "Sorry, your browser is not supported"
)