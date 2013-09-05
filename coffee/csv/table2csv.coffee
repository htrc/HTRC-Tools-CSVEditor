# table2csv
#
# A higher-level serialization of a table to csv, including
# grabbing the data and headers, stripping hull lines, then
# encoding properly
#

define(['jquery', 'alert', 'csv/arr2csv'], ($, alert, arr2csv) ->
    ($el) ->
        table = $el.data('handsontable')
        console.log table
        if table?
            header = table.getSettings().colHeaders
            data = table.getData()
            # Prepend header
            data.unshift header
            # Only include rows that have a value in the first column
            data = (arr for arr in data when arr[0]?)
            csvdata = arr2csv(data)
            csvdata
        else
            false
)