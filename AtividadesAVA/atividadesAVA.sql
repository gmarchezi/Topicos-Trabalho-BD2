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
