// Generated by CoffeeScript 1.6.3
(function() {
  define(['file/checkForFileAPI', 'file/loadLocalFile', 'alert', 'csv/csv2table', 'csv/table2csv'], function(checkAPI, loadLocalFile, alert, csv2table, table2csv) {
    return function($el, $fileSelector, $tablediv, append) {
      var callback;
      if (append == null) {
        append = false;
      }
      if (checkAPI()) {
        if (append) {
          callback = function(data) {
            var oldData;
            console.log("Appending data:\n " + data);
            oldData = table2csv($tablediv);
            if (oldData) {
              data = data.split(/\r\n|\n|\r/gm).slice(1);
              data = data.join('\n');
              data = "" + oldData + "\n" + data;
              console.log(data);
            }
            return csv2table(data);
          };
        } else {
          callback = function(data) {
            console.log("Loading new data:\n " + data);
            return csv2table(data);
          };
        }
        return $el.bind('click', function(e) {
          return loadLocalFile($fileSelector, callback);
        });
      } else {
        return alert("Sorry, your browser is not supported");
      }
    };
  });

}).call(this);