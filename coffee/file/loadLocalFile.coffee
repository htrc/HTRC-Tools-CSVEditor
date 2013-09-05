# LoadLocalFile
# Load a local file into a table

define([], () ->
    (target, callback) ->
        files = if target.files? then target.files else target[0].files # FileList object
        file = files[0]

        # read the file metadata
        # output = ''
        # output += '<span style="font-weight:bold;">' + escape(file.name) + '</span><br />\n'
        # output += ' - FileType: ' + (file.type || 'n/a') + '<br />\n'
        # output += ' - FileSize: ' + file.size + ' bytes<br />\n'
        # output += ' - LastModified: ' + (if file.lastModifiedDate then file.lastModifiedDate.toLocaleDateString() else 'n/a') + '<br />\n'

        # read the file contents
        reader = new FileReader()
        reader.readAsText(file)
        reader.onload = (event) ->
          csv = event.target.result
          callback csv
        reader.onerror = () -> alert('Unable to read ' + file.fileName)
    
)