echo **************************************************
echo "inicio do processo completo"
echo %time%
set TEMP_INICIO_COMPLETO=%time%

echo **************************************************

echo "inicio do processo de criação das tabelas"
set TEMP_INICIO_LOCACAO=%time%
psql -h localhost -d locadora_populado -U postgres -p 5432 -a -W -f script_criar_tabelas_bd_locacao.sql
echo "inicio do processo de criação das tabelas" %TEMP_INICIO_LOCACAO%
set TEMP_FIM_LOCACAO=%time%
echo "fim do processo de criação das tabelas" %TEMP_FIM_LOCACAO%

echo **************************************************

echo "inicio do processo insercao categoria"
set TEMP_INICIO_CATEGORIA=%time%
psql -h localhost -d locadora_populado -U postgres -p 5432 -q -W -f script_InsertCategoria.sql
echo "inicio do processo insercao categoria" %TEMP_INICIO_CATEGORIA%
set TEMP_FIM_CATEGORIA=%time%
echo "fim do processo de criação das tabelas" %TEMP_FIM_CATEGORIA%

echo **************************************************

echo "inicio do processo insercao CLIENTE"
set TEMP_INICIO_CLIENTE=%time%
psql -h localhost -d locadora_populado -U postgres -p 5432 -q -W -f script_InsertCliente.sql
echo "inicio do processo insercao CLIENTE" %TEMP_INICIO_CLIENTE%
set TEMP_FIM_CLIENTE=%time%
echo "fim do processo de criação das tabelas" %TEMP_FIM_CLIENTE%

echo **************************************************

echo "inicio do processo insercao FILMES"
set TEMP_INICIO_FILMES=%time%
psql -h localhost -d locadora_populado -U postgres -p 5432 -q -W -f script_InsertFilme.sql
echo "inicio do processo insercao FILMES" %TEMP_INICIO_FILMES%
set TEMP_FIM_FILMES=%time%
echo "fim do processo de criação das tabelas" %TEMP_FIM_FILMES%

echo **************************************************

echo "inicio do processo insercao LOCACAO"
set TEMP_INICIO_LOCACAO=%time%
psql -h localhost -d locadora_populado -U postgres -p 5432 -q -W -f script_InsertLocacao.sql
echo "inicio do processo insercao LOCACAO" %TEMP_INICIO_LOCACAO%
set TEMP_FIM_LOCACAO=%time%
echo "fim do processo de criação das tabelas" %TEMP_FIM_LOCACAO%

echo **************************************************

RESUMO
echo "inicio geral do processo" %TEMP_INICIO_COMPLETO%

echo "inicio do processo de criação das tabelas" %TEMP_INICIO_LOCACAO%
echo "fim do processo de criação das tabelas" %TEMP_FIM_LOCACAO%
echo "inicio do processo insercao categoria" %TEMP_INICIO_CATEGORIA%
echo "fim do processo de criação das tabelas" %TEMP_FIM_CATEGORIA%
echo "inicio do processo insercao CLIENTE" %TEMP_INICIO_CLIENTE%
echo "fim do processo de criação das tabelas" %TEMP_FIM_CLIENTE%
echo "inicio do processo insercao LOCACAO" %TEMP_INICIO_LOCACAO%
echo "fim do processo de criação das tabelas" %TEMP_FIM_LOCACAO%

echo "final do processo completo %time%