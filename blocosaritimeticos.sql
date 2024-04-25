DO $$
DECLARE 
    cod INTEGER := 1;
    nome_completo VARCHAR(200) := 'Maria Joaquina';
---3 digitos no total, dois para valores decimais
    salario NUMERIC (13,2) := 20.5;
BEGIN
 	RAISE NOTICE 'Meu código é %, me chamo % e meu salario é R$ %', cod, nome_completo, salario;
END; $$

DO $$
DECLARE
	n1 INTEGER :=5;
	n2 INTEGER :=2;
	n3 NUMERIC (5,2) := 5;
	n4 INTEGER := -5;
BEGIN
	---adicao
	RAISE NOTICE '% + % = %', n1, n2, n1 + n2;
	--- + uniario: sem efeito
	RAISE NOTICE '%', || n1;
	--- subtracao
	RAISE NOTICE '% - % = %', n1, n2, n1 - n2;
	--- multiplicacao
	RAISE NOTICE '% * % = %', n1, n2, n1 * n2;
	--- divisao (para inteiros, trunca o resultado em direcao ao zero)
	RAISE NOTICE '% / % = %', n1, n2, n1 / n2;
    --- divisao (se envolve um real, a divisao é real)
	RAISE NOTICE '% / % = %', n3, n2, n3 / n2;
     	--- divisao (formatada)
 	RAISE NOTICE '% / % = %', n3, n2, to_char(n3 / n2, '99.99');
 	--- resto  da divisao
 	--- usamos %% oara escapar um %
 	RAISE NOTICE '% %% % = %', n1, n2, n1 % n2;
 	--- exponenciacao
 	RAISE NOTICE '% ^ % = %', n1, n2, n1 ^ n2;
 	--- raiz quadrad
 	RAISE NOTICE '|/ % = %', n1, n2, |/ n1 = n2;
 	--- raiz cubica
 	RAISE NOTICE '||/ % = %', n1, ||/ n1;
 	--- valor absoluto
 	RAISE NOTICE '@% = % e @% = %', n1, @n1, n4, @n4;
 END; $$

DO $$
DECLARE
 	n1 NUMERIC (5,2);
 	n2 INTEGER;
 	limite_inferior INTEGER := 5;
 	limite_superior integer :=17;
 BEGIN
 	-- 0 < n1 < 1 (real)
 	n1 := random();
 	RAISE NOTICE '%', n1;
 	-- 1 <= n1 < 10 (real)
 	n1 := random() * 10 + 1;
 	RAISE NOTICE '%', n1;
 	-- 1 < = n2 < 10 (:: faz type cast) (floor arredonda para baixo)
 	n2 := floor(random()* 10 + 1):: int;
 	RAISE NOTICE '%', n2;
 	-- limite_inferior <= n2 <=limite_superior
 	n2 := floor(random() * (limite_superior - limite_inferior + 1) + limite_inferior)::int;
 	RAISE NOTICE '%', n2;
END$$;