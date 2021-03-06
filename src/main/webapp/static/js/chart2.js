// 曲线图
var options_scdt = {
    chart: {
        renderTo: ''
    },
	title: {
		text: ''
	},
	xAxis: {
		categories: [],
        labels:{ 
            step:0 
        } 
	},
	yAxis: {
		min: 0,
		title: {
            text: '' 
		}
	},
	legend: {
		enabled:false
			                	       
	},
	tooltip: {
		shared: true,
		formatter: function() {
            return this.x +'<br/>'+
            this.points[0].series.name + ': ' + this.y + '&nbsp;' + this.points[0].series.options.unit;
        }					
	},
	plotOptions: {
		column: {
            pointPadding: 0.2,
			borderWidth: 0
		}
	},
	series: []
}
           
/**
 * 创建曲线
 * @param {type} a
 * @param {type} b
 * @param {type} c
 * @param {type} d
 * @param {type} e
 * @returns {undefined}
 */           
function createScdtQx(a,b,c,d,e){
    
    var xAxisData = [];
    var yAxisData = [];
                            
    var series = new Object();
    series.data = [];
    
    a.keys.sort();
    $.each(a.keys,function(key, value){
        xAxisData.push(value);
        yAxisData.push(accDiv(Math.round(accMul(a.get(value), 100)), 100));
    });

    series.data = yAxisData;
    series.name = b;
    series.unit = c;

    options_scdt.series = [];
    options_scdt.chart.renderTo = d;
    options_scdt.xAxis.categories=xAxisData;
    
    if(xAxisData.length > 10){
        options_scdt.xAxis.labels.step = 5;
    }else{        
        options_scdt.xAxis.labels.step = 0;
    }
    options_scdt.yAxis.title.text = e;
    options_scdt.series.push(series);
    
    new Highcharts.Chart(options_scdt);
}	

/**
 * 创建曲线
 * @param {type} a
 * @param {type} b
 * @param {type} c
 * @param {type} d
 * @param {type} e
 * @returns {undefined}
 */           
function createScdtQx_pj(a,b,c,d,e,f){
    
    var xAxisData = [];
    var yAxisData = [];
                            
    var series = new Object();
    series.data = [];
    
    a.keys.sort();
    $.each(a.keys,function(key, value){
        xAxisData.push(value);
        yAxisData.push(accDiv(Math.round(accMul(accDiv(a.get(value), f), 100)), 100));
    });

    series.data = yAxisData;
    series.name = b;
    series.unit = c;

    options_scdt.series = [];
    options_scdt.chart.renderTo = d;
    options_scdt.xAxis.categories=xAxisData;
    if(xAxisData.length > 10){
        options_scdt.xAxis.labels.step = 5;
    }else{        
        options_scdt.xAxis.labels.step = 0;
    }
    options_scdt.yAxis.title.text = e;
    options_scdt.series.push(series);
    
    new Highcharts.Chart(options_scdt);
}	