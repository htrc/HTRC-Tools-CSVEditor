# csv2table
# Convert csv file to an interactive table

define(['jquery', 'handsontable', 'csvparse'], ($) ->
    # Define module as a function
    a = (csvdata) ->
        data = $.csv.toArrays(csvdata)
        
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
        
        $('#test-div').addClass('table table-hover')

    a
)