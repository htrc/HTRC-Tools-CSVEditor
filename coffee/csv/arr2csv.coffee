# arr2csv
#
# Convert an array of arrays to a CSV string, adhering
# to RFC4180 (http://tools.ietf.org/html/rfc4180)
#

define([], () ->
    escapeRow = (arr) ->
        # Escape double-quotes in content
        # ...
        # Wrap all values in double-quotes
        # arr = ("\"#{row}\"" for row in arr) 
        arr.join(', ') 

    (arrs) ->
        arrs = (escapeRow(arr) for arr in arrs)
        arrs.join('\n')
)