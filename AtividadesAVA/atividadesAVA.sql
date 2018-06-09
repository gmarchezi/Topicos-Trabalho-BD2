FUNCTION PYTHON:

CREATE OR REPLACE FUNCTION quantidade_loops (a integer)
 RETURNS varchar(100) AS $$
  import timeit as tm
  global contador
  global res
  contador=0
  start = tm.timeit()
  print "Inicio do processo"
  if a > 1:
    for i in range(10):
      contador=contador+1
      end = tm.timeit()
      res=end - start
    return "valor total foi: "+str(res)
    
 return "valor para loop deve ser maior que 1” 
 
 $$ LANGUAGE plpython2u;


TRIGGER:

CREATE FUNCTION public.checkmodelojaexiste()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE NOT LEAKPROOF 
AS $BODY$

 BEGIN
IF EXISTS 
(SELECT m1.nome_modelo, m2.nome_modelo
FROM modelo m1, modelo m2 WHERE m1.nome_modelo = m2.nome_modelo AND m1.id_modelo != m2.id_modelo 
 AND m1.nome_modelo IS NOT NULL AND m2.nome_modelo IS NOT NULL) 
THEN
RAISE EXCEPTION 'Erro: modelo ja se encontra na banco de dados!'; 
END IF; 
RETURN NULL; 
END 

$BODY$;

CREATE TRIGGER checkmodeloTrigger AFTER INSERT OR UPDATE OF nome_modelo ON modelo
FOR EACH ROW
EXECUTE PROCEDURE checkmodelojaexiste();


CREATE FUNCTION public.checkCNPJjaexiste()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE NOT LEAKPROOF 
AS $BODY$

 BEGIN
IF EXISTS 
(SELECT c1.cpnj_cpf, c2.cpnj_cpf
FROM cliente c1, cliente c2 WHERE c1.cnpj_cpf = c2.cnpj_cpf AND c1.id_cliente != c2.id_cliente 
 AND c1.cnpj_cpf IS NOT NULL AND c2.cnpj_cpf IS NOT NULL) 
THEN
RAISE EXCEPTION 'Erro: CNPJ ou CPF ja se encontra na banco de dados!'; 
END IF; 
RETURN NULL; 
END 

$BODY$;

CREATE TRIGGER checkCNPJTrigger AFTER INSERT OR UPDATE OF cnpj_cpf ON cliente
FOR EACH ROW
EXECUTE PROCEDURE checkCNPJjaexiste();


CREATE VIEW relatorio_veiculo_fin_seguro AS
    SELECT v.nome_veiculo, v.chassi, v.placa,
    m.nome_modelo, m.ano, 
    s.seguradora, s.plano, s.valor     
    FROM veiculo v
    JOIN seguro s ON s.id_seguro = v.id_seguro
    JOIN modelo m ON m.id_modelo = v.id_modelo

    WHERE v.status = 1 AND CURRENT_DATE + integer '5' = s.fin_contrato AND s.status = 1

SELECT * FROM relatorio_veiculo_fin_seguro

CREATE VIEW relatorio_mes_servico AS
    SELECT c.nome as nome_cliente, c.cnpj_cpf, s.id_servico,
    s.valor_contrato, s.origem, s.destino, v.nome_veiculo 
    FROM servico s 
    JOIN cliente c ON c.id_cliente = s.id_cliente
    JOIN veiculo_servico vs ON vs.id_servico = s.id_servico
    JOIN veiculo v ON v.id_veiculo = vs.id_veiculo

    WHERE CONCAT(DATE_PART('YEAR', CURRENT_TIMESTAMP),'-', DATE_PART('MONTH', CURRENT_TIMESTAMP), '-01') <= s.data_fin
    AND
    CONCAT(DATE_PART('YEAR', CURRENT_TIMESTAMP),'-', DATE_PART('MONTH', CURRENT_TIMESTAMP), '-31') >= s.data_fin

SELECT * FROM relatorio_mes_servico
