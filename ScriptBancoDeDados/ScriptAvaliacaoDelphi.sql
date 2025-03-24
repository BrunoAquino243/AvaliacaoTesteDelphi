-- Criação das tabelas

CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    CPF VARCHAR(11) UNIQUE NOT NULL,
    DataNascimento DATE
);

CREATE TABLE ModelosCarros (
    ModeloID INT PRIMARY KEY,
    NomeModelo VARCHAR(255) NOT NULL,
    DataLancamento DATE
);

CREATE TABLE Vendas (
    VendaID INT PRIMARY KEY,
    ClienteID INT,
    ModeloID INT,
    DataVenda DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (ModeloID) REFERENCES ModelosCarros(ModeloID)
);


-- Quantidade de vendas do Marea

SELECT COUNT(*) AS TotalVendasMarea
  FROM Vendas v JOIN ModelosCarros m ON v.ModeloID = m.ModeloID
 WHERE m.NomeModelo = 'Marea';


-- Quantidade de vendas do Uno por cliente 

SELECT c.ClienteID,
       c.Nome,
       COUNT(v.VendaID) AS TotalVendasUno
  FROM Clientes c LEFT JOIN Vendas v ON c.ClienteID = v.ClienteID
				  LEFT JOIN ModelosCarros m ON v.ModeloID = m.ModeloID
 WHERE m.NomeModelo = 'Uno'
 GROUP BY c.ClienteID, c.Nome;


-- Quantidades de clientes que não efetuaram a venda 

SELECT COUNT(*) AS TotalClientesSemVenda
  FROM Clientes c LEFT JOIN Vendas v ON c.ClienteID = v.ClienteID
 WHERE v.VendaID IS NULL;


-- Clientes sorteados

SELECT c.ClienteID,
       c.Nome,
       c.CPF,
       v.DataVenda
  FROM Clientes c JOIN Vendas v ON c.ClienteID = v.ClienteID
                  JOIN ModelosCarros m ON v.ModeloID = m.ModeloID
 WHERE SUBSTRING(c.CPF, 1, 1) = '0'
   AND m.NomeModelo = 'Marea'
   AND YEAR(m.DataLancamento) = 2021
   AND c.ClienteID NOT IN (SELECT ClienteID FROM Vendas GROUP BY ClienteID HAVING COUNT(*) > 1)
 ORDER BY v.DataVenda
 LIMIT 15;


-- Exclusão de todas as vendas que não são dos clientes sorteados

DELETE FROM Vendas
 WHERE NOT EXISTS (SELECT 1
                     FROM (SELECT c.ClienteID
							 FROM Clientes c JOIN Vendas v ON c.ClienteID = v.ClienteID
											 JOIN ModelosCarros m ON v.ModeloID = m.ModeloID
							WHERE SUBSTRING(c.CPF, 1, 1) = '0'
							  AND m.NomeModelo = 'Marea'
							  AND YEAR(m.DataLancamento) = 2021
							  AND c.ClienteID NOT IN (SELECT ClienteID 
							                            FROM Vendas 
													   GROUP BY ClienteID 
   												      HAVING COUNT(*) > 1)
							ORDER BY v.DataVenda
							LIMIT 15) AS Sorteados
					WHERE Vendas.ClienteID = Sorteados.ClienteID);