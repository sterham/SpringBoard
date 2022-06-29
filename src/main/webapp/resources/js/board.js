function goList(cpath){
	location.href = cpath + "/boardList.do"
}

function goUpdate(cpath, idx){
	location.href = cpath + '/boardUpdate.do?idx=' + idx
}

function goDelete(cpath, idx){
    ///삭제 시켜주는 컨트롤러로 이동
    
    // url/value1/value2/......
    location.href = cpath+'/boardDelete.do/'+idx
    
 }