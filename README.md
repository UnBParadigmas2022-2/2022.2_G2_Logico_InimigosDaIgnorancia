# Inimigos da Ignorância

**Disciplina**: FGA0210 - PARADIGMAS DE PROGRAMAÇÃO - T01 <br>
**Nro do Grupo (de acordo com a Planilha de Divisão dos Grupos)**: 02<br>
**Paradigma**: Lógico<br>

## Alunos
|Matrícula | Aluno |
| -- | -- |
| 19/0041871  |  Abner Filipe Cunha Ribeiro   |
| 19/0102390  |  André Macedo Rodrigues Alves |
| 19/0012307  |  Eduardo Afonso Dutra Silva   |
| 18/0018728  |  Igor Batista Paiva           |
| 18/0033620  |  João Henrique Cunha Paulino  |
| 16/0152615  |  João Pedro Elias de Moura    |
| 18/0054554  |  Paulo Batista                |
| 19/0019158  |  Rafael Leão Teixeira de Magalhães |
| 19/0020903  |  Vitor Magalhães Lamego       |

## Sobre 

A ideia era que um grupo de engenheiros de software, extremamente inspirados
no filme 'A Rede social',
montassem uma rede social com base na wikipédia. O problema é que nenhum
deles se lembrava como montar diagramas UML, o que gerou a pasta [docs\/ ](docs/)
do projeto. Alguns deles sabiam apenas Python ou JavaScript ou Prolog, o 
que levou o projeto a ser separado em 3 diferentes módulos + 1 banco de
dados postgres.

A parte em prolog seria um servidor HTTP com rotas pré configuradas para 
cada regra presente no projeto e os fatos seriam obtidos das tuplas do
Postgres.

### Quais seriam as regras do Prolog ?

- Classificar o usuário como Jovem, Adulto ou Senior dependendo da idade.
- Poderia averiguar se pessoas que não gostam de ler passam mais tempo em artigos com menos palavras e mais imagens.
- Poderia ver se os artigos considerados como ofensivos são mais acessados.
- Poderia averiguar se homens nao consideram um determinado artigo como ofensivo enquanto que mulheres o consideram.
- Poderia inferir se o usuario esta procurando cônjuge na rede social, os parâmetros seriam se ele segue mais pessoas do sexo oposto e se estas pessoas são do mesmo estado.
- Poderia classificar um artigo como familly friendly se 90 % das pessoas Jovens, Adultas e Seniors não o classificassem como ofensivo.
- Faria a recomendação de amigos, artigos e categorias baseadas nas informações dos usuário.

### Por que descontinuar o projeto ?

1. Complexidade de implementação alta.
2. A parte das regras do prolog não estavam/estão muito claras.

### Nota

Inicialmente foi pensado em usar a desciclopédia como fonte de dados, mas
o site é muito ofensivo. 

## Screenshots
Adicione 2 ou mais screenshots do projeto em termos de interface e/ou funcionamento.

## Instalação 
**Linguagens**: JavaScript, python, sql, prolog<br>
**Tecnologias**: flask,postgresql,SWI-Prolog <br>

O projeto contém diversas tecnologias e instalar manualmente cada uma é um trabalho desafiador,
a solução foi usar o docker-compose. Sendo assim, basta entrar na pasta do projeto e executar o comando
docker-compose up -d. Um servidor web em JavaScript irá ser criado em sua máquina. No seu navegador web
favorito digite: "localhost:8080", e então você terá acesso a página inicial da aplicação.

Ainda não tem o Docker e o docker-compose instalado ? [Instalando docker](https://github.com/JoaoHenrique12/TutorialPostgreSQL/blob/main/DOCKER.md#instalando-o-dockerzitos)

## Uso 
Explique como usar seu projeto.
Procure ilustrar em passos, com apoio de telas do software, seja com base na interface gráfica, seja com base no terminal.
Nessa seção, deve-se revelar de forma clara sobre o funcionamento do software.

## Vídeo
Adicione 1 ou mais vídeos com a execução do projeto.
Procure: 
(i) Introduzir o projeto;
(ii) Mostrar passo a passo o código, explicando-o, e deixando claro o que é de terceiros, e o que é contribuição real da equipe;
(iii) Apresentar particularidades do Paradigma, da Linguagem, e das Tecnologias, e
(iV) Apresentar lições aprendidas, contribuições, pendências, e ideias para trabalhos futuros.
OBS: TODOS DEVEM PARTICIPAR, CONFERINDO PONTOS DE VISTA.
TEMPO: +/- 15min

## Participações
Apresente, brevemente, como cada membro do grupo contribuiu para o projeto.
|Nome do Membro | Contribuição | Significância da Contribuição para o Projeto (Excelente/Boa/Regular/Ruim/Nula) |
| -- | -- | -- |
| Fulano  |  Programação dos Fatos da Base de Conhecimento Lógica | Boa |

## Outros 
Quaisquer outras informações sobre o projeto podem ser descritas aqui. Não esqueça, entretanto, de informar sobre:
(i) Lições Aprendidas;
(ii) Percepções;
(iii) Contribuições e Fragilidades, e
(iV) Trabalhos Futuros.

## Fontes
Referencie, adequadamente, as referências utilizadas.
Indique ainda sobre fontes de leitura complementares.
