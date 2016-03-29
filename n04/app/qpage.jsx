
let qpage = (dom,addr,param,fn)=> {
  addr = "/psr/"+addr;                      //  query 주소
  $('body').css('cursor','progreess');      //  커서 설정
  $.post(addr,param,function(data) {
    $('body').css('cursor','default');      //  커서 원복
    console.log("RECEIVE query result");
    $(dom).html(data.html);                 //  HTML sanitizing
    if (fn) {fn(data);};                    //  callback for Success !
  });
};
