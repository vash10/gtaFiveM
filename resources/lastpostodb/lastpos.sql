--
-- Vous pouvez remplacer {-887.48388671875, -2311.68872070313,  -3.50776553153992, 142.503463745117} par la position par defaut où seront spawn les nouveaux utilisateurs
--
ALTER TABLE `users` ADD COLUMN lastpos VARCHAR(255) DEFAULT '{-1037.79388671875, -2738.11872070313,  20.16776553153992, 142.503463745117}';