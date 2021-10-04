local Mod = GameMain:GetMod("rerollstatsmod");

execLimit = 50

function findPropertyPanel(wnd)
    if not wnd.GetChildren then 
        return 
    end

    local children = wnd:GetChildren()

    for i=1,children.Length do 
        local child = children[i-1]
        if child and child.name == "PropertyPanel" then 
            return child 
        end

        local foundPanel = findPropertyPanel(child)
        if foundPanel then 
            return foundPanel
        end
    end

    return nil
end

function Mod:OnInit()
    Mod:Log("Init")
end

function Mod:OnRender(dt)
    local charUIExists = CS.Wnd_NpcGentrate.Instance ~= nil and 
    CS.Wnd_NpcGentrate.Instance.isShowing and
    Mod.CharUI
    
    if charUIExists then
        local npcPanel = findPropertyPanel(GRoot.inst)        
        Mod.CharUI:SetupUI(npcPanel)
    end
end


function Mod:Log(...)
    local arg = {...};
    local str = "[RerollStats] ";
    for i, v in ipairs(arg) do
        if v ~= nil then
            str = str .. tostring(v) .. " "
        else
            str = str .. "nil "
        end
    end
    print(str)
end