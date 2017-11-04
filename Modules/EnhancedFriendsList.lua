local PA = _G.ProjectAzilroka
local EFL = LibStub('AceAddon-3.0'):NewAddon('EnhancedFriendsList', 'AceEvent-3.0', 'AceHook-3.0', 'AceTimer-3.0')
_G.EnhancedFriendsList = EFL

EFL.Title = 'Enhanced Friends List'
EFL.Description = 'Provides Freinds List Customization'
EFL.Author = 'Azilroka'

local pairs, tonumber = pairs, tonumber
local format = format
local Locale = GetLocale()
local GetFriendInfo, BNGetFriendInfo, BNGetGameAccountInfo, BNConnected, GetQuestDifficultyColor, CanCooperateWithGameAccount = GetFriendInfo, BNGetFriendInfo, BNGetGameAccountInfo, BNConnected, GetQuestDifficultyColor, CanCooperateWithGameAccount

local MediaPath = 'Interface\\AddOns\\ProjectAzilroka\\Media\\EnhancedFriendsList\\'
-- Marotheit
--[[
BNET_CLIENT_APP
BNET_CLIENT_WOW
BNET_CLIENT_SC2
BNET_CLIENT_D3
BNET_CLIENT_WTCG
BNET_CLIENT_HEROES
BNET_CLIENT_OVERWATCH
BNET_CLIENT_SC
BNET_CLIENT_DESTINY2
]]

EFL.GameIcons = {
	Alliance = {
		Default = BNet_GetClientTexture(BNET_CLIENT_WOW),
		BlizzardChat = 'Interface\\ChatFrame\\UI-ChatIcon-WoW',
		Flat = MediaPath..'GameIcons\\Flat\\Alliance',
		Gloss = MediaPath..'GameIcons\\Gloss\\Alliance',
		Launcher = MediaPath..'GameIcons\\Launcher\\Alliance',
	},
	Horde = {
		Default = BNet_GetClientTexture(BNET_CLIENT_WOW),
		BlizzardChat = 'Interface\\ChatFrame\\UI-ChatIcon-WoW',
		Flat = MediaPath..'GameIcons\\Flat\\Horde',
		Gloss = MediaPath..'GameIcons\\Gloss\\Horde',
		Launcher = MediaPath..'GameIcons\\Launcher\\Horde',
	},
	Neutral = {
		Default = BNet_GetClientTexture(BNET_CLIENT_WOW),
		BlizzardChat = 'Interface\\ChatFrame\\UI-ChatIcon-WoW',
		Flat = MediaPath..'GameIcons\\Flat\\WoW',
		Gloss = MediaPath..'GameIcons\\Gloss\\WoW',
		Launcher = MediaPath..'GameIcons\\Launcher\\WoW',
	},
	D3 = {
		Default = BNet_GetClientTexture(BNET_CLIENT_D3),
		BlizzardChat = 'Interface\\ChatFrame\\UI-ChatIcon-D3',
		Flat = MediaPath..'GameIcons\\Flat\\D3',
		Gloss = MediaPath..'GameIcons\\Gloss\\D3',
		Launcher = MediaPath..'GameIcons\\Launcher\\D3',
	},
	WTCG = {
		Default = BNet_GetClientTexture(BNET_CLIENT_WTCG),
		BlizzardChat = 'Interface\\ChatFrame\\UI-ChatIcon-WTCG',
		Flat = MediaPath..'GameIcons\\Flat\\Hearthstone',
		Gloss = MediaPath..'GameIcons\\Gloss\\Hearthstone',
		Launcher = MediaPath..'GameIcons\\Launcher\\Hearthstone',
	},
	S1 = {
		Default = BNet_GetClientTexture(BNET_CLIENT_SC),
		BlizzardChat = 'Interface\\ChatFrame\\UI-ChatIcon-SC',
		Flat = MediaPath..'GameIcons\\Flat\\SC',
		Gloss = MediaPath..'GameIcons\\Gloss\\SC',
		Launcher = MediaPath..'GameIcons\\Launcher\\SC',
	},
	S2 = {
		Default = BNet_GetClientTexture(BNET_CLIENT_SC2),
		BlizzardChat = 'Interface\\ChatFrame\\UI-ChatIcon-SC2',
		Flat = MediaPath..'GameIcons\\Flat\\SC2',
		Gloss = MediaPath..'GameIcons\\Gloss\\SC2',
		Launcher = MediaPath..'GameIcons\\Launcher\\SC2',
	},
	App = {
		Default = BNet_GetClientTexture(BNET_CLIENT_APP),
		BlizzardChat = 'Interface\\ChatFrame\\UI-ChatIcon-Battlenet',
		Flat = MediaPath..'GameIcons\\Flat\\BattleNet',
		Gloss = MediaPath..'GameIcons\\Gloss\\BattleNet',
		Launcher = MediaPath..'GameIcons\\Launcher\\BattleNet',
	},
	BSAp = {
		Default = BNet_GetClientTexture(BNET_CLIENT_APP),
		BlizzardChat = 'Interface\\ChatFrame\\UI-ChatIcon-Battlenet',
		Flat = MediaPath..'GameIcons\\Flat\\BattleNet',
		Gloss = MediaPath..'GameIcons\\Gloss\\BattleNet',
		Launcher = MediaPath..'GameIcons\\Launcher\\BattleNet',
	},
	Hero = {
		Default = BNet_GetClientTexture(BNET_CLIENT_HEROES),
		BlizzardChat = 'Interface\\ChatFrame\\UI-ChatIcon-HotS',
		Flat = MediaPath..'GameIcons\\Flat\\Heroes',
		Gloss = MediaPath..'GameIcons\\Gloss\\Heroes',
		Launcher = MediaPath..'GameIcons\\Launcher\\Heroes',
	},
	Pro = {
		Default = BNet_GetClientTexture(BNET_CLIENT_OVERWATCH),
		BlizzardChat = 'Interface\\ChatFrame\\UI-ChatIcon-Overwatch',
		Flat = MediaPath..'GameIcons\\Flat\\Overwatch',
		Gloss = MediaPath..'GameIcons\\Gloss\\Overwatch',
		Launcher = MediaPath..'GameIcons\\Launcher\\Overwatch',
	},
	DST2 = {
		Default = BNet_GetClientTexture(BNET_CLIENT_DESTINY2),
		BlizzardChat = 'Interface\\ChatFrame\\UI-ChatIcon-Destiny2',
		Flat = MediaPath..'GameIcons\\Launcher\\Destiny2',
		Gloss = MediaPath..'GameIcons\\Launcher\\Destiny2',
		Launcher = MediaPath..'GameIcons\\Launcher\\Destiny2',
	},
}

EFL.StatusIcons = {
	Default = {
		Online = FRIENDS_TEXTURE_ONLINE,
		Offline = FRIENDS_TEXTURE_OFFLINE,
		DND = FRIENDS_TEXTURE_DND,
		AFK = FRIENDS_TEXTURE_AFK,
	},
	Square = {
		Online = MediaPath..'StatusIcons\\Square\\Online',
		Offline = MediaPath..'StatusIcons\\Square\\Offline',
		DND = MediaPath..'StatusIcons\\Square\\DND',
		AFK = MediaPath..'StatusIcons\\Square\\AFK',
	},
	D3 = {
		Online = MediaPath..'StatusIcons\\D3\\Online',
		Offline = MediaPath..'StatusIcons\\D3\\Offline',
		DND = MediaPath..'StatusIcons\\D3\\DND',
		AFK = MediaPath..'StatusIcons\\D3\\AFK',
	},
}

EFL.ClientColor = {
	S1 = 'C495DD',
	S2 = 'C495DD',
	D3 = 'C41F3B',
	Pro = 'FFFFFF',
	WTCG = 'FFB100',
	Hero = '00CCFF',
	App = '82C5FF',
	BSAp = '82C5FF',
}

function EFL:GetOptions()
	local Options = {
		type = 'group',
		name = PA.ModuleColor..EFL.Title,
		desc = EFL.Description,
		order = 206,
		args = {
			general = {
				order = 2,
				type = 'group',
				name = 'General',
				guiInline = true,
				get = function(info) return EFL.db[info[#info]] end,
				set = function(info, value) EFL.db[info[#info]] = value FriendsFrame_Update() end,
				args = {
					NameFont = {
						type = 'select', dialogControl = 'LSM30_Font',
						order = 1,
						name = 'Name Font',
						desc = 'The font that the RealID / Character Name / Level uses.',
						values = AceGUIWidgetLSMlists.font,
					},
					NameFontSize = {
						order = 2,
						name = 'Name Font Size',
						desc = 'The font size that the RealID / Character Name / Level uses.',
						type = 'range',
						min = 6, max = 22, step = 1,
					},
					NameFontFlag = {
						name = 'Name Font Flag',
						desc = 'The font flag that the RealID / Character Name / Level uses.',
						order = 3,
						type = 'select',
						values = {
							['NONE'] = 'None',
							['OUTLINE'] = 'OUTLINE',
							['MONOCHROME'] = 'MONOCHROME',
							['MONOCHROMEOUTLINE'] = 'MONOCROMEOUTLINE',
							['THICKOUTLINE'] = 'THICKOUTLINE',
						},
					},
					InfoFont = {
						type = 'select', dialogControl = 'LSM30_Font',
						order = 4,
						name = 'Info Font',
						desc = 'The font that the Zone / Server uses.',
						values = AceGUIWidgetLSMlists.font,
					},
					InfoFontSize = {
						order = 5,
						name = 'Info Font Size',
						desc = 'The font size that the Zone / Server uses.',
						type = 'range',
						min = 6, max = 22, step = 1,
					},
					InfoFontFlag = {
						order = 6,
						name = 'Info Font Outline',
						desc = 'The font flag that the Zone / Server uses.',
						type = 'select',
						values = {
							['NONE'] = 'None',
							['OUTLINE'] = 'OUTLINE',
							['MONOCHROME'] = 'MONOCHROME',
							['MONOCHROMEOUTLINE'] = 'MONOCROMEOUTLINE',
							['THICKOUTLINE'] = 'THICKOUTLINE',
						},
					},
					StatusIconPack = {
						name = 'Status Icon Pack',
						desc = 'Different Status Icons.',
						order = 8,
						type = 'select',
						values = {
							['Default'] = 'Default',
							['Square'] = 'Square',
							['D3'] = 'Diablo 3',
						},
					},
				},
			},
			GameIcons = {
				order = 3,
				type = 'group',
				name = 'Game Icons',
				guiInline = true,
				get = function(info) return EFL.db[info[#info]] end,
				set = function(info, value) EFL.db[info[#info]] = value FriendsFrame_Update() end,
				args = {},
			},
			GameIconsPreview = {
				order = 4,
				type = 'group',
				name = 'Game Icon Preview',
				guiInline = true,
				args = {},
			},
			StatusIcons = {
				order = 5,
				type = 'group',
				name = 'Status Icon Preview',
				guiInline = true,
				args = {},
			},
		},
	}

	local GameIconsOptions = {
		Alliance = FACTION_ALLIANCE,
		Horde = FACTION_HORDE,
		Neutral = FACTION_STANDING_LABEL4,
		D3 = 'Diablo 3',
		WTCG = 'Hearthstone',
		S1 = 'Starcraft',
		S2 = 'Starcraft 2',
		App = 'App',
		BSAp = 'Mobile',
		Hero = 'Hero of the Storm',
		Pro = 'Overwatch',
		DST2 = 'Destiny 2',
	}

	local GameIconOrder = {
		Alliance = 1,
		Horde = 2,
		Neutral = 3,
		D3 = 4,
		WTCG = 5,
		S1 = 6,
		S2 = 7,
		App = 8,
		BSAp = 9,
		Hero = 10,
		Pro = 11,
		DST2 = 12,
	}

	for Key, Value in pairs(GameIconsOptions) do
		Options.args.GameIcons.args[Key] = {
			name = Value..' Icon',
			order = GameIconOrder[Key],
			type = 'select',
			values = {
				['Default'] = 'Default',
				['BlizzardChat'] = 'Blizzard Chat',
				['Flat'] = 'Flat Style',
				['Gloss'] = 'Glossy',
				['Launcher'] = 'Launcher',
			},
		}
		Options.args.GameIconsPreview.args[Key] = {
			order = GameIconOrder[Key],
			type = 'execute',
			name = Value,
			func = function() return end,
			image = function(info) return EFL.GameIcons[info[#info]][EFL.db[Key]], 32, 32 end,
		}
	end

	local StatusIconsOptions = {
		Online = FRIENDS_LIST_ONLINE,
		Offline = FRIENDS_LIST_OFFLINE,
		DND = DEFAULT_DND_MESSAGE,
		AFK = DEFAULT_AFK_MESSAGE,
	}

	local StatusIconsOrder = {
		Online = 1,
		Offline = 2,
		DND = 3,
		AFK = 4,
	}

	for Key, Value in pairs(StatusIconsOptions) do
		Options.args.StatusIcons.args[Key] = {
			order = StatusIconsOrder[Key],
			type = 'execute',
			name = Value,
			func = function() return end,
			image = function(info) return EFL.StatusIcons[EFL.db.StatusIconPack][info[#info]], 16, 16 end,
		}
	end

	PA.AceOptionsPanel.Options.args.ProjectAzilroka.args.EnhancedFriendsList = Options
end

local Defaults
function EFL:SetupProfile()
	if not Defaults then
		Defaults = {
			profile = {
				['NameFont'] = 'Arial Narrow',
				['NameFontSize'] = 12,
				['NameFontFlag'] = 'OUTLINE',
				['InfoFont'] = 'Arial Narrow',
				['InfoFontSize'] = 12,
				['InfoFontFlag'] = 'OUTLINE',
				['StatusIconPack'] = 'Default',
				['Alliance'] = 'Default',
				['Horde'] = 'Default',
				['Neutral'] = 'Default',
				['D3'] = 'Default',
				['WTCG'] = 'Default',
				['S1'] = 'Default',
				['S2'] = 'Default',
				['App'] = 'Default',
				['BSAp'] = 'Default',
				['Hero'] = 'Default',
				['Pro'] = 'Default',
				['DST2'] = 'Default',
			}
		}
		if self.ElvUI then
			Defaults.profile['NameFont'] = ElvUI[1].db.general.font
			Defaults.profile['InfoFont'] = ElvUI[1].db.general.font
		elseif self.Tukui then
			Defaults.profile['NameFont'] = 'Tukui Pixel'
			Defaults.profile['InfoFont'] = 'Tukui Pixel'
			Defaults.profile['NameFontFlag'] = 'MONOCHROMEOUTLINE'
			Defaults.profile['InfoFontFlag'] = 'MONOCHROMEOUTLINE'
		end
	end

	self.data = LibStub('AceDB-3.0'):New('EnhancedFriendsListDB', Defaults)
	self.data.RegisterCallback(self, 'OnProfileChanged', 'SetupProfile')
	self.data.RegisterCallback(self, 'OnProfileCopied', 'SetupProfile')
	self.db = self.data.profile
end

function EFL:ClassColorCode(class)
	for k, v in pairs(LOCALIZED_CLASS_NAMES_MALE) do
		if class == v then
			class = k
		end
	end

	if Locale ~= 'enUS' then
		for k, v in pairs(LOCALIZED_CLASS_NAMES_FEMALE) do
			if class == v then
				class = k
			end
		end
	end

	local color = class and RAID_CLASS_COLORS[class] or { r = 1, g = 1, b = 1 }

	return format('|cFF%02x%02x%02x', color.r * 255, color.g * 255, color.b * 255)
end

function EFL:BasicUpdateFriends(button)
	local nameText, nameColor, infoText, broadcastText, _, Cooperate
	if button.buttonType == FRIENDS_BUTTON_TYPE_WOW then
		local name, level, class, area, connected, status = GetFriendInfo(button.id)
		broadcastText = nil
		if connected then
			button.status:SetTexture(EFL.StatusIcons[self.db.StatusIconPack][(status == CHAT_FLAG_DND and 'DND' or status == CHAT_FLAG_AFK and 'AFK' or 'Online')])
			nameText = format('%s%s - (%s - %s %s)', EFL:ClassColorCode(class), name, class, LEVEL, level)
			nameColor = FRIENDS_WOW_NAME_COLOR
			Cooperate = true
		else
			button.status:SetTexture(EFL.StatusIcons[self.db.StatusIconPack].Offline)
			nameText = name
			nameColor = FRIENDS_GRAY_COLOR
		end
		infoText = area
	elseif button.buttonType == FRIENDS_BUTTON_TYPE_BNET and BNConnected() then
		local presenceID, presenceName, battleTag, isBattleTagPresence, toonName, toonID, client, isOnline, lastOnline, isAFK, isDND, messageText, noteText, isRIDFriend, messageTime, canSoR = BNGetFriendInfo(button.id)
		local realmName, realmID, faction, race, class, zoneName, level, gameText
		broadcastText = messageText
		local characterName = toonName
		if presenceName then
			nameText = presenceName
			if isOnline then
				characterName = BNet_GetValidatedCharacterName(characterName, battleTag, client)
			end
		else
			nameText = UNKNOWN
		end

		if characterName then
			_, _, _, realmName, realmID, faction, race, class, _, zoneName, level, gameText = BNGetGameAccountInfo(toonID)
			if client == BNET_CLIENT_WOW then
				if (level == nil or tonumber(level) == nil) then level = 0 end
				local classcolor = EFL:ClassColorCode(class)
				local diff = level ~= 0 and format('|cFF%02x%02x%02x', GetQuestDifficultyColor(level).r * 255, GetQuestDifficultyColor(level).g * 255, GetQuestDifficultyColor(level).b * 255) or '|cFFFFFFFF'
				nameText = format('%s |cFFFFFFFF(|r%s%s|r - %s %s%s|r|cFFFFFFFF)|r', nameText, classcolor, characterName, LEVEL, diff, level)
				Cooperate = CanCooperateWithGameAccount(toonID)
			else
				nameText = format('|cFF%s%s|r', EFL.ClientColor[client] or 'FFFFFF', nameText)
			end
		end

		if isOnline then
			button.status:SetTexture(EFL.StatusIcons[self.db.StatusIconPack][(isDND and 'DND' or isAFK and 'AFK' or 'Online')])
			if client == BNET_CLIENT_WOW then
				if not zoneName or zoneName == '' then
					infoText = UNKNOWN
				else
					if realmName == EFL.MyRealm then
						infoText = zoneName
					else
						infoText = format('%s - %s', zoneName, realmName)
					end
				end
				button.gameIcon:SetTexture(EFL.GameIcons[faction][self.db[faction]])
			else
				infoText = gameText
				button.gameIcon:SetTexture(EFL.GameIcons[client][self.db[client]])
			end
			nameColor = FRIENDS_BNET_NAME_COLOR
		else
			button.status:SetTexture(EFL.StatusIcons[self.db.StatusIconPack].Offline)
			nameColor = FRIENDS_GRAY_COLOR
			infoText = lastOnline == 0 and FRIENDS_LIST_OFFLINE or format(BNET_LAST_ONLINE_TIME, FriendsFrame_GetLastOnline(lastOnline))
		end
	end

	if button.summonButton:IsShown() then
		button.gameIcon:SetPoint('TOPRIGHT', -50, -2)
	else
		button.gameIcon:SetPoint('TOPRIGHT', -21, -2)
	end

	if nameText then
		button.name:SetText(nameText)
		button.name:SetTextColor(nameColor.r, nameColor.g, nameColor.b)
		button.info:SetText(infoText)
		button.info:SetTextColor(.49, .52, .54)
		if Cooperate then
			button.info:SetTextColor(1, .96, .45)
		end
		button.name:SetFont(PA.LSM:Fetch('font', self.db.NameFont), self.db.NameFontSize, self.db.NameFontFlag)
		button.info:SetFont(PA.LSM:Fetch('font', self.db.InfoFont), self.db.InfoFontSize, self.db.InfoFontFlag)
	end
end

function EFL:Initialize()
	self:SetupProfile()
	hooksecurefunc('FriendsFrame_UpdateFriendButton', function(button) EFL:BasicUpdateFriends(button) end)
end