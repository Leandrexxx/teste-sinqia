--5. Criar um comando UPDATE que altere o estado de todas as cidades para o estado “SP”
--quando estiverem com estado igual a “PR”.

update cidades
set estado = 'SP'
where estado = 'PR';