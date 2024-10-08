local LSM = LibStub('LibSharedMedia-3.0')
local AddOnName = ...
local Path = [[Interface\AddOns\]]..AddOnName..[[\Media\]]

LSM:Register('statusbar', 'Asphyxia', Path..[[StatusBars\Asphyxia]])
LSM:Register('statusbar', 'Bezo', Path..[[StatusBars\Bezo]])
LSM:Register('statusbar', 'Dajova', Path..[[StatusBars\Dajova]])
LSM:Register('statusbar', 'Duffed', Path..[[StatusBars\Duffed]])
LSM:Register('statusbar', 'ElvUI', Path..[[StatusBars\ElvUI]])
LSM:Register('statusbar', 'Flatt', Path..[[StatusBars\Flatt]])
LSM:Register('statusbar', 'Sinaris', Path..[[StatusBars\Sinaris]])
LSM:Register('statusbar', 'Slate', Path..[[StatusBars\Slate]])
LSM:Register('statusbar', 'Smooth', Path..[[StatusBars\Smooth]])
LSM:Register('statusbar', 'Tukui', Path..[[StatusBars\Tukui]])

LSM:Register('font', 'Action Man', Path..[[Fonts\ActionMan.ttf]])
LSM:Register('font', 'Arial', Path..[[Fonts\Arial.ttf]])
LSM:Register('font', 'Big Noodle Titling', Path..[[Fonts\BigNoodleTitling.ttf]])
LSM:Register('font', 'Continuum Medium', Path..[[Fonts\ContinuumMedium.ttf]])
LSM:Register('font', 'Junegull', Path..[[Fonts\Junegull.ttf]])
LSM:Register('font', 'Diediedie', Path..[[Fonts\Diediedie.ttf]])
LSM:Register('font', 'Event Horizon', Path..[[Fonts\Event Horizon.ttf]])
LSM:Register('font', 'Futurapress', Path..[[Fonts\Futurapress.ttf]])
LSM:Register('font', 'Good Time', Path..[[Fonts\GOODTIME.ttf]])
LSM:Register('font', 'H.H. Samuel', Path..[[Fonts\H.H. Samuel.ttf]])
LSM:Register('font', 'Homespun TT BRK', Path..[[Fonts\Homespun.ttf]])
LSM:Register('font', 'KGSmallTownSouthernGirl', Path..[[Fonts\KGSmallTownSouthernGirl.ttf]])
LSM:Register('font', 'Oswald Bold', Path..[[Fonts\Oswald-Bold.ttf]])
LSM:Register('font', 'Oswald Light', Path..[[Fonts\Oswald-Light.ttf]])
LSM:Register('font', 'Oswald Regular', Path..[[Fonts\Oswald-Regular.ttf]])
LSM:Register('font', 'PT Sans Narrow Bold', Path..[[Fonts\PTSansNarrow-Bold.ttf]])
LSM:Register('font', 'Reprise Title', Path..[[Fonts\Reprise Title.ttf]])
LSM:Register('font', 'Saarland', Path..[[Fonts\Saarland.ttf]])
LSM:Register('font', 'Samson', Path..[[Fonts\Samson.ttf]])
LSM:Register('font', 'Sony Sketch', Path..[[Fonts\SonySketch.ttf]])
LSM:Register('font', 'Visitor TT2 BRK', Path..[[Fonts\Visitor.ttf]])
LSM:Register('font', 'Youthanasia Texture Regular', Path..[[Fonts\YOUTTX.ttf]])
LSM:Register('font', 'Youthanasia Texture', Path..[[Fonts\YOUTHAN.ttf]])

LSM:Register('sound', 'Warning', Path..[[Sounds\Warning.mp3]])

LSM:Register('font', 'Tukui Combat', Path..[[Fonts\Diediedie.ttf]])
LSM:Register('font', 'Tukui Pixel', Path..[[Fonts\Visitor.ttf]])
LSM:Register('font', 'Tukui UnitFrame', Path..[[Fonts\BigNoodleTitling.ttf]])

if not C_AddOns.GetAddOnInfo('ElvUI') then
	LSM:Register('font', 'ElvUI Alt-Combat', Path..[[Fonts\Diediedie.ttf]])
	LSM:Register('font', 'ElvUI Alt-Font', Path..[[Fonts\ContinuumMedium.ttf]])
	LSM:Register('font', 'ElvUI Combat', Path..[[Fonts\ActionMan.ttf]])
	LSM:Register('font', 'ElvUI Font', Path..[[Fonts\PTSansNarrow-Bold.ttf]])
	LSM:Register('font', 'ElvUI Pixel', Path..[[Fonts\Homespun.ttf]])

	LSM:Register('statusbar', 'ElvUI Gloss', Path..[[StatusBars\ElvUI]])
end
