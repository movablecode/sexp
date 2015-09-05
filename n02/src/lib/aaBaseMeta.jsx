//  aaBaseMeta.jsx
let _BMeta = {};

(()=>{

  let print = console.log;

  /*
    Class Meta 데이터, 실제 객체를 뜻하는 것이 아니라,
    그 구성에 대한 메타를 가리킨다.
    백본을 사용한다고 해도, 이 메타는 필요할 듯 싶다.
  */
  class BaseMeta
  {

    constructor(name, nid=0) {
      this._name = name;
      this._nid = nid;    //  set numeric ID
      this._bmf_map = {};
      this._bmf_array = [];
      _G.classes[this._name] = this;
      if (this._nid>0) {
        _G.class_array[this._nid] = this;
        // print (_G.class_array, _G.class_array.length);
      }
    }

    __add_meta_field (bmf) {
      this._bmf_map[bmf.SID] = bmf;
      if (bmf.NID>0) {
        this._bmf_array[bmf.NID] = bmf;
      };
    }

    add_field (name, nid=0) {
      return (new BaseMetaField(this, name, nid));
    }

    print_meta() {
      print (this._bmf_map);
    }

    get SID() {return this._name}
    get NID() {return this._nid}
    get name() {return this._name}


  };

  class BaseMetaField
  {

    constructor(bm, name, nid=0) {
      this._bm = bm;
      this._name = name;
      this._nid = nid;
      bm.__add_meta_field (this);
    }

    get SID() {return this._name}
    get NID() {return this._nid}
    get name() {return this._name}

  };

  /*
    string ID 로 get or create 메타.
  */
  _G.get_or_create_SM = (name,nid=0)=> {
    let res = _G.classes[name];
    if (res==null) {
      res = new BaseMeta(name,nid);
    }
    // print (res);
    return res;
  };
  _G.find_SM = (name)=> {return _G.classes[name]};
  _G.find_NM = (nid)=> {return _G.class_array[nid]};


})();

let gocsM = _G.get_or_create_SM;
let getsM = _G.find_SM;
let getnM = _G.find_NM;
