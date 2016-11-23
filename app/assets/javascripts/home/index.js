//= require application

$(document).ready(function(){
	$(".btn-minimize").toggle(function(){
			$(this).parent().find('i:first').removeAttr('class').addClass('icon-chevron-down');
			$(this).parent().parent().parent().find('.box-content').slideUp();
			return false;
	},function(){
			$(this).parent().find('i:first').removeAttr('class').addClass('icon-chevron-up');
			$(this).parent().parent().parent().find('.box-content').slideDown();
			return false;
	});
	
	$(".btn-close").click(function(){
		$(this).parent().parent().parent().fadeOut();
		return false;
	});
	
	var showTooltip = function(x, y, contents) {
		$('<div id="tooltip">' + Number(contents) + '</div>').css( {
		position: 'absolute',
		display: 'block',
		top: y - 15,
		left: x + 5,
		border: '1px solid #fdd',
		padding: '2px',
		'background-color': '#dfeffc',
		opacity: 0.80,
		zIndex: 1000
	}).appendTo("body").fadeIn(200);
	};
	
	var plot1 = $.plot($("#chart1"),
		   [ { data: point_deposit_data, label: "deposit"}, { data: point_use_data, label: "use" } ], {
			   series: {
				   lines: { show: true,
							lineWidth: 3,
							fill: true,
							fillColor: { colors: [ { opacity: 0.08 }, { opacity: 0.01 } ] }
						 },
				   points: { show: true },
				   shadowSize: 2
			   },
			   grid: { hoverable: true, 
					   clickable: true, 
					   tickColor: "#eee",
					   borderWidth: 0,
					 },
			   colors: ["#FA5833", "#2FABE9"],
				xaxis: {
					show : true,
					mode : 'time',
				  timeformat: "%m/%d",
				 minTickSize: [1, "day"],
    color: "black",
    position: "bottom",       
    axisLabel: "day",
    axisLabelUseCanvas: true,
    axisLabelPadding: 5,
    ticks:30
				},
			
				yaxis: {ticks:5, tickDecimals: 0},
			 });	
	
	var plot2 = $.plot($("#chart2"),
		   [ { data: user_data, label: "New Member"}, { data: daily_active_user_data, label: "Active Member" } ], {
			   series: {
				   lines: { show: true,
							lineWidth: 3,
							fill: true,
							fillColor: { colors: [ { opacity: 0.08 }, { opacity: 0.01 } ] }
						 },
				   points: { show: true },
				   shadowSize: 2
			   },
			   grid: { hoverable: true, 
					   clickable: true, 
					   tickColor: "#eee",
					   borderWidth: 0,
					 },
			   colors: ["#FA5833"],
				xaxis: {
					show : true,
					mode : 'time',
				  timeformat: "%m/%d",
				 minTickSize: [1, "day"],
    color: "black",
    position: "bottom",       
    axisLabel: "day",
    axisLabelUseCanvas: true,
    axisLabelPadding: 5,
    ticks:30
				},
				yaxis: {ticks:5, tickDecimals: 0},
			 });
			 
	var plot3 = $.plot($("#chart3"),
		   [ { data: d1, label: "calls"}, { data: d2, label: "recieves" } ], {
			   series: {
				   lines: { show: true,
							lineWidth: 3,
							fill: true,
							fillColor: { colors: [ { opacity: 0.08 }, { opacity: 0.01 } ] }
						 },
				   points: { show: true },
				   shadowSize: 2
			   },
			   grid: { hoverable: true, 
					   clickable: true, 
					   tickColor: "#eee",
					   borderWidth: 0,
					 },
			   colors: ["#FA5833", "#2FABE9"],
				xaxis: {
					show : true,
					mode : 'time',
				  timeformat: "%m/%d",
				 minTickSize: [1, "day"],
    color: "black",
    position: "bottom",       
    axisLabel: "day",
    axisLabelUseCanvas: true,
    axisLabelPadding: 5,
    ticks:30
				},
				yaxis: {ticks:5, tickDecimals: 0},
			 });
			 
	var plot4 = $.plot($("#chart4"),
		   [ { data: limit_user_data, label: "Member"} ], {
			   series: {
				   lines: { show: true,
							lineWidth: 3,
							fill: true,
							fillColor: { colors: [ { opacity: 0.08 }, { opacity: 0.01 } ] }
						 },
				   points: { show: true },
				   shadowSize: 2
			   },
			   grid: { hoverable: true, 
					   clickable: true, 
					   tickColor: "#eee",
					   borderWidth: 0,
					 },
			   colors: ["#FA5833"],
				xaxis: {
					show : true,
					mode : 'time',
				  timeformat: "%m/%d",
				 minTickSize: [1, "day"],
    color: "black",
    position: "bottom",
    axisLabel: "day",
    axisLabelUseCanvas: true,
    axisLabelPadding: 5,
    ticks:30
				},
				yaxis: {ticks:5, tickDecimals: 0},
			 });			 
			 
			 
	var previousPoint = null;	
	var indexCharthover = function (event, pos, item) {
		$("#x").text(pos.x.toFixed(2));
		$("#y").text(pos.y.toFixed(2));

		if (item) {
			if (previousPoint != item.dataIndex) {
				previousPoint = item.dataIndex;

				$("#tooltip").remove();
				var x = item.datapoint[0].toFixed(2),
					y = item.datapoint[1].toFixed(2);

				showTooltip(item.pageX, item.pageY, y);
			}
		}
		else {
			$("#tooltip").remove();
			previousPoint = null;
		}
	};
			 
	$("#chart1").bind("plothover", indexCharthover);
	$("#chart2").bind("plothover", indexCharthover);
	$("#chart3").bind("plothover", indexCharthover);
	$("#chart4").bind("plothover", indexCharthover);				 
});