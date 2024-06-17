--7. Criar uma view para consultar os registros contidos na tabela CIDADES. (Criar um arquivo separado)

CREATE VIEW View_Cidades AS
SELECT *
FROM cidades;

SELECT * FROM View_Cidades;