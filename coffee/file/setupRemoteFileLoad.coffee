# setupRemoteFileLoad
# Takes a jQuery object of a file select input and binds it to the Javascript
# file loading functionality

define(['csv/table2csv', 'file/loadRemoteFile', 'csv/csv2table'],
(table2csv, loadRemoteFile, csv2table) ->
    ($el, $tablediv, append=false) ->
        if append
             callback = (data) ->
                    console.log data
                    oldData = table2csv($tablediv)
                    if oldData
                        # Join old data with new data, ignoring first column
                        data = data.split(/\r\n|\n|\r/gm)[1..]
                        data = data.join('\n')
                        console.log oldData
                        data = "#{oldData}\n#{data}"
                        console.log data
                    csv2table(data)
        else
            callback = (data) ->
                csv2table(data)
        
        $el.bind('click', (e) -> loadRemoteFile(e, callback))
        )