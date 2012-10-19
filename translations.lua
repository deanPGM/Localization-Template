-- language.lua created by Andre Biasi, Amended by CraftyDeano
-- http://monkeybin.no/blog/archives/2011/09/18/corona-sdk-localization-made-easy/
-- ***IMPORTANT*** Make sure any additional languages you add are listed in build.settings

-- this table holds all the translations, add into it text that needs to be translated
-- using the same format as the examples.
-- DO NOT remove the test translation, as this is used in the setLanguage function. 
local translations =
{
        ["test"] =
    {
        ["en"] = "test",
        ["fr"] = "test",
        ["de"] = "test",
        ["es"] = "test",
        ["it"] = "test"
    },
    ["Hello World"] =
    {
        ["en"] = "Hello World",
        ["fr"] = "Bonjour Monde",
        ["de"] = "Hallo Welt",
        ["es"] = "Hola Mundo",
        ["it"] = "Ciao Mondo"
    },
}

-- sets the language based on the users device and saves it as a setting.
-- if settings file aready exists, it just loads the settings. 
 function setLanguage()
    if (settings.get('language')) == nil then
        language = system.getPreference("ui", "language")
        if (translations["test"][language]) == nil then
           language = "en"
           settings.set('language', language)
           print ("UI language supported - Saving "..language.." to settings.json")
        else
           settings.set('language', language)
           print ("UI language supported - Saving "..language.." to settings.json")
        end
    else
       language = settings.get('language')
       print ("restored language "..language.." from settings.json")
    end
end

return translations

