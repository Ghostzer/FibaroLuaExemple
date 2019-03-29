--[[
%% properties
55 value 
%% events
%% globals
--]]

-- Trigger : numéro de la porte. Dès que la valeur change, le script se charge : 55 plus haut.

-- Init des variables
local maPorte
local nbPorte
local maLumiere
local detectionMouvement
local timer
local mouvement

-- Set des variables
nbPorte=55
maLumiere=97
detectionMouvement=112
maPorte= fibaro:getValue(nbPorte, 'value')
timer=60000 -- en ms


if (maPorte = '1') then -- on vérifie que la porte est bien ouverte
  fibaro:call (maLumiere, 'turnOn') -- on allume la lumière
  fibaro:call (detectionMouvement, 'turnOn') -- on allume le detecteur de mouvement
  sleep(timer) -- sleep pendant 60sec
  mouvement = fibaro:getValue(detectionMouvement, 'value')
  if (mouvement = '0') then
    fibaro:call (maLumiere, 'turnOff') -- on allume la lumière
  end

end