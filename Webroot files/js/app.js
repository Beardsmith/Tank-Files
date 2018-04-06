$(function() {
    $.ajax({

        url: 'chart_data.php',
        type: 'GET',
        success: function(data) {
            chartData = data;
            var chartProperties = {
                "caption": "Main Tank Level",
                "xAxisName": "Tank",
                "yAxisName": "Level",
                "rotatevalues": "1",
                "theme": "zune"
            };

            apiChart = new FusionCharts({
                type: 'angulargauge',
                renderAt: 'chart-container',
                width: '550',
                height: '350',
                dataFormat: 'json',
                dataSource: {
                    "chart": chartProperties,
                    "data": chartData
                }
            });
            apiChart.render();
        }
    });
});