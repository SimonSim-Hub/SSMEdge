function getFullHeight(pageHeight){
	const documentHeight = $(window).height();

	const mainHeaderHeight = $(".main-header").outerHeight(true);
	const contentHeaderHeight = $(".content-header").outerHeight(true);
	const boxHeaderHight = $(".box-header").outerHeight(true);
	const eHight = 38 + pageHeight;

	const fullHeight = documentHeight - mainHeaderHeight - contentHeaderHeight - boxHeaderHight - eHight;

	return fullHeight;
}

function getFullDataTableHeight(inputLine){
	const documentHeight = $(document).height();

	const mainHeaderHeight = $(".main-header").outerHeight(true);
	const contentHeaderHeight = $(".content-header").outerHeight(true);
	const boxHeaderHight = $(".box-header").outerHeight(true);
	let eHight = 71;

	if(inputLine == 1) {
		eHight = eHight + 136;
	}

	const fullHeight = documentHeight - mainHeaderHeight - contentHeaderHeight - boxHeaderHight - eHight;
	
	return fullHeight;
}