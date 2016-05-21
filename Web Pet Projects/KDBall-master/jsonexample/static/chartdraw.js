function drawStatesMap() {
        //var options = {region: 'US', resolution: 'provinces'};
        var dimension = "test_value";
        $.ajax({
          url: "static\chartson.json",
          dataType: "JSON"
        }).done(function(data) {
                var Term_Array = [["DataField",dimension]];
                $.each(data.chart_table, function() {
                    var chartitem = [this.name, this[dimension]];
                    Term_Array.push(chartitem);
                });
          var ArrayData = google.visualization.arrayToDataTable(Term_Array);
          var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
		  var chart2 = new google.visualization.BarChart(document.getElementById('chart_div2'));
		  var chart3 = new google.visualization.ColumnChart(document.getElementById("chart_div3"));
          chart.draw(ArrayData);
		  chart2.draw(ArrayData);
		  chart3.draw(ArrayData);
          $("h3").append(" Just a Test "+dimension);
        });
}
google.load("visualization", "1", {packages:["corechart"]});