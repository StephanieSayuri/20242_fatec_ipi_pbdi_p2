-- Active: 1726576516959@@localhost@1234@20242_ipi_pbdi_stephanie@public

-- Fatec Ipiranga
-- Programação para Banco de Dados I
-- Professor Rodrigo Bossini

-- Especificação do projeto:
-- Neste projeto, seu grupo desenvolverá scripts SQL para analisar e processar uma base
-- de dados de estudantes utilizando a linguagem PL/pgSQL.

-- A prova é com consulta apenas aos materiais de aula.
-- OBS: As mensagens de commit usam type igual a “feat”. A ideia vem da especificação “Commits convencionais”.
-- https://www.conventionalcommits.org/en/v1.0.0/
-- “feat” significa “feature”, ou seja, adição de nova funcionalidade. O scope foi ajustado
-- para ser condizente com o projeto aqui descrito.


-- Instruções

-- 1. O projeto pode ser desenvolvido por grupos de até três alunos.

-- 2. Data de entrega:
-- - O projeto será desenvolvido e entregue na aula do dia 26/11/2024.
-- - O desenvolvimento acontecerá das 08h30 às 10h30. Provas entregues com atraso,
-- entre 10h30 e 11h, têm 20% de desconto na nota total. Nenhuma prova será aceita
-- depois das 11h.

-- 3. A solução deve ser armazenada no Github de um membro do grupo. A entrega do link
-- do repositório será feita pelo Google Forms a seguir.
-- https://bit.ly/bossini_fatec_entregas_provas

-- 4. No repositório, inclua um arquivo chamado README.md contendo o nome completo de
-- cada integrante (sem abreviações) em ordem alfabética e os RAs.

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

-- Requisitos

-- 1. Base de dados e criação de tabela.
-- A base a ser utilizada pode ser obtida a partir do link a seguir. Há também uma versão
-- disponível no ambiente da disciplina. Utilize a que preferir.
-- https://www.kaggle.com/datasets/csafrit2/higher-education-students-performance-evaluation
-- Ela deve ser importada para uma base de dados gerenciada pelo PostgreSQL. Os dados
-- devem ser armazenados em uma tabela apropriada para as análises desejadas. Você deve
-- identificar as colunas necessárias, de acordo com a descrição de cada item da prova.
-- Além, é claro, de uma chave primária (de auto incremento).
-- Mensagem de commit: feat(p2): tabela para importação dos dados
-- Esse commit inclui apenas o script de criação da tabela. Os dados não estão incluídos.

-- Cria tabela auxiliar para importação:
DROP TABLE IF EXISTS tb_aux_3;
CREATE TABLE tb_aux_3 (
    studentid VARCHAR(20), 
    age INT, 
    gender INT, 
    hs_type INT, 
    scholarship INT, 
    work INT, 
    activity INT, 
    partner INT, 
    salary INT, 
    transport INT, 
    living INT, 
    mother_edu INT, 
    father_edu INT, 
    siblings INT, 
    kids INT, 
    mother_job INT, 
    father_job INT, 
    study_hrs INT, 
    read_freq INT, 
    read_freq_sci INT, 
    attend_dept INT, 
    impact INT, 
    attend INT, 
    prep_study INT, 
    prep_exam INT, 
    notes INT, 
    listens INT, 
    likes_discuss INT, 
    classroom INT, 
    cuml_gpa INT, 
    exp_gpa INT, 
    course_id INT, 
    grade INT
);

-- Importa os dados para tabela auxiliar:
COPY tb_aux_3(studentid, age, gender, hs_type, scholarship, work, activity, partner, salary, transport, living, mother_edu, father_edu, siblings, kids, mother_job, father_job, study_hrs, read_freq, read_freq_sci, attend_dept, impact, attend, prep_study, prep_exam, notes, listens, likes_discuss, classroom, cuml_gpa, exp_gpa, course_id, grade) 
FROM '/home/pbdi/prova/student_prediction.csv' delimiter ',' csv header;

SELECT * FROM tb_aux_3;

-- cria tabela "oficial"
DROP TABLE IF EXISTS student_prediction;
CREATE TABLE student_prediction (
    ID SERIAL PRIMARY KEY, 
    salary INT, 
    mother_edu INT, 
    father_edu INT, 
    prep_study INT, 
    prep_exam INT,
    grade INT
);

-- "Limpa" os dados e transfere para tabela "oficial":
INSERT INTO student_prediction (salary, mother_edu, father_edu, prep_study, prep_exam, grade) 
    SELECT salary, mother_edu, father_edu, prep_study, prep_exam, grade FROM tb_aux_3;

-- resultados
SELECT * FROM student_prediction;


-- 2. Resultado em função da formação dos pais:
-- Escreva um stored procedure que exibe o número de alunos aprovados e cujos pais são
-- ambos PhDs.
-- Mensagem de commit: feat(p2):aprovados com pais phds



-- 3 Resultado em função dos estudos
-- Escreva um stored procedure que disponibiliza, utilizando um parâmetro em modo OUT, o
-- número de alunos aprovados dentre aqueles que estudam sozinhos.
-- Mensagem de commit: feat(p2): aprovados que estudam sozinhos



-- 4 Salário versus estudos
-- Dentre os alunos que têm salário maior que 410, quantos costumam se preparar com
-- frequência (regularmente) para os exames? Escreva uma função que devolva esse número.
-- Mensagem de commit: feat(p2): salario versus estudos



-- 5 Entrega final
-- Chegar neste ponto é notável. Algo que merece destaque. O commit que representa essa
-- fase tem que ser destacado. Faça isso criando uma tag anotada, com o nome seguindo o
-- versionamento semântico.
-- Mensagem da tag: seja criativo e invente uma.
-- Não se esqueça de também enviar a tag para o Github, ok?
