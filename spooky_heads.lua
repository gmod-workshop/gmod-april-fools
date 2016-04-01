local showHead = CreateClientConVar( "SpookyScaryHeads", "1", true, true )
 
chat.AddText(Color(255,255,255),"Put ",Color(255,0,0),"\"SpookyScaryHeads 0\"`",Color(255,255,255)," in console to disable april fools.")
 
hook.Add("PostPlayerDraw","DrawSpookyScaryHeads",function(ply)
  if ply == LocalPlayer() or not ply:Alive() then return end
  if not showHead:GetBool() then return end
 
  if not IsValid(LocalPlayer().SpookySkeletonHead) then LocalPlayer().SpookySkeletonHead = ents.CreateClientProp("models/Gibs/HGIBS.mdl") end
  local head = LocalPlayer().SpookySkeletonHead
  local matrix = ply:GetBoneMatrix(ply:LookupBone("ValveBiped.Bip01_Head1"))
  if not matrix then return end
 
  matrix:Scale(Vector(2.5,2.5,2.5))
  matrix:Rotate(Angle(0,-90,-90))
 
  if ply:SteamID() == "STEAM_0:1:20046983" then //Steamd IDs here will have rainbow heads
    render.SetColorModulation(math.random(),math.random(),math.random())
  end
 
  render.SuppressEngineLighting( true )
 
  head:EnableMatrix("RenderMultiply",matrix)
    head:DrawModel()
  head:DisableMatrix("RenderMultiply")
 
  render.SetColorModulation(1,1,1)
  render.SuppressEngineLighting( false )
end)