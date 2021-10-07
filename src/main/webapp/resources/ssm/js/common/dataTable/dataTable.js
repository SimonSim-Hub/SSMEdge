function addList(table, list) {
    const jsonList = $.parseJSON(list);

    resetList(table);

    table.DataTable().rows.add(jsonList).draw();
}

function resetList(table) {
    table.DataTable().clear().draw();
}

// Korean
const lang_kor = {
    "decimal": "",
    "emptyTable": "데이터가 없습니다.",
    "info": "_START_ - _END_ (총 _TOTAL_ 건)",
    "infoEmpty": "0건",
    "infoFiltered": "(전체 _MAX_ 건 중 검색결과)",
    "infoPostFix": "",
    "thousands": ",",
    "lengthMenu": "_MENU_ 개씩 보기",
    "loadingRecords": "로딩중...",
    "processing": "처리중...",
    "search": "검색 : ",
    "zeroRecords": "검색된 데이터가 없습니다.",
    "paginate": {
        "first": "첫 페이지",
        "last": "마지막 페이지",
        "next": "다음",
        "previous": "이전"
    },
    "aria": {
        "sortAscending": " :  오름차순 정렬",
        "sortDescending": " :  내림차순 정렬"
    }
};