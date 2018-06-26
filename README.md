# FatCat Gestão de Frotas
Trabalho desenvolvido durante a disciplina de BD

# Sumário

### 1	COMPONENTES<br>
Brenno Milanezi, Gabriel Marchezi e Lucas Manço<br>

### 2	INTRODUÇÃO E MOTIVAÇAO<br>
O nosso sistema tem como objetivo a administração de frotas veiculares e se chama FatCat Gestão de Frotas<br>
      
### 3	MINI-MUNDO<br>
<p align="justify">O objetivo do nosso sistema é ser uma forte ferramenta na administração de grandes frotas veiculares tanto para empresas que possuem como produto fim a prestação de serviços veiculares tanto para empresas que possuem outros produtos/serviços fim, como exemplo uma empresa alimentícia que possue uma frota veicular. O sistema atua na administração organizacional e contábil dos veículos, gerando relatórios e comparações.</p><br>
                                                                                                                                                                                           
### 4	RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS)<br>

<br>Link Balsamiq PDF:https://github.com/gmarchezi/Topicos-Trabalho-BD2/blob/master/FatCat.pdf 

![Alt text](https://github.com/gmarchezi/Topicos-Trabalho-BD2/blob/master/Fotos_Balsamiq/Tela%20Ve%C3%ADculo.png "Title")

### 5	MODELO CONCEITUAL<br>
#### 5.1 NOTACAO ENTIDADE RELACIONAMENTO
![Alt text](https://github.com/gmarchezi/Topicos-Trabalho-BD2/blob/master/Modelos/ModeloConceitual_FatCat.jpg "Modelo Conceitual")

#### 5.3 DECISÕES DE PROJETO
    
<p align="justify">Modelo: em nosso projeto optamos por separar modelo do veiculo, pois a classe veiculo estava muito grande e isto poderia prejudicar a manutenibilidade do sistema.<br>

#### 5.4 DESCRIÇÃO DOS DADOS 
    
    Veiculo: Tabela que armazena as informações referentes ao veículo.<br>
        id_veiculo: Chave primária da tabela Veiculo.<br>
        nome_veiculo: Campo que armazena o nome do veiculo.<br>
        placa: Campo que armazena a placa do veículo.<br>
        status: Campo que armazena o status do veículo, ou seja, se ele está em serviço ou não.<br>
        chassi: Campo que armazena a numeração do chassi do veículo.<br>
        id_modelo: Chave secundária, primária da tabela Modelo.<br>
        id_tipo: Chave secundária, primária da tabela Tipo.<br>
        id_financiamento: Chave secundária, primária da tabela financiamento.<br>
        id_seguro: Chave secundária, primária da tabela Seguro.<br>
        
    Modelo: Tabela que armazena informações referentes ao modelo do veículo.<br>
        id_modelo: Chave primária da tabela Modelo.
        altura: Campo que armazena a altura do modelo de veículo.<br>
        marca: Campo que armazena a marca do modelo de veículo.<br>
        largura: Campo que armazena a largura do modelo de veículo.<br>
        peso: Campo que armazena o peso do modelo de veículo.<br>
        capacidade: Campo que armazena a capacidade de carga do modelo de veículo.<br>
        ano: Campo que armazena o ano de fabricação do modelo de veículo.<br>
        eixos: Campo que armazena a quantidade de eixos do modelo de veículo.<br>
        comprimento: Campo que armazena o comprimento do modelo de veículo.<br>
        nome_modelo: Campo que armazena o nome do modelo de veículo.<br>
        
    Seguro: Tabela que armazena informações referentes ao seguro do veículo.<br>
        id_seguro: Chave primária da tabela Seguro.<br>
        seguradora: Campo que armazena o nome da empresa que presta o serviço de seguro.<br>
        plano: Campo que armazena o plano contratado.<br>
        valor: Campo que armazena o valor pago a seguradora pelo serviço.<br>
        data_vencimento: Campo que armazena a data de vencimento do pagamento mensal do serviço.<br>
        fim_contrato: Campo que armazena a data do fim do contrato do serviço.<br>
        status: Campo que armazena se o seguro está ativo ou não.<br>
        
    Tipo_Veiculo: Tabela que armazena informações sobre o tipo do veículo.<br>
        id_tipo: Chave primária da tabela Tipo_Veiculo.<br>
        tipo_combustivel: Campo que armazena o tipo de combustível utilizado pelo veículo.<br>
        nome_tipo: Campo que armazena o tipo do veículo(ex:carro, moto, carreta...).<br>
        
    Financiamento: Tabela que armazena informações do financiamento de determinado veículo.<br>
        id_financiamento: Chave primária da tabela Financiamento.<br>
        financiador: Campo que armazena o nome do financiador.<br>
        num_parcelas: Campo que armazena o número de parcelas do financiamento.<br>
        valor_parcela: Campo que armazena o valor de cada parcela.<br>
        valor_total: Campo que armazena o valor total do financiamento.<br>
    
    Motorista: Tabela que armazena informações de um determinado motorista.<br>
        id_motorista:  Chave primária da tabela Motorista.<br>
        nome: Campo que armazena o nome do motorista.<br>
        cpf: Campo que armazena o cpf do motorista.<br>
        endereco: Campo que armazena o endereço do motorista.<br>
        status: Campo que armazena o status do motorista,ou seja, se está na ativa ou não.<br>
        num_contato: Campo que armazena um telefone de contato do motorista.<br>
        salario: Campo que armazena o valor do salário do motorista.<br>
        refeicao: Campo que armazena o valor do ticket alimentação do motorista.<br>
      
### 6	MODELO LÓGICO<br>

![Alt text](https://github.com/gmarchezi/Topicos-Trabalho-BD2/blob/master/Modelos/ModeloLogico_FatCat.jpg "Modelo Lógico")

### 7	MODELO FÍSICO<br>

Link Modelo Físico: https://github.com/gmarchezi/Topicos-Trabalho-BD2/blob/master/Modelos/Modelo_Fisico_FAT.sql

### 8	INSERT APLICADO NAS TABELAS DO BANCO DE DADOS<br>
#### 8.1 DETALHAMENTO DAS INFORMAÇÕES
        Detalhamento sobre as informações e processo de obtenção ou geração dos dados.
        Referenciar todas as fontes referentes a:
        a) obtenção dos dados
        b) obtenção de códigos reutilizados
        c) fontes de estudo para desenvolvimento do projeto
        
#### 8.2 INCLUSÃO DO SCRIPT PARA CRIAÇÃO DE TABELAS E INSERÇÃO DOS DADOS (ARQUIVO ÚNICO COM):
        a) inclusão das instruções para criação das tabelas e estruturas de amazenamento do BD
        b) inclusão das instruções de inserção dos dados nas referidas tabelas
        c) inclusão das instruções para execução de outros procedimentos necessários

### 9	TABELAS E PRINCIPAIS CONSULTAS<br>
#### 9.1	GERACAO DE DADOS (MÍNIMO DE 10 REGISTROS PARA CADA TABELA NO BANCO DE DADOS)<br>

## Data de Entrega: (18/05/2018)

<br>
OBS: Incluir para os tópicos 9.2 e 9.3 as instruções SQL + imagens (print da tela) mostrando os resultados.<br>

#### 9.2	SELECT DAS TABELAS COM PRIMEIROS 10 REGISTROS INSERIDOS  


SELECT * FROM cliente LIMIT 10
![Alt text](https://github.com/gmarchezi/Topicos-Trabalho-BD2/blob/master/Images/Select/cliente.PNG?raw=true "SELECT * FROM cliente LIMIT 10")

SELECT * FROM financiamento LIMIT 10
![Alt text]( "SELECT * FROM financiamento LIMIT 10")

SELECT * FROM funcionario LIMIT 10
![Alt text](https://github.com/gmarchezi/Topicos-Trabalho-BD2/blob/master/Images/Select/funcionario.PNG?raw=true "SELECT * FROM funcionario LIMIT 10")

SELECT * FROM modelo LIMIT 10
![Alt text](https://github.com/gmarchezi/Topicos-Trabalho-BD2/blob/master/Images/Select/modelo.PNG?raw=true "SELECT * FROM modelo LIMIT 10")

SELECT * FROM seguro LIMIT 10
![Alt text]( "SELECT * FROM seguro LIMIT 10")

SELECT * FROM servico LIMIT 10
![Alt text](https://github.com/gmarchezi/Topicos-Trabalho-BD2/blob/master/Images/Select/servico.PNG?raw=true "SELECT * FROM servico LIMIT 10")

SELECT * FROM tipo_veiculo LIMIT 10
![Alt text](https://github.com/gmarchezi/Topicos-Trabalho-BD2/blob/master/Images/Select/tipo_veiculo.PNG?raw=true "SELECT * FROM tipo_veiculo LIMIT 10")

SELECT * FROM usuario LIMIT 10
![Alt text](https://github.com/gmarchezi/Topicos-Trabalho-BD2/blob/master/Images/Select/usuario.PNG?raw=true "SELECT * FROM usuario LIMIT 10")

SELECT * FROM veiculo LIMIT 10
![Alt text](https://github.com/gmarchezi/Topicos-Trabalho-BD2/blob/master/Images/Select/veiculo.PNG?raw=true "SELECT * FROM veiculo LIMIT 10")

SELECT * FROM veiculo_motorista LIMIT 10
![Alt text](https://github.com/gmarchezi/Topicos-Trabalho-BD2/blob/master/Images/Select/veiculo_motorista.PNG?raw=true "SELECT * FROM veiculo_motorista LIMIT 10")

SELECT * FROM veiculo_servico LIMIT 10
![Alt text](https://github.com/gmarchezi/Topicos-Trabalho-BD2/blob/master/Images/Select/veiculo_servico.PNG?raw=true "SELECT * FROM veiculo_servico LIMIT 10")


#### 9.3	SELECT DAS VISÕES COM PRIMEIROS 10 REGISTROS DA VIEW <br>
     CREATE VIEW relatorio_veiculo_fin_seguro AS
          SELECT v.nome_veiculo, v.chassi, v.placa,
          m.nome_modelo, m.ano, 
          s.seguradora, s.plano, s.valor     
          FROM veiculo v
          JOIN seguro s ON s.id_seguro = v.id_seguro
          JOIN modelo m ON m.id_modelo = v.id_modelo

          WHERE v.status = 1 AND CURRENT_DATE + integer '5' = s.fin_contrato AND s.status = 1

      SELECT * FROM relatorio_veiculo_fin_seguro LIMIT 10

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

      SELECT * FROM relatorio_mes_servico LIMIT 10
<br>

#### 9.4	LISTA DE CODIGOS DAS FUNÇÕES, ASSERÇOES E TRIGGERS<br>
      
<p align="justify">Iremos Utilizar duas Triggers para que não seja inserido no banco modelo iguais de veiculo, e nem dois clientes com o mesmo           registro</p>
      
      
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
<br>

#### 9.5	Administração do banco de dados<br>
        Descrição detalhada sobre como serão executadas no banco de dados as <br>
        seguintes atividades.
        a) Segurança e autorização de acesso:
            Tendo como referência os princípios da segurança da informação, confidencialidade,
            integridade e disponibilidade da informação, serão feitos backups completos diariamente,
            fora do horário comercial, e backups diferenciais de 2 em 2 horas em horário comercial. O 
            banco será criptografado, garantindo que apenas pessoas com acesso ao banco consigam
            vizualizar os dados. Diariamente serão emitidos relátorios para análise do banco e seus
            backups. As autorizações de acesso serão rígidas, os usuários terão pré-definidos dias da
            semana e horários que poderão acessar o banco.
            
        b) Estimativas de aquisição de recursos para armazenamento e processamento da informação:
            O banco será executado em um Servidor em torre Dell PowerEdge T440 (Processador Intel Xeon Bronze 3106,
            8GB de RAM e HD de 1TB) que possui um custo estimado de R$7.699,00.
            
        c) Planejamento de rotinas de manutenção e monitoramento do banco
           Diariamente, antes de ser feito o backup completo, será verificada a integridade do banco,
           a recuperação de espaço em disco ocupado por linhas atualizadas ou removidas e logo após o
           backup completo será emitido um relatório com informações do banco e dos backups.
           
        d) Plano com frequencia de análises visando otimização de performance:
           Diariamente, antes de ser feito o backup completo fora do horário comercial,será feita
           a atualização das estatísticas do planejador de comandos do banco de dados, via comando
           ANALYZE para todo banco.
<br>

#### 9.6	GERACAO DE DADOS (MÍNIMO DE 1,5 MILHÃO DE REGISTROS PARA PRINCIPAL RELAÇAO)<br>

<br>Base de dados gerados para o banco:<br>

veiculo - 10.000 registros<br>
modelo - 10 registros<br>
tipo_veiculo - 4 registros<br>
veiculo_motorista - 100.000 registros<br>
funcionario - 10.000 registros<br>
veiculo_servico - 1.500.000 registros<br>
servico - 1.500.000 registros<br>
usuario - 20.000 registros<br>
cliente - 10.000 registros<br>

<br>Inserção de dados na tabela.<br>
![alt text](https://github.com/gmarchezi/Topicos-Trabalho-BD2/blob/master/Images/inse_cmd.PNG?raw=true "Img CMD")
<br>Estatisticas do banco após a inserção dos dados.<br>
![alt text](https://github.com/gmarchezi/Topicos-Trabalho-BD2/blob/master/Images/tabela_de_tabelas.PNG?raw=true "Img Tabela")

        
## Data de Entrega: (12/06/2018)
#### 9.7	Backup do Banco de Dados<br>
        Detalhamento do backup.
        a) Tempo
        b) Tamanho
        c) Teste de restauração (backup)
        d) Tempo para restauração
        e) Teste de restauração (script sql)
        f) Tempo para restauração (script sql)

#### 9.8	APLICAÇAO DE ÍNDICES E TESTES DE PERFORMANCE<br>
    a) Lista de índices, tipos de índices com explicação de porque foram implementados nas consultas 
    b) Performance esperada VS Resultados obtidos
    c) Tabela de resultados comparando velocidades antes e depois da aplicação dos índices (constando velocidade esperada com planejamento, sem indice e com índice Vs velocidade de execucao real com índice e sem índice).
    d) Escolher as consultas mais complexas para serem analisadas (consultas com menos de 2 joins não serão aceitas)
    e) As imagens do Explain devem ser inclusas no trabalho, bem como explicações sobre os resultados obtidos.
    f) Inclusão de tabela mostrando as 10 execuções, excluindo-se o maior e menor tempos para cada consulta e 
    obtendo-se a media dos outros valores como resultado médio final.   

## Data de Entrega: (29/06/2018)
#### 9.9	ANÁLISE DOS DADOS COM ORANGE<br>    
        a) captura das informaçõs
        b) integração com banco de dados em desenvolvimento
        c) aplicação de algoritmos e interpretação dos resultados
        c) atualização da documentação do trabalho incluindo a mineração de dados

### 10	ATUALIZAÇÃO DA DOCUMENTAÇÃO/ SLIDES E ENTREGA FINAL<br>


### 11	DIFICULDADES ENCONTRADAS PELO GRUPO<br>  

       
### 12  FORMATACAO NO GIT: https://help.github.com/articles/basic-writing-and-formatting-syntax/
<comentario no git>
    
##### About Formatting
    https://help.github.com/articles/about-writing-and-formatting-on-github/
    
##### Basic Formatting in Git
    
    https://help.github.com/articles/basic-writing-and-formatting-syntax/#referencing-issues-and-pull-requests
    
    
##### Working with advanced formatting
    https://help.github.com/articles/working-with-advanced-formatting/
#### Mastering Markdown
    https://guides.github.com/features/mastering-markdown/

### OBSERVAÇÕES IMPORTANTES

#### Todos os arquivos que fazem parte do projeto (Imagens, pdfs, arquivos fonte, etc..), devem estar presentes no GIT. Os arquivos do projeto vigente não devem ser armazenados em quaisquer outras plataformas.
1. Caso existam arquivos com conteúdos sigilosos, comunicar o professor que definirá em conjunto com o grupo a melhor forma de armazenamento do arquivo.

#### Todos os grupos deverão fazer Fork deste repositório e dar permissões administrativas ao usuário deste GIT, para acompanhamento do trabalho.

#### Os usuários criados no GIT devem possuir o nome de identificação do aluno (não serão aceitos nomes como Eu123, meuprojeto, pro456, etc). Em caso de dúvida comunicar o professor.


Link para BrModelo:<br>
http://sis4.com/brModelo/brModelo/download.html
<br>


Link para curso de GIT<br>
![https://www.youtube.com/curso_git](https://www.youtube.com/playlist?list=PLo7sFyCeiGUdIyEmHdfbuD2eR4XPDqnN2?raw=true "Title")



