# csv2table
# Convert csv file to an interactive table

define(['jquery', 'handsontable', 'csvparse', 'bootstrap'], ($) ->
    # Define module as a function
    a = (csvdata) ->
        data = $.csv.toArrays(csvdata)
        
        $('#test-div').show()
        
        $('#test-div').handsontable({
          data: data[1..]
          colHeaders: data[0]
          colWidths: [55, 80, 80, 80, 80, 80, 80],
          rowHeaders: true
          minSpareRows: 1
          stretchH: 'all'
          columnSorting: true
          contextMenu: true
        })
        tab =  $('#test-div').handsontable('getInstance')
        tab.addHook('afterCreateCol', (colIndex) ->
                headers = tab.getColHeader()
                $("#colNameInput").val('class')
                $("#colNameModal").modal('show')
                $('.nameCol').bind("click", (e) ->
                    name = $("#colNameInput").val()
                    headers[colIndex] = name
                    $('#test-div').handsontable({ colHeaders:headers })
                )
            )
        
        $('#test-div').addClass('table table-hover')

    a
)