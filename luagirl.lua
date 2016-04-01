
local enabled = CreateClientConVar("AX_AprilFools","1")
chat.AddText(Color(255,255,255),"Put ",Color(255,0,0),"\"AX_AprilFools 0\"`",Color(255,255,255)," in console to disable april fools.")

if IsValid(LocalPlayer().luagirl) then LocalPlayer().luagirl:Remove() end

hook.Add("PostPlayerDraw","AprilFools",function(ply)
  if not IsValid(LocalPlayer().luagirl) then
    LocalPlayer().luagirl = ents.CreateClientProp("prop_physics")
    LocalPlayer().luagirl:SetModel("models/props_lab/huladoll.mdl")
  end

  if not enabled:GetBool() then return end

  local bone = ply:LookupBone("ValveBiped.Bip01_R_Shoulder")
  if not bone then return end

  local playerhead = ply:GetBoneMatrix(bone)
    playerhead:Scale(Vector(1.5,1.5,1.5))
    playerhead:Rotate(Angle(0,-90,110))
    playerhead:Translate(Vector(0,0,1))

  LocalPlayer().luagirl:EnableMatrix("RenderMultiply",playerhead)
    LocalPlayer().luagirl:DrawModel()
  LocalPlayer().luagirl:DisableMatrix("RenderMultiply")
end)
