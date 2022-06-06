local QBCore = exports['qb-core']:GetCoreObject()

local function createSkillMenu()
    skillMenu = {}
    skillMenu[#skillMenu + 1] = {
        isHeader = true,
        header = 'Skills',
        isMenuHeader = true,
        icon = 'fas fa-chart-simple'
    }

    for k,v in pairs(Config.Skills) do
        if v['Current'] <= 0 then
            SkillLevel = 'LVL 0'
        elseif v['Current'] >= 0 and v['Current'] <= 20 then
            SkillLevel = 'Level 1'
        elseif v['Current'] >= 20 and v['Current'] <= 30 then
            SkillLevel = 'Level 2'
        elseif v['Current'] >= 30 and v['Current'] <= 40 then
            SkillLevel = 'Level 3'
        elseif v['Current'] >= 40 and v['Current'] <= 50 then
            SkillLevel = 'Level 4'
        elseif v['Current'] >= 50 and v['Current'] <= 60 then
            SkillLevel = 'Level 5'
        elseif v['Current'] >= 60 and v['Current'] <= 70 then
            SkillLevel = 'Level 6'
        elseif v['Current'] >= 70 and v['Current'] <= 80 then
            SkillLevel = 'Level 7'
        elseif v['Current'] >= 80 and v['Current'] <= 90 then
            SkillLevel = 'Level 8'
        elseif v['Current'] >= 90 and v['Current'] <= 100 then
            SkillLevel = 'Level 9'
        else
            SkillLevel = 'Level 10'
        end
        skillMenu[#skillMenu + 1] = {
            header = ''.. k .. '',
            txt = '( '..SkillLevel..' ) Total EXP ( '..round1(v['Current'])..' )',
            icon = ''..v['icon']..'',
            params = {
                args = {
                    v
                }
            }
        }
    end
    exports['qb-menu']:openMenu(skillMenu)
end
    
RegisterCommand(Config.Skillmenu, function()
    createSkillMenu()
end)
