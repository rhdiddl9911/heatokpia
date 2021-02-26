/**
 * 
 */

$("#chk_all").click(function(){ 
	//클릭되었으면 
	if($("#chk_all").prop("checked")){
		//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의 
		$("input[name=chk]").prop("checked",true);
		}else{ //클릭이 안되있으면
		//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의 
		$("input[name=chk]").prop("checked",false);
		}
	})

