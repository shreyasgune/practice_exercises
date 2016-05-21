//Data Set Defined (static)
var data;
//Drawing a pie chart::
function drawPie()
{


var options = {
title: 'My Pie Chart'
};

var Piechart = new google.visualization.PieChart(document.getElementById('pieDiv'));
Piechart.draw(data,options);
}

//Drawing a Column chart ::

function drawCol()
{


/*var Colview = new google.visualization.DataView(data);
Colview.setColumns(
[0,1,
  {
    calc: "stringify",
    sourceColumn: 1,
    type: "string",
    role: "annotation"
  },
2]
);*/

var options = {
title : "Column Chart",
width : 600, //you can put any value
height : 400, //again , you can use any value
bar: {groupWidth : "95%"},
legend: {position:"none"}
};

var Colchart = new google.visualization.ColumnChart(document.getElementById("colDiv"));
Colchart.draw(data, options);
}

//Drawing a Bar Chart
function drawBar()
{


/*var Barview = new google.visualization.DataView(data);
Barview.setColumns([0, 1,
                 { calc: "stringify",
                   sourceColumn: 1,
                   type: "string",
                   role: "annotation" },
                 2]);*/

var options = {
  title: "Bar Chart",
  width: 600,
  height: 400,
  bar: {groupWidth: "95%"},
  legend: { position: "none" },
};
var Barchart = new google.visualization.BarChart(document.getElementById("barDiv"));
Barchart.draw(data, options);
}

$(function () {
data = google.visualization.arrayToDataTable(
[
['field1','filed2'],
['data1',1],
['data2',10],
['data3',17],
['data4',27]

]
);
drawPie();
drawBar();
drawCol();
});
