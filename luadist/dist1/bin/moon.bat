@echo off
"C:\App\Dev\LuaDist\dist1\lua5.1.exe" -e "package.path=\"C:\\Users\\DB400\\AppData\\Roaming/luarocks/share/lua/5.1/?.lua;C:\\Users\\DB400\\AppData\\Roaming/luarocks/share/lua/5.1/?/init.lua;C:\\App\\Dev\\LuaDist\\dist1/share/lua/5.1/?.lua;C:\\App\\Dev\\LuaDist\\dist1/share/lua/5.1/?/init.lua;C:\\App\\Dev\\LuaDist\\dist1_rock\\2.2\\lua\\?.lua;\"..package.path; package.cpath=\"C:\\Users\\DB400\\AppData\\Roaming/luarocks/lib/lua/5.1/?.dll;C:\\App\\Dev\\LuaDist\\dist1/lib/lua/5.1/?.dll;\"..package.cpath" -e "local k,l,_=pcall(require,\"luarocks.loader\") _=k and l.add_context(\"moonscript\",\"0.3.2-1\")" "C:\App\Dev\LuaDist\dist1\lib\luarocks\rocks\moonscript\0.3.2-1\bin\moon" %*
