--ex3 Declare um cursor  com parâmetros com USING, que receba um estado (hub_state) como parâmetro, e exiba todos os hubs desse estado. 
 DO $$
 DECLARE 
 v_estado varchar(10) = 'SP';
 v_nome VARCHAR;
 tupla RECORD;
 cur_hubs_estado CURSOR (nome VARCHAR (100), estado VARCHAR(10) )
 					FOR SELECT hub_nome FROM hubs
					 WHERE hub_estado = v_estado;
BEGIN 
OPEN cur_hubs_estado (v_nome, v_estado);
 
LOOP
FETCH cur_hubs_estado INTO tupla;
EXIT WHEN NOT FOUND;
 RAISE NOTICE '%', tupla;
END LOOP;
 
CLOSE cur_hubs_estado;
END; $$

-- --ex2 selecione a hub_state do hub com hub_id = 2, e use CASE para exibir: "Sul" se o estado for RS "Sudeste" se for SP "Outro" para qualquer outro
-- do $$
-- DECLARE
-- 	estado VARCHAR(10);
-- 	nome VARCHAR(100);
-- BEGIN
-- 	SELECT hub_estado INTO estado FROM hubs;
-- 	SELECT hub_nome INTO nome FROM hubs;
-- 	CASE  
-- 	WHEN estado IN ('RS', 'PR', 'SC') 
-- 		THEN RAISE NOTICE 'É DO SUL';
-- 		RAISE NOTICE ' O HUB % ', nome ;
-- 	WHEN estado IN ('SP', 'RJ', 'ES', 'MG' )
-- 		THEN RAISE NOTICE 'É DE SUDOESTE';
-- 		RAISE NOTICE ' O HUB % ', nome ;
-- 	WHEN estado IN ('AC', 'AP', 'AM', 'PA', 'RO', 'RR', 'TO' )
-- 		THEN RAISE NOTICE 'É DO NORTE';
-- 		RAISE NOTICE ' O HUB % ', nome ;
-- 	WHEN estado IN ('ACL', 'AP', 'BA', 'CE', 'MA', 'PB', 'PE', 'PI','RN', 'SE'  )
-- 		THEN RAISE NOTICE 'É DO NORDESTE';
-- 		RAISE NOTICE ' O HUB % ', nome ;
-- 	END CASE;
-- END;$$

--aprimorado 
-- do $$
-- DECLARE
-- 	estado VARCHAR(10);
-- 	nome VARCHAR(100);
-- 	cur_regioes CURSOR FOR SELECT hub_estado, hub_nome FROM hubs;
-- 	regioes RECORD;
-- BEGIN
-- OPEN cur_regioes;
-- 	LOOP
-- 		FETCH cur_regioes INTO regioes;
-- 			CASE  
-- 			WHEN regioes.hub_estado IN ('RS', 'PR', 'SC') 
-- 				THEN RAISE NOTICE 'O HUB: %   É DO SUL ', regioes.hub_nome ;
-- 			WHEN regioes.hub_estado IN ('SP', 'RJ', 'ES', 'MG' )
-- 				THEN RAISE NOTICE 'O HUB: % É DE SUDOESTE ', regioes.hub_nome ;
-- 			WHEN regioes.hub_estado IN ('AC', 'AP', 'AM', 'PA', 'RO', 'RR', 'TO' )
-- 				THEN RAISE NOTICE 'O HUB: % É DO NORTE', regioes.hub_nome ;
-- 			WHEN regioes.hub_estado IN ('AL', 'AP', 'BA', 'CE', 'MA', 'PB', 'PE', 'PI','RN', 'SE'  )
-- 				THEN RAISE NOTICE 'O HUB: %  É DO NORDESTE', regioes.hub_nome ;
-- 			END CASE;
-- 		EXIT WHEN NOT FOUND;
-- 	END LOOP;
-- CLOSE cur_regioes;
-- END;$$



--ex1  verifique se o número total de hubs é maior que 5. Se sim, exiba uma mensagem: "Muitos hubs!", senão: "Poucos hubs!"
-- DO $$
-- DECLARE 
-- 	num_hubs INT ;
	
-- BEGIN

-- 	SELECT COUNT(*) FROM hubs INTO num_hubs	;
	
-- 	IF 	num_hubs > 5 
-- 		THEN RAISE NOTICE 'EXISTEM % hubs   Muitos Hubs', num_hubs ;
-- 	ELSE 
-- 		RAISE NOTICE 'EXISTEM % hubs  Pouco Hubs', num_hubs;
-- 	END IF;
-- END;
-- $$

select*from hubs;
-----------HUBS
CREATE TABLE hubs(
	hub_id SERIAL PRIMARY KEY, 
	hub_nome VARCHAR(100), 
	hub_cidade VARCHAR (200),
	hub_estado VARCHAR (100),
	hub_latitude  DECIMAL(10, 8) NOT NULL,
	hub_longitude DECIMAL(10, 8) NOT NULL  
	)


