 1. Criar um comando SELECT que retorne APENAS o nome dos clientes da cidade “TUPA”.
Utilizar o EXISTS para realizar a condição.

Select nome from clientes cli
where EXISTS (
    Select * from cidades cid
    where upper(nome) like '%TUPÃ%'
    and cid.codigo_cidade = cli.codigo_cidade
);