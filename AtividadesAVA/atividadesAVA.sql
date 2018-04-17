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

CREATE FUNCTION checkModelojaExiste() RETURNS TRIGGER AS ' BEGIN
IF EXISTS 
(SELECT m1.nome_modelo, m2.modelo
FROM Modelo m1, Modelo m2 WHERE m1.nome_modelo = m2.nome_modelo) 
THEN
RAISE EXCEPTION ''Erro: modelo ja se encontra na banco de dados!''; END IF; RETURN NULL; END
'
LANGUAGE plpgsql;

CREATE TRIGGER checkModeloTrigger AFTER INSERT OR UPDATE OF nome_modelo ON Modelo
FOR EACH ROW
EXECUTE PROCEDURE checkModelojaExiste();
