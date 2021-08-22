if text == 'الالعاب' then
local Text = [[
《WELCOM IN STAR GAMES🎮》
≪━━━━━━STAR━━━━━━≫
✯مرحب بيك في قائمه الالعاب 🎮
≪━━━━━━STAR━━━━━━≫
⓵↤ العاب السورس 
⓶↤ العاب متطوره 
≪━━━━━━STAR━━━━━━≫
[SOURCE STAR](t.me/SOURCE_STAR1)
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⓵', callback_data="/help1"},{text = '⓶', callback_data="/help2"},
},
{
{text = 'SOURCE STAR', url="t.me/SOURCE_STAR1"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
local Text =[[
《WELCOM IN STAR GAMES🎮》
≪━━━━━━STAR━━━━━━≫
✯أنت الآن في العاب السورس🎮
≪━━━━━━STAR━━━━━━≫
✯اوامر الالعاب كتالي 
≪━━━━━━STAR━━━━━━≫
 ✯تفعيل الالعاب ⇐ لتفعيل العبه ◐
 ✯تعطيل الالعاب ⇐ لتعطيل العبه ◐
≪━━━━━━STAR━━━━━━≫
 ✯الالعاب الخاصه بسورس ستار
≪━━━━━━STAR━━━━━━≫
 ✯لعبه البات⇇ لعبة المحيبس 
 ✯لعبه التخمين⇇ لعبة البحث
 ✯لعبه الاسرع⇇ لعبة اسرع شخص
 ✯لعبه السمايلات⇇ لعبة المطابقه 
 ✯لعبه المختلف⇇ لعبة الذكاء
 ✯لعبه الرياضيات⇇ لعبة الارقام
 ✯لعبه الانكليزي⇇ لعبة ترجمه
 ✯لعبه الامثله⇇ لعبة تصحيح 
 ✯لعبه العكس⇇ لعبة عكس الكلمات
 ✯لعبه الحزوره⇇لعبة التفكير 
 ✯لعبه المعاني⇇ العبه الشهيره 
  ✯لعبه صخرة الموت⇇ صخره الموت
  ✯لعبه مريم⇇ مريم
≪━━━━━━STAR━━━━━━≫
[SOURCE STAR](t.me/SOURCE_STAR1)
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⓵', callback_data="/help1"},{text = '⓶', callback_data="/help2"},
},
{
{text = ' الاوامر الرئيسيه ', callback_data="/help"},
},
{
{text = 'SOURCE STAR', url="t.me/SOURCE_STAR1"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/help2' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text =[[
《WELCOM IN STAR GAMES🎮》
≪━━━━━━STAR━━━━━━≫
✯مرحب بيك في قائمه العاب سورس ستار
≪━━━━━━STAR━━━━━━≫
لو عايز العاب متطوره اكتب.. 
⇐العاب ستار
⇐العاب متطوره
⇐العاب مطوره
≪━━━━━━ STAR━━━━━━≫
لو عايز العاب السورس اكتب.... 
✓العاب 
✓العاب السورس 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⓵', callback_data="/help1"},{text = '⓶', callback_data="/help2"},
},
{
{text = ' الاوامر الرئيسيه ', callback_data="/help"},
},
{
{text = 'SOURCE STAR', url="t.me/SOURCE_STAR1"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/help3' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end