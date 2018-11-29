--WiFi Settup
wifi.setmode(wifi.STATION)
local cfg={}
cfg.ssid="MGTS_GPON_4429"
cfg.pwd="S3RSWYXX"
wifi.sta.config(cfg)
cfg = nil
collectgarbage()
