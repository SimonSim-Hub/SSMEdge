let commonCodeObj;

function getCommonCodeTreeData(commonCodeTreeList){
    let resultData = new Array();

    commonCodeObj = "";

    resultData = makeTreeObject($.parseJSON(commonCodeTreeList), "");

    return resultData;
}

function makeTreeObject(commonCodeTreeList, _commonCodeParentId) {
    let commonCodeId = "";
    let commonCodeName = "";
    let commonCodeType = "";
    let commonCodeSequence = "";
    let commonCodeParentId = "";
    let commonCodeChildCount = "";
    let useYn = 0;

    let treeObj = null;

    let resultData = new Array();

    $.each(commonCodeTreeList, function( childIndex, value) {
        commonCodeId = value.commonCodeId;
        commonCodeName = value.commonCodeName;
        commonCodeType = value.commonCodeType;
        commonCodeSequence = value.commonCodeSequence;
        commonCodeParentId = value.commonCodeParentId;
        commonCodeChildCount = value.commonCodeChildCount;
        useYn = value.useYn;

        if (commonCodeParentId == _commonCodeParentId) {
            treeObj = {
                text: commonCodeName,
                dataId: commonCodeId,
                dataType: commonCodeType,
                tags: [commonCodeType],
                icon: iconCheck(commonCodeType, commonCodeChildCount)
            };

            if(commonCodeChildCount > 0) {
                treeObj.nodes = makeTreeObject(commonCodeTreeList, commonCodeId);
            }

            resultData.push(treeObj);
        }

    });

    return resultData;
}

function iconCheck(commonCodeType, commonCodeChildCount) {
    const iconLarge = 'glyphicon glyphicon-th-large';
    const iconSmall = 'glyphicon glyphicon-stop';
    const iconGroup = 'glyphicon glyphicon-folder-open';

    if(commonCodeType == "G") {
        return iconGroup;
    } else {
        if(commonCodeChildCount > 0) {
            return iconLarge;
        } else {
            return iconSmall;
        }
    }
}

function getParentId(dataId) {
    $.each($.parseJSON($("#commonCodeListData").val()),function(key,value) {
        if(dataId == value.commonCodeId){
            $("#selectedParentDataId").val(value.commonCodeParentId);
        }
    });
}

function selectTreeList(queryType) {
    let commonCodeId = $("#selectedDataId").val();
    let commonCodeParentId = $("#selectedParentDataId").val();

    const treeViewObject = $('#commonCodeTree').data('treeview'),
        allCollapsedNodes = treeViewObject.getCollapsed(),
        allExpandedNodes = treeViewObject.getExpanded(),
        allNodes = allCollapsedNodes.concat(allExpandedNodes);

    for (let i = 0; i < allNodes.length; i++) {
        if(queryType == "D") {
            if (allNodes[i].dataId != commonCodeParentId) {
                continue;
            }
        } else {
            if (allNodes[i].dataId != commonCodeId) {
                continue;
            }
        }

        $('#commonCodeTree').treeview('selectNode', [allNodes[i].nodeId, { silent: true } ]);
    }

    let expandNodeId = 0;

    for (let i = 0; i < allNodes.length ; i++) {
        if(queryType == "I") {
            if (allNodes[i].dataId == commonCodeId) {
                expandNodeId = allNodes[i].nodeId;
            }
        } else {
            if (allNodes[i].dataId == commonCodeParentId) {
                expandNodeId = allNodes[i].nodeId;
            }
        }
    }

    expandParentNode(allNodes, expandNodeId);
}

function expandParentNode(allNodes, expandNodeId) {
    for (let i = 0; i < allNodes.length ; i++) {
        if(expandNodeId == allNodes[i].nodeId) {
            $('#commonCodeTree').treeview('expandNode', [allNodes[i].nodeId]);

            if (allNodes[i].parentId != null) {
                expandParentNode(allNodes, allNodes[i].parentId)
            }
        }
    }
}