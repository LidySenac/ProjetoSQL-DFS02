-- Apagando bd --
drop database dbprodutos;

-- Criando bd --
create database dbProdutos;

-- Acessando bd --
use dbProdutos;

-- Criando Tabela --
CREATE TABLE PRODUTOS 
( 
CODIGO INT, 
NOME VARCHAR(50), 
TIPO VARCHAR(25), 
QUANTIDADE INT, 
VALOR DECIMAL(10,2) 
);

-- Insert --
INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 1,
'IMPRESSORA', 'INFORMATICA', 200, 600.00 );

INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 2,
'CAMERA DIGITAL', 'DIGITAIS', 300, 400.00 ); 

INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 3,'DVD PLAYER', 'ELETRONICOS', 250, 500.00 ); 

INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 4,
'MONITOR', 'INFORMATICA', 400, 900.00 ); 

INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 5,
'TELEVISOR', 'ELETRONICOS', 350, 650.00 );

INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 6,
'FILMADORA DIGITAL', 'DIGITAIS', 500, 700.00 );

INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 7,
'CELULAR', 'TELEFONE', 450, 850.00 ); 

INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 8,
'TECLADO', 'INFORMATICA', 300, 450.00 ); 

INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 9,
'VIDEOCASSETE', 'ELETRONICOS', 200, 300.00 ); 

INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 10,
'MOUSE', 'INFORMATICA', 400, 60.00 );

desc PRODUTOS;

-- Tipos de Busca (select) --
select * from PRODUTOS; 

select distinct tipo from PRODUTOS; -- tipos sem repetição --

select distinct tipo from PRODUTOS;

select * from PRODUTOS where tipo = 'INFORMATICA';

select distinct tipo from PRODUTOS order by tipo;

select * from produtos where valor > 600;

select * from produtos where valor >= 600;

select valor as 'Valor' from produtos where valor >= 600;

-- Busca Por Código --
select * from produtos where codigo = 1;

-- Busca Por Nome --
select * from produtos where tipo like '%a%'; -- Tudo o que tem 'a'
select * from produtos where tipo like '%a'; -- Tudo o que termina com 'a' 
select * from produtos where tipo like 'a%'; -- Tudo o que começa com 'a'

--Tipos de utilização da busca --
-- nome like '%nome%'
-- i% Tudo que começa com i
-- %i Tudo que termina com i
-- select * from produtos where tipo like 'i%';
-- select * from produtos where tipo like '%s';
-- select * from produtos where tipo like '%s%'; começo,meio e fim que tem a letra S (mais utilizado)

-- Tipos de Expressões --
-- AND (e) OR(ou) IN()(ou também) BETWEEN
-- Com AND
-- select * from produtos where tipo like '%o%' and valor <=600; Ele só trás o resultado verdadeiro por causa do AND
-- select * from produtos where valor >=100 and valor <=300;

-- Com OR
-- select * from produtos where tipo like '%o%' or valor <=600;
-- select * from produtos where tipo = 'INFORMATICA' or tipo = 'TELEFONE';

-- Com IN()
-- select * from produtos where tipo in('INFORMATICA','TELEFONE');
-- select * from produtos where not tipo in('INFORMATICA','TELEFONE');

-- Between sempre funciona com o AND (Do começo para o final, trazendo para dentro)
-- select * from produtos where valor between 100 and 300;
-- select * from produtos where valor not between 100 and 300; -->(Negando a Expressão)
 -- final --

 -- Exercicios -- 
 -- 1. Aumente em 12% o valor dos produtos cujos nomes iniciem com a letra 'F'
 update produtos set valor = valor * 1.12 where nome like 'F%';
 	select * from produtos where nome like 'f%';

 -- 2. Aumentar em 50 unidades todos os produtos cujo valor seja maior que 400 e inferior a 600
 -- select * from produtos where valor >400 and valor <600; (RESPOSTA ERRADA)

 update produtos set QUANTIDADE = QUANTIDADE + 50 where valor between 400 and 600;
 select * from produtos where valor between 400 and 600; 

 -- 3. Aplicar um desconto de 50% (*0.5) em todos os produtos que as unidades de estoque sejam maiores que 300
 update produtos set valor = valor * 0.5 where QUANTIDADE > 300;
 	select * from produtos where QUANTIDADE > 300

 -- 4. Exiba o produto de CODIGO = 4
 select * from produtos where codigo = 4;

 -- 5. Exibir todos os produtos que não tenham a letra 'Y'
select * from produtos where nome not like '%Y%';
select * from produtos;

 -- 6. Exibir todos os produtos que se iniciem com nome 'MO' e tenham como tipo as letras'MA'
 select * from produtos where nome like 'MO%' and tipo like '%MA%';
select * from produtos;

-- Ordenando --
-- desc (decrescente) / asc(crescente);
-- select * from produtos order by tipo;
-- select * from produtos order by valor; (Sempre mostrando o primeiro)
-- select * from produtos order by valor desc; (Do maior para o menor)
-- select distinct tipo from produtos order by tipo asc; (Em ordem alfabética, e sem repetição)
-- select * from produtos limit 5 order by valor desc; 
-- select * from produtos order by valor limit 5;
-- select * from produtos order by valor desc limit 5;

-- Exercicios (Laboratório 53)--
-- 1 Escreva uma consulta que exiba os dados da tabela PRODUTOS na forma crescente pelo campo NOME.
select * from produtos order by nome asc;

-- 2 Escreva uma consulta que exiba o NOME dos produtos ordenado de forma decrescente e o VALOR de forma crescente.
select nome, valor from produtos order by nome desc, valor asc;

-- 3 Escreva uma consulta que exiba os três produtos mais caros.
 select * from produtos order by valor desc limit 3;

-- 4 Escreva uma consulta que exiba o VALOR do produto mais barato.
select * from produtos order by valor desc limit 1;