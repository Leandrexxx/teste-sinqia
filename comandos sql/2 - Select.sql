2. Criar um comando SELECT que retorne o nome do cliente e o nome da cidade de todos os
registros.

select cli.nome,cid.nome from clientes cli
inner join cidades cid on cid.codigo_cidade = cli.codigo_cidade;

