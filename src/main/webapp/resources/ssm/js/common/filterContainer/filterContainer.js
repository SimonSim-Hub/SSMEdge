$.fn.drawHeader = function(deviceMasterList, deviceButtonDiv, sensorCardDiv) {
	deviceButtonDiv.html("");

	deviceButtonDiv.append('<a class="btn btn-info active" href="javascript:deviceBtnClick(0)" data-filter="all"> 전체 보기 </a>');

	for(let i = 0; i < deviceMasterList.length; i++) {
		const deviceCode = deviceMasterList[i].deviceCode;
		const deviceName = deviceMasterList[i].deviceName;

		deviceButtonDiv.append('<a class="btn btn-info" href="javascript:deviceBtnClick('+'\''+deviceCode+'\''+')" data-filter="'+deviceCode+'"> '+deviceName+' </a>');
	}
}

$.fn.drawSensorCard = function(sensorMasterList, sensorCardDiv) {
	sensorCardDiv.html("");

	for(let i = 0; i < sensorMasterList.length; i++) {
		const sensorNo = sensorMasterList[i].sensorNo;
		const sensorCode = sensorMasterList[i].sensorCode;
		const sensorName = sensorMasterList[i].sensorName;
		const deviceCode = sensorMasterList[i].deviceCode;

		const divString = '' +
			'<div class="filter-container">'+
			'	<div class="filtr-item col-lg-3 col-md-6 col-sm-6 col-xs-12" data-category="'+deviceCode+'" data-sort="'+sensorNo+'">'+
			'		<div id="'+sensorCode+'_Card_Header" class="card card-primary">'+
			'			<div class="card-header">'+sensorName+'</div>'+
			'			<div class="banner-img min-height-170" style="padding-right: 20px; padding-top: 10px;">'+
			'				<div id="chart_'+sensorCode+'"></div>'+
			'			</div>'+
			'			<div class="dates">'+
			'				<div class="start">'+
			'					<strong>X_Axis_RMS_Velocity</strong> <label id="'+sensorCode+'_X_Axis_RMS_Velocity_mm_Value" class="font-size-45 font-weight-bold">0.014</label>'+
			'				<span></span>'+
			'				</div>'+
			'				<div class="ends">'+
			'					<strong>Z_Axis_RMS_Velocity</strong> <label id="'+sensorCode+'_Z_Axis_RMS_Velocity_mm_Value" class="font-size-45 font-weight-bold">0.014</label>'+
			'				</div>'+
			'			</div>'+
			'			<div class="stats">'+
			'				<div>'+
			'					<strong>X_Warning</strong> <h7 id="'+sensorCode+'_X_Axis_RMS_Velocity_Warning_Value" class="font-color-warning font-weight-bold">0.123</h7>'+
			'				</div>'+
			'				<div>'+
			'					<strong>X_Error</strong> <h7 id="'+sensorCode+'_X_Axis_RMS_Velocity_Alarm_Value" class="font-color-Error font-weight-bold">0.432</h7>'+
			'				</div>'+
			'				<div>'+
			'					<strong>Z_Warning</strong> <h7 id="'+sensorCode+'_Z_Axis_RMS_Velocity_Warning_Value" class="font-color-warning font-weight-bold">0.123</h7>'+
			'				</div>'+
			'				<div>'+
			'					<strong>Z_Error</strong> <h7 id="'+sensorCode+'_Z_Axis_RMS_Velocity_Alarm_Value" class="font-color-Error font-weight-bold">0.432</h7>'+
			'				</div>'+
			'			</div>'+
			'			<div class="footer">'+
			'				<a href="/SSMEdge/core/main/reportPage?sensorCode='+sensorCode+'" class="Cbtn Cbtn-primary">이력보기</a>'+
			'				<a href="/SSMEdge/core/main/detailPage?sensorCode='+sensorCode+'" class="Cbtn Cbtn-danger">상세보기</a>'+
			'			</div>'+
			'		</div>'+
			'	</div>'+
			'</div>';

		sensorCardDiv.append(divString);
	}
}

