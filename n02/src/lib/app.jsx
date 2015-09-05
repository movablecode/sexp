//  app.jsx

(()=>{
  let print = console.log;
  _G.print = print;

  print ("걸프/바벨 테스트");

  let test_f = (x)=> {
    return x += 1;
  };

  print (test_f(100));

  let bc = _G.query_class("Base");

  // class Blade extends bc
  // {
  //   constructor (adjust) {
  //     super();
  //     this._base_damage = 10;
  //     this._damage_mod = adjust;
  //   }

  //   attack(mod2=1.0) {
  //     return (this._base_damage + this._damage_mod) * mod2;
  //   }

  //   set base_damage (x) {this._base_damage=x}
  //   get base_damage () {return this._base_damage}

  //   set damage_mod (x) {this._damage_mod=x}
  //   get damage_mod () {return this._damage_mod}

  // };
  // _G.register_class("Blade",Blade);


  let test_class = (a)=> {
    let class_meta = _G.query_class(a);
    let w01 = new class_meta(1);
    print ( w01.attack() );
    print ( w01.attack(1.1) );
    print ( w01.damage_mod );
  };

  // test_class("Blade");
  print (gocsM("MMX",1));
  print (gocsM("MMX3",3));
  print (getsM("MMX2",2));
  print (getnM(2));
  print (getnM(1));

  let k = getnM(1);
  k.add_field("KK",1);
  k.print_meta();

}) ();

_G.print ("YES");

const loopN = 1000*1000;

console.time("find_meta_by_N");
for (let ii=0; ii<loopN; ++ii) {
  let k = getnM(2);
}
console.timeEnd("find_meta_by_N");

console.time("find_meta_by_S");
for (let ii=0; ii<loopN; ++ii) {
  let k = getsM("MMX3");
}
console.timeEnd("find_meta_by_S");
