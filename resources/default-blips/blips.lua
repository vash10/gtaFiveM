local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},
	-- Postes de polices
	{title="Poste de Polices", colour=29, id=60, x=-445.202, y=6014.36, z=31.7164},
	{title="Poste de Polices", colour=29, id=60, x=1854.21, y=3685.51, z=34.2671},
	{title="Poste de Polices", colour=29, id=60, x=642.001, y=0.638351, z=82.7869},
	{title="Poste de Polices", colour=29, id=60, x=-1198.25, y=-845.297, z=19.317},
	{title="Poste de Polices", colour=29, id=60, x=436.811, y=-982.757, z=30.6986},
	{title="Poste de Polices", colour=29, id=60, x=360.624, y=-1584.47, z=29.2919},
	{title="Poste de Polices", colour=29, id=60, x=825.987, y=-1290.03, z=28.2407},
	-- Casernes de pompiers
	{title="Caserne de Pompiers", colour=1, id=60, x=215.786, y=-1642.49, z=29.7138},
	{title="Caserne de Pompiers", colour=1, id=60, x=1202.38, y=-1460.13, z=34.7642},
	{title="Caserne de Pompiers", colour=1, id=60, x=-1087.93, y=-2374.1, z=13.9451},
	{title="Caserne de Pompiers", colour=1, id=60, x=-379.942, y=6118.73, z=31.8456},
	{title="Caserne de Pompiers", colour=1, id=60, x=-635.992, y=-121.635, z=39.0138},
	{title="Caserne de Pompiers", colour=1, id=60, x=1697.26, y=3585.46, z=35.5443},
	{title="Caserne de Pompiers", colour=1, id=60, x=-2113.74, y=2831.58, z=32.8093},
	-- Centre médicaux
	{title="Centre Médical", colour=0, id=61, x=337.238, y=-1396.28, z=32.5092},
	{title="Centre Médical", colour=0, id=61, x=-450.586, y=-340.387, z=34.5014},
	{title="Centre Médical", colour=0, id=61, x=1839.74, y=3672.0, z=34.2767},
	{title="Centre Médical", colour=0, id=61, x=360.222, y=-582.222, z=28.8212},
	{title="Centre Médical", colour=0, id=61, x=-243.463, y=6327.87, z=32.4262},
	{title="Centre Médical", colour=0, id=61, x=-677.003, y=310.929, z=83.0841},
	{title="Centre Médical", colour=0, id=61, x=1151.31, y=-1529.95, z=34.9904},
	{title="Centre Médical", colour=0, id=61, x=-874.614, y=-308.375, z=39.5448},
	-- Garages de réparations
	{title="Garage de Réparations", colour=31, id=50, x=-356.146, y=-134.69, z=39.0097},
	{title="Garage de Réparations", colour=31, id=50, x=723.013, y=-1088.92, z=22.1829},
	{title="Garage de Réparations", colour=31, id=50, x=-1145.67, y=-1991.17, z=13.162},
	{title="Garage de Réparations", colour=31, id=50, x=1174.76, y=2645.46, z=37.7545},
	{title="Garage de Réparations", colour=31, id=50, x=112.275, y=6619.83, z=31.8154},
	{title="Garage de Réparations", colour=31, id=50, x=-207.978, y=-1309.64, z=-31.2939},
	-- Distributeurs de Billets
	--{title="Distributeur de Billets", colour=2, id=431, x=89.9733, y=2.18227, z=68.2283},
	--{title="Distributeur de Billets", colour=2, id=431, x=-526.065, y=-1221.99, z=18.4549},
	--{title="Distributeur de Billets", colour=2, id=431, x=711.389, y=-820.833, z=23.6155},
	--{title="Distributeur de Billets", colour=2, id=431, x=-2073.44, y=-317.245, z=13.316},
	--{title="Distributeur de Billets", colour=2, id=431, x=-821.17, y=-1083.29, z=11.1324},
	--{title="Distributeur de Billets", colour=2, id=431, x=1686.4, y=4816.36, z=42.0092},
	-- Banques
    {title="Banques", colour=2, id=434, x=150.266, y=-1040.203, z=29.374},
    {title="Banques", colour=2, id=434, x=-1212.980, y=-330.841, z=37.787},
    {title="Banques", colour=2, id=434, x=-2962.582, y=482.627, z=15.703},
    {title="Banques", colour=2, id=434, x=-112.202, y=6469.295, z=31.626},
    {title="Banques", colour=2, id=434, x=314.187, y=-278.621, z=54.170},
    {title="Banques", colour=2, id=434, x=-351.534, y=-49.529, z=49.042},
    {title="Banques", colour=2, id=434, x=241.727, y=220.706, z=106.286},
	-- Aéroport
    {title="Aéroport", colour=3, id=280, x=-1032.690, y=-2728.141, z=13.757},
	{title="Aéroport", colour=3, id=90, x=1381.74, y=31330.03, z=40.8172},
	{title="Aéroport", colour=3, id=90, x=2044.42, y=4768.07, z=41.0603},
	{title="Aéroport", colour=3, id=90, x=1743.6820, y=3286.2510, z=40.087},
    -- Magasins
    {title="Magasin", colour=5, id=52, x=28.463, y=-1353.033, z=29.340},
    {title="Magasin", colour=5, id=52, x=-54.937, y=-1759.108, z=29.005},
    {title="Magasin", colour=5, id=52, x=375.858, y=320.097, z=103.433},
    {title="Magasin", colour=5, id=52, x=1143.813, y=-980.601, z=46.205},
    {title="Magasin", colour=5, id=52, x=1695.284, y=4932.052, z=42.078},
    {title="Magasin", colour=5, id=52, x=2686.051, y=3281.089, z=55.241},
    {title="Magasin", colour=5, id=52, x=1967.648, y=3735.871, z=32.221},
    {title="Magasin", colour=5, id=52, x=-2977.137, y=390.652, z=15.024},
    {title="Magasin", colour=5, id=52, x=1160.269, y=-333.137, z=68.783},
    {title="Magasin", colour=5, id=52, x=-1492.784, y=-386.306, z=39.798},
    {title="Magasin", colour=5, id=52, x=-1229.355, y=-899.230, z=12.263},
    {title="Magasin", colour=5, id=52, x=-712.091, y=-923.820, z=19.014},
    {title="Magasin", colour=5, id=52, x=-1816.544, y=782.072, z=137.600},
    {title="Magasin", colour=5, id=52, x=1729.689, y=6405.970, z=34.453},
    {title="Magasin", colour=5, id=52, x=2565.705, y=385.228, z=108.463},
    -- Magasins de vêtements
    {title="Magasin de vêtements", colour=8, id=73, x=88.291, y=-1391.929, z=29.200},
    {title="Magasin de vêtements", colour=8, id=73, x=-718.985, y=-158.059, z=36.996},
    {title="Magasin de vêtements", colour=8, id=73, x=-151.204, y=-306.837, z=38.724},
    {title="Magasin de vêtements", colour=8, id=73, x=414.646, y=-807.452, z=29.338},
    {title="Magasin de vêtements", colour=8, id=73, x=-815.193, y=-1083.333, z=11.022},
    {title="Magasin de vêtements", colour=8, id=73, x=-1208.098, y=-782.020, z=17.163},
    {title="Magasin de vêtements", colour=8, id=73, x=-1457.954, y=-229.426, z=49.185},
    {title="Magasin de vêtements", colour=8, id=73, x=-2.777, y=6518.491, z=31.533},
    {title="Magasin de vêtements", colour=8, id=73, x=1681.586, y=4820.133, z=42.046},
    {title="Magasin de vêtements", colour=8, id=73, x=130.216, y=-202.940, z=54.505},
    {title="Magasin de vêtements", colour=8, id=73, x=618.701, y=2740.564, z=41.905},
    {title="Magasin de vêtements", colour=8, id=73, x=1199.169, y=2694.895, z=37.866},
    {title="Magasin de vêtements", colour=8, id=73, x=-3164.172, y=1063.927, z=20.674},
    {title="Magasin de vêtements", colour=8, id=73, x=-1091.373, y=2702.356, z=19.422},
    -- Magasins d'armes
    --{title="Magasin d'armes", colour=21, id=110, x=1701.292, y=3750.450, z=34.365},
    --{title="Magasin d'armes", colour=21, id=110, x=237.428, y=-43.655, z=69.698},
    --{title="Magasin d'armes", colour=21, id=110, x=843.604, y=-1017.784, z=27.546},
    --{title="Magasin d'armes", colour=21, id=110, x=-321.524, y=6072.479, z=31.299},
    --{title="Magasin d'armes", colour=21, id=110, x=-664.218, y=-950.097, z=21.509},
    --{title="Magasin d'armes", colour=21, id=110, x=-1320.983, y=-389.260, z=36.483},
    --{title="Magasin d'armes", colour=21, id=110, x=-1109.053, y=2686.300, z=18.775},
    --{title="Magasin d'armes", colour=21, id=110, x=2568.379, y=309.629, z=108.461},
    --{title="Magasin d'armes", colour=21, id=110, x=-3157.450, y=1079.633, z=20.692},
    --[[ Station-essence
    {title="Station-essence", colour=1, id=361, x=49.4187,   y=2778.793,  z=58.043},
    {title="Station-essence", colour=1, id=361, x=263.894,   y=2606.463,  z=44.983},
    {title="Station-essence", colour=1, id=361, x=1039.958,  y=2671.134,  z=39.550},
    {title="Station-essence", colour=1, id=361, x=1207.260,  y=2660.175,  z=37.899},
    {title="Station-essence", colour=1, id=361, x=2539.685,  y=2594.192,  z=37.944},
    {title="Station-essence", colour=1, id=361, x=2679.858,  y=3263.946,  z=55.240},
    {title="Station-essence", colour=1, id=361, x=2005.055,  y=3773.887,  z=32.403},
    {title="Station-essence", colour=1, id=361, x=1687.156,  y=4929.392,  z=42.078},
    {title="Station-essence", colour=1, id=361, x=1701.314,  y=6416.028,  z=32.763},
    {title="Station-essence", colour=1, id=361, x=179.857,   y=6602.839,  z=31.868},
    {title="Station-essence", colour=1, id=361, x=-94.4619,  y=6419.594,  z=31.489},
    {title="Station-essence", colour=1, id=361, x=-2554.996, y=2334.40,  z=33.078},
    {title="Station-essence", colour=1, id=361, x=-1800.375, y=803.661,  z=138.651},
    {title="Station-essence", colour=1, id=361, x=-1437.622, y=-276.747,  z=46.207},
    {title="Station-essence", colour=1, id=361, x=-2096.243, y=-320.286,  z=13.168},
    {title="Station-essence", colour=1, id=361, x=-724.619, y=-935.1631,  z=19.213},
    {title="Station-essence", colour=1, id=361, x=-526.019, y=-1211.003,  z=18.184},
    {title="Station-essence", colour=1, id=361, x=-70.2148, y=-1761.792,  z=29.534},
    {title="Station-essence", colour=1, id=361, x=265.648,  y=-1261.309,  z=29.292},
    {title="Station-essence", colour=1, id=361, x=819.653,  y=-1028.846,  z=26.403},
    {title="Station-essence", colour=1, id=361, x=1208.951, y= -1402.567, z=35.224},
    {title="Station-essence", colour=1, id=361, x=1181.381, y= -330.847,  z=69.316},
    {title="Station-essence", colour=1, id=361, x=620.843,  y= 269.100,  z=103.089},
    {title="Station-essence", colour=1, id=361, x=2581.321, y=362.039, 108.468},--]]
  }

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)
