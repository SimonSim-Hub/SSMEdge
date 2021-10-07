function getDeviceTreeData(deviceTreeList){
	var resultData = new Array();

	resultData = makeDeviceTreeData($.parseJSON(deviceTreeList));

	return resultData;
}

function makeDeviceTreeData(deviceTreeList) {
	var resultData = new Array();
	
	var networkTempData = new Array();
	var tagTempData = new Array();
	
	var deviceObj = "";
	var networkObj = "";
	var tagObj = "";
	
	$.each(deviceTreeList, function( index, value) {
    	deviceId = value.DEVICE_ID;
		deviceType = value.DEVICE_TYPE;
		deviceName = value.DEVICE_NAME;
		deviceSequence = value.DEVICE_SEQUENCE;
		deviceGroupId = value.DEVICE_GROUP_ID;
		deviceNodeCount = value.DEVICE_NODE_COUNT;
		deviceRemark = value.DEVICE_REMARK;
		deviceUseYn = value.USE_YN;
		
		if (deviceType == "D") {
			deviceObj = {
				text : deviceName,
				tags : [deviceType],
				state : { 
	                expanded: false
	            }
			};
			
			if(deviceNodeCount > 0) {
				networkTempData = [];
				
				for(var i = 0; i < deviceNodeCount; i++) {
					index++;

					networkId = deviceTreeList[index].DEVICE_ID;
					networkType = deviceTreeList[index].DEVICE_TYPE;
					networkName = deviceTreeList[index].DEVICE_NAME;
					networkSequence = deviceTreeList[index].DEVICE_SEQUENCE;
					networkGroupId = deviceTreeList[index].DEVICE_GROUP_ID;
					networkNodeCount = deviceTreeList[index].DEVICE_NODE_COUNT;
					networkRemark = deviceTreeList[index].DEVICE_REMARK;
					networkUseYn = deviceTreeList[index].USE_YN;
					
					networkObj = {
						text : networkName,
						tags : [networkType],
						state : { 
			                expanded: false
			            },
			            icon: 'glyphicon glyphicon-retweet'
					};
					
					networkTempData.push(networkObj);
					
					if(networkNodeCount > 0) {
						tagTempData = [];
						
						for(var j = 0; j < networkNodeCount; j++) {
							index++;

							tagId = deviceTreeList[index].DEVICE_ID;
							tagType = deviceTreeList[index].DEVICE_TYPE;
							tagName = deviceTreeList[index].DEVICE_NAME;
							tagSequence = deviceTreeList[index].DEVICE_SEQUENCE;
							tagGroupId = deviceTreeList[index].DEVICE_GROUP_ID;
							tagNodeCount = deviceTreeList[index].DEVICE_NODE_COUNT;
							tagRemark = deviceTreeList[index].DEVICE_REMARK;
							tagUseYn = deviceTreeList[index].USE_YN;
							
							tagObj = {
								text : tagName,
								tags : [tagType],
								state : { 
					                expanded: false
					            },
					            icon: 'fa fa-tag'
							};
							
							tagTempData.push(tagObj);
						}
						
						networkObj.nodes = tagTempData; 
					}
				}
				
				deviceObj.nodes = networkTempData;
			}

			resultData.push(deviceObj);
		}
    });

	return resultData;
}