--Project: Localisation App Template                        																															
--Description: A basic app that translates itself based on the users device language
--Also has the options to choose language by clicking on country flags. 
--Supporting Blog Post: http://echoecho.es/blog/2012/10/18/corona-sdk-tutorial-ios-app-localization

--Twitter: @CraftyDeano
--GitHub: @CraftyDeano
--App.Net @CraftyDeano
--Web: http://echoecho.es

--<ShamelessAdvertising>
--My 2nd iPhone app, Joke Shake, is available free on the app store for all devices!
--Grab it at www.jokeshake.com
--</ShamelessAdvertising>

settings = require("settings")
translations = require("translations")
settings.load()
setLanguage()

_W = display.contentWidth / 2
_H = display.contentHeight / 2

-- not localized text
local textObject1 = display.newText("Hello World", 0, 0,native.systemFont, 40)
textObject1.x = _W;textObject1.y = _H - 200

-- localized text
local textObject2 = display.newText(translations["Hello World"][language], 0, 0,native.systemFont, 40)
textObject2.x = _W;textObject2.y = _H - 125

-- loads the country flags with event listeners
function loadFlags()
local flag1 = display.newImageRect("images/usa.png", 64, 64) 
flag1.x = _W - 100;flag1.y = _H + 30;flag1.name = "flag1"
flag1:addEventListener("tap",changeLanguage)

local flag2 = display.newImageRect("images/france.png", 64, 64) 
flag2.x = _W;flag2.y = _H + 30;flag2.name = "flag2"
flag2:addEventListener("tap",changeLanguage)

local flag3 = display.newImageRect("images/germany.png", 64, 64) 
flag3.x = _W + 100;flag3.y = _H + 30;flag3.name = "flag3"
flag3:addEventListener("tap",changeLanguage)

local flag4 = display.newImageRect("images/spain.png", 64, 64) 
flag4.x = _W - 100;flag4.y = _H + 120;flag4.name = "flag4"
flag4:addEventListener("tap",changeLanguage)

local flag5 = display.newImageRect("images/italy.png", 64, 64) 
flag5.x = _W;flag5.y = _H + 120;flag5.name = "flag5"
flag5:addEventListener("tap",changeLanguage)

end

-- changes language, saves in the settings file and changes textobject2 depending on what flag was touched
function changeLanguage(event)
    if event.target.name == "flag1" then
        language = "en"
        settings.set('language', language)
        textObject2.text = translations["Hello World"][language]
    elseif event.target.name == "flag2" then
        language = "fr"
        settings.set('language', language)
        textObject2.text = translations["Hello World"][language]
    elseif event.target.name == "flag3" then
        language = "de"
        settings.set('language', language)
        textObject2.text = translations["Hello World"][language]
    elseif event.target.name == "flag4" then
        language = "es"
        settings.set('language', language)
        textObject2.text = translations["Hello World"][language]
    elseif event.target.name == "flag5" then
        language = "it"
        settings.set('language', language)
        textObject2.text = translations["Hello World"][language]
    end
end
loadFlags()

