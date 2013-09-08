require.config({
    baseUrl: 'js',
    paths: {
        lib : '../bower_components'
        jquery : '../bower_components/jquery/jquery'
        handsontable : '../bower_components/handsontable/dist/jquery.handsontable.full'
        csvparse : '../bower_components/jquery-csv/src/jquery.csv'
        FileSaver : '../bower_components/FileSaver/FileSaver'
        bootstrap: '../bower_components/bootstrap/dist/js/bootstrap.min'
    }
    shim: {
        csvparse: {
            deps: ['jquery']
        }
        handsontable: {
            deps: ['jquery']
        }
        FileSaver: {
            exports: 'saveAs'
        }
        bootstrap: {
            deps:['jquery']
        }
    }
})

require(['jquery', 'FileSaver', 'file/setupFileUpload', 'file/setupRemoteFileLoad', 'csv/table2csv', 'csv/csv2table', 'alert', 'bootstrap'],
       ($, saveAs, setupFileUpload, setupRemoteFileLoad, table2csv, csv2table, alert) ->
            $tablediv = $("#test-div")
            $tablediv.hide()
            setupFileUpload($('#localUploadModal .loadFile'), $('#files'), $tablediv)
            setupFileUpload($('#localUploadModal .appendFile'), $('#files'), $tablediv, true) #Append = true
            setupRemoteFileLoad($('#remoteUploadModal .loadFile'), $tablediv)
            setupRemoteFileLoad($('#remoteUploadModal .appendFile'), $tablediv, true) # Append = true
            
            #Add a default table
            csv2table("volume_id, class\n , ")
            
            $(".download-csv").bind("click", (e) ->
                csvdata = table2csv($tablediv)
                if csvdata
                    blob = new Blob([csvdata], {type:"text/csv;charset=utf-8"})
                    saveAs(blob, 'workset.csv')
                else
                    alert($(".alert"), "No data to export!", "danger")
            )
            
        )
