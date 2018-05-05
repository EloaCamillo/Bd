use DevitProva;

-------------------------------------------------Proce que salva dados na tabela----------------------------------
Delimiter $$
Create Procedure SalvarDados(in Nome_heroi varchar(50), in CodiNome_Heroi varchar(50), in idade_heroi int, in Planeta_Heroi varchar(50), FKPoderId int)
Begin 
Insert into Heroi(Nome,CodiNome, Idade, Planeta, FKPoderId ) Values(Nome_heroi, CodiNome_Heroi, idade_heroi,Planeta_Heroi,FKPoderId);

End $$

Delimiter ;


Delimiter $$
create procedure SalvarDadosPoder(in Descricao_poder varchar(50), in NivelPoder_poder int)
Begin
insert into Poder(Descricao, NivelPoder) values(Descricao_poder, NivelPoder_poder);
End $$

Delimiter ;

----------------------------------------------Proce que exclui dados--------------------------------
Delimiter $$
create procedure ExcluirDadosHeroi(in HeroiId_heroi int)
Begin
delete from Heroi where HeroiId = HeroiId_heroi;
End $$
Delimiter ;

Delimiter $$
create procedure ExcluirDadosPoder(in PoderId_poder int)
Begin
delete from Poder where PoderId = PoderId_poder;
End $$

Delimiter ; 

--------------------------------------------------------Proce que seleciona dados--------------------------
Delimiter $$
create procedure SelecionaDadosHeroi(in HeroiId_heroi int)
Begin
select* from Heroi where HeroiId = HeroiId_heroi;
End $$
Delimiter ;

Delimiter $$
create procedure SelecionaDadosPoder(in PoderId_poder int)
Begin
select*from Poder where PoderId = PoderId_poder;
End $$

Delimiter ; 

