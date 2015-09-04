//  a_base_01.jsx
let _G = {};

_G.classes = {};
_G.class_array = [];

_G.register_class = (name,a)=> {
  _G.classes[name] = a;
};

_G.query_class = (name)=> {
  return _G.classes[name];
};
