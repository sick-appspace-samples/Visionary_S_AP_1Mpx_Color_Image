--Start of Global Scope---------------------------------------------------------
local gCamera = Image.Provider.Camera.create()
local gViewer = View.create("viewer2d")
--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

---Handle function for the "OnNewImage" event
---@param images Image[] Array of images received from the Image.Provider
local function handleOnNewImage(images, _)
  -- calculating full res rgb map: expected duration ~6 ms
  local fullResRgb = Image.demosaic(images[2],'BAYER_RGGB_TO_RGB24')
  -- update the full resolution color image in the 2d viewer
  gViewer:clear()
  gViewer:addImage(fullResRgb)
  gViewer:present()
end
-- register the above function the the "OnNewImage" event
Image.Provider.Camera.register(gCamera, "OnNewImage", handleOnNewImage)

--End of Function and Event Scope-----------------------------------------------

---The initial "main" function, which is executed on startup of the app
local function main()
  gCamera:stop()
  local config = gCamera:getDefaultConfig()
  config:setMaps({ "z_u16", "image_rgba"})
  config:setStereoIntegrationTime(2000)
  config:setColorIntegrationTime(50000)
  -- settings for fullres RGB
  config:setColorImagerMode('RGGB')
  gCamera:setAutoConvertRGB(false)
  -- apply config and start frontend
  gCamera:setConfig(config)
  gCamera:start()
end
Script.register("Engine.OnStarted", main)
