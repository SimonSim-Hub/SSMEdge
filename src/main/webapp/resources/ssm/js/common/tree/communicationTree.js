let communicationObj;

function getCommunicationTreeData(communicationTreeList){
    let resultData = new Array();

    communicationObj = "";

    resultData = makeTreeObject($.parseJSON(communicationTreeList), "");

    return resultData;
}

function makeTreeObject(communicationTreeList, _communicationParentId) {
    let communicationId = "";
    let communicationName = "";
    let communicationType = "";
    let communicationSequence = "";
    let communicationParentId = "";
    let communicationChildCount = "";
    let useYn = 0;

    let treeObj = null;

    let resultData = new Array();

    $.each(communicationTreeList, function( childIndex, value) {
        communicationId = value.communicationId;
        communicationName = value.communicationName;
        communicationType = value.communicationType;
        communicationSequence = value.communicationSequence;
        communicationParentId = value.communicationParentId;
        communicationChildCount = value.communicationChildCount;
        useYn = value.useYn;

        if (communicationParentId == _communicationParentId) {
            treeObj = {
                text: communicationName,
                dataId: communicationId,
                dataType: communicationType,
                tags: [communicationType],
                icon: iconCheck(communicationType, communicationChildCount)
            };

            if(communicationChildCount > 0) {
                treeObj.nodes = makeTreeObject(communicationTreeList, communicationId);
            }

            resultData.push(treeObj);
        }

    });

    return resultData;
}

function iconCheck(communicationType, communicationChildCount) {
    const iconLarge = 'glyphicon glyphicon-th-large';
    const iconSmall = 'glyphicon glyphicon-stop';
    const iconGroup = 'glyphicon glyphicon-folder-open';

    if(communicationType == "G") {
        return iconGroup;
    } else {
        if(communicationChildCount > 0) {
            return iconLarge;
        } else {
            return iconSmall;
        }
    }
}

function getParentId(dataId) {
    $.each($.parseJSON($("#communicationListData").val()),function(key,value) {
        if(dataId == value.communicationId){
            $("#selectedParentDataId").val(value.communicationParentId);
        }
    });
}

function selectTreeList(queryType) {
    let communicationId = $("#selectedDataId").val();
    let communicationParentId = $("#selectedParentDataId").val();

    const treeViewObject = $('#communicationTree').data('treeview'),
        allCollapsedNodes = treeViewObject.getCollapsed(),
        allExpandedNodes = treeViewObject.getExpanded(),
        allNodes = allCollapsedNodes.concat(allExpandedNodes);

    for (let i = 0; i < allNodes.length; i++) {
        if(queryType == "D") {
            if (allNodes[i].dataId != communicationParentId) {
                continue;
            }
        } else {
            if (allNodes[i].dataId != communicationId) {
                continue;
            }
        }

        $('#communicationTree').treeview('selectNode', [allNodes[i].nodeId, { silent: true } ]);
    }

    let expandNodeId = 0;

    for (let i = 0; i < allNodes.length ; i++) {
        if(queryType == "I") {
            if (allNodes[i].dataId == communicationId) {
                expandNodeId = allNodes[i].nodeId;
            }
        } else {
            if (allNodes[i].dataId == communicationParentId) {
                expandNodeId = allNodes[i].nodeId;
            }
        }
    }

    expandParentNode(allNodes, expandNodeId);
}

function expandParentNode(allNodes, expandNodeId) {
    for (let i = 0; i < allNodes.length ; i++) {
        if(expandNodeId == allNodes[i].nodeId) {
            $('#communicationTree').treeview('expandNode', [allNodes[i].nodeId]);

            if (allNodes[i].parentId != null) {
                expandParentNode(allNodes, allNodes[i].parentId)
            }
        }
    }
}